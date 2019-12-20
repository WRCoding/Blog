package com.lb.lblog.dao;

import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Sort;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SortMapper {

    List<BlogInfo> sortBlog(Integer sortId);

    List<Sort> getAllSorts();

    int addSort(String sortName);

    List<Sort> sorts(@Param("limit") Integer limit, @Param("offset") Integer offset);

    int getTotalSorts();

    List<Sort> editorSorts();

    void sortToArticle(@Param("sortId")Integer sortId,@Param("articleId")Integer articleId);

    int updateSortNum(@Param("sortId") Integer sortId,@Param("isDelete") Integer isDelete);

    int delSort(Integer id);

    List<Integer> articleIdToSortId(Integer articleId);

}
