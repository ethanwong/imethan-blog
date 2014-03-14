package com.the3.service;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.cms.Channel;

/**
 * ChannelService.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:46:01
 */
public interface ChannelService  {
	
	/**
	 * 保存栏目
	 * @param entity
	 * @return
	 */
	public ServiceReturnDto<Channel> save(Channel entity);
	
	/**
	 * 获取分页栏目
	 * @param parameters
	 * @param pageable
	 * @return
	 */
	public Page<Channel> getPage(Map<String,Object> parameters,PageRequest pageable);
	
	/**
	 * 根据ID获取栏目
	 * @param id
	 * @return
	 */
	public Channel getById(String id);
	
	/**
	 * 根据ID删除栏目
	 * @param id
	 * @return
	 */
	public boolean deleteById(String id);
	
	/**
	 * 保存更新栏目
	 * @param channel
	 * @return
	 */
	public WebReturnDto modify(Channel channel);
	
}
