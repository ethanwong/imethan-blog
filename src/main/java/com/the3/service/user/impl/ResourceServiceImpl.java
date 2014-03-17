package com.the3.service.user.impl;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
import com.the3.dto.web.WebReturnDto;
import com.the3.entity.user.Resource;
import com.the3.repository.user.ResourceRepository;
import com.the3.repository.user.UserRepository;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Resource> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resource getById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public WebReturnDto modify(Resource entity) {
		// TODO Auto-generated method stub
		return null;
	}

}


