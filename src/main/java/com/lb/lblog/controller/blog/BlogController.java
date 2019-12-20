package com.lb.lblog.controller.blog;

import com.github.pagehelper.PageInfo;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.pojo.Comment;
import com.lb.lblog.pojo.Sort;
import com.lb.lblog.service.BlogService;
import com.lb.lblog.service.LikeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author LB
 * @create 2019-07-14 9:27
 */
@Controller
public class BlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping("/")
    public String index(HttpServletRequest request){
        return this.page(request,0 );
    }
    @RequestMapping("/show")
    public String show(){
        return "blog/show";
    }

    @RequestMapping("/all_sort")
    public String allSort(){
        return "blog/all_sort";
    }

    @GetMapping("/archive")
    public String archive(@RequestParam(required = false,value = "year") String year){
        return "blog/archive";
    }

    @GetMapping("/page/{pageNum}")
    public String page(HttpServletRequest request, @PathVariable("pageNum") Integer pageNum){
        List<BlogInfo> blogList = blogService.blogList(pageNum);
        PageInfo pageInfo = new PageInfo(blogList);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("titleBlogs", blogService.getRecentBlogs());
        request.setAttribute("viewsBlogs", blogService.getMostViewsBlogs());
        request.setAttribute("archive",blogService.findAchiveByYear());
        return "blog/index";
    }

    @GetMapping("/register")
    public String register(){
        return "admin/register";
    }

    @GetMapping("/show/{blogId}")
    public String show(HttpServletRequest request,@PathVariable("blogId") Integer blogId){
        BlogInfo blogInfo = blogService.showBlog(blogId);
        request.getSession().setAttribute("username",blogInfo.getAuthor() );
        request.setAttribute("blogInfo", blogInfo);
        return "blog/show";
    }
}
