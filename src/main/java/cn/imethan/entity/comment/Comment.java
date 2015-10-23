package cn.imethan.entity.comment;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import cn.imethan.common.entity.BaseEntity;

@Entity
@Table(name="imethan_sys_comment")
public class Comment extends BaseEntity {

	private static final long serialVersionUID = -6942577833622786934L;
	
	private CommentType type;//类型：
	private String content;//内容
	private Long extendId;//扩展ID
	private String username;//用户名
	private String email;//邮箱地址
	
	public CommentType getType() {
		return type;
	}
	public void setType(CommentType type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Long getExtendId() {
		return extendId;
	}
	public void setExtendId(Long extendId) {
		this.extendId = extendId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
