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
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * @author LB
 * @create 2019-07-17 20:38
 */
@Service("blogService")
@Transactional
public class BlogServiceImpl implements BlogService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    private boolean isFirst = true;

    @Autowired
    private BlogMapper blogMapper;

    @Autowired
    private SortMapper sortMapper;

    @Autowired
    private RedisTemplate redisTemplate;
    private ZSetOperations zSetOperations ;
    private HashOperations hashOperations ;

    /**
     * 只执行一次，在构造函数之后执行
     */
    @PostConstruct
    public void init(){
         zSetOperations = redisTemplate.opsForZSet();
         hashOperations = redisTemplate.opsForHash();
    }


    @Override
    public Result saveBolg(BlogInfo blogInfo) {
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
            hashOperations.put(String.valueOf(blogInfo.getId()),blogInfo.getArticleTitle() ,blogMapper.showBlog(blogInfo.getId()));
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
        for (BlogInfo blogInfo : blogInfos) {
            blogInfo.setCreateByStr(DateUtils.date2String(blogInfo.getCreateBy(),"yyyy-MM-dd HH:mm" ));
        }
        blogList.setTotal(total);
        blogList.setRows(blogInfos);
        return blogList;
    }

    @Override
    public BlogInfo editBlog(Integer id) {
        BlogInfo blogInfo = new BlogInfo();
        Map<String,BlogInfo> entries = hashOperations.entries(String.valueOf(id));
        for (Map.Entry<String, BlogInfo> entry : entries.entrySet()) {
            blogInfo = entry.getValue();
        }
        return blogInfo;
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
        Map<String,BlogInfo> map = hashOperations.entries(String.valueOf(id));
        BlogInfo blogInfo = null;
        //获取访问量
        Double views = zSetOperations.score("views", id);
        double number = views;
        if(map.size() > 0){
            for(Map.Entry<String,BlogInfo> entry : map.entrySet()){
                blogInfo = entry.getValue();
                //设置访问量
                blogInfo.setArticleViews((int)number);
                //添加博客类型
                if(blogInfo.getSorts() != null){
                    String[] names = blogInfo.getSorts().split(",");
                    List<String> sortNames = new ArrayList<>();
                    for (String name : names) {
                        sortNames.add(name);
                    }
                    blogInfo.setSortNames(sortNames);
                }
                blogInfo.setArticleContent(MarkDownToHtmlUtil.mdToHtml(blogInfo.getArticleContent()));
            }
        }
        return blogInfo;
    }

    @Override
    public int getView(Integer id) {
       return blogMapper.getView(id);
    }

    @Override
    public int getTotalView() {
        Set<ZSetOperations.TypedTuple> views = zSetOperations.rangeWithScores("views", 0, -1);
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
        Map<String,Integer> userViews = hashOperations.entries(RedisKeyUtils.USER_VIEWS);
        userViews.forEach((username,view) ->{
            blogMapper.writeUserViews2DB(username,view );
            logger.error("username: "+username+" ,view: "+view);
        });
    }

    /**
     * 定时任务，每日的23:59:59把当日的总访问量写入到MySQL中
     */
    @Override
    public void setView() {
        Set<ZSetOperations.TypedTuple<Integer>> views = zSetOperations.rangeWithScores("views", 0, -1);
        for (ZSetOperations.TypedTuple<Integer> tuple : views) {
            Integer id = tuple.getValue();
            //访问量
            double score = tuple.getScore();
            Integer view = (int)score;
            blogMapper.setView(id,view);
        }
    }

    /**
     * 定时任务，每日的23:59:59把当日的总访问量写入到MySQL中
     */
    @Override
    public void writeHistoricalViews(){
        Set<ZSetOperations.TypedTuple> views = zSetOperations.rangeWithScores("views", 0, -1);
        int currentViews = 0;
        for (ZSetOperations.TypedTuple tuple : views) {
            //访问量
            double score = tuple.getScore();
            Integer view = (int)score;
            currentViews+=view;
        }
        blogMapper.writeHistoricalViews(currentViews);
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
            logger.error("[writeHistoricalViews]方法异常");
        }
        //删除旧缓存
        delHistoricalViews("HistoricalViews");
        //写入新缓存
        saveHistoricalViews(blogMapper.getHistoricalViews());
    }


    /**
     * 将历史浏览量存入缓存
     * @param historicalViews
     */

    private void saveHistoricalViews(List<HistoricalViews> historicalViews){
        if (!redisTemplate.hasKey("HistoricalViews")){
            for (HistoricalViews historicalView : historicalViews) {
                String historical = DateUtils.date2String(historicalView.getCreateBy(),"yyyy-MM-dd")+":"+historicalView.getViews();
                redisTemplate.opsForList().rightPush("HistoricalViews",historical);
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
    public Map<String, Integer> getHistoricalViews() {
        List<String> historicalViews;
        //缓存不存在
        if(redisTemplate.opsForList().size("HistoricalViews") == 0){
            //存入redis
            saveHistoricalViews(blogMapper.getHistoricalViews());
        }
        historicalViews = redisTemplate.opsForList().range("HistoricalViews", 0, -1);
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
            if(redisTemplate.hasKey(String.valueOf(blogInfo.getId()))){
                redisTemplate.delete(String.valueOf(blogInfo.getId()));
            }
            saveCache(blogMapper.blogs());
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
        if(isFirst){
            saveCache(blogMapper.blogs());
            isFirst = false;
        }
        Set<Integer> ids = zSetOperations.reverseRange("views", 0, 5);
        for (Integer id : ids) {
            Map<String,BlogInfo> map = hashOperations.entries(String.valueOf(id));
            for (Map.Entry<String,BlogInfo> entry : map.entrySet()) {
                list.add(entry.getValue());
            }
        }
        return list;
    }
    private void saveCache(List<BlogInfo> blogInfos){
        for (BlogInfo blogInfo : blogInfos) {
            if(!redisTemplate.hasKey(String.valueOf(blogInfo.getId()))){
                hashOperations.put(String.valueOf(blogInfo.getId()),blogInfo.getArticleTitle() ,blogMapper.showBlog(blogInfo.getId()) );
                zSetOperations.add("views", blogInfo.getId(), blogInfo.getArticleViews());
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
        Result BlogResult = new Result();
        if(index > 0){
            BlogResult.setCode(200);
            BlogResult.setMessage("删除成功");
        }else {
            BlogResult.setCode(500);
            BlogResult.setMessage("删除失败");
        }
        return BlogResult;
    }

    @Override
    public Result delComment(Integer id) {
        int index = blogMapper.delComment(id);
        Result CommentResult = new Result();
        if(index > 0){
            CommentResult.setCode(200);
            CommentResult.setMessage("删除成功");
        }else {
            CommentResult.setCode(500);
            CommentResult.setMessage("删除失败");
        }
        return CommentResult;
    }
}