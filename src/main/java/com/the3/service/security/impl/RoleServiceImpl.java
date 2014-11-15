package com.the3.service.security.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
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
import com.the3.repository.security.PermissionRepository;
import com.the3.repository.security.ResourceRepository;
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
	@Autowired
	private ResourceRepository resourceRepository;
	@Autowired
	private PermissionRepository permissionRepository;
	
	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto<Role> saveOrModify(Role entity,String resourcePermission) {
		boolean isSuccess = true;
		try {
			Map<String,Object> result = this.parseResourcePermission(resourcePermission);
			if(!result.isEmpty()){
				if(result.get("resourceSet") !=null ){
					Set<Resource> resourceSet = (Set<Resource>) result.get("resourceSet");
					entity.setResources(resourceSet);
				}
				if(result.get("permissionSet") !=null ){
					Set<Permission> permissionSet = (Set<Permission>) result.get("permissionSet");
					entity.setPermissions(permissionSet);
				}
			}
			
			roleRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Role>(isSuccess, entity);
	}
	
	private Map<String,Object> parseResourcePermission(String resourcePermission){
		Map<String,Object> map = new HashMap<String,Object>();
		Set<Resource> resourceSet = new HashSet<Resource>();
		Set<Permission> permissionSet = new HashSet<Permission>();
		
		String[] list = StringUtils.split(resourcePermission, ",");

		for(String temp : list){
//			 type:resource id:1
//			 type:resource id:4
//			 type:permission id:16
			String[] tempSplits = StringUtils.split(temp,"-");
			String type = tempSplits[0];
			String id = tempSplits[1];
			Long idLong = Long.parseLong(id);
			if(type.equals("resource")){
				Resource resource = resourceRepository.findOne(idLong);
				resourceSet.add(resource);
			}
			if(type.equals("permission")){
				Permission permission = permissionRepository.findOne(idLong);
				permissionSet.add(permission);
			}
		}
		map.put("resourceSet", resourceSet);
		map.put("permissionSet", permissionSet);
		
		return map;
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
		
		return role;
	}
	
	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto<Role> deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			if(isResourceAndPermissionExists(id)){
				isSuccess = false;
				message = "删除失败,请先删除资源和授权";
			}else{
				roleRepository.delete(id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "删除失败";
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Role>(isSuccess , message);
	}

	//判断是否存在资源和授权信息
	private boolean isResourceAndPermissionExists(Long id) {
		Role role = roleRepository.findOne(id);
		if((role.getResources() != null && !role.getResources().isEmpty()) || (role.getPermissions() != null && !role.getPermissions().isEmpty()) ){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Role> getAllList() {
		return roleRepository.findAll();
	}

}