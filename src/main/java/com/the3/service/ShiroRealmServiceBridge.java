package com.the3.service;

import com.the3.service.realm.ShiroDbRealm;
import com.the3.service.user.UserService;

/**
 * ShiroRealmServiceBridge.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午6:38:02
 */
public class ShiroRealmServiceBridge {
	public static void postInject(ShiroDbRealm shiroDbRealm, UserService userService) {
		shiroDbRealm.setService(userService);
    }
}


