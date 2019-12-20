package com.lb.lblog.service;

import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @author LB
 * @create 2019-07-15 9:56
 */
public interface AdminService extends UserDetailsService {

    Result register(UserInfo userInfo);

    Integer isRegistered(String username);

    void updateStatus(String username);

    String getEmailByUserName(String username);
//有BUG目前还没解决，于是该功能先下线
//    void saveRecord(SysRecord sysRecord);
//
//    TableList getRecord(Integer limit,Integer offset);
}
