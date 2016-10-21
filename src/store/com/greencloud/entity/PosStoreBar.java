package com.greencloud.entity;

public class PosStoreBar extends OperationInfo {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5619175316801736181L;
	private String code;
	private String descript;
	private String descriptEn;
	private String staffId;
	private String pcCodes;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	public String getStaffId() {
		return staffId;
	}
	public void setStaffId(String staffId) {
		this.staffId = staffId;
	}
	public String getPcCodes() {
		return pcCodes;
	}
	public void setPcCodes(String pcCodes) {
		this.pcCodes = pcCodes;
	}
}
