package com.the3.service.security.impl;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
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
	@PersistenceContext 
	private EntityManager entityManger;
	

	@Override
	@Transactional(readOnly = false)
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
	public Resource getById(Long id) {
		return resourceRepository.findOne(id);
	}

	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto<Resource> deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			if(this.isChildrenExists(id)){
				message = "删除失败,先删除子节点";
				isSuccess = false;
			}else{
				resourceRepository.delete(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return new ServiceReturnDto<Resource>(isSuccess,message);
	}

	@Override
	public List<Resource> getRootResource() {
		List<Resource> list = resourceRepository.findByIsRoot(true);
		return list;
	}
	
	/**
	 * 是否存在父亲节点
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unused")
	private boolean isParentExists(Long id){
		boolean isExists = false;
		if(resourceRepository.findOne(id).getParent() != null){
			isExists = true;
		}
		return isExists;
	}
	
	/**
	 * 是否存在孩子节点
	 * @param id
	 * @return
	 */
	private boolean isChildrenExists(Long id){
		boolean isExists = false;
		Resource resource = resourceRepository.findOne(id);
		if(resource != null){
			Set<Resource> list = resource.getChildrens();
			if(list != null && !list.isEmpty()){
				isExists = true;
			}
		}
		
		return isExists;
	}
}


