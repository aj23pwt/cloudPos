package com.greencloud.dto;

import java.util.Date;

public class PosUserDto implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4061769776052081818L;
	private long hotelGroupId;
	private long hotelId;
	private String pcCode;
	private String userCode;
	private String cashier;
	private Date bizDate;
	private String taCode;
	private String cardNo;
	private String type1;
	public String getTaCode() {
		return taCode;
	}
	public void setTaCode(String taCode) {
		this.taCode = taCode;
	}
	public long getHotelGroupId() {
		return hotelGroupId;
	}
	public void setHotelGroupId(long hotelGroupId) {
		this.hotelGroupId = hotelGroupId;
	}
	public long getHotelId() {
		return hotelId;
	}
	public void setHotelId(long hotelId) {
		this.hotelId = hotelId;
	}
	public String getPcCode() {
		return pcCode;
	}
	public void setPcCode(String pcCode) {
		this.pcCode = pcCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getCashier() {
		return cashier;
	}
	public void setCashier(String cashier) {
		this.cashier = cashier;
	}
	public Date getBizDate() {
		return bizDate;
	}
	public void setBizDate(Date bizDate) {
		this.bizDate = bizDate;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}

}
