package cn.imethan.repository.security;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.imethan.entity.security.Permission;
import cn.imethan.entity.security.User;
import cn.imethan.repository.jpa.security.PermissionRepository;

/**
 * UserRepositoryTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:31:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class PermissionRepositoryTest {
	
	@Autowired
	private PermissionRepository permissionRepository;
	
	@Test
	public void testSave(){
		Permission permission1 = new Permission();
		Permission permission2 = new Permission();
		Permission permission3 = new Permission();
		Permission permission4 = new Permission();
		Permission permission5 = new Permission();
		permission1.setName("新增栏目");
		permission1.setPermission("channel:new");
		
		permission2.setName("删除栏目");
		permission2.setPermission("channel:delete");
		
		permission3.setName("修改栏目");
		permission3.setPermission("channel:modify");
		
		permission4.setName("查看栏目");
		permission4.setPermission("channel:view");
		
		permission5.setName("获取栏目");
		permission5.setPermission("channel:list");
		
		List<Permission> list = new ArrayList<Permission>();
		list.add(permission1);
		list.add(permission2);
		list.add(permission3);
		list.add(permission4);
		list.add(permission5);
		
		permissionRepository.save(list);
		

		
		
		
	}
	
	
	
	
	

}


