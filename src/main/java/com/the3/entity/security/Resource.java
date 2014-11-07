package com.the3.entity.security;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import com.the3.base.entity.BaseEntity;

/**
 * Resource.java
 *
 * @author Ethan Wong
 * @time 2014年3月17日下午10:01:41
 */
@Entity
@Table(name="imethan_security_resource")
@JsonIgnoreProperties(value={"parent","roles","permissions","modifyTime","createTime","intro","module","url"})
public class Resource extends BaseEntity {
	
	private static final long serialVersionUID = 6701956302298630995L;
	
	@NotNull
	@Size(min=4, max=20,message="title must be between 4 and 20")
	private String name;//名称
	
	@NotNull
	@Size(min=4,message="module must not by null")
	private String module;//模块名称
	
	@NotNull
	@Size(min=4,message="url must not by null")
	private String url;//URL
	
	@NotNull
	@Size(min=4,message="intro must not by null")
	private String intro;//描述
	
	private boolean isRoot;//是否是根节点
	@Transient
	private boolean open = true;
	
	public Resource(){
	}
	
	public Resource(Long id){
		this.setId(id);
	}
	
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}

	@Transient
	private Long parentId;
	
	public Long getParentId() {
		if(parent != null){
			return this.parent.getId();
		}else{
			return 0l;
		}
		
	}
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	
	@ManyToOne(cascade = {CascadeType.MERGE},fetch = FetchType.LAZY)
	@JoinColumn(name="pid")
	private Resource parent;//父级
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="parent")
	@OrderBy("id")
	private Set<Resource> childrens = new HashSet<Resource>();//子级
	
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.MERGE}, mappedBy = "resources", fetch = FetchType.LAZY)
	private Set<Role> roles = new HashSet<Role>();//角色
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy="resource")
	@OrderBy("id")
	private Set<Permission> permissions = new HashSet<Permission>();//授权
	
	public Resource getParent() {
		return parent;
	}
	public void setParent(Resource parent) {
		this.parent = parent;
	}
	
	public Set<Resource> getChildrens() {
		return childrens;
	}
	public void setChildrens(Set<Resource> childrens) {
		this.childrens = childrens;
	}
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