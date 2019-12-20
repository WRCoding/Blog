package com.lb.lblog.dao;

import com.lb.lblog.pojo.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author LB
 * @create 2019-07-15 9:46
 */
@Mapper
public interface BlogMapper {

    int saveBlogInfo(BlogInfo blogInfo);

    int saveBlogContent(BlogInfo blogInfo);

    int saveImageUrl(BlogInfo blogInfo);

    List<BlogInfo> blogList(@Param("limit") Integer limit,@Param("offset") Integer offset,@Param("username") String username);

    int totalCount(String username);

    List<BlogInfo> blogs();

    BlogInfo showBlog(Integer id);

    int getView(Integer id);

    void setView(@Param("id") Integer id,@Param("view") Integer view);

    BlogInfo findBlog(Integer id);

    int update(BlogInfo blogInfo);

    int getTotalBlogs();

    int getUserTotalBlogs(String name);

    List<BlogInfo> getRecentBlogs();

    int saveComment(@Param("commentName") String commentName,@Param("comment") String comment,@Param("articleId") Integer articleId);

    List<Comment> getComments (Integer articleId);

    int getTotalComments();

    int getUserTotalComments(String username);

    List<Comment> commentList(@Param("limit") Integer limit,@Param("offset") Integer offset,@Param("username") String username);

    int saveReplay(@Param("id") Integer id,@Param("replayComment") String replayComment);

    int delBlog(Integer id);

    int delComment(Integer id);

    List<BlogInfo> searchBlogs(String searchKey);

    List<BlogInfo> searchTitle(String searchKey);

    int addSort(String sortName);

    List<Sort> sorts(@Param("limit") Integer limit,@Param("offset") Integer offset);

    int getTotalSorts();

    List<Sort> getAllSorts();

    List<Sort> editorSorts();

    void sortToArticle(@Param("sortId")Integer sortId,@Param("articleId")Integer articleId);

    int updateSortNum(@Param("sortId") Integer sortId,@Param("isDelete") Integer isDelete);

    List<BlogInfo> sortBlog(Integer sortId);

    int delSort(Integer id);

    List<String> findAchiveByYear();

    int findYearByNum(String year);

    List<BlogInfo> findByYear(String year);

    void writeHistoricalViews(Integer currentViews);

    List<HistoricalViews> getHistoricalViews();

    List<Integer> articleIdToSortId(Integer articleId);

    UserLike getLikeStatus(@Param("username")String username, @Param("articleId")Integer articleId);
}
