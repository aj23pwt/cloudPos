package com.greencloud.dto;

import java.math.BigDecimal;
import java.util.Date;

public class PosMemberPointDto implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4061769776052081818L;
	
	private Long hotelGroupId;//集团id
	private Long hotelId;//酒店id
	private Date bizDate;//ihotel当前营业日期
	private String accnt;//餐单号
	private String cardNo;//外部卡号
	private String market;//来源
	private String src;//来源
	private String posMode;//餐娱码。选填。
	private String rmtype;//桌号、包厢号有没有类似房型的属性,没有就""？选填。
	private String tableno;//桌号、包厢号选填。
	
	private Date bDate;//单笔费用的营业日期
	private String taCode;//费用码	
	private String taCodeOld;//原系统费用码。选填。
	private String taDescript;//原系统费用码描述。选填。
	private String taDescriptEn;//原系统费用码描述。选填。
	private BigDecimal charge;//单笔费用
	private BigDecimal pay;//付款
	private Long number;//单笔费用的序号
	
	private Long   cashier;//班别
	private String remark;//备注
	private String createUser;//单笔费用操作员工号
	private Date createDatetime;//单笔费用操作时间
	
	private String payCode; //付款码

	public Long getHotelGroupId() {
		return hotelGroupId;
	}

	public void setHotelGroupId(Long hotelGroupId) {
		this.hotelGroupId = hotelGroupId;
	}

	public Long getHotelId() {
		return hotelId;
	}

	public void setHotelId(Long hotelId) {
		this.hotelId = hotelId;
	}

	public Date getBizDate() {
		return bizDate;
	}

	public void setBizDate(Date bizDate) {
		this.bizDate = bizDate;
	}

	public String getAccnt() {
		return accnt;
	}

	public void setAccnt(String accnt) {
		this.accnt = accnt;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getMarket() {
		return market;
	}

	public void setMarket(String market) {
		this.market = market;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getPosMode() {
		return posMode;
	}

	public void setPosMode(String posMode) {
		this.posMode = posMode;
	}

	public String getRmtype() {
		return rmtype;
	}

	public void setRmtype(String rmtype) {
		this.rmtype = rmtype;
	}

	public String getTableno() {
		return tableno;
	}

	public void setTableno(String tableno) {
		this.tableno = tableno;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getTaCode() {
		return taCode;
	}

	public void setTaCode(String taCode) {
		this.taCode = taCode;
	}

	public String getTaCodeOld() {
		return taCodeOld;
	}

	public void setTaCodeOld(String taCodeOld) {
		this.taCodeOld = taCodeOld;
	}

	public String getTaDescript() {
		return taDescript;
	}

	public void setTaDescript(String taDescript) {
		this.taDescript = taDescript;
	}

	public String getTaDescriptEn() {
		return taDescriptEn;
	}

	public void setTaDescriptEn(String taDescriptEn) {
		this.taDescriptEn = taDescriptEn;
	}

	public BigDecimal getCharge() {
		return charge;
	}

	public void setCharge(BigDecimal charge) {
		this.charge = charge;
	}

	public BigDecimal getPay() {
		return pay;
	}

	public void setPay(BigDecimal pay) {
		this.pay = pay;
	}

	public Long getNumber() {
		return number;
	}

	public void setNumber(Long number) {
		this.number = number;
	}

	public Long getCashier() {
		return cashier;
	}

	public void setCashier(Long cashier) {
		this.cashier = cashier;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDatetime() {
		return createDatetime;
	}

	public void setCreateDatetime(Date createDatetime) {
		this.createDatetime = createDatetime;
	}

	public String getPayCode() {
		return payCode;
	}

	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}

}

