package com.the3.base.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.MappedSuperclass;

/**
 * IdEntity.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:51:08
 */
@MappedSuperclass 
public class IdEntity {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;//ID

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
}


