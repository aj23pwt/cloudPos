package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class POSInterfaceGuestFkDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String accnt;
	private String sta;
	private String name;
	private String sex;
	private String birth;
	private String idno;
	private String mobil;
	private String saldid;
	private String salesdescript;
	private String posMode;
	private String posModeDescript;
	private String prefer;
	private String remark;
	private String arr;
	private String dep;
	private String linkman;
	
	
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
	public String getSaldid() {
		return saldid;
	}
	public void setSaldid(String saldid) {
		this.saldid = saldid;
	}
	public String getSalesdescript() {
		return salesdescript;
	}
	public void setSalesdescript(String salesdescript) {
		this.salesdescript = salesdescript;
	}
	public String getPosMode() {
		return posMode;
	}
	public void setPosMode(String posMode) {
		this.posMode = posMode;
	}
	public String getPosModeDescript() {
		return posModeDescript;
	}
	public void setPosModeDescript(String posModeDescript) {
		this.posModeDescript = posModeDescript;
	}
	public String getPrefer() {
		return prefer;
	}
	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
}
