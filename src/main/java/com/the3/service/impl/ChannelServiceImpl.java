package com.the3.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.the3.entity.cms.Article;
import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ArticleRepository;
import com.the3.repository.cms.ChannelRepository;
import com.the3.service.ArticleService;
import com.the3.service.ChannelService;

@Component
public class ChannelServiceImpl implements ChannelService {
	
	@Autowired
	private ChannelRepository channelRepository;

	@Override
	public Channel save(Channel entity) {
		return channelRepository.save(entity);
	}
	

}
