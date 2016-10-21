package com.greencloud.entity;

import java.math.BigDecimal;

public class PosSysReason extends OperationInfo{

	private String code;
	private String dscType;
	private String descript;
	private String descriptEn;
	private BigDecimal p01;
	private BigDecimal p02;
	private BigDecimal p03;
	private BigDecimal p04;
	private BigDecimal p90;
	private String isHalt;
	private Integer listOrder;
	private String codeType;
	private String groupCode;
	private String isGroup;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDscType() {
		return dscType;
	}
	public void setDscType(String dscType) {
		this.dscType = dscType;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public String getDescriptEn() {
		return descriptEn;
	}
	public void setDescriptEn(String descriptEn) {
		this.descriptEn = descriptEn;
	}
	public BigDecimal getP01() {
		return p01;
	}
	public void setP01(BigDecimal p01) {
		this.p01 = p01;
	}
	public BigDecimal getP02() {
		return p02;
	}
	public void setP02(BigDecimal p02) {
		this.p02 = p02;
	}
	public BigDecimal getP03() {
		return p03;
	}
	public void setP03(BigDecimal p03) {
		this.p03 = p03;
	}
	public BigDecimal getP04() {
		return p04;
	}
	public void setP04(BigDecimal p04) {
		this.p04 = p04;
	}
	public BigDecimal getP90() {
		return p90;
	}
	public void setP90(BigDecimal p90) {
		this.p90 = p90;
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
