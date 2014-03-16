package com.the3.service.user.impl;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.user.Permission;
import com.the3.service.user.PermissionService;


/**
 * PermissionServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:02:56
 */
@Service
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements PermissionService {

	@Override
	public ServiceReturnDto<Permission> save(Permission entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Permission> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Permission getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public WebReturnDto modify(Permission entity) {
		// TODO Auto-generated method stub
		return null;
	}

}


