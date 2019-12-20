package com.lb.lblog.dao;

import com.lb.lblog.pojo.LikeCount;
import com.lb.lblog.pojo.UserLike;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeMapper {

    /**
     * 把点赞数据保存到数据库中
     * @param userLike
     */
    void saveLiked2DB(UserLike userLike);

    /**
     * 更新数据库里的数据
     * @param userLike
     */
    void updateLiked2DB(UserLike userLike);

    /**
     * 把点赞数据保存到数据库
     * @param likeCount
     */
    void saveLikedCount2DB(LikeCount likeCount);

    /**
     * 从数据库获得文章点赞数
     * @param articleId
     * @return
     */
    int getLikedCountByIdFromDB(Integer articleId);
}
