package com.the3.service.security;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.the3.entity.security.Permission;

/**
 * PermissionServiceTest.java
 *
 * @author Ethan Wong
 * @time 2014年11月1日下午6:05:08
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager",defaultRollback=false)  
public class PermissionServiceTest {
	
	@Autowired
	private PermissionService permissionService;
	
	@Test
	public void testGetByReourceId(){
		List<Permission> list = permissionService.getByResourceId(3l);
		System.out.println("list:"+list);
	}
}


