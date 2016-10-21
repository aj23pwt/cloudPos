package com.greencloud.entity;

import java.math.BigDecimal;

public class PosStorePluArticle extends OperationInfo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3314104881261757380L;
	private String pluCode;
	private String pluName;
	private String artCode;
	private String artName;
	private BigDecimal rate;
	public String getPluCode() {
		return pluCode;
	}
	public void setPluCode(String pluCode) {
		this.pluCode = pluCode;
	}
	public String getPluName() {
		return pluName;
	}
	public void setPluName(String pluName) {
		this.pluName = pluName;
	}
	public String getArtCode() {
		return artCode;
	}
	public void setArtCode(String artCode) {
		this.artCode = artCode;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	public BigDecimal getRate() {
		return rate;
	}
	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}
	
}
