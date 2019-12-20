package com.lb.lblog.dto;

import lombok.Data;

/**
 * 返回BootstrapTable的数据
 * @author LB
 * @create 2019-07-28 14:49
 */
@Data
public class TableList {
    private Integer total;
    private Object rows;
}
