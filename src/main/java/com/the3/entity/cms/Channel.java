package com.the3.entity.cms;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Channel.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:32
 */
@Document
public class Channel {
	@Id
	private String id;
	private String title;
	private String describe;
	private Date createTime = new Date();
	private Date modifyTime = new Date();

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	@Override
	public String toString() {
		return "Channel [id=" + id + ", title=" + title + ", describe="
				+ describe + ", createTime=" + createTime + ",modifyTime=" + modifyTime + "]";
	}
}
