package com.lb.lblog.controller;

import com.lb.lblog.dao.AdminMapper;
import com.lb.lblog.dto.Result;
import com.lb.lblog.pojo.UserInfo;
import com.lb.lblog.service.AdminService;
import com.lb.lblog.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author LB
 * @create 2019-07-15 19:16
 */
@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private MailUtil mailUtil;

    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping("/login")
    public String login(){
        return "admin/login";
    }

    @PostMapping("/reg")
    @ResponseBody
    public Result reg(@RequestParam("username")String username,@RequestParam("password")String password,@RequestParam("email")String email){
        UserInfo userInfo = new UserInfo(email,password,username);
        return adminService.register(userInfo);
    }

    @PostMapping("/activate")
    @ResponseBody
    public void activate(@RequestParam("username") String username, @RequestParam("email") String email) throws MessagingException {
        if (email == null){
            email = adminService.getEmailByUserName(username);
        }
        String uuid = UUID.randomUUID().toString();
        String activCode = uuid+"*"+username+"*"+email;
        redisTemplate.opsForValue().set(activCode,username,60, TimeUnit.SECONDS);
        mailUtil.sendMail(email, activCode);
    }

    @GetMapping("/statusCode")
    public ModelAndView checkCode(String code){
        System.out.println(code);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/activateAccount");
        if (redisTemplate.hasKey(code)){
            String username = (String) redisTemplate.opsForValue().get(code);
            adminService.updateStatus(username);
            redisTemplate.delete(code);
            modelAndView.addObject("success",1 );
            return modelAndView;
        }else {
            String[] strs = code.split("\\*");
            for (String str : strs) {
                System.out.println(str);
            }
            String username = strs[1];
            String email = strs[2];
            modelAndView.addObject("failure",0 );
            modelAndView.addObject("username",username );
            modelAndView.addObject("email",email );
            return modelAndView;
        }
    }

    @PostMapping("/isEmail")
    @ResponseBody
    public Integer isEmail(@RequestParam("email") String email){
        return adminService.isEmail(email);
    }
}
