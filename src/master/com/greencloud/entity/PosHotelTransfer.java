package com.greencloud.entity;


public class PosHotelTransfer extends OperationInfo {

	/**
	 * 
	 */
	private static final Long serialVersionUID = 1L;
	/**
	 * 
	 */
	private Long transferHotelGroupId;
	private Long transferHotelId;
	private String transferHotelCode;
	private String transferHotelDescript;
	private String transactionPmsCode;
	private String transactionPmsDescript;
	private String transferServerIp;
	private String transactionArCode;
	private String transactionArDescript;
	public Long getTransferHotelGroupId()
	{
		return transferHotelGroupId;
	}
	public void setTransferHotelGroupId(Long transferHotelGroupId)
	{
		this.transferHotelGroupId = transferHotelGroupId;
	}
	public Long getTransferHotelId()
	{
		return transferHotelId;
	}
	public void setTransferHotelId(Long transferHotelId)
	{
		this.transferHotelId = transferHotelId;
	}
	
	public String getTransferHotelCode()
	{
		return transferHotelCode;
	}
	public void setTransferHotelCode(String transferHotelCode)
	{
		this.transferHotelCode = transferHotelCode;
	}
	public String getTransferHotelDescript()
	{
		return transferHotelDescript;
	}
	public void setTransferHotelDescript(String transferHotelDescript)
	{
		this.transferHotelDescript = transferHotelDescript;
	}
	public String getTransactionPmsCode()
	{
		return transactionPmsCode;
	}
	public void setTransactionPmsCode(String transactionPmsCode)
	{
		this.transactionPmsCode = transactionPmsCode;
	}
	public String getTransactionPmsDescript()
	{
		return transactionPmsDescript;
	}
	public void setTransactionPmsDescript(String transactionPmsDescript)
	{
		this.transactionPmsDescript = transactionPmsDescript;
	}
	public String getTransferServerIp()
	{
		return transferServerIp;
	}
	public void setTransferServerIp(String transferServerIp)
	{
		this.transferServerIp = transferServerIp;
	}
	public String getTransactionArCode()
	{
		return transactionArCode;
	}
	public void setTransactionArCode(String transactionArCode)
	{
		this.transactionArCode = transactionArCode;
	}
	public String getTransactionArDescript()
	{
		return transactionArDescript;
	}
	public void setTransactionArDescript(String transactionArDescript)
	{
		this.transactionArDescript = transactionArDescript;
	}
	
}
