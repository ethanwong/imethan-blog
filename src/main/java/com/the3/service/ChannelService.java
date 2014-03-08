package com.the3.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.cms.Channel;

/**
 * ChannelService.java
 *
 * @author ETHAN
 * @time 2014年3月2日下午4:46:01
 */
public interface ChannelService  {
	
	/**
	 * 
	 * @param entity
	 * @return
	 */
	public ServiceReturnDto<Channel> save(Channel entity);
	
	
	public Page<Channel> getPage(PageRequest pageable);
	
	
	

}
