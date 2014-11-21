package com.the3.service.security.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.dto.common.ReturnDto;
import com.the3.entity.security.Permission;
import com.the3.repository.security.PermissionRepository;
import com.the3.service.security.PermissionService;


/**
 * PermissionServiceImpl.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:02:56
 */
@Service
@Transactional(readOnly = true)
public class PermissionServiceImpl  implements PermissionService {
	
	private Logger logger = Logger.getLogger(PermissionServiceImpl.class);  
	
	@Autowired
	private PermissionRepository permissionRepository;
	
	@PersistenceContext 
	private EntityManager entityManger;
	
	@Override
	public List<Permission> getByResourceId(Long resourceId) {
		
		List<Permission> list = new ArrayList<Permission>();
		try {
			String jpql = "SELECT p FROM Permission p where p.resource.id = ?1";   
			Query query =  entityManger.createQuery(jpql);
			query.setParameter(1, resourceId);
			list = query.getResultList();   
		} catch (Exception e) {
			e.printStackTrace();
		} 
        
		return list;
	}

	@Override
	public Permission getById(Long id) {
		return permissionRepository.findOne(id);
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			permissionRepository.delete(id);
		} catch (Exception e) {
			isSuccess = false;
			message = "删除失败";
			e.printStackTrace();
		}
		return new ReturnDto(isSuccess,message);
	}

	@Override
	@Transactional(readOnly = false)
	public ReturnDto saveOrModify(Permission permission) {
		boolean isSuccess = true;
		String message = "操作成功";
		try {
			permissionRepository.save(permission);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
			message = "操作失败";
		}
		return new ReturnDto(isSuccess,message,permission);
	}

}