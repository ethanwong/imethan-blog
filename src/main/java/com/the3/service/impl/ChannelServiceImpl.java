package com.the3.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.the3.base.repository.QueryUtils;
import com.the3.base.web.SearchFilter;
import com.the3.dto.service.ServiceReturnDto;
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
	
	private Logger logger = Logger.getLogger(ChannelServiceImpl.class);  
	
	@Autowired
	private MongoTemplate  mongoTemplate;
	
	@Autowired
	private ChannelRepository channelRepository;

	@Override
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
		
		Query query = QueryUtils.dynamicGenerateQuery(SearchFilter.parse(parameters).entrySet());
				
		List<Channel> list =  mongoTemplate.find(query.with(pageable), Channel.class);
		long count = mongoTemplate.count(query, Channel.class);
		
		return new PageImpl<Channel>(list, pageable, count);
	}
	
	@Override
	public Page<Channel> getPage(Pageable pageable) {
		
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
	
	
	public void find(){
		String id = "531aacd75061bb91c2492d71";
//		Query query = query(where("id").is(id));
		Channel channel = mongoTemplate.findById(id, Channel.class);
		
		System.out.println("channel:"+channel);
	}

}
