package cn.imethan.service.message;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * MessageServiceTest.java
 *
 * @author Ethan Wong
 * @since JDK 1.7
 * @datetime 2015年10月23日上午11:16:24
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class MessageServiceTest {
	
	@Autowired
	private MessageService messageService;
	
	@Test
	public void hidden(){
		messageService.hidden(4l);
	}
	
	@Test
	public void delete(){
		messageService.deleteById(4l);
	}

}
