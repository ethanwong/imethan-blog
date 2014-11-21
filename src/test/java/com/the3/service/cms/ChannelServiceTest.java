package com.the3.service.cms;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.the3.entity.cms.Channel;
import com.the3.service.cms.impl.ChannelServiceImpl;

//@ContextConfiguration({"/main/applicationContext.xml"})

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class ChannelServiceTest {
	
	@Autowired
	private ChannelService channelService;
	
	@Autowired
	private ChannelServiceImpl channelServiceImpl; 
	
	@Test
	public void testSave(){
		
		Channel channel = new Channel();
		channel.setName("第一个栏目"+new Date());;
		channel.setIntro("第一个栏目的描述");
		
//		System.out.println(channelService.save(channel));
		
		
	}
	
	@Test
	public void testGetById(){
//		Channel channel = channelService.getById("531b4b4ca9faac654cc17762");
////		System.out.println("channel:"+channel);
	}
	
	@Test
	public void testDelete(){
//		channelService.deleteById("531b4b4ca9faac654cc17762");
	}
	

}
