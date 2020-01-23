package com.lb.lblog.config;


import com.lb.lblog.job.QuartzJob;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.quartz.*;

@Configuration
public class QuartzConfig {
    private static final String LIKE_TASK_IDENTITY = "LikeTask";
    private static final String LIKE_COUNT_TASK_IDENTITY = "LikeCountTask";

    @Bean
    public JobDetail likeJobDetail(){
        return JobBuilder.newJob(QuartzJob.class).withIdentity(LIKE_TASK_IDENTITY).storeDurably().build();
    }

    @Bean
    public Trigger likeCountJobTrigger(){
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("0 0 1 1/1 * ? ");
        return TriggerBuilder.newTrigger().forJob(likeJobDetail()).withIdentity(LIKE_COUNT_TASK_IDENTITY).withSchedule(cronScheduleBuilder).build();
    }
}
