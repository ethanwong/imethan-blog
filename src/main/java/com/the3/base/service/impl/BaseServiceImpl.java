package com.the3.base.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.dto.service.ServiceReturnDto;

/**
 * BaseServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月14日下午10:28:51
 */
@Service
public class BaseServiceImpl<T> {
	
	private Logger logger = Logger.getLogger(BaseServiceImpl.class);  
	
	
	/**
	 * 获取分页列表
	 * @param parameters
	 * @param pageable
	 * @param entityClass
	 * @return
	 */
	protected Page<T> getPage(Map<String, Object> parameters,PageRequest pageable,Class<T> entityClass) {
		try {
//			Query query = QueryUtils.dynamicGenerateQuery(SearchFilter.parse(parameters).entrySet());
//			
//			List<T> list =  mongoTemplate.find(query.with(pageable),entityClass);
//			long count = mongoTemplate.count(query, entityClass);
			
//			return new PageImpl<T>(list, pageable, count);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}
	
	/**
	 * 更新
	 * @param entityMap
	 * @param entityClass
	 * @return
	 */
	protected  ServiceReturnDto modify(Map<String,Object> entityMap,Class<T> entityClass){
		ServiceReturnDto serviceReturnDto = new ServiceReturnDto();
		boolean isSuccess = true;
		String id = "";
//		Update update = new Update();
		
		try {
			for (Entry<String, Object> entry : entityMap.entrySet()) {
				String attributeName= entry.getKey();
				Object attributeValue= entry.getValue();
				
				//获取ID
				if(attributeName.equals("id")){
					id = attributeValue.toString();
				}
				
				//设置更新内容
//				update.set(attributeName, attributeValue);
				
			}
			
//			mongoTemplate.findAndModify(Query.query(new Criteria("id").is(id)), update, entityClass);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		
		serviceReturnDto.setSuccess(isSuccess);
		return serviceReturnDto;
	}
	
}


