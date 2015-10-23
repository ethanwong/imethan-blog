package com.the3.service.message.impl;


import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.mail.EmailSender;
import com.the3.base.repository.DynamicSpecifications;
import com.the3.base.repository.SearchFilter;
import com.the3.dto.common.ReturnDto;
import com.the3.entity.message.Message;
import com.the3.repository.message.MessageRepository;
import com.the3.service.message.MessageService;

/**
 * ContactServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:36:27
 */
@Service
@Transactional(readOnly = true)
public class MessageServiceImpl implements MessageService {
	
	private Logger logger = LogManager.getLogger(MessageServiceImpl.class);
	
	@Autowired
	private MessageRepository messageRepository;
	
	@Autowired
	private EmailSender emailSender;
	

	@Override
	@Transactional(readOnly = false)
	public ReturnDto save(Message entity) {
		boolean isSuccess = true;
		String message = "保存成功";
		try {
			entity = messageRepository.save(entity);
			
			emailSender.send("ethanwong@qq.com", "自来ImEthanBlog的邮件", entity.getContent());
			
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "保存失败";
			logger.error(e.getMessage());
		}
		return new ReturnDto(isSuccess,message,entity);
	}


	@Override
	public Page<Message> findPage(List<SearchFilter> filters,PageRequest pageable) {
		Page<Message> result = null;
		
		try {
			Specification<Message> spec = DynamicSpecifications.bySearchFilter(filters, Message.class);
			
			result = messageRepository.findAll(spec, pageable);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}


