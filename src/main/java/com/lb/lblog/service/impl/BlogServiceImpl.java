package com.lb.lblog.service.impl;

import com.github.pagehelper.PageHelper;
import com.lb.lblog.dao.BlogMapper;
import com.lb.lblog.dao.SortMapper;
import com.lb.lblog.dto.TableList;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.*;
import com.lb.lblog.service.BlogService;
import com.lb.lblog.utils.DateUtils;
import com.lb.lblog.utils.MarkDownToHtmlUtil;
import com.lb.lblog.utils.RedisKeyUtils;
import com.lb.lblog.utils.UserUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.*;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * @author LB
 * @create 2019-07-17 20:38
 */
@Service("blogService")
@Transactional(rollbackFor = Exception.class)
public class BlogServiceImpl implements BlogService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private boolean isFirst = true;

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private SortMapper sortMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    private ZSetOperations<String,Object> zSetOperations;
    private HashOperations hashOperations ;

    private static final String[] DATA_KEY = {RedisKeyUtils.HISTORICAL_VIEWS,RedisKeyUtils.BLOG_NUM,RedisKeyUtils.LIKE_NUM};
    /**
     * 只执行一次，在构造函数之后执行
     */
    @PostConstruct
    public void init(){
         zSetOperations = redisTemplate.opsForZSet();
         hashOperations = redisTemplate.opsForHash();
    }


    @Override
    public Result saveBlog(BlogInfo blogInfo) {
        String username = UserUtil.getUserName();
        blogInfo.setAuthor(username);
        Result result = new Result();
        int index = blogMapper.saveBlogInfo(blogInfo);
        int articleId = blogInfo.getId();
        blogInfo.setArticleId(blogInfo.getId());
        String[] sortIds = blogInfo.getSorts().split(",");
        for (String sortId : sortIds) {
            sortMapper.sortToArticle(Integer.parseInt(sortId),articleId );
            sortMapper.updateSortNum(Integer.parseInt(sortId),0);
        }
        int num = blogMapper.saveBlogContent(blogInfo);
        int count = blogMapper.saveImageUrl(blogInfo);
        if(index > 0 && num > 0&& count > 0){
            result.setCode(200);
            result.setMessage("发布成功");
            hashOperations.put(RedisKeyUtils.BLOG,String.valueOf(blogInfo.getId()),blogMapper.showBlog(blogInfo.getId()));
            return result;
        }else {
            result.setCode(500);
            result.setMessage("发布失败");
            return result;
        }
    }

    @Override
    public TableList blogList(Integer limit, Integer offset) {
        String username = UserUtil.getUserName();
        TableList blogList = new TableList();
        int total = blogMapper.totalCount(username);
        List<BlogInfo> blogInfos = blogMapper.blogList(limit, offset,username);
        blogInfos.stream().forEach((e)->e.setCreateByStr(DateUtils.date2String(e.getCreateBy(),"yyyy-MM-dd HH:mm" )));
        blogList.setTotal(total);
        blogList.setRows(blogInfos);
        return blogList;
    }

    @Override
    public BlogInfo editBlog(Integer id) {
        return (BlogInfo) hashOperations.get(RedisKeyUtils.BLOG,String.valueOf(id));
    }

    @Override
    public List<BlogInfo> blogList(Integer pageNum) {
        PageHelper.startPage(pageNum,3 );
        List<BlogInfo> blogs = blogMapper.blogs();
        for (BlogInfo blog : blogs) {
           if(blog.getSorts() != null){
               String[] names = blog.getSorts().split(",");
               List<String> sortNames = new ArrayList<>();
               for (String name : names) {
                   sortNames.add(name);
               }
               blog.setSortNames(sortNames);
           }
        }
        return blogs ;
    }

    @Override
    public BlogInfo showBlog(Integer id) {
        BlogInfo blogInfo = (BlogInfo) hashOperations.get(RedisKeyUtils.BLOG, String.valueOf(id));
        //获取访问量
        Double views = zSetOperations.score(RedisKeyUtils.VIEW, String.valueOf(id));
        double number = views;
        //设置访问量
        blogInfo.setArticleViews((int)number);
        //添加博客类型
        if(blogInfo.getSorts() != null){
            String[] names = blogInfo.getSorts().split(",");
            List<String> sortNames = Arrays.asList(names);
            blogInfo.setSortNames(sortNames);
        }
        blogInfo.setArticleContent(MarkDownToHtmlUtil.mdToHtml(blogInfo.getArticleContent()));
        return blogInfo;
    }

    @Override
    public int getView(Integer id) {
       return blogMapper.getView(id);
    }

    @Override
    public int getTotalView() {
        Set<ZSetOperations.TypedTuple<Object>> views = zSetOperations.rangeWithScores(RedisKeyUtils.VIEW, 0, -1);
        int totalView = 0;
        for (ZSetOperations.TypedTuple tuple : views) {
            //访问量
            double score = tuple.getScore();
            Integer view = (int)score;
            totalView+=view;
        }
        return totalView;
    }

    @Override
    public int getUserTotalViews(){
        String username = UserUtil.getUserName();
        Integer views = (Integer) hashOperations.get(RedisKeyUtils.USER_VIEWS, username);
        return views == null?0:views;
    }

    @Override
    public void writeUserViews2DB(){
        Map<String,Integer> map = hashOperations.entries(RedisKeyUtils.USER_VIEWS);
        map.forEach((username,view) -> blogMapper.writeUserViews2DB(username,view ));
    }


    @Override
    public void  setView() {
        Set<ZSetOperations.TypedTuple<Object>> views = zSetOperations.rangeWithScores(RedisKeyUtils.VIEW, 0, -1);
        for (ZSetOperations.TypedTuple<Object> tuple : views) {
            //访问量
            double score = tuple.getScore();
            Integer view = (int)score;
            blogMapper.setView(tuple.getValue(),view);
        }
    }


    @Override
    public void writeHistoricalViews(){
        Arrays.stream(DATA_KEY).forEach((e)->{
            if (redisTemplate.hasKey(e)){
                if (RedisKeyUtils.HISTORICAL_VIEWS.equals(e)){
                    Set<ZSetOperations.TypedTuple<Object>> views = zSetOperations.rangeWithScores(RedisKeyUtils.VIEW, 0, -1);
                    int currentViews = 0;
                    for (ZSetOperations.TypedTuple tuple : views) {
                        //访问量
                        double score = tuple.getScore();
                        Long view = (long)score;
                        currentViews+=view;
                    }
                    String tableName = "blog_"+e;
                    blogMapper.writeHistoricalViews(currentViews,tableName);
                }
                if (RedisKeyUtils.BLOG_NUM.equals(e)){
                    String tableName = "blog_"+e;
                    long blogNum = hashOperations.size(RedisKeyUtils.BLOG);
                    blogMapper.writeHistoricalViews((int)blogNum,tableName);
                }
                if (RedisKeyUtils.LIKE_NUM.equals(e)){
                    String tableName = "blog_"+e;
                    List<Integer> likeList = hashOperations.values(RedisKeyUtils.LIKE_COUNT);
                    int sum = likeList.stream().mapToInt((s) -> s).sum();
                    blogMapper.writeHistoricalViews(sum,tableName);
                }
            }else {
                logger.error(e+" :不存在");
            }
//            try {
//                Thread.sleep(2000);
//            } catch (InterruptedException exc) {
//                logger.error("[writeHistoricalViews]方法异常："+exc.getMessage());
//            }
//            //删除旧缓存
//            delHistoricalViews(e);
//            //写入新缓存
//            saveHistoricalViews(blogMapper.getHistoricalViews(),e);
        });
    }


    /**
     * 将历史浏览量存入缓存
     * @param historicalViews
     */

    private void saveHistoricalViews(List<HistoricalViews> historicalViews,String key){
        if (!redisTemplate.hasKey(key)){
            for (HistoricalViews historicalView : historicalViews) {
                String historical = DateUtils.date2String(historicalView.getCreateBy(),"yyyy-MM-dd")+":"+historicalView.getViews();
                redisTemplate.opsForList().rightPush(key,historical);
            }
        }
    }

    /**
     * 删除历史浏览量
     * @param key
     */
    private void delHistoricalViews(String key){
        redisTemplate.delete(key);
    }

    @Override
    public Map<String, Integer> getHistoricalViews(String key) {
        List<String> historicalViews;
        String tableName = "blog_"+key;
        //缓存不存在
        if(!redisTemplate.hasKey(key)){
            //存入redis
            saveHistoricalViews(blogMapper.getHistoricalViews(tableName),key);
        }
        historicalViews = redisTemplate.opsForList().range(key, 0, -1);
        Map<String,Integer> historicalViewsMap = new LinkedHashMap<>();
        for (String historicalView : historicalViews) {
            String[] strs = historicalView.split(":");
            historicalViewsMap.put(strs[0], Integer.valueOf(strs[1]));
        }
        return historicalViewsMap;
    }


    @Override
    public BlogInfo findBlog(Integer id) {
        return blogMapper.findBlog(id);
    }

    @Override
    public Result update(BlogInfo blogInfo) {
        int index = blogMapper.update(blogInfo);
        Result result = new Result();
        if(index > 0){
            result.setCode(200);
            result.setMessage("更新成功");
            if(null != hashOperations.get(RedisKeyUtils.BLOG,String.valueOf(blogInfo.getId()))){
                hashOperations.delete(RedisKeyUtils.BLOG,String.valueOf(blogInfo.getId()));
            }
            hashOperations.put(RedisKeyUtils.BLOG, String.valueOf(blogInfo.getId()), blogMapper.showBlog(blogInfo.getId()));
        }else {
            result.setCode(500);
            result.setMessage("更新失败");
        }
        return result;
    }

    @Override
    public int getTotalBlogs() {
        return  blogMapper.getTotalBlogs();
    }

    @Override
    public int getUserTotalBlogs() {
        String username = UserUtil.getUserName();
        return blogMapper.getUserTotalBlogs(username);
    }

    @Override
    public List<BlogInfo> getRecentBlogs() {
        return blogMapper.getRecentBlogs();
    }

    @Override
    public List<BlogInfo> getMostViewsBlogs() {
        List<BlogInfo> list = new ArrayList<>();
        if(!redisTemplate.hasKey(RedisKeyUtils.BLOG)){
            saveCache(blogMapper.blogs());
        }
        Set<Object> ids = zSetOperations.reverseRange(RedisKeyUtils.VIEW, 0, 5);
        for (Object id : ids) {
            BlogInfo blogInfo = (BlogInfo)hashOperations.get(RedisKeyUtils.BLOG, String.valueOf(id));
            list.add(blogInfo);
        }
        return list;
    }
    private void saveCache(List<BlogInfo> blogInfos){
        for (BlogInfo blogInfo : blogInfos) {
            if(null == hashOperations.get(RedisKeyUtils.BLOG,String.valueOf(blogInfo.getId()))){
                hashOperations.put(RedisKeyUtils.BLOG,String.valueOf(blogInfo.getId()) ,blogMapper.showBlog(blogInfo.getId()) );
                zSetOperations.add(RedisKeyUtils.VIEW, String.valueOf(blogInfo.getId()), blogInfo.getArticleViews());
            }else{
                continue;
            }
        }
    }

    @Override
    public Result saveComment(String commentName, String comment,Integer articleId) {
        int index = blogMapper.saveComment(commentName, comment, articleId);
        Result result = new Result();
        if(index > 0){
            result.setCode(200);
            result.setMessage("评论成功");
        }else {
            result.setCode(500);
            result.setMessage("评论失败");
        }
        return result;
    }

    @Override
    public List<Comment> getComments(Integer articleId,Integer pageNum) {
        PageHelper.startPage(pageNum,4 );
        return blogMapper.getComments(articleId);
    }

    @Override
    public int getTotalComments() {
        return blogMapper.getTotalComments();
    }

    @Override
    public int getUserTotalComments() {
        String username = UserUtil.getUserName();
        return blogMapper.getUserTotalComments(username);
    }

    @Override
    public TableList commentList(Integer limit, Integer offset) {
        String username = UserUtil.getUserName();
        List<Comment> comments = blogMapper.commentList(limit, offset,username);
        for (Comment comment : comments) {
            comment.setCreateByStr(DateUtils.date2String(comment.getCreateBy(),"yyyy-MM-dd HH:mm"));
        }
        TableList tableList = new TableList();
        tableList.setTotal(blogMapper.getUserTotalComments(username));
        tableList.setRows(comments);
        return tableList;
    }

    @Override
    public Result saveReplay(Integer id, String replayComment) {
        int index = blogMapper.saveReplay(id, replayComment);
        Result result = new Result();
        if(index > 0){
            result.setCode(200);
            result.setMessage("回复成功");
        }else {
            result.setCode(500);
            result.setMessage("回复失败");
        }
        return result;
    }

    @Override
    public Result delBlog(Integer id) {
        int index = blogMapper.delBlog(id);
        List<Integer> sortIds =sortMapper .articleIdToSortId(id);
        for (Integer sortId : sortIds) {
            sortMapper.updateSortNum(sortId,1);
        }
        Result blogResult = new Result();
        if(index > 0){
            blogResult.setCode(200);
            blogResult.setMessage("删除成功");
        }else {
            blogResult.setCode(500);
            blogResult.setMessage("删除失败");
        }
        return blogResult;
    }

    @Override
    public Result delComment(Integer id) {
        int index = blogMapper.delComment(id);
        Result commentResult = new Result();
        if(index > 0){
            commentResult.setCode(200);
            commentResult.setMessage("删除成功");
        }else {
            commentResult.setCode(500);
            commentResult.setMessage("删除失败");
        }
        return commentResult;
    }
}