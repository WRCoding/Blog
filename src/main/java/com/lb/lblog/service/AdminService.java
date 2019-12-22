package com.lb.lblog.service;

import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @author LB
 * @create 2019-07-15 9:56
 */
public interface AdminService extends UserDetailsService {

    /**
     * 用户注册
     * @param userInfo
     * @return
     */
    Result register(UserInfo userInfo);

    /**
     * 用户名是否已经注册
     * @param username
     * @return
     */
    Integer isRegistered(String username);

    /**
     * 更新激活状态
     * @param username
     */
    void updateStatus(String username);

    /**
     * 根据用户名获得邮箱
     * @param username
     * @return
     */
    String getEmailByUserName(String username);

    /**
     * 邮箱是否被注册
     * @param email
     * @return
     */
    Integer isEmail(String email);
}
