package com.lb.lblog.utils;

public class RedisKeyUtils {
    public static final String USER_LIKE = "user_like";
    public static final String LIKE_COUNT = "like_count";
    public static final String USER_VIEWS = "user_views";

    public static String getLikeKey(String username,Integer articleId){
        StringBuilder builder = new StringBuilder();
        builder.append(username);
        builder.append(":");
        builder.append(articleId);
        return builder.toString();
    }
}
