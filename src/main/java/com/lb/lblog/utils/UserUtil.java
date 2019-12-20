package com.lb.lblog.utils;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;


import java.util.Collection;

public class UserUtil {
    private static String userName;
    private static GrantedAuthority[] grantedAuthorities;

    public static String getUserName(){
        userName = SecurityContextHolder.getContext().getAuthentication().getName();
        return userName;
    }

    public static GrantedAuthority[] getGrantedAuthorities(){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Collection<? extends GrantedAuthority> authorities = userDetails.getAuthorities();
        grantedAuthorities = authorities.toArray(new GrantedAuthority[authorities.size()]);
        return grantedAuthorities;
    }
}
