package com.the3.entity.user;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import com.the3.base.entity.BaseEntity;

/**
 * Role.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:32:40
 */
@Document
public class Role extends BaseEntity {
	
	private String rolename;//角色名称
	private String describe;//描述
	@DBRef
	private List<User> users;//用户
	@DBRef
	private List<Permission> permissions;//权限
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}


