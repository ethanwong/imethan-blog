package com.the3.entity.todo;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.the3.base.entity.BaseEntity;

@Entity
@Table(name="imethan_sys_todo")
public class Todo extends BaseEntity {

	private static final long serialVersionUID = 1L;
	
	private TodoType type = TodoType.IMETHAN;//类型
	private String content;//待办内容
	
	public TodoType getType() {
		return type;
	}
	public void setType(TodoType type) {
		this.type = type;
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
