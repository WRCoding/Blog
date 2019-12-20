package com.lb.lblog.utils;

import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期转换类
 * @author LB
 * @create 2019-06-27 18:09
 */
@Component
public class DateUtils {

    public static String date2String(Date date,String pattern){
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        return dateFormat.format(date);
    }

    public static Date string2Date(String date,String pattern) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        return dateFormat.parse(date);
    }
}
