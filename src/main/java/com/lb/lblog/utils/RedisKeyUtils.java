package com.lb.lblog.utils;

/**
 * @author 林北
 */
public class RedisKeyUtils {
    public static final String USER_LIKE = "USER_LIKE";
    public static final String LIKE_COUNT = "LIKE_COUNT";
    public static final String USER_VIEWS = "USER_VIEWS";
    public static final String HISTORICAL_VIEWS = "HISTORICAL_VIEWS";
    public static final String BLOG_NUM = "BLOG_NUM";
    public static final String LIKE_NUM = "LIKE_NUM";
    public static final String BLOG = "BLOG";
    public static final String VIEW = "VIEW";

    public static String getLikeKey(String username,Integer articleId){
        StringBuilder builder = new StringBuilder();
        builder.append(username);
        builder.append(":");
        builder.append(articleId);
        return builder.toString();
    }
}
