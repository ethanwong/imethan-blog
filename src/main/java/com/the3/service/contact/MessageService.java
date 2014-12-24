package com.the3.service.contact;

import com.the3.dto.common.ReturnDto;
import com.the3.entity.contact.Message;

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

}


