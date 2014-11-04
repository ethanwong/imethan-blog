package com.the3.service.security.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.base.service.impl.BaseServiceImpl;
import com.the3.dto.service.ServiceReturnDto;
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
	@PersistenceUnit 
	private EntityManagerFactory emf;
	
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
	public ServiceReturnDto<Permission> saveOrModify(Permission entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Permission> getPage(Map<String, Object> parameters,
			PageRequest pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Permission getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(Long id) {
		// TODO Auto-generated method stub
		return false;
	}
}


