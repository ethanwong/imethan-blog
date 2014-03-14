package com.the3.base.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * IdEntity.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:51:08
 */
@Document
public class IdEntity {
	@Id
	private String id;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}


