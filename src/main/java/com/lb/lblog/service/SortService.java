package com.lb.lblog.service;


import com.lb.lblog.dto.Result;
import com.lb.lblog.dto.TableList;
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

    /**
     * 添加分类
     * @param sortName
     * @return
     */
    Result addSort(String sortName);

    /**
     * 获得所有分类
     * @param limit
     * @param offset
     * @return
     */
    TableList sorts(Integer limit, Integer offset);

    List<Sort> editorSorts();
    /**
     * 删除分类
     * @param id
     * @return
     */
    Result delSort(Integer id);
}
