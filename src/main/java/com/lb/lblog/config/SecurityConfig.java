package com.lb.lblog.config;

import com.lb.lblog.handle.LoginFailureHandler;
import com.lb.lblog.handle.LoginSuccesHandler;
import com.lb.lblog.service.AdminService;
import com.lb.lblog.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.DaoAuthenticationConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-07-14 21:53
 */
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private AdminServiceImpl adminService;

    @Autowired
    private LoginFailureHandler loginFailureHandler;

    @Autowired
    private LoginSuccesHandler loginSuccesHandler;
    /**
     * 定制请求的授权规则
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/admin/isRegistered").permitAll()
                .antMatchers("/").permitAll()
                .antMatchers("/register").permitAll()
                .antMatchers("/likeStatus").hasAnyRole("ADMIN","USER")
//                .antMatchers("/show/**").hasAnyRole("ADMIN","USER")
                .antMatchers("/admin/**").hasAnyRole("ADMIN","USER")
                .and().formLogin().loginProcessingUrl("/login").loginPage("/login")
                .successHandler(loginSuccesHandler)
                .failureHandler(loginFailureHandler);
        http.logout().logoutSuccessUrl("/");
        http.csrf().disable();
        //记住我
//        http.rememberMe();
    }

    /**
     * 放行静态资源
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/admin/dist/**","/blog/dist/**","/oss/upload/**");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(daoAuthenticationProvider());
    }

    @Bean
    public DaoAuthenticationProvider daoAuthenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setPasswordEncoder(new BCryptPasswordEncoder());
        daoAuthenticationProvider.setUserDetailsService(adminService);
        daoAuthenticationProvider.setHideUserNotFoundExceptions(false);
        return daoAuthenticationProvider;
    }
}
