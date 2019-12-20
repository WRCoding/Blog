package com.lb.lblog.controller.blog;

import com.github.pagehelper.PageInfo;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 *
 */
@Controller
public class SearchController {

    @Autowired
    private BlogService blogService;


    @PostMapping("/searchTitle")
    @ResponseBody
    public Result searchTitle(@RequestParam("searchKey")String searchKey){
        return blogService.searchTitle(searchKey);
    }


    @PostMapping("/search")
    public String search(HttpServletRequest request, @RequestParam("searchKey")String searchKey){
        request.getSession().setAttribute("searchKey", searchKey);
        return this.searchPage(request,0);
    }
    @GetMapping("/searchPage/{pageNum}")
    public String searchPage(HttpServletRequest request, @PathVariable("pageNum") Integer pageNum){
        String searchKey = (String) request.getSession().getAttribute("searchKey");
        List<BlogInfo> blogList = blogService.searshBlogs(pageNum,searchKey);
        PageInfo pageInfo = new PageInfo(blogList);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("titleBlogs", blogService.getRecentBlogs());
        request.setAttribute("viewsBlogs", blogService.getMostViewsBlogs());
        return "blog/search";
    }

}
