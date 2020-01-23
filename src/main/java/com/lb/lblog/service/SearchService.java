package com.lb.lblog.service;

import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.BlogInfo;

import java.util.List;

/**
 * @author 林北
 */
public interface SearchService {

    /**
     * 根据searchKey查找文章是否存在
     * @param searchKey
     * @return
     */
    Result searchTitle(String searchKey);

    /**
     *博客搜索分页
     * @param pageNum
     * @param searchKey
     * @return
     */
    List<BlogInfo> searchBlog(Integer pageNum, String searchKey);
}
