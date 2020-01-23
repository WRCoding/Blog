package com.lb.lblog.service.impl;

import com.lb.lblog.dao.BlogMapper;
import com.lb.lblog.dao.LikeMapper;
import com.lb.lblog.pojo.LikeCount;
import com.lb.lblog.pojo.UserLike;
import com.lb.lblog.service.LikeService;
import com.lb.lblog.utils.RedisKeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.serializer.GenericToStringSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("likeService")
@Transactional(rollbackFor = Exception.class)
public class LikeServiceImpl implements LikeService {

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private LikeMapper likeMapper;

    @Autowired
    private BlogMapper blogMapper;

    @Override
    public Integer getLikeStatus(String username, Integer articleId) {
        String key = RedisKeyUtils.getLikeKey(username,articleId);
        if(redisTemplate.opsForHash().hasKey(RedisKeyUtils.USER_LIKE,key)){
            Integer likeStatus = (Integer) redisTemplate.opsForHash().get(RedisKeyUtils.USER_LIKE, key);
            return likeStatus;
        }else{
            UserLike userLike = blogMapper.getLikeStatus(username, articleId);
            redisTemplate.opsForHash().put(RedisKeyUtils.USER_LIKE, key,userLike == null?0:userLike.getLikeStatus());
            return userLike == null?0:userLike.getLikeStatus();
        }
    }


    @Override
    public void saveLiked2Redis(String username, Integer articleId) {
        String key = RedisKeyUtils.getLikeKey(username,articleId);
        redisTemplate.opsForHash().put(RedisKeyUtils.USER_LIKE,key,1);
    }

    @Override
    public void unLiked2Redis(String username, Integer articleId) {
        String key = RedisKeyUtils.getLikeKey(username,articleId);
        redisTemplate.opsForHash().put(RedisKeyUtils.USER_LIKE,key,0);
    }

    @Override
    public List<UserLike> getLikedStatusFromRedis() {
        Cursor<Map.Entry<Object,Object>> cursor = redisTemplate.opsForHash().scan(RedisKeyUtils.USER_LIKE, ScanOptions.NONE);
        List<UserLike> list = new ArrayList<>();
        while (cursor.hasNext()){
            Map.Entry<Object, Object> entry = cursor.next();
            String key = (String) entry.getKey();
            String[] keys = key.split(":");
            String username = keys[0];
            Integer articleId = Integer.parseInt(keys[1]);
            Integer likeStatus = (Integer) entry.getValue();
            UserLike userLike = new UserLike(username,articleId,likeStatus);
            list.add(userLike);
        }
        return list;
    }

    @Override
    public UserLike getByUserNameAndArticleId(String username, Integer articleId) {
        return blogMapper.getLikeStatus(username,articleId);
    }

    @Override
    public void saveLiked2DB() {
        List<UserLike> userLikeList = getLikedStatusFromRedis();
        for (UserLike userLike : userLikeList) {
            UserLike ul = getByUserNameAndArticleId(userLike.getUsername(), userLike.getArticleId());
            if( null == ul){
                //没记录，直接保存
                likeMapper.saveLiked2DB(userLike);
            }else{
                //有记录，更新状态
                ul.setLikeStatus(userLike.getLikeStatus());
                likeMapper.updateLiked2DB(ul);
            }
        }
    }

    @Override
    public void incrementLikedCount(String articleId) {
        redisTemplate.opsForHash().increment(RedisKeyUtils.LIKE_COUNT,articleId ,1 );
    }

    @Override
    public void decrementLikedCount(String articleId) {
        redisTemplate.opsForHash().increment(RedisKeyUtils.LIKE_COUNT,articleId ,-1 );
    }

    @Override
    public List<LikeCount> getLikedCountFromRedis() {
        redisTemplate.setValueSerializer(new StringRedisSerializer());
        Cursor<Map.Entry<Object,Object>> cursor = redisTemplate.opsForHash().scan(RedisKeyUtils.LIKE_COUNT, ScanOptions.NONE);
        List<LikeCount> likeCountList = new ArrayList<>();
        while (cursor.hasNext()){
            Map.Entry<Object, Object> entry = cursor.next();
            String key = (String) entry.getKey();
            LikeCount likeCount = new LikeCount(Integer.parseInt(key),(Integer) entry.getValue() );
            likeCountList.add(likeCount);
        }
        return likeCountList;
    }

    @Override
    public Integer getLikedCountByIdFromRedis(Integer articleId) {
        if (redisTemplate.opsForHash().hasKey(RedisKeyUtils.LIKE_COUNT,String.valueOf(articleId))){
            Integer likeCount = (Integer) redisTemplate.opsForHash().get(RedisKeyUtils.LIKE_COUNT, String.valueOf(articleId));
            return likeCount;
        }else{
            int count = likeMapper.getLikedCountByIdFromDB(articleId);
            redisTemplate.opsForHash().put(RedisKeyUtils.LIKE_COUNT, String.valueOf(articleId),count);
            return count;
        }

    }

    @Override
    public void saveLikedCount2DB() {
        List<LikeCount> likeCountList = getLikedCountFromRedis();
        for (LikeCount count : likeCountList) {
            likeMapper.saveLikedCount2DB(count);
        }
    }

    @Override
    public List<LikeCount> getLikedCountFromDB() {
        return null;
    }
}
