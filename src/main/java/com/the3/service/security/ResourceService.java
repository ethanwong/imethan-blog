package com.the3.service.security;

import java.util.List;

import com.the3.base.service.BaseService;
import com.the3.entity.security.Resource;


/**
 * ResourceService.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:09:38
 */
public interface ResourceService extends BaseService<Resource> {
	
	/**
	 * 获取根节点
	 * @return
	 */
	List<Resource> getRootResource();
	
	
}


