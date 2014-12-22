package com.the3.dto.userinfo;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * UserInfo.java
 *
 * @author Ethan Wong
 * @time 2014年12月22日下午9:53:26
 */
public class UserInfo {
	
	private String username;//账号
	private String nickname;//昵称
	private String email;//Email
	private String phone;//手机号码
	private String locate;//位置
	private String avatar;//头像
	
	public UserInfo(String username, String nickname, String email,
			String phone, String locate, String avatar) {
		super();
		this.username = username;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.locate = locate;
		this.avatar = avatar;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLocate() {
		return locate;
	}

	public void setLocate(String locate) {
		this.locate = locate;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}


