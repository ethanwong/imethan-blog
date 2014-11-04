package com.the3.service.security.impl;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.dto.service.ServiceReturnDto;
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
	public Page<Role> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
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
		try {
			return roleRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public boolean deleteById(Long id) {
		boolean isSuccess = true;
		try {
//			roleRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return isSuccess;
	}

}