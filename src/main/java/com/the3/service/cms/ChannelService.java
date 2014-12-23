package com.the3.service.cms;


import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.cms.Channel;

/**
 * ChannelService.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:46:01
 */
public interface ChannelService{
	
	/**
	 * 保存或更新
	 * @param entity
	 * @return
	 */
	public ReturnDto saveOrModify(Channel entity);
	
	/**
	 * 获取列表
	 * @param filters
	 * @return
	 */
	public List<Channel> getList(List<SearchFilter> filters);
	
	/**
	 * 获取分页列表
	 * @param parameters
	 * @param pageable
	 * @return
	 */
	public Page<Channel> getPage(Map<String,Object> parameters,PageRequest pageable);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public ReturnDto deleteById(Long id);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public Channel getById(Long id);
	
}