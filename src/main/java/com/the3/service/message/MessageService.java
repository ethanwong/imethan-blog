package com.the3.service.message;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.message.Message;

/**
 * ContactService.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:36:13
 */
public interface MessageService {
	
	/**
	 * 保存消息
	 * @param message
	 * @return
	 */
	public ReturnDto save(Message entity);
	
	/**
	 * 获取消息分页列表
	 * @param filters
	 * @param pageable
	 * @return
	 */
	public Page<Message> findPage(List<SearchFilter> filters,PageRequest pageable);

}


