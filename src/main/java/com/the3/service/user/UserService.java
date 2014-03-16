package com.the3.service.user;

import com.the3.base.service.BaseService;
import com.the3.entity.user.User;

/**
 * UserService.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:00:04
 */
public interface UserService extends BaseService<User> {

	User getByUsername(String username);
	
}


