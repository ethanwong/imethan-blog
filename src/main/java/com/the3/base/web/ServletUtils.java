package com.the3.base.web;

import javax.servlet.ServletRequest;

import org.springframework.util.StringUtils;

/**
 * WebUtils.java
 *
 * @author ETHAN
 * @time 2014年3月11日下午8:12:40
 */
public class ServletUtils {
	
	/**
	 * 获取request Integer 类型的参数，默认为0
	 * @param request
	 * @param propertyName
	 * @return
	 */
	public static int getRequestIntParameter(ServletRequest request,String propertyName){
		int value = 0;
		try {
			value = !StringUtils.isEmpty(request.getParameter(propertyName))?Integer.valueOf(request.getParameter(propertyName)):0;
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		return value;
	}

}


