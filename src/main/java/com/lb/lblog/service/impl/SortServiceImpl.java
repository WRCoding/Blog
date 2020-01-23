package com.lb.lblog.service.impl;

import com.github.pagehelper.PageHelper;
import com.lb.lblog.dao.SortMapper;
import com.lb.lblog.dto.Result;
import com.lb.lblog.dto.TableList;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Sort;
import com.lb.lblog.service.SortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("SortService")
@Transactional(rollbackFor = Exception.class)
public class SortServiceImpl implements SortService {


    @Autowired
    private SortMapper sortMapper;

    @Override
    public List<Sort> getAllSorts() {
        return sortMapper.getAllSorts();
    }

//    @Override
//    public List<BlogInfo> sortBlog(Integer sortId, Integer pageNum) {
//        PageHelper.startPage(pageNum,3 );
//        List<BlogInfo> sortBlogs = sortMapper.sortBlog(sortId);
//        for (BlogInfo blog : sortBlogs) {
//            if(blog.getSorts() != null){
//                String[] names = blog.getSorts().split(",");
//                List<String> sortNames = new ArrayList<>();
//                for (String name : names) {
//                    sortNames.add(name);
//                }
//                blog.setSortNames(sortNames);
//            }
//        }
//        return sortBlogs;
//    }

    @Override
    public List<BlogInfo> sortToBlog(String sortName) {
        return sortMapper.sortBlog(sortName);
    }

    @Override
    public Result addSort(String sortName) {
        int index = sortMapper.addSort(sortName);
        Result result = new Result();
        if(index > 0){
            result.setCode(200);
            result.setMessage("添加成功");
        }else {
            result.setCode(500);
            result.setMessage("添加失败");
        }
        return result;
    }

    @Override
    public TableList sorts(Integer limit, Integer offset) {
        List<Sort> sorts = sortMapper.sorts(limit, offset);
        TableList tableList = new TableList();
        tableList.setTotal(sortMapper.getTotalSorts());
        tableList.setRows(sorts);
        return tableList;
    }

    @Override
    public List<Sort> editorSorts() {
        return sortMapper.editorSorts();
    }

    @Override
    public Result delSort(Integer id) {
        int index = sortMapper.delSort(id);
        Result sortResult = new Result();
        if(index > 0){
            sortResult.setCode(200);
            sortResult.setMessage("删除成功");
        }else {
            sortResult.setCode(500);
            sortResult.setMessage("删除失败");
        }
        return sortResult;
    }
}
