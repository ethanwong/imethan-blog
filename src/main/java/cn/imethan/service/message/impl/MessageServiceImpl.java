package cn.imethan.service.message.impl;


import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.imethan.common.mail.EmailSender;
import cn.imethan.common.repository.DynamicSpecifications;
import cn.imethan.common.repository.SearchFilter;
import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.message.Message;
import cn.imethan.repository.message.MessageRepository;
import cn.imethan.service.message.MessageService;

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


	@Override
	@Transactional(readOnly = false)
	public ReturnDto hidden(Long id) {
		boolean isSuccess = true;
		String message = "更新成功";
		int isShow = 0;
		try {
			messageRepository.updateIsShowById(id,isShow);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "更新失败";
		}
		return new ReturnDto(isSuccess,message);
	}


	@Override
	@Transactional(readOnly = false)
	public ReturnDto deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			messageRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "删除失败";
		}
		return new ReturnDto(isSuccess,message);
	}

}


