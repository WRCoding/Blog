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
    public JobDetail LikeJobDetail(){
        return JobBuilder.newJob(QuartzJob.class).withIdentity(LIKE_TASK_IDENTITY).storeDurably().build();
    }

    @Bean
    public Trigger LikeCountJobTrigger(){
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("59 59 23 1/1 * ?");
        return TriggerBuilder.newTrigger().forJob(LikeJobDetail()).withIdentity(LIKE_COUNT_TASK_IDENTITY).withSchedule(cronScheduleBuilder).build();
    }
}
