package com.the3.service.security;

import com.the3.entity.security.User;

/**
 * UserService.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:00:04
 */
public interface UserService{

	User getByUsername(String username);
	
}


