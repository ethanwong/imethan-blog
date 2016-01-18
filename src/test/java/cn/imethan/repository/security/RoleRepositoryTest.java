package cn.imethan.repository.security;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.imethan.entity.security.Permission;
import cn.imethan.entity.security.Role;
import cn.imethan.entity.security.User;
import cn.imethan.repository.jpa.security.PermissionRepository;
import cn.imethan.repository.jpa.security.RoleRepository;

/**
 * UserRepositoryTest.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:31:11
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/main/applicationContext.xml"})
public class RoleRepositoryTest {
	
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private PermissionRepository permissionRepository;
	
	@Test
	public void testSave(){
		Role role = new Role();
		role.setName("栏目管理员");
		List<Permission> allPermission = permissionRepository.findAll();
//		role.setPermissions(allPermission);
		roleRepository.save(role);
	}
	
	
	

}


