package com.the3.base.mail;

import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * EmailSender.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年10月21日下午5:23:13
 */
@Service
public class EmailSender {
	
	@Autowired
    private MailSender mailSender;
	@Autowired
    private SimpleMailMessage templateMessage;
	
	/**
	 * 发送邮件
	 * @param email 邮箱地址
	 * @param title 邮件标题
	 * @param content 邮件内容
	 * @throws UnsupportedEncodingException
	 *
	 * @author Ethan Wong
	 * @datetime 2015年10月21日下午5:25:19
	 */
	@Async
    public void send(String email,String title,String content) {
    	
        SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);
        
        // 设置收件人，寄件人 
        try {
			msg.setFrom(MimeUtility.encodeText("ImEthan Blog") + "<sunccojava@163.com>");
	        msg.setTo(email);//收件人
	        msg.setSubject(MimeUtility.encodeText(title));//标题
	        msg.setText(MimeUtility.encodeText(content));//内容
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

        try{
            this.mailSender.send(msg);
        } catch (MailException ex) {
            ex.printStackTrace();
        }
    }

}
