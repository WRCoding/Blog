package com.lb.lblog.handle;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author LB
 * @create 2019-12-09 19:18
 */
@Component
public class LoginFailureHandler implements AuthenticationFailureHandler {

    private Logger logger = LoggerFactory.getLogger(LoginFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String message = exception.getMessage();
        if (exception instanceof BadCredentialsException){
            message = "密码错误";
        }
        logger.error("登录失败："+ message);
        request.getSession().setAttribute("errorMsg",message );
        response.sendRedirect("/login");
    }
}
