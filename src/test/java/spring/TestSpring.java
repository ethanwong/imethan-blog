package spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.the3.service.cms.ChannelService;

public class TestSpring {
	
	public static void main(String args[]){
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"main/applicationContext.xml"});
		ChannelService channelService = context.getBean(ChannelService.class);
	}
	
}
