package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class POSInterfaceGuestDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String accnt;
	private String sta;
	private String name;
	private String birth;
	private String idno;
	private String mobil;
	
	public String getAccnt() {
		return accnt;
	}
	public void setAccnt(String accnt) {
		this.accnt = accnt;
	}
	public String getSta() {
		return sta;
	}
	public void setSta(String sta) {
		this.sta = sta;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
		this.idno = idno;
	}
	public String getMobil() {
		return mobil;
	}
	public void setMobil(String mobil) {
		this.mobil = mobil;
	}
}
