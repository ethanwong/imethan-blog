package spring.mail;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.imethan.common.mail.EmailSender;
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
	EmailSender emailSender;
	
	@Test
	public void testSend(){
		emailSender.send("ethanwong@qq.com", "title", "content");
	}

}
