package com.the3.service.user.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.user.Permission;
import com.the3.repository.user.PermissionRepository;
import com.the3.service.user.PermissionService;


/**
 * PermissionServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:02:56
 */
@Service
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements PermissionService {
	
	private Logger logger = Logger.getLogger(PermissionServiceImpl.class);  
	
	@Autowired
	private PermissionRepository permissionRepository;
	
	@Override
	public ServiceReturnDto<Permission> save(Permission entity) {
		boolean isSuccess = true;
		try {
			permissionRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Permission>(isSuccess, entity);
	}

	@Override
	public Page<Permission> getPage(Map<String, Object> parameters,PageRequest pageable) {
		try {
			return super.getPage(parameters, pageable, Permission.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public Permission getById(String id) {
		try {
			return permissionRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public boolean deleteById(String id) {
		boolean isSuccess = true;
		try {
			permissionRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return isSuccess;
	}

	@Override
	public ServiceReturnDto<Permission> modify(Permission entity) {
		boolean isSuccess = true;
		try {
			//设置更新字段内容
			Map<String,Object> entityMap = new HashMap<String,Object>();
			entityMap.put("permission", entity.getPermission());
			entityMap.put("name", entity.getName());
			entityMap.put("modifyTime", entity.getModifyTime());
			entityMap.put("describe", entity.getDescribe());
			
			//需要测试
			entityMap.put("parent", entity.getParent());
			entityMap.put("children", entity.getChildren());
			
			super.modify(entityMap, Permission.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return new ServiceReturnDto<Permission>(isSuccess,entity);
	}

}


