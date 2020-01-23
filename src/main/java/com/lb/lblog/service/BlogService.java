package com.lb.lblog.service;

import com.lb.lblog.dto.TableList;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Comment;
import com.lb.lblog.pojo.Sort;

import java.util.List;
import java.util.Map;


/**
 * @author LB
 * @create 2019-07-17 20:37
 */
public interface BlogService {

    /**
     * 保存文章
     * @param blogInfo
     * @return
     */
    Result saveBlog(BlogInfo blogInfo);

    /**
     * 分页获得文章列表
     * @param limit
     * @param offset
     * @return
     */
    TableList blogList(Integer limit, Integer offset);

    /**
     * 编辑文章
     * @param id
     * @return
     */
    BlogInfo editBlog(Integer id);

    /**
     * 获得指定页数的文章集合
     * @param pageNum
     * @return
     */
    List<BlogInfo> blogList(Integer pageNum);

    /**
     * 文章的详细信息
     * @param id
     * @return
     */
    BlogInfo showBlog(Integer id);

    int getView(Integer id);

    /**
     * 获得总浏览量
     * @return
     */
    int getTotalView();

    /**
     * 获得用户的总浏览量
     * @return
     */
    int getUserTotalViews();

    /**
     * 根据Id查找文章
     * @param id
     * @return
     */
    BlogInfo findBlog(Integer id);

    /**
     *
     * @param blogInfo
     * @return
     */
    Result update( BlogInfo blogInfo);

    int getTotalBlogs();

    int getUserTotalBlogs();

    List<BlogInfo> getRecentBlogs();

    List<BlogInfo> getMostViewsBlogs();

    Result saveComment(String commentName,String comment,Integer articleId);

    List<Comment> getComments (Integer articleId,Integer pageNum);

    int getTotalComments();

    int getUserTotalComments();

    TableList commentList(Integer limit, Integer offset);

    Result saveReplay(Integer id,String replayComment);

    Result delBlog(Integer id);

    Result delComment(Integer id);

    Map<String,Integer> getHistoricalViews(String key);

    void writeHistoricalViews();

    void setView();

    void writeUserViews2DB();
}
