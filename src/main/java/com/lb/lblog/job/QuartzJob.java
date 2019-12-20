package com.lb.lblog.job;

import com.lb.lblog.service.BlogService;
import com.lb.lblog.service.LikeService;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class QuartzJob extends QuartzJobBean {

    @Autowired
    private LikeService likeService;
    @Autowired
    private BlogService blogService;

    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        blogService.writeHistoricalViews();
        blogService.setView();
        likeService.saveLiked2DB();
        likeService.saveLikedCount2DB();
        likeService.saveLikedCount2DB();
    }
}
