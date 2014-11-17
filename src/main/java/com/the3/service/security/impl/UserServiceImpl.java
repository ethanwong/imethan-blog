package com.the3.service.security.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.repository.DynamicSpecifications;
import com.the3.base.repository.SearchFilter;
import com.the3.dto.page.PageDto;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.security.User;
import com.the3.repository.security.UserRepository;
import com.the3.service.security.UserService;

/**
 * UserServiceIMpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:01:34
 */
@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {
	
	private Logger logger = Logger.getLogger(UserServiceImpl.class);  
	
	@Autowired
	private UserRepository userRepository;

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

	@Override
	public Page<User> findPage(List<SearchFilter> filters , PageRequest pageable) {
		Page<User> result = null;
		try {
			Specification<User> spec = DynamicSpecifications.bySearchFilter(filters, User.class);
			result = userRepository.findAll(spec, pageable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public User getById(Long id) {
		try {
			return userRepository.findOne(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto save(User entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			userRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
		}
		return new ServiceReturnDto(isSuccess,message);
	}

	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			userRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "删除失败";
		}
		return new ServiceReturnDto(isSuccess,message);
	}

}


