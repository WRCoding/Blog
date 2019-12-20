package com.lb.lblog.service.impl;

import com.github.pagehelper.PageHelper;
import com.lb.lblog.dao.SortMapper;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Sort;
import com.lb.lblog.service.SortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("SortService")
@Transactional
public class SortServiceImpl implements SortService {


    @Autowired
    private SortMapper sortMapper;

    @Override
    public List<Sort> getAllSorts() {
        return sortMapper.getAllSorts();
    }

    @Override
    public List<BlogInfo> sortBlog(Integer sortId, Integer pageNum) {
        PageHelper.startPage(pageNum,3 );
        return sortMapper.sortBlog(sortId);
    }

    @Override
    public List<BlogInfo> sortToBlog(Integer sortId) {
        return sortMapper.sortBlog(sortId);
    }
}
