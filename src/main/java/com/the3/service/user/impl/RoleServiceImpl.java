package com.the3.service.user.impl;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.user.Role;
import com.the3.service.user.RoleService;

/**
 * UserServiceIMpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:01:34
 */
@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {

	@Override
	public ServiceReturnDto<Role> save(Role entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Role> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public WebReturnDto modify(Role entity) {
		// TODO Auto-generated method stub
		return null;
	}

}


