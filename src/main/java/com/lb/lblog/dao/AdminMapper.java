package com.lb.lblog.dao;

import com.lb.lblog.pojo.UserInfo;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author LB
 * @create 2019-07-15 9:46
 */
@Mapper
public interface AdminMapper {

    UserInfo findUserByName(String userName);

    void setUserView(String username);

    int register(UserInfo userInfo);

    int isRegistered(String username);

    int updateStatus(String username);

    String getEmailByUserName(String username);

    int isEmail(String email);
}
