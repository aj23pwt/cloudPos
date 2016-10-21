package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class POSInterfaceCardFkDto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long cardId;
	private String cardNo;
	private String cardDescript;
	private BigDecimal amount;
	private BigDecimal pointBalance;
	private String passwdNeeded;
	private String password;
	private String posMode;
	private String posModeDescript;
	private String saldid;
	private String salesdescript;
	private String birth;
	private String sex;
	private String sta;
	private String mobile;
	private String cardType;
	private String cardTypeDes;
	private String cardLevel;
	private String cardLevelDes;
	private String remark="";
	private Long guestid;
	private String issHotel;
	private Long memberId;
	private String arr;
	private String dep;
	private String passvalidate;

//	开元新增5个折扣比例
	private BigDecimal foodDiscount;
	private BigDecimal beveDiscount;
	private BigDecimal miscDiscount;
	private BigDecimal discount1;
	private BigDecimal discount2;

	public Long getCardId() {
		return cardId;
	}
	public BigDecimal getPointBalance() {
		return pointBalance;
	}
	public void setPointBalance(BigDecimal pointBalance) {
		this.pointBalance = pointBalance;
	}
	public void setCardId(Long cardId) {
		this.cardId = cardId;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardDescript() {
		return cardDescript;
	}
	public void setCardDescript(String cardDescript) {
		this.cardDescript = cardDescript;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getPasswdNeeded() {
		return passwdNeeded;
	}
	public void setPasswdNeeded(String passwdNeeded) {
		this.passwdNeeded = passwdNeeded;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSta() {
		return sta;
	}
	public void setSta(String sta) {
		this.sta = sta;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardTypeDes() {
		return cardTypeDes;
	}
	public void setCardTypeDes(String cardTypeDes) {
		this.cardTypeDes = cardTypeDes;
	}
	public String getCardLevel() {
		return cardLevel;
	}
	public void setCardLevel(String cardLevel) {
		this.cardLevel = cardLevel;
	}
	public String getCardLevelDes() {
		return cardLevelDes;
	}
	public void setCardLevelDes(String cardLevelDes) {
		this.cardLevelDes = cardLevelDes;
	}
	public Long getGuestid() {
		return guestid;
	}
	public void setGuestid(Long guestid) {
		this.guestid = guestid;
	}
	public String getIssHotel() {
		return issHotel;
	}
	public void setIssHotel(String issHotel) {
		this.issHotel = issHotel;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getPassvalidate() {
		return passvalidate;
	}

//开元折扣比例	
	public void setPassvalidate(String passvalidate) {
		this.passvalidate = passvalidate;
	}
	public BigDecimal getFoodDiscount() {
		return foodDiscount;
	}
	public void setFoodDiscount(BigDecimal foodDiscount) {
		this.foodDiscount = foodDiscount;
	}
	public BigDecimal getBeveDiscount() {
		return beveDiscount;
	}
	public void setBeveDiscount(BigDecimal beveDiscount) {
		this.beveDiscount = beveDiscount;
	}
	public BigDecimal getMiscDiscount() {
		return miscDiscount;
	}
	public void setMiscDiscount(BigDecimal miscDiscount) {
		this.miscDiscount = miscDiscount;
	}
	public BigDecimal getDiscount1() {
		return discount1;
	}
	public void setDiscount1(BigDecimal discount1) {
		this.discount1 = discount1;
	}
	public BigDecimal getDiscount2() {
		return discount2;
	}
	public void setDiscount2(BigDecimal discount2) {
		this.discount2 = discount2;
	}
}
