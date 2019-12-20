package com.lb.lblog.pojo;

import lombok.Data;

import java.util.Date;

/**
 * @author LB
 * @create 2019-07-28 10:18
 */
@Data
public class Comment {
    private Integer id;
    private Integer articleId;
    private String commentName;
    private String comment;
    private String articleTitle;
    private String replay;
    private Date createBy;
    private String createByStr;
    private Date replayCreateBy;
    private Integer isDelete;
}
