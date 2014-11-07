package com.the3.service.security.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.security.Resource;
import com.the3.repository.security.ResourceRepository;
import com.the3.service.security.ResourceService;


/**
 * ResourceServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:11:12
 */
@Service
@Transactional(readOnly = true)
public class ResourceServiceImpl implements ResourceService {
	
	private Logger logger = Logger.getLogger(ResourceServiceImpl.class);  
	
	@Autowired
	private ResourceRepository resourceRepository;
	

	@Override
	public ServiceReturnDto<Resource> saveOrModify(Resource entity) {
		boolean isSuccess = true;
		try {
			resourceRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return new ServiceReturnDto<Resource>(isSuccess, entity);
	}

	@Override
	public Page<Resource> getPage(Map<String, Object> parameters,PageRequest pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resource getById(Long id) {
		return resourceRepository.findOne(id);
	}

	@Override
	public boolean deleteById(Long id) {
		boolean isSuccess = true;
		try {
			resourceRepository.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return isSuccess;
	}

	@Override
	public List<Resource> getRootResource() {
		List<Resource> list = resourceRepository.findByIsRoot(true);
		return list;
	}
}


