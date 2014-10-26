package com.the3.entity.security;


import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.the3.base.entity.BaseEntity;

/**
 * Role.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:32:40
 */
@Entity
@Table(name="imethan_security_role")
public class Role extends BaseEntity {
	
	private String rolename;//角色名称
	private String intro;//描述
//	private List<User> users;//用户
//	private List<Permission> permissions;//权限
//	private List<Resource> resources;//资源
//	public List<Resource> getResources() {
//		return resources;
//	}
//	public void setResources(List<Resource> resources) {
//		this.resources = resources;
//	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	//	public List<User> getUsers() {
//		return users;
//	}
//	public void setUsers(List<User> users) {
//		this.users = users;
//	}
//	public List<Permission> getPermissions() {
//		return permissions;
//	}
//	public void setPermissions(List<Permission> permissions) {
//		this.permissions = permissions;
//	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}


