package com.lb.lblog.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

/**
 * @author LB
 * @create 2019-07-17 20:30
 */
@Data
public class Result {
    private int code;
    private String message;
    private Object data;
}
