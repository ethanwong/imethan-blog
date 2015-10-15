package spring.mail;
import java.io.UnsupportedEncodingException;

import javax.mail.internet.MimeUtility;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
/**
 * SendMailTest.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年10月15日下午4:55:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class SendMailTest {
	
	@Autowired
    private MailSender mailSender;
	@Autowired
    private SimpleMailMessage templateMessage;

    @Test
    public void testMail() throws UnsupportedEncodingException {
        SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);
        
        // 设置收件人，寄件人 
        msg.setFrom(MimeUtility.encodeText("您的昵称") + "<WTTCS@zmyou.com>");//发件人
        msg.setTo("ethanwong@qq.com");//收件人
        msg.setSubject("来自Spring的邮件");//标题
        msg.setText("这是一封来自Spring的邮件,Send a mail by spring");//内容
        try{
            this.mailSender.send(msg);
        }
        catch (MailException ex) {
            System.err.println(ex.getMessage());
        }
    }

}
