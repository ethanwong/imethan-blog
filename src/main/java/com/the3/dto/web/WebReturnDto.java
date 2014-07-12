package com.the3.dto.web;

import java.io.Serializable;

/**
 * WebReturnDto.java
 *
 * @author Ethan Wong
 * @time 2014年3月10日下午10:25:57
 */
public class WebReturnDto implements Serializable {

	private static final long serialVersionUID = 7914053967907070806L;
	
	private boolean isSuccess = true;
	private String message = "Successfully!";
	
	public WebReturnDto(){
		
	}
	
	public WebReturnDto(boolean isSuccess, String message) {
		super();
		this.isSuccess = isSuccess;
		this.message = message;
	}
	
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "WebReturnDto [isSuccess=" + isSuccess + ", message=" + message
				+ "]";
	}
	
}


