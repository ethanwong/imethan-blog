package com.the3.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ChannelRepository;
import com.the3.service.ChannelService;

/**
 * ChannelServiceImpl.java
 *
 * @author ETHAN
 * @time 2014年3月2日下午4:45:52
 */
@Service
public class ChannelServiceImpl implements ChannelService {
	
	@Autowired
	private ChannelRepository channelRepository;

	@Override
	public Channel save(Channel entity) {
		
		return channelRepository.save(entity);
	}

}
