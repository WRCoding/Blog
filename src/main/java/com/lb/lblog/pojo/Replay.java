package com.lb.lblog.pojo;

import lombok.Data;

import java.util.Date;

/**
 * @author LB
 * @create 2019-07-28 10:21
 */
@Data
public class Replay {
    private Integer id;
    private Integer commentId;
    private String replay;
    private Date createBy;
    private Integer isDelete;
}
