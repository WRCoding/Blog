package com.lb.lblog.service.impl;

import com.lb.lblog.dao.AdminMapper;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.UserInfo;
import com.lb.lblog.service.AdminService;
import com.lb.lblog.utils.RedisKeyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LB
 * @create 2019-07-15 9:56
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;

    @Autowired
    RedisTemplate redisTemplate;

    @Override
    public UserDetails loadUserByUsername(String username){
        UserInfo user = adminMapper.findUserByName(username);
        if(user == null){
            throw new UsernameNotFoundException("用户名不存在");
        }
        if (user.getStatus() == 0){
            throw new DisabledException("账号未激活");
        }
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        list.add(new SimpleGrantedAuthority(user.getLoginRole()));

        return new User(user.getNickName(),user.getLoginPassword(),list);
    }

    @Override
    public Result register(UserInfo userInfo) {
        userInfo.setLoginRole("ROLE_USER");
        userInfo.setLoginPassword(new BCryptPasswordEncoder().encode(userInfo.getLoginPassword()));
        int index = adminMapper.register(userInfo);
        Result result = new Result();
        if (index>0){
            adminMapper.setUserView(userInfo.getNickName());
            result.setCode(200);
            result.setMessage("注册成功");
        }else{
            result.setCode(500);
            result.setMessage("注册失败");
        }
        return result;
    }

    @Override
    public Integer isRegistered(String username) {
        return adminMapper.isRegistered(username);
    }

    @Override
    public void updateStatus(String username) {
        adminMapper.updateStatus(username);
    }

    @Override
    public String getEmailByUserName(String username) {
        return adminMapper.getEmailByUserName(username);
    }

    @Override
    public Integer isEmail(String email) {
        return adminMapper.isEmail(email);
    }
}
