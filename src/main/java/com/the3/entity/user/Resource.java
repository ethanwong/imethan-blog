package com.the3.entity.user;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.data.mongodb.core.mapping.DBRef;
import org.springframework.data.mongodb.core.mapping.Document;

import com.the3.base.entity.BaseEntity;

/**
 * Resource.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:01:41
 */
@Document
public class Resource extends BaseEntity {
	
	private String name;//名称
	private String module;//模块名称
	private String url;//URL
	private String describe;//描述
	private boolean isRoot;//是否是根节点
	@DBRef
	private List<Permission> permissions;//授权
	@DBRef
	private Resource parent;//父级
	@DBRef
	private List<Resource> childrens;//子级
	
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
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public List<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	public Resource getParent() {
		return parent;
	}
	public void setParent(Resource parent) {
		this.parent = parent;
	}
	public List<Resource> getChildrens() {
		return childrens;
	}
	public void setChildrens(List<Resource> childrens) {
		this.childrens = childrens;
	}
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


