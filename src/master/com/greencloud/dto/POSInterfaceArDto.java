package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class POSInterfaceArDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long accnt;
	private String name;
	private String name2;
	private BigDecimal amount;
	private String sta;
	private String postingFlag;
	public Long getAccnt() {
		return accnt;
	}
	public void setAccnt(Long accnt) {
		this.accnt = accnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getSta() {
		return sta;
	}
	public void setSta(String sta) {
		this.sta = sta;
	}
	public String getPostingFlag() {
		return postingFlag;
	}
	public void setPostingFlag(String postingFlag) {
		this.postingFlag = postingFlag;
	}
	
	
}
