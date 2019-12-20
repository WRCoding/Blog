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

    private Logger logger = LoggerFactory.getLogger(this.getClass());

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

    @PostMapping("/archive")
    @ResponseBody
    public Map<String,Integer> archiveDetail(){
        return blogService.findAchiveByYear();
    }

    @PostMapping("/findByYear")
    @ResponseBody
    public List<BlogInfo> findByYear (@RequestParam("year") String year){
        return blogService.findByYear(year);
    }

    @PostMapping("/allSorts")
    @ResponseBody
    public List<Sort> allSorts(){
        return blogService.getAllSorts();
    }

    @GetMapping("/show/{blogId}")
    public String show(HttpServletRequest request,@PathVariable("blogId") Integer blogId){
        BlogInfo blogInfo = blogService.showBlog(blogId);
        request.getSession().setAttribute("username",blogInfo.getAuthor() );
        request.setAttribute("blogInfo", blogInfo);
        return "blog/show";
    }

    @PostMapping("/saveComment")
    @ResponseBody
    public Result comment(@RequestParam("commentName") String commentName,
                          @RequestParam("comment") String comment,
                          @RequestParam("articleId") Integer articleId){
        Result result = blogService.saveComment(commentName, comment, articleId);
        if (result.getCode() == 200){
            List<Comment> commentList = blogService.getComments(articleId,0);
            result.setData(commentList);
        }
        return result;
    }

    @PostMapping("/getComments")
    @ResponseBody
    public PageInfo getComments(@RequestParam("articleId") Integer articleId,@RequestParam(value = "pageNum",defaultValue = "0",required = false) Integer pageNum){
        List<Comment> commentList = blogService.getComments(articleId, pageNum);
        PageInfo pageInfo = new PageInfo(commentList);
        return pageInfo;
    }

    @PostMapping("/saveReplay")
    @ResponseBody
    public Result saveReplay(@RequestParam("id") Integer id,@RequestParam("replayComment") String replayComment){
        return blogService.saveReplay(id,replayComment );
    }
    @PostMapping("/searchTitle")
    @ResponseBody
    public Result searchTitle(@RequestParam("searchKey")String searchKey){
        return blogService.searchTitle(searchKey);
    }


    @PostMapping("/search")
    public String search(HttpServletRequest request,@RequestParam("searchKey")String searchKey){
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
    @GetMapping("/sort/{sortId}")
    public String sort(HttpServletRequest request,@PathVariable("sortId")String sortId){
        request.getSession().setAttribute("sortId", sortId);
        return this.sortPage(request,0);
    }
    @GetMapping("/sortPage/{pageNum}")
    public String sortPage(HttpServletRequest request, @PathVariable("pageNum") Integer pageNum){
        Integer sortId = Integer.parseInt((String) request.getSession().getAttribute("sortId"));
        List<BlogInfo> blogList = blogService.sortBlog(sortId,pageNum);
        PageInfo pageInfo = new PageInfo(blogList);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("titleBlogs", blogService.getRecentBlogs());
        request.setAttribute("viewsBlogs", blogService.getMostViewsBlogs());
        return "blog/sort";
    }
    @PostMapping("/sortToBlog")
    @ResponseBody
    public List<BlogInfo> sortToBlog(Integer sortId){
        return blogService.sortToBlog(sortId);
    }
}
