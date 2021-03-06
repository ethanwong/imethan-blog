package cn.imethan.entity.security;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.JoinColumn;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import cn.imethan.common.entity.BaseEntity;

/**
 * Role.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:32:40
 */
@Entity
@Table(name="imethan_security_role")
@JsonIgnoreProperties(value = {"users","createTime"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="securityCache") 
public class Role extends BaseEntity {
	
	private static final long serialVersionUID = -6601962016508223381L;
	
	private String name;//角色名称
	private String intro;//描述
	
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="securityCache") 
	@ManyToMany(cascade = {CascadeType.PERSIST}, mappedBy = "roles", fetch = FetchType.LAZY)
	private Set<User> users = new HashSet<User>();//用户集合
    
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="securityCache") 
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name="imethan_security_role_resource",joinColumns = { @JoinColumn(name ="roleId" )} ,inverseJoinColumns = { @JoinColumn(name = "resourceId")})
	@OrderBy("id")
	private Set<Resource> resources = new HashSet<Resource>();//资源
	
	public Set<Resource> getResources() {
		return resources;
	}
	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
	@JoinTable(name="imethan_security_role_permission",joinColumns = { @JoinColumn(name ="roleId" )} ,inverseJoinColumns = { @JoinColumn(name = "permissionId")})
	@OrderBy("id")
	private Set<Permission> permissions = new HashSet<Permission>();//授权
	
	public Set<Permission> getPermissions() {
		return permissions;
	}
	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}
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
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}