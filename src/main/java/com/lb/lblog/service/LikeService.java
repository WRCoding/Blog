package com.lb.lblog.service;

import com.lb.lblog.pojo.LikeCount;
import com.lb.lblog.pojo.UserLike;

import java.util.List;

public interface LikeService {


    /**
     * 获得文章点赞状态
     * @param username
     * @param articleId
     * @return
     */
    Integer getLikeStatus(String username,Integer articleId);

    /**
     * 文章点赞
     * @param username 用户名
     * @param articleId 文章ID
     */
    void saveLiked2Redis(String username,Integer articleId);

    /**
     * 取消点赞
     * @param username 用户名
     * @param articleId 文章ID
     */
    void unLiked2Redis(String username,Integer articleId);

    /**
     * 从Redis获得点赞数据
     * @return
     */
    List<UserLike> getLikedStatusFromRedis();

    /**
     * 根据用户名和文章ID获得点赞状态
     * @param username 用户名
     * @param articleId 文章ID
     * @return
     */
    UserLike getByUserNameAndArticleId(String username,Integer articleId);

    /**
     * 把点赞数据保存到数据库
     */
    void saveLiked2DB();

    /**
     * 文章点赞数加一
     * @param articleId 文章ID
     */
    void incrementLikedCount(String articleId);

    /**
     * 文章点赞数减一
     * @param articleId 文章ID
     */
    void decrementLikedCount(String articleId);


    /**
     * 从Redis中获得每篇文章点赞数
     * @return
     */
    List<LikeCount> getLikedCountFromRedis();

    /**
     * 根据文章ID获取文章的点赞数
     * @param articleId
     * @return
     */
    Integer getLikedCountByIdFromRedis(Integer articleId);

    /**
     * 把点赞数据保存到数据库
     */
    void saveLikedCount2DB();

    /**
     * 从数据库获得点赞数据
     * @return
     */
    List<LikeCount> getLikedCountFromDB();
}
