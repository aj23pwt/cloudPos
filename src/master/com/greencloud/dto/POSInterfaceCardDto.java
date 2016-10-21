package com.greencloud.dto;

import java.io.Serializable;
import java.math.BigDecimal;

public class POSInterfaceCardDto implements Serializable{
	
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
}
