package com.the3.entity.security;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.the3.base.entity.BaseEntity;

/**
 * Resource.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:01:41
 */
@Entity
@Table(name="imethan_security_resource")
public class Resource extends BaseEntity {
	
	private String name;//名称
	private String module;//模块名称
	private String url;//URL
	private String intro;//描述
	private boolean isRoot;//是否是根节点
//	private List<Permission> permissions;//授权
//	private Resource parent;//父级
//	private List<Resource> childrens;//子级
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	//	public List<Permission> getPermissions() {
//		return permissions;
//	}
//	public void setPermissions(List<Permission> permissions) {
//		this.permissions = permissions;
//	}
//	public Resource getParent() {
//		return parent;
//	}
//	public void setParent(Resource parent) {
//		this.parent = parent;
//	}
//	public List<Resource> getChildrens() {
//		return childrens;
//	}
//	public void setChildrens(List<Resource> childrens) {
//		this.childrens = childrens;
//	}
	public boolean isRoot() {
		return isRoot;
	}
	public void setRoot(boolean isRoot) {
		this.isRoot = isRoot;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}


