package cn.imethan.service.security;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import cn.imethan.entity.cms.Article;
import cn.imethan.entity.cms.Channel;
import cn.imethan.entity.security.User;
import cn.imethan.service.security.UserService;


/**
 * UserServiceTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:34:07
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=false)  
public class UserServiceTest extends AbstractTransactionalJUnit4SpringContextTests {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void testSave(){
		
	}
	
	@Test
	public void testFindByUsername(){
		String username = "imethan";
		
		User user = userService.getByUsername(username);
		System.out.println("user:"+user.toString());
		
	}
	
	
	
}


