package com.greencloud.entity;

public class PosDrinksConsume extends OperationInfo {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3746079668450296872L;

	private Long accnt;
	private String descript;
	private String volume;
	private Integer consumeNumber;
	
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	
	public Long getAccnt() {
		return accnt;
	}
	public void setAccnt(Long accnt) {
		this.accnt = accnt;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	public Integer getConsumeNumber() {
		return consumeNumber;
	}
	public void setConsumeNumber(Integer consumeNumber) {
		this.consumeNumber = consumeNumber;
	}
	@Override
	public String toString() {
		return "PosDrinksConsume [accnt=" + accnt + ", descript=" + descript
				+ ", volume=" + volume + ", consumeNumber=" + consumeNumber
				+ "]";
	}
	
	
	
}
