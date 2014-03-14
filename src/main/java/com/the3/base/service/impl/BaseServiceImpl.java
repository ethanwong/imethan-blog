package com.the3.base.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import com.the3.base.repository.QueryUtils;
import com.the3.base.web.SearchFilter;

/**
 * BaseServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月14日下午10:28:51
 */
@Service
public class BaseServiceImpl<T> {
	
	@Autowired
	protected MongoTemplate  mongoTemplate;
	
	/**
	 * 获取分页列表
	 * @param parameters
	 * @param pageable
	 * @param entityClass
	 * @return
	 */
	protected Page<T> getPage(Map<String, Object> parameters,PageRequest pageable,Class<T> entityClass) {
		try {
			Query query = QueryUtils.dynamicGenerateQuery(SearchFilter.parse(parameters).entrySet());
			
			List<T> list =  mongoTemplate.find(query.with(pageable),entityClass);
			long count = mongoTemplate.count(query, entityClass);
			
			return new PageImpl<T>(list, pageable, count);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
}


