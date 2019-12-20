package com.lb.lblog.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 博客内容
 * @author LB
 * @create 2019-07-15 14:19
 */
@Data
public class BlogContent {
    private Integer id;
    private String articleContent;
    private Integer articleId;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createBy;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date modifiedBy;
}
