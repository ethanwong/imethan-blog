package com.the3.service.cms;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.the3.entity.cms.Article;
import com.the3.entity.cms.Channel;

/**
 * ArticleServiceTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月14日下午9:42:42
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class ArticleServiceTest {
	
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ChannelService channelService;
	
	@Test
	public void testSave(){
		Article entity  = new Article();
		entity.setTitle("121231233第一篇文章的标题"+new Date());
		entity.setContent("123123这个是文章的内容"+new Date());
		
//		Channel channel = channelService.getById("5321d66e01f2fd536c327283");
		Channel channel = new Channel();
//		channel.setId("5321d66e01f2fd536c327283");
//		entity.setChannel(channel);
		
//		articleService.save(entity);
		
	}
	
	@Test
	public void testGetById(){
//		Article article = articleService.getById("532316bb0a5eec8e9684e0ee");
//		System.out.println("article:"+article);
	}
	
	
	@Test
	public void testUpdatePublish(){
		System.out.println(articleService.updatePublish(39l));
	}
	
	@Test
	public void test(){
		articleService.test();
	}
	

}


