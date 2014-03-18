package com.the3.entity.cms;


import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.springframework.data.mongodb.core.mapping.Document;

import com.the3.base.entity.BaseEntity;

/**
 * Channel.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:32
 */
@Document
public class Channel extends BaseEntity {
	
	@NotNull
	@Size(min=4, max=20,message="title must be between 4 and 20")
	private String title;//标题
	@NotNull(message="describe must not by null")
	private String describe;//描述

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
