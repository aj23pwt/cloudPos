package com.greencloud.listener;


import java.math.BigDecimal;

import org.springframework.context.ApplicationEvent;

public class LogServiceEvent extends ApplicationEvent {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1924235542317898012L;
		
	
	public LogServiceEvent(Object source) {
		super(source);
		
	}
	
	/**客户编号**/
	private Long customerId;
	
	/**客户名**/
	private String customerName;
	
	/**服务类型**/
	private String serviceType;
	
	/**操作金额**/
	private BigDecimal amount;
	
	/**操作备注**/
	private String remark;


	public Long getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
	
}
