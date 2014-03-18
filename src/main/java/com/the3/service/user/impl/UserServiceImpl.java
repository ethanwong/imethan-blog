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
		boolean isSuccess = true;
		try {
			userRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<User>(isSuccess, entity);
	}

	@Override
	public Page<User> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		try {
			return super.getPage(parameters, pageable, User.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public User getById(String id) {
		try {
			return userRepository.findOne(id);
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
			userRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return isSuccess;
	}

	@Override
	public ServiceReturnDto<User> modify(User entity) {
		boolean isSuccess = true;
		try {
			//设置更新字段内容
			Map<String,Object> entityMap = new HashMap<String,Object>();
			
			super.modify(entityMap, User.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return new ServiceReturnDto<User>(isSuccess,entity);
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


