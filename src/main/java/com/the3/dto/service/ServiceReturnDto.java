package com.the3.dto.service;

/**
 * ServiceReturnDto.java
 *
 * @author Ethan Wong
 * @param <S>
 * @time 2014年3月8日下午10:29:21
 */
public class ServiceReturnDto {
	
	private boolean isSuccess = true;
	private String message = "操作成功";
	private Object entity;
	
	public ServiceReturnDto() {
		
	}
	public ServiceReturnDto(boolean isSuccess, Object entity) {
		super();
		this.isSuccess = isSuccess;
		this.entity = entity;
	}
	
	public ServiceReturnDto(boolean isSuccess,String message) {
		super();
		this.isSuccess = isSuccess;
		this.message = message;
	}
	
	public ServiceReturnDto(boolean isSuccess,String message, Object entity) {
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
	

}