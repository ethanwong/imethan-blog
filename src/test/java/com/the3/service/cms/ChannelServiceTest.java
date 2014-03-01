package com.the3.service.cms;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextLoader;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.the3.entity.cms.Channel;
import com.the3.service.ChannelService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"/main/applicationContext.xml"})
public class ChannelServiceTest {
	
	@Autowired
	private ChannelService channelService;
	
	@Test
	public void testSave(){
		
		Channel channel = new Channel();
		channel.setTitle("第一个栏目");;
		channel.setDescribe("第一个栏目的描述");
		channel.setCreateTime(new Date());
		
		System.out.println(channelService.save(channel));
		
	}
	
	

}
