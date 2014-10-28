package com.the3.entity.security;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
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
	
	private static final long serialVersionUID = 6701956302298630995L;
	
	private String name;//名称
	private String module;//模块名称
	private String url;//URL
	private String intro;//描述
	private boolean isRoot;//是否是根节点
//	private Resource parent;//父级
//	private List<Resource> childrens;//子级
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, mappedBy = "resources", fetch = FetchType.LAZY)
	private Set<Role> roles = new HashSet<Role>();//角色
	
	@ManyToMany
    @JoinTable(name="imethan_security_resource_permission",joinColumns = { @JoinColumn(name ="resource_id" )} ,inverseJoinColumns = { @JoinColumn(name = "permission_id")})
	@OrderBy("id")
	private Set<Permission> permissions = new HashSet<Permission>();//授权
	
	public Set<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
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