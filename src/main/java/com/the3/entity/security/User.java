package com.the3.entity.security;

import java.util.List;

import javax.persistence.Entity;
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
	
	private String username;//账号
	private String password;//密码
	private String nickname;//昵称
	
//	private List<Role> roles;//角色

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

//	public List<Role> getRoles() {
//		return roles;
//	}
//
//	public void setRoles(List<Role> roles) {
//		this.roles = roles;
//	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	

}


