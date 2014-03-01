package com.the3.repository.cms.impl;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.the3.entity.cms.Channel;
import com.the3.repository.cms.ChannelRepository;

public class ChannelRepositoryImpl implements ChannelRepository,MongoRepository<Channel, Long>  {

	@Override
	public Page<Channel> findAll(Pageable pageable) {
		return this.findAll(pageable);
	}

	@Override
	public <S extends Channel> S save(S entity) {
		return this.save(entity);
	}

	@Override
	public Channel findOne(Long id) {
		return this.findOne(id);
	}

	@Override
	public boolean exists(Long id) {
		return this.exists(id);
	}

	@Override
	public Iterable<Channel> findAll(Iterable<Long> ids) {
		return this.findAll(ids);
	}

	@Override
	public long count() {
		return this.count();
	}

	@Override
	public void delete(Long id) {
		this.delete(id);
	}

	@Override
	public void delete(Channel entity) {
		this.delete(entity);
	}

	@Override
	public void delete(Iterable<? extends Channel> entities) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAll() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public <S extends Channel> List<S> save(Iterable<S> entites) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Channel> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Channel> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}

}
