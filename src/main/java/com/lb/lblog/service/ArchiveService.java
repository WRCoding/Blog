package com.lb.lblog.service;

import com.lb.lblog.pojo.BlogInfo;

import java.util.List;
import java.util.Map;

public interface ArchiveService {

    /**
     * 归档
     * @return
     */
    Map<String,Integer> findAchiveByYear();

    /**
     * 根据年份搜索博客
     * @param year
     * @return
     */
    List<BlogInfo> findByYear(String year);
}
