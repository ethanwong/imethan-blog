package com.the3.service.contact.impl;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.dto.common.ReturnDto;
import com.the3.entity.contact.Message;
import com.the3.repository.contact.MessageRepository;
import com.the3.service.contact.MessageService;

/**
 * ContactServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:36:27
 */
@Service
@Transactional(readOnly = true)
public class MessageServiceImpl implements MessageService {
	
	private Logger logger = Logger.getLogger(MessageServiceImpl.class);  
	
	@Autowired
	private MessageRepository messageRepository;
	

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(Message entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			entity = messageRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess,message,entity);
	}

}


