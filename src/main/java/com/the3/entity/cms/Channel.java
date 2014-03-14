package com.the3.entity.cms;


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
	
	private String title;
	private String describe;

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
