package com.lb.lblog.dao;

import com.lb.lblog.pojo.BlogInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchMapper {

    List<BlogInfo> searchTitle(String searchKey);

    List<BlogInfo> searchBlogs(String searchKey);
}
