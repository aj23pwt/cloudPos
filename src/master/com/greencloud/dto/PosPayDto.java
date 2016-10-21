package com.greencloud.dto;

import java.math.BigDecimal;

public class PosPayDto  implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2025109249187127414L;
	private String code;
	private String descript;
	private Long accnt;
	private String remark;
	private BigDecimal pay;
	private String cardNo;
	private String passwd;
	private BigDecimal receipt;
	private Long sysOrder;	
	
	public Long getSysOrder() {
		return sysOrder;
	}
	public void setSysOrder(Long sysOrder) {
		this.sysOrder = sysOrder;
	}
	public BigDecimal getReceipt() {
		return receipt;
	}
	public void setReceipt(BigDecimal receipt) {
		this.receipt = receipt;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Long getAccnt() {
		return accnt;
	}
	public void setAccnt(Long accnt) {
		this.accnt = accnt;
	}
	public BigDecimal getPay() {
		return pay;
	}
	public void setPay(BigDecimal pay) {
		this.pay = pay;
	}
}
