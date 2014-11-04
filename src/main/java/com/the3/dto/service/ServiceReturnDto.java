package com.the3.dto.service;

/**
 * ServiceReturnDto.java
 *
 * @author Ethan Wong
 * @param <S>
 * @time 2014年3月8日下午10:29:21
 */
public class ServiceReturnDto<T> {
	
	private boolean isSuccess = true;
	private String message = "操作成功";
	private T entity;
	
	public ServiceReturnDto() {
		
	}
	public ServiceReturnDto(boolean isSuccess, T entity) {
		super();
		this.isSuccess = isSuccess;
		this.entity = entity;
	}
	
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public T getEntity() {
		return entity;
	}
	public void setEntity(T entity) {
		this.entity = entity;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	

}