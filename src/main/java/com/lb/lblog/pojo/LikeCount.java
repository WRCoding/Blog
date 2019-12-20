package com.lb.lblog.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author LB
 * @create 2019-11-16 13:28
 */
@Data
public class LikeCount {
    private Integer articleId;
    private Integer likeNum;

    public LikeCount() {
    }

    public LikeCount(Integer articleId, Integer likeNum) {
        this.articleId = articleId;
        this.likeNum = likeNum;
    }
}
