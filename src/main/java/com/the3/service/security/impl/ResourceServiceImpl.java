package com.the3.service.security.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.the3.dto.service.ServiceReturnDto;
import com.the3.entity.security.Permission;
import com.the3.entity.security.Resource;
import com.the3.entity.security.Role;
import com.the3.repository.security.PermissionRepository;
import com.the3.repository.security.ResourceRepository;
import com.the3.repository.security.RoleRepository;
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
	@Autowired
	private PermissionRepository permissionRepository;
	@Autowired
	private RoleRepository roleRepository;
	@PersistenceContext 
	private EntityManager entityManger;
	

	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto saveOrModify(Resource entity) {
		boolean isSuccess = true;
		try {
			resourceRepository.save(entity);
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return new ServiceReturnDto(isSuccess, entity);
	}

	@Override
	public Resource getById(Long id) {
		return resourceRepository.findOne(id);
	}

	@Override
	@Transactional(readOnly = false)
	public ServiceReturnDto deleteById(Long id) {
		boolean isSuccess = true;
		String message = "删除成功";
		try {
			if(this.isChildrenExists(id)){
				message = "删除失败,先删除子节点";
				isSuccess = false;
			}else if(this.isPermissionExists(id)){
				message = "删除失败,先删除授权信息";
				isSuccess = false;
			}else{
				resourceRepository.delete(id);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}
		return new ServiceReturnDto(isSuccess,message);
	}
	
	/**
	 * 判断是否存在授权信息
	 * @param id
	 * @return
	 */
	private boolean isPermissionExists(Long id) {
		Resource resource = resourceRepository.findOne(id);
		Set<Permission> set = resource.getPermissions();
		if(set != null && !set.isEmpty()){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public Set<Resource> getRootResource() {
		Set<Resource> list = resourceRepository.findByIsRoot(true);
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

	@Override
	public Set<Resource> getResourcePermissionForRoleInput(Long roleId) {
		
		//获取选中的资源和授权信息
		Role role = roleRepository.findOne(roleId);
		Set<Resource> checkResourceSet = role.getResources();
		Set<Permission> checkPermissionSet = role.getPermissions();
		
		Set<Resource> resources = resourceRepository.findByIsRoot(true);
		for(Resource resource : resources){//遍历父级节点
			
			//设置父级资源节点是否选中
			if(checkResourceSet.contains(resource)){
				resource.setChecked(true);
			}
			
			Set<Resource> childrens = resource.getChildrens();
			for(Resource children : childrens){//遍历子级节点
				
				//设置子级资源节点是否选中
				if(checkResourceSet.contains(children)){
					children.setChecked(true);
					resource.setChecked(true);
				}
				
				Set<Permission> permissions = children.getPermissions();//子级节点的授权信息
				if(children.getChildrens() ==null || children.getChildrens().isEmpty()){
					Set<Resource> resourceChildrensTemp = new HashSet<Resource>();
					
					for(Permission permission : permissions){
						Resource resourceChildrenTemp = new Resource();
						resourceChildrenTemp.setId(permission.getId());
						resourceChildrenTemp.setName(permission.getName());
						resourceChildrenTemp.setNodeType("permission");
						
						//设置授权节点是否选中
						if(checkPermissionSet.contains(permission)){
							resourceChildrenTemp.setChecked(true);
							children.setChecked(true);
							resource.setChecked(true);
						}
						resourceChildrensTemp.add(resourceChildrenTemp);
					}
					children.setChildrens(resourceChildrensTemp);
				}
			}
		}
		return resources;
	}
}