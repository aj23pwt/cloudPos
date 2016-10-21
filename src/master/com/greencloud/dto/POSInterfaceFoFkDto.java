package com.greencloud.dto;

import java.math.BigDecimal;

public class POSInterfaceFoFkDto {
	
	private static final long serialVersionUID = 1L;
	private Long accnt;
	private String rmno;
	private String name;
	private String name2;
	private String arr;
	private String dep;
	private BigDecimal amount;
	private String sta;
	private String postingFlag;
	private String remark;
//结账提醒
	private String coMsg;
//	信用
	private BigDecimal credit;
	public Long getAccnt() {
		return accnt;
	}
	public void setAccnt(Long accnt) {
		this.accnt = accnt;
	}
	public String getRmno() {
		return rmno;
	}
	public void setRmno(String rmno) {
		this.rmno = rmno;
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
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getCoMsg() {
		return coMsg;
	}
	public void setCoMsg(String coMsg) {
		this.coMsg = coMsg;
	}
	public BigDecimal getCredit() {
		return credit;
	}
	public void setCredit(BigDecimal credit) {
		this.credit = credit;
	}
}
