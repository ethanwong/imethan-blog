package cn.imethan.dto.common;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * ReturnDto.java
 *
 * @author Ethan Wong
 * @param <S>
 * @time 2014年3月8日下午10:29:21
 */
public class ReturnDto implements Serializable {
	
	private static final long serialVersionUID = -5166483670926027917L;
	
	private boolean isSuccess = true;
	private String message = "Successfully!";
	private Object entity;
	
	public ReturnDto() {
		
	}
	public ReturnDto(boolean isSuccess, Object entity) {
		super();
		this.isSuccess = isSuccess;
		this.entity = entity;
	}
	
	public ReturnDto(boolean isSuccess,String message) {
		super();
		this.isSuccess = isSuccess;
		this.message = message;
	}
	
	public ReturnDto(boolean isSuccess,String message, Object entity) {
		super();
		this.isSuccess = isSuccess;
		this.message = message;
		this.entity = entity;
	}
	
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public Object getEntity() {
		return entity;
	}
	public void setEntity(Object entity) {
		this.entity = entity;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}