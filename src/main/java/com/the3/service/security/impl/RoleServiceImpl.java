package com.the3.service.security.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.security.Permission;
import com.the3.entity.security.Resource;
import com.the3.entity.security.Role;
import com.the3.repository.security.RoleRepository;
import com.the3.service.security.RoleService;

/**
 * UserServiceIMpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:01:34
 */
@Service
@Transactional(readOnly = true)
public class RoleServiceImpl implements RoleService {
	
	private Logger logger = Logger.getLogger(ResourceServiceImpl.class);  
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public ServiceReturnDto<Role> saveOrModify(Role entity) {
		boolean isSuccess = true;
		try {
			roleRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Role>(isSuccess, entity);
	}
	
	@Override
	public Page<Role> getPage(Map<String, Object> parameters,PageRequest pageable) {
		try {
//			return super.getPage(parameters, pageable, Role.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return null;
	}
	
	@Override
	public Role getById(Long id) {
		Role role = new Role();
		try {
			role = roleRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		
		
		Set<Resource> resources = role.getResources();
		for(Resource resource : resources){//遍历父级节点
			
			Set<Resource> childrens = resource.getChildrens();
			for(Resource children : childrens){//遍历子级节点
				
				Set<Permission> permissions = children.getPermissions();//子级节点的授权信息
				if(children.getChildrens() ==null || children.getChildrens().isEmpty()){
					Set<Resource> resourceChildrensTemp = new HashSet<Resource>();
					
					for(Permission permission : permissions){
						Resource resourceChildrenTemp = new Resource();
						resourceChildrenTemp.setId(permission.getId());
						resourceChildrenTemp.setName(permission.getName());
						resourceChildrenTemp.setNodeType("permission");
						resourceChildrensTemp.add(resourceChildrenTemp);
					}
					children.setChildrens(resourceChildrensTemp);
				}
			}
		}
		
		return role;
	}
	
	
	
	@Override
	public ServiceReturnDto<Resource> deleteById(Long id) {
		boolean isSuccess = true;
		try {
//			roleRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return null;
	}

	@Override
	public List<Role> getAllList() {
		return roleRepository.findAll();
	}

}