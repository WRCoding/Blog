package com.lb.lblog.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


/**
 * @author LB
 * @create 2019-12-10 20:20
 */
@Component
public class MailUtil {

    private static final String FROM = "pepsic@qq.com";
    @Autowired
    private JavaMailSender mailSender;

    public  void sendMail(String to, String message) throws MessagingException {
        String address = " http://127.0.0.1:8080/statusCode?code="+message;
        MimeMessage mimeMessage = mailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage,true);
        mimeMessageHelper.setSubject("激活账号");
        mimeMessageHelper.setFrom(FROM);
        mimeMessageHelper.setTo(to);
        mimeMessageHelper.setText("点击完成激活账号，激活码的有效时间为五分钟，只有账号激活才能使用其他功能，<a href = "+address+">激活账号</a>",true);
        mailSender.send(mimeMessage);
    }
}
