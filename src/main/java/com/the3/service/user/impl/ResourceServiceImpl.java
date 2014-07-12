package com.the3.service.user.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.user.Resource;
import com.the3.repository.user.ResourceRepository;
import com.the3.service.user.ResourceService;


/**
 * ResourceServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:11:12
 */
@Service
public class ResourceServiceImpl extends BaseServiceImpl<Resource> implements ResourceService {
	
	private Logger logger = Logger.getLogger(ResourceServiceImpl.class);  
	
	@Autowired
	private ResourceRepository resourceRepository;
	

	@Override
	public ServiceReturnDto<Resource> save(Resource entity) {
		
		System.out.println("---------------isRoot:"+entity.isRoot());
		
		boolean isSuccess = true;
		try {
			Resource parent = null;
			if(!entity.isRoot()){
				parent = resourceRepository.findOne("53c0f7d1d14d355998867050");
				entity.setParent(parent);
			}
			resourceRepository.save(entity);
			
			if(!entity.isRoot()){
				List<Resource> childrens = new ArrayList<Resource>();
				childrens.add(entity);
				parent.setChildrens(childrens);
				resourceRepository.save(parent);
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return new ServiceReturnDto<Resource>(isSuccess, entity);
	}

	@Override
	public Page<Resource> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		try {
			return super.getPage(parameters, pageable, Resource.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public Resource getById(String id) {
		try {
			return resourceRepository.findOne(id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return null;
		}
	}

	@Override
	public boolean deleteById(String id) {
		boolean isSuccess = true;
		try {
			resourceRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			logger.error(e.getMessage());
		}
		return isSuccess;
	}

	@Override
	public ServiceReturnDto<Resource> modify(Resource entity) {
		boolean isSuccess = true;
		try {
			//设置更新字段内容
			Map<String,Object> entityMap = new HashMap<String,Object>();
			
			super.modify(entityMap, Resource.class);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSuccess = false;
		}
		return new ServiceReturnDto<Resource>(isSuccess,entity);
	}

}


