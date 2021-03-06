package cn.imethan.service.security;

import java.util.List;

import cn.imethan.dto.common.ReturnDto;
import cn.imethan.entity.security.Permission;

/**
 * PermissionService.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午5:00:27
 */
public interface PermissionService{
	
	/**
	 * 根据resourceId获取授权列表
	 * @param resourceId
	 * @return
	 */
	List<Permission> getByResourceId(Long resourceId);
	
	/**
	 * 根据ID获取
	 * @param id
	 * @return
	 */
	Permission getById(Long id);
	
	/**
	 * 根据ID删除
	 * @param id
	 * @return
	 */
	ReturnDto deleteById(Long id);
	
	/**
	 * 保存或者删除
	 * @param permission
	 * @return
	 */
	ReturnDto saveOrModify(Permission permission);

}


