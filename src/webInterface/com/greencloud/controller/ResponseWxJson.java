package com.greencloud.controller;
/**
 * 
 * JSON模型
 * 
 * 后台向前台返回的JSON对象
 * 
 * @author AJ23PWT 
 * 
 */
@SuppressWarnings("serial")
public class ResponseWxJson implements java.io.Serializable {

	private String status = "0";

	private  Object data ;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	


}
