package com.the3.service.user.impl;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.user.User;
import com.the3.repository.user.UserRepository;
import com.the3.service.user.UserService;

/**
 * UserServiceIMpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:01:34
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	
	private Logger logger = Logger.getLogger(UserServiceImpl.class);  
	
	@Autowired
	private UserRepository userRepository;
	

	@Override
	public ServiceReturnDto<User> save(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<User> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public WebReturnDto modify(User entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getByUsername(String username) {
		try {
			return userRepository.findByUsername(username);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

}


