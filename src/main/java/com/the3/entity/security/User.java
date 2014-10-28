package com.the3.entity.security;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import org.apache.commons.lang3.builder.ToStringBuilder;
import com.the3.base.entity.BaseEntity;

/**
 * User.java
 *
 * @author Ethan Wong
 * @time 2014年3月16日下午4:32:34
 */
@Entity
@Table(name="imethan_security_user")
public class User extends BaseEntity {
	
	private static final long serialVersionUID = 2732105841282347957L;
	
	private String username;//账号
	private String password;//密码
	private String nickname;//昵称
	
	@ManyToMany
    @JoinTable(name="imethan_security_user_role",joinColumns = { @JoinColumn(name ="user_id" )} ,inverseJoinColumns = { @JoinColumn(name = "role_id")})
	@OrderBy("id")
	private Set<Role> roles = new HashSet<Role>();//角色

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}