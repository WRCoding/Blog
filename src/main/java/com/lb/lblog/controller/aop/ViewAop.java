package com.lb.lblog.controller.aop;

import com.lb.lblog.pojo.BlogInfo;
import com.lb.lblog.service.BlogService;
import com.lb.lblog.utils.MarkDownToHtmlUtil;
import com.lb.lblog.utils.RedisKeyUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ZSetOperations;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * @author LB
 * @create 2019-07-21 11:28
 */
@Component
@Aspect
@Transactional
public class ViewAop {
    @Autowired
    private HttpServletRequest request;

    @Autowired
    private BlogService blogService;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 切入点表达式
     */
    @Pointcut("execution(* com.lb.lblog.controller.blog.BlogController.show(..))")
    public void pointCut(){ }

    /**
     * 前置通知，点击一篇博客，浏览量加一
     * @param point
     * @throws NoSuchMethodException
     */
    @Before("pointCut()")
    public void setView(JoinPoint point) throws NoSuchMethodException{
        Object[] args = point.getArgs();
        Integer id = (Integer) args[1];
        HashOperations hashOperations = redisTemplate.opsForHash();
        ZSetOperations zSetOperations = redisTemplate.opsForZSet();
        Map<String,BlogInfo> map = hashOperations.entries(String.valueOf(id));
        if(map != null){
            zSetOperations.incrementScore("views", id, 1);
        }
    }
    @After("pointCut()")
    public void setUserViews(){
        HashOperations hashOperations = redisTemplate.opsForHash();
        String username = (String) request.getSession().getAttribute("username");
        if (!hashOperations.hasKey(RedisKeyUtils.USER_VIEWS,username)){
            hashOperations.put(RedisKeyUtils.USER_VIEWS,username , 1);
        }else {
            hashOperations.increment(RedisKeyUtils.USER_VIEWS,username ,1 );
        }
    }
}
