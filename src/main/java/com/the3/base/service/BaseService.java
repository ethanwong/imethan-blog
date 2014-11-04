package com.the3.base.service;

import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import com.the3.dto.service.ServiceReturnDto;

/**
 * BaseService.java
 *
 * @author Ethan Wong
 * @time 2014年3月14日下午10:21:58
 */
public interface BaseService<T> {
	
	/**
	 * 保存或更新
	 * @param entity
	 * @return
	 */
	public ServiceReturnDto<T> saveOrModify(T entity);
	
	/**
	 * 获取分页
	 * @param parameters
	 * @param pageable
	 * @return
	 */
	public Page<T> getPage(Map<String,Object> parameters,PageRequest pageable);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	public T getById(Long id);
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	public boolean deleteById(Long id);
	

}


