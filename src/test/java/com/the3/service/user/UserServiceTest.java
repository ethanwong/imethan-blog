package com.the3.service.user;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.the3.entity.cms.Article;
import com.the3.entity.cms.Channel;
import com.the3.entity.user.User;


/**
 * UserServiceTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:34:07
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class UserServiceTest {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void testSave(){
		
		
		
	}
	
	@Test
	public void testFindByUsername(){
		String username = "ethan";
		
		User user = userService.getByUsername(username);
		System.out.println("user:"+user);
		
	}
	
	
	
}


