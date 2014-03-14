package com.the3.dto.web;

/**
 * WebReturnDto.java
 *
 * @author Ethan Wong
 * @time 2014年3月10日下午10:25:57
 */
public class WebReturnDto {

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


