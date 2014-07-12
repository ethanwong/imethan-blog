package com.the3.repository.user;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.the3.entity.user.User;

/**
 * UserRepositoryTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:31:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class UserRepositoryTest {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private RoleRepository roleRepository;
	
	@Test
	public void testSaveUser(){
		User user = new User();
		user.setUsername("ethan");
		user.setPassword("123456");
		user.setNickname("hello ethan");
		userRepository.save(user);
	}
	
	@Test
	public void testSave(){
		User user = new User();
		user.setUsername("admin");
		user.setPassword("123456");
		user.setNickname("system administrator ");
		
		
		user.setRoles(roleRepository.findAll());
		userRepository.save(user);
		
	}
	
	@Test
	public void testFindByUsername(){
		
		String username = "ethan";
		User user = userRepository.findByUsername(username);
		System.out.println("user:"+user);
	}

}