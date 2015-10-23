package cn.imethan.service;

import cn.imethan.service.realm.ShiroDbRealm;
import cn.imethan.service.security.UserService;

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


