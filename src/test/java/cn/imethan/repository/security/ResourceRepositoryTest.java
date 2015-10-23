package cn.imethan.repository.security;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import cn.imethan.entity.security.Permission;
import cn.imethan.entity.security.Resource;
import cn.imethan.entity.security.Role;
import cn.imethan.entity.security.User;
import cn.imethan.repository.security.ResourceRepository;

/**
 * ResourceRepositoryTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:31:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class ResourceRepositoryTest {
	
	@Autowired
	private ResourceRepository resourceRepository;
	
	@Test
	public void testGetPage(){
		for(Resource resouce:resourceRepository.findAll()){
			System.out.println(resouce);
		}
		
	}
	
	
	

}


