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

    Result saveBolg(BlogInfo blogInfo);

    TableList blogList(Integer limit, Integer offset);

    BlogInfo editBlog(Integer id);

    List<BlogInfo> blogList(Integer pageNum);

    BlogInfo showBlog(Integer id);

    int getView(Integer id);

    int getTotalView();

    int getUserTotalViews();

    BlogInfo findBlog(Integer id);

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

    List<BlogInfo> searshBlogs(Integer pageNum,String searchKey);

    Result searchTitle(String searchKey);

    Result addSort(String sortName);

    TableList sorts(Integer limit, Integer offset);

    List<Sort> getAllSorts();

    List<Sort> editorSorts();

    List<BlogInfo> sortBlog(Integer sortId,Integer pageNum);

    Result delSort(Integer id);

    Map<String,Integer> findAchiveByYear();

    List<BlogInfo> findByYear(String year);

    List<BlogInfo> sortToBlog(Integer sortId);

    Map<String,Integer> getHistoricalViews();

    void writeHistoricalViews();

    void setView();

}
