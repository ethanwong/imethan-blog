package com.the3.entity.cms;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.the3.base.entity.BaseEntity;

/**
 * Article.java
 *
 * @author Ethan Wong
 * @time 2014年3月2日下午4:44:26
 */
@Entity
@Table(name="imethan_cms_article")
public class Article extends BaseEntity {

	private static final long serialVersionUID = 3135828776040100046L;
	
	private String title;//标题
	private String content;//内容
	
	private Channel channel;//栏目
	
	public Channel getChannel() {
		return channel;
	}
	public void setChannel(Channel channel) {
		this.channel = channel;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
	
}
