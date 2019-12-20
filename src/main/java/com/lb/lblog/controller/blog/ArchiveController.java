package com.lb.lblog.controller.blog;

import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.service.ArchiveService;
import com.lb.lblog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class ArchiveController {

    @Autowired
    private ArchiveService archiveService;

    @PostMapping("/archive")
    @ResponseBody
    public Map<String,Integer> archiveDetail(){
        return archiveService.findAchiveByYear();
    }

    @PostMapping("/findByYear")
    @ResponseBody
    public List<BlogInfo> findByYear (@RequestParam("year") String year){
        return archiveService.findByYear(year);
    }
}
