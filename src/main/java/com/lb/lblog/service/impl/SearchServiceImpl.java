package com.lb.lblog.service.impl;

import com.github.pagehelper.PageHelper;
import com.lb.lblog.dao.SearchMapper;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("SearchService")
@Transactional(rollbackFor = Exception.class)
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchMapper searchMapper;

    @Override
    public Result searchTitle(String searchKey) {
        List<BlogInfo> blogInfos = searchMapper.searchTitle(searchKey);
        Result searchResult = new Result();
        if(blogInfos.size() != 0){
            searchResult.setCode(200);
        }else{
            searchResult.setCode(202);
            searchResult.setMessage("未找到相似的文章");
        }
        return searchResult;
    }

    @Override
    public List<BlogInfo> searchBlog(Integer pageNum, String searchKey) {
        PageHelper.startPage(pageNum,3 );
        List<BlogInfo> searchBlogs = searchMapper.searchBlogs(searchKey);
        for (BlogInfo blog : searchBlogs) {
            if(blog.getSorts() != null){
                String[] names = blog.getSorts().split(",");
                List<String> sortNames = new ArrayList<>();
                for (String name : names) {
                    sortNames.add(name);
                }
                blog.setSortNames(sortNames);
            }
        }
        return searchBlogs;
    }
}
