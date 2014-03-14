package com.the3.repository.cms.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.the3.entity.cms.Channel;


/**
 * ChannelRepositoryImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:45:32
 */
@Service
public class ChannelRepositoryImpl{
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public void find(){
		
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		map.put("operation", "value");
		Map<String,Object> allMap = new LinkedHashMap<String,Object>();
		allMap.put("key", map);
		
		for(Entry<String, Object> entry : allMap.entrySet()){
			System.out.println("entry"+entry.getKey());
			System.out.println("entry"+entry.getValue());
		}
		
		//查询操作
//		int page = 3;
//		int size = 3;
		String id = "531aacd75061bb91c2492d71";
//		Query query = Query.query(Criteria.where("id").is(id));
//		Query query = Query.query(new Criteria()).with(new PageRequest(page,size,Direction.DESC,"createTime"));
		Query query = Query.query(new Criteria("title").regex("黄+"));
		List<Channel> list = mongoTemplate.find(query, Channel.class);
//		".*?"+"张"+".*"
//		Channel channel = mongoTemplate.findById(id, Channel.class);
//		Channel channel = list.get(0);
		
		//更新操作
//		Update update = new Update().rename("is is update title", "title");
//		Update update = new Update().set("title", "123456789000000");
//		System.out.println("channel:"+list);
//		Channel channel = mongoTemplate.findAndModify(Query.query(new Criteria("id").is(id)), update, Channel.class);
//		System.out.println("channel:"+channel);
	}
	

}
