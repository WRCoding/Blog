package com.lb.lblog.dto;

import lombok.Data;

/**
 * MarkDown文件上传
 * @author LB
 * @create 2019-07-09 20:50
 */
@Data
public class ResponseResult {
    private Integer success;
    private String Message;
    private String url;
}
