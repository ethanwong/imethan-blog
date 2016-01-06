package cn.imethan.entity.message;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import cn.imethan.common.entity.BaseEntity;

/**
 * Contact.java
 *
 * @author Ethan Wong
 * @time 2014年12月24日下午11:37:52
 */
@Entity
@Table(name="imethan_contact_message")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE) 
public class Message extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	private String name;
	private String email;
	private String content;
	private int isShow = 1;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getIsShow() {
		return isShow;
	}
	public void setIsShow(int isShow) {
		this.isShow = isShow;
	}

}