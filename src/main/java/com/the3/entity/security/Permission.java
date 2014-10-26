package com.the3.entity.security;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.the3.base.entity.BaseEntity;

/**
 * Permission.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:33:10
 */
@Entity
@Table(name="imethan_security_permission")
public class Permission extends BaseEntity {
	
	private String name;//权限名称
	private String intro;//描述
	private String permission;//权限
//	private Permission parent;//父级
//	private List<Permission> children;//子级
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
//	public Permission getParent() {
//		return parent;
//	}
//	public void setParent(Permission parent) {
//		this.parent = parent;
//	}
//	public List<Permission> getChildren() {
//		return children;
//	}
//	public void setChildren(List<Permission> children) {
//		this.children = children;
//	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}


