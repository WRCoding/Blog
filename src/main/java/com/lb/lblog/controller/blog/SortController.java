package com.lb.lblog.controller.blog;

import com.github.pagehelper.PageInfo;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Sort;
import com.lb.lblog.service.BlogService;
import com.lb.lblog.service.SortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 */
@Controller
public class SortController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private SortService sortService;

    @PostMapping("/allSorts")
    @ResponseBody
    public List<Sort> allSorts(){
        return sortService.getAllSorts();
    }

    @GetMapping("/sort/{sortId}")
    public String sort(HttpServletRequest request, @PathVariable("sortId")String sortId){
        request.getSession().setAttribute("sortId", sortId);
        return this.sortPage(request,0);
    }

    @GetMapping("/sortPage/{pageNum}")
    public String sortPage(HttpServletRequest request, @PathVariable("pageNum") Integer pageNum){
        Integer sortId = Integer.parseInt((String) request.getSession().getAttribute("sortId"));
        List<BlogInfo> blogList = sortService.sortBlog(sortId,pageNum);
        PageInfo pageInfo = new PageInfo(blogList);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("titleBlogs", blogService.getRecentBlogs());
        request.setAttribute("viewsBlogs", blogService.getMostViewsBlogs());
        return "blog/sort";
    }

    @PostMapping("/sortToBlog")
    @ResponseBody
    public List<BlogInfo> sortToBlog(Integer sortId){
        return sortService.sortToBlog(sortId);
    }
}
