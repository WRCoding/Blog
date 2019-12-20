package com.lb.lblog.service;

import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.BlogInfo;

import java.util.List;

public interface SearchService {

    /**
     * 根据searchKey查找文章是否存在
     * @param searchKey
     * @return
     */
    Result searchTitle(String searchKey);

    /**
     *
     * @param pageNum
     * @param searchKey
     * @return
     */
    List<BlogInfo> searshBlogs(Integer pageNum, String searchKey);
}
