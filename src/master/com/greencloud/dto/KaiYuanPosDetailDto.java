package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class KaiYuanPosDetailDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long id;
	private String accnt;
	private String pluCode;
	private String toCode;
	private String pluDescript;
	private String unit;
	private String price;	
	private BigDecimal number;
	private BigDecimal amount;
	private BigDecimal srv;	
	private BigDecimal dsc;
	private BigDecimal tax;
	private String toCodeType;	
	private String toCodeTypeDes;
	private String toCodeTypeDesEn;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getAccnt() {
		return accnt;
	}
	public void setAccnt(String accnt) {
		this.accnt = accnt;
	}
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getToCode() {
		return toCode;
	}
	public void setToCode(String toCode) {
		this.toCode = toCode;
	}
	public String getPluDescript() {
		return pluDescript;
	}
	public void setPluDescript(String pluDescript) {
		this.pluDescript = pluDescript;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public BigDecimal getNumber() {
		return number;
	}
	public void setNumber(BigDecimal number) {
		this.number = number;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public BigDecimal getSrv() {
		return srv;
	}
	public void setSrv(BigDecimal srv) {
		this.srv = srv;
	}
	public BigDecimal getDsc() {
		return dsc;
	}
	public void setDsc(BigDecimal dsc) {
		this.dsc = dsc;
	}
	public BigDecimal getTax() {
		return tax;
	}
	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}
	public String getToCodeType() {
		return toCodeType;
	}
	public void setToCodeType(String toCodeType) {
		this.toCodeType = toCodeType;
	}
	public String getToCodeTypeDes() {
		return toCodeTypeDes;
	}
	public void setToCodeTypeDes(String toCodeTypeDes) {
		this.toCodeTypeDes = toCodeTypeDes;
	}
	public String getToCodeTypeDesEn() {
		return toCodeTypeDesEn;
	}
	public void setToCodeTypeDesEn(String toCodeTypeDesEn) {
		this.toCodeTypeDesEn = toCodeTypeDesEn;
	}

}
