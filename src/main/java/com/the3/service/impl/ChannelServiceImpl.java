package com.the3.service.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.AbstractPageRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ChannelRepository;
import com.the3.service.ChannelService;
import com.the3.utils.Debug;

/**
 * ChannelServiceImpl.java
 *
 * @author ETHAN
 * @time 2014年3月2日下午4:45:52
 */
@Service
public class ChannelServiceImpl implements ChannelService {
	
	private Logger logger = Logger.getLogger(ChannelServiceImpl.class);  
	
	@Autowired
	private ChannelRepository channelRepository;

	@Override
	public ServiceReturnDto<Channel> save(Channel entity) {
		boolean isSuccess = true;
		try {
			entity = channelRepository.save(entity);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Channel>(isSuccess,entity);
	}

	@Override
	public Page<Channel> getPage(PageRequest pageable) {
		
		Page<Channel> page = channelRepository.findAll(pageable);
		return page;
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

}
