package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class KaiYuanCardPosOldDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6396489048387248679L;
	private String traceId;
	private String terminalId;
	private BigDecimal amount;
	/**
	 * 卡号
	 */
	private String svan;
	private Discount discount;


	public static class Discount{
		private BigDecimal foodDiscount;
		private BigDecimal beveDiscount;
		private BigDecimal miscDiscount;
		private BigDecimal discount1;
		private BigDecimal discount2;
		private BigDecimal discount3;
		private BigDecimal discount4;
		private BigDecimal discount5;
		private BigDecimal discount6;
		private BigDecimal discount7;
		private BigDecimal discount8;
		private BigDecimal discount9;
		private BigDecimal discount10;
		
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
		public BigDecimal getDiscount3() {
			return discount3;
		}
		public void setDiscount3(BigDecimal discount3) {
			this.discount3 = discount3;
		}
		public BigDecimal getDiscount4() {
			return discount4;
		}
		public void setDiscount4(BigDecimal discount4) {
			this.discount4 = discount4;
		}
		public BigDecimal getDiscount5() {
			return discount5;
		}
		public void setDiscount5(BigDecimal discount5) {
			this.discount5 = discount5;
		}
		public BigDecimal getDiscount6() {
			return discount6;
		}
		public void setDiscount6(BigDecimal discount6) {
			this.discount6 = discount6;
		}
		public BigDecimal getDiscount7() {
			return discount7;
		}
		public void setDiscount7(BigDecimal discount7) {
			this.discount7 = discount7;
		}
		public BigDecimal getDiscount8() {
			return discount8;
		}
		public void setDiscount8(BigDecimal discount8) {
			this.discount8 = discount8;
		}
		public BigDecimal getDiscount9() {
			return discount9;
		}
		public void setDiscount9(BigDecimal discount9) {
			this.discount9 = discount9;
		}
		public BigDecimal getDiscount10() {
			return discount10;
		}
		public void setDiscount10(BigDecimal discount10) {
			this.discount10 = discount10;
		}
	}
	
	private String responseCode;
	private String displayMessage;
	/**
	 * 会员姓名
	 */
	private String accountName;
	/**
	 * 卡类型
	 */
	private String cardType;
	/**
	 * 可用余额  accountBalance - localBalance = deposit（冻结）
	 */
	private BigDecimal localBalance;
	/**
	 * 储值余额  包含冻结
	 */
	private BigDecimal accountBalance;
	/**
	 * 生日
	 */
	private String birthday;
	/**
	 * 积分余额
	 */
	private BigDecimal pointsBalance;
	/**
	 * 过期日期
	 */
	private String expiryDate;
	/**
	 * 卡等级code
	 */
	private String cardLevelCode;
	/**
	 * 卡等级描述
	 */
	private String cardLevelName;
	/**
	 * 会员英文名
	 */
	private String englishName;
	/**
	 * unknown
	 */
	private String cardSN;
	
	private Coupons coupons;

	public static class Coupons{
		private String couponList;
		public String getCouponList() {
			return couponList;
		}
		public void setCouponList(String couponList) {
			this.couponList = couponList;
		}
	}

	public String getTraceId() {
		return traceId;
	}
	public void setTraceId(String traceId) {
		this.traceId = traceId;
	}
	public String getTerminalId() {
		return terminalId;
	}
	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}
	public BigDecimal getAmount() {
		return amount;
	}
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	public String getSvan() {
		return svan;
	}
	public void setSvan(String svan) {
		this.svan = svan;
	}
	
	public String getResponseCode() {
		return responseCode;
	}
	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}
	public String getDisplayMessage() {
		return displayMessage;
	}
	public void setDisplayMessage(String displayMessage) {
		this.displayMessage = displayMessage;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public BigDecimal getLocalBalance() {
		return localBalance;
	}
	public void setLocalBalance(BigDecimal localBalance) {
		this.localBalance = localBalance;
	}
	public BigDecimal getAccountBalance() {
		return accountBalance;
	}
	public void setAccountBalance(BigDecimal accountBalance) {
		this.accountBalance = accountBalance;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public BigDecimal getPointsBalance() {
		return pointsBalance;
	}
	public void setPointsBalance(BigDecimal pointsBalance) {
		this.pointsBalance = pointsBalance;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getCardLevelCode() {
		return cardLevelCode;
	}
	public void setCardLevelCode(String cardLevelCode) {
		this.cardLevelCode = cardLevelCode;
	}
	public String getCardLevelName() {
		return cardLevelName;
	}
	public void setCardLevelName(String cardLevelName) {
		this.cardLevelName = cardLevelName;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getCardSN() {
		return cardSN;
	}
	public void setCardSN(String cardSN) {
		this.cardSN = cardSN;
	}
	public Discount getDiscount() {
		return discount;
	}
	public void setDiscount(Discount discount) {
		this.discount = discount;
	}	
}
