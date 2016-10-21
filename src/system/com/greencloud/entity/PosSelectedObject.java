package com.greencloud.entity;


public class PosSelectedObject extends OperationInfo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String stationCode;
	private String stationDes;
	private String userCode;
	private String category;
	private String accntType;
	private String accnt;
	private String pcrec;
	private Integer number;
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getStationCode() {
		return stationCode;
	}
	public void setStationCode(String stationCode) {
		this.stationCode = stationCode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAccntType() {
		return accntType;
	}
	public void setAccntType(String accntType) {
		this.accntType = accntType;
	}
	public String getAccnt() {
		return accnt;
	}
	public void setAccnt(String accnt) {
		this.accnt = accnt;
	}
	public String getPcrec() {
		return pcrec;
	}
	public void setPcrec(String pcrec) {
		this.pcrec = pcrec;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public String getStationDes() {
		return stationDes;
	}
	public void setStationDes(String stationDes) {
		this.stationDes = stationDes;
	}

}
