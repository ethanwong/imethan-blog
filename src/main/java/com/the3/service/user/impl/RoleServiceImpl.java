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
import com.the3.entity.user.Role;
import com.the3.repository.user.RoleRepository;
import com.the3.service.user.RoleService;

/**
 * UserServiceIMpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:01:34
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
	
	private Logger logger = Logger.getLogger(ResourceServiceImpl.class);  
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public ServiceReturnDto<Role> save(Role entity) {
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
	public Page<Role> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		try {
			return super.getPage(parameters, pageable, Role.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public Role getById(String id) {
		try {
			return roleRepository.findOne(id);
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
			roleRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return isSuccess;
	}

	@Override
	public ServiceReturnDto<Role> modify(Role entity) {
		boolean isSuccess = true;
		try {
			//设置更新字段内容
			Map<String,Object> entityMap = new HashMap<String,Object>();
			
			super.modify(entityMap, Role.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return new ServiceReturnDto<Role>(isSuccess,entity);
	}

}


