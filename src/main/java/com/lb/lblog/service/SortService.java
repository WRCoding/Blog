package com.lb.lblog.service;


import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Sort;

import java.util.List;

public interface SortService {

    /**
     * 获得所有分类
     * @return
     */
    List<Sort> getAllSorts();

    /**
     *分类博客展示
     * @param sortId
     * @param pageNum
     * @return
     */
    List<BlogInfo> sortBlog(Integer sortId, Integer pageNum);

    /**
     * 根据分类Id获得博客
     * @param sortId
     * @return
     */
    List<BlogInfo> sortToBlog(Integer sortId);
}
