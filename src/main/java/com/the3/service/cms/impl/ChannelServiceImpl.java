package com.the3.service.cms.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ChannelRepository;
import com.the3.service.cms.ChannelService;

/**
 * ChannelServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:52
 */
@Service
@Transactional(readOnly = true)
public class ChannelServiceImpl implements ChannelService {
	
	private Logger logger = Logger.getLogger(ChannelServiceImpl.class);  
	
	@Autowired
	private ChannelRepository channelRepository;

	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto<Channel> save(Channel entity) {
		boolean isSuccess = true;
		try {
			entity = channelRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Channel>(isSuccess,entity);
	}

	@Override
	public Page<Channel> getPage(Map<String,Object> parameters,PageRequest pageable) {
		
		try {
//			return super.getPage(parameters, pageable, Channel.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return null;
	}
	
	@Override
	public Channel getById(String id) {
		Channel entity = null;
		try {
			entity = channelRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return entity;
	}

	@Override
	public boolean deleteById(String id) {
		boolean isSuccess = true;
		try {
			channelRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return isSuccess;
	}

	@Override
	public ServiceReturnDto<Channel> modify(Channel entity) {
		boolean isSuccess = true;
		try {
//			Update update = new Update().set("title", entity.getTitle()).set("describe", entity.getDescribe()).set("modifyTime", new Date());
//			mongoTemplate.findAndModify(Query.query(new Criteria("id").is(entity.getId())), update, Channel.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return new ServiceReturnDto<Channel>(isSuccess,entity);
	}

	@Override
	public List<Channel> getList() {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public List<Channel> getList() {
//		try {
//			return channelRepository.findAll();
//		} catch (Exception e) {
//			logger.error(e.getMessage());
//			e.printStackTrace();
//			return null;
//		}
//	}


}
