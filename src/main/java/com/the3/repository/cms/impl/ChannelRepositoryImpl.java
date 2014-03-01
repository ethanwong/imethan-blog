package com.the3.repository.cms.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.repository.query.MongoEntityInformation;
import org.springframework.data.mongodb.repository.support.SimpleMongoRepository;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Repository;

import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ChannelRepository;

@Repository
public class ChannelRepositoryImpl extends SimpleMongoRepository<Channel, Long> implements ChannelRepository  {
	@Autowired
	private MongoEntityInformation<Channel, Long> metadata;
	@Autowired
	private MongoOperations mongoOperations;

	public ChannelRepositoryImpl(
			MongoEntityInformation<Channel, Long> metadata,
			MongoOperations mongoOperations) {
		super(metadata, mongoOperations);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Channel save(Channel entity){
		return super.save(entity);
	}
	
	
	



}
