package com.greencloud.entity;

import java.math.BigDecimal;
import java.util.Date;

public class PosCurrentPrice extends OperationInfo{

	private Date bizDate;
	private String pluCode;
	private String pluUnit;
	private BigDecimal price;
	private BigDecimal number;
	private String isHalt;
	private Integer listOrder;
	private String codeType;
	private String groupCode;
	private String isGroup;
	public Date getBizDate() {
		return bizDate;
	}
	public void setBizDate(Date bizDate) {
		this.bizDate = bizDate;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getPluUnit() {
		return pluUnit;
	}
	public void setPluUnit(String pluUnit) {
		this.pluUnit = pluUnit;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getNumber() {
		return number;
	}
	public void setNumber(BigDecimal number) {
		this.number = number;
	}
	public String getIsHalt() {
		return isHalt;
	}
	public void setIsHalt(String isHalt) {
		this.isHalt = isHalt;
	}
	public Integer getListOrder() {
		return listOrder;
	}
	public void setListOrder(Integer listOrder) {
		this.listOrder = listOrder;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getIsGroup() {
		return isGroup;
	}
	public void setIsGroup(String isGroup) {
		this.isGroup = isGroup;
	}
	
}
