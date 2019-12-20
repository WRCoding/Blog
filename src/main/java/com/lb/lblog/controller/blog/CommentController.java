package com.lb.lblog.controller.blog;

import com.github.pagehelper.PageInfo;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.Comment;
import com.lb.lblog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private BlogService blogService;

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
    public PageInfo getComments(@RequestParam("articleId") Integer articleId, @RequestParam(value = "pageNum",defaultValue = "0",required = false) Integer pageNum){
        List<Comment> commentList = blogService.getComments(articleId, pageNum);
        PageInfo pageInfo = new PageInfo(commentList);
        return pageInfo;
    }

    @PostMapping("/saveReplay")
    @ResponseBody
    public Result saveReplay(@RequestParam("id") Integer id,@RequestParam("replayComment") String replayComment){
        return blogService.saveReplay(id,replayComment );
    }

}
