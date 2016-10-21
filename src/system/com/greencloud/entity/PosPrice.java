package com.greencloud.entity;

import java.math.BigDecimal;

public class PosPrice extends OperationInfo{
	
	private Long pluCode;
	private String pccode;
	private Integer inumber;
	private String unit;
	private BigDecimal price;
	private BigDecimal cost;
	private BigDecimal costF;
	private String baseunit;
	private BigDecimal basenumb;
	private String flag;
	private String isHalt;
	private Integer listOrder;
	private String codeType;
	private String groupCode;
	private String isGroup;
	public Long getPluCode() {
		return pluCode;
	}
	public void setPluCode(Long pluCode) {
		this.pluCode = pluCode;
	}
	
	public String getPccode() {
		return pccode;
	}
	public void setPccode(String pccode) {
		this.pccode = pccode;
	}
	public Integer getInumber() {
		return inumber;
	}
	public void setInumber(Integer inumber) {
		this.inumber = inumber;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getCost() {
		return cost;
	}
	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}
	public BigDecimal getCostF() {
		return costF;
	}
	public void setCostF(BigDecimal costF) {
		this.costF = costF;
	}
	public String getBaseunit() {
		return baseunit;
	}
	public void setBaseunit(String baseunit) {
		this.baseunit = baseunit;
	}
	public BigDecimal getBasenumb() {
		return basenumb;
	}
	public void setBasenumb(BigDecimal basenumb) {
		this.basenumb = basenumb;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
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
