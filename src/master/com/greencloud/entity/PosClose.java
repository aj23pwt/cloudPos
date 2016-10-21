package com.greencloud.entity;
import java.math.BigDecimal;
import java.util.Date;


public class PosClose  extends OperationInfo {
	/**
	 * 
	 */
	private static final Long serialVersionUID = 1L;
	private String accnt;
	private String billno;
	private String closeFlag="";
	private BigDecimal charge=BigDecimal.ZERO ;
	private BigDecimal pay=BigDecimal.ZERO ;
	private String transType;
	private String transAccnt;
	private Date genBizDate;
	private String genUser;
	private String genCashier;
	private Date genDatetime;
	private Date delBizDate;
	private String delUser;
	private String delCashier;
	private Date delDatetime;
	private String tableno="";
	private String auditUser;
	private String auditRemark;
	public String getAccnt() {
		return accnt;
	}
	public void setAccnt(String accnt) {
		this.accnt = accnt;
	}
	public String getBillno() {
		return billno;
	}
	public void setBillno(String billno) {
		this.billno = billno;
	}
	public String getCloseFlag() {
		return closeFlag;
	}
	public void setCloseFlag(String closeFlag) {
		this.closeFlag = closeFlag;
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
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public String getTransAccnt() {
		return transAccnt;
	}
	public void setTransAccnt(String transAccnt) {
		this.transAccnt = transAccnt;
	}
	public Date getGenBizDate() {
		return genBizDate;
	}
	public void setGenBizDate(Date genBizDate) {
		this.genBizDate = genBizDate;
	}
	public String getGenUser() {
		return genUser;
	}
	public void setGenUser(String genUser) {
		this.genUser = genUser;
	}
	public String getGenCashier() {
		return genCashier;
	}
	public void setGenCashier(String genCashier) {
		this.genCashier = genCashier;
	}
	public Date getGenDatetime() {
		return genDatetime;
	}
	public void setGenDatetime(Date genDatetime) {
		this.genDatetime = genDatetime;
	}
	public Date getDelBizDate() {
		return delBizDate;
	}
	public void setDelBizDate(Date delBizDate) {
		this.delBizDate = delBizDate;
	}
	public String getDelUser() {
		return delUser;
	}
	public void setDelUser(String delUser) {
		this.delUser = delUser;
	}
	public String getDelCashier() {
		return delCashier;
	}
	public void setDelCashier(String delCashier) {
		this.delCashier = delCashier;
	}
	public Date getDelDatetime() {
		return delDatetime;
	}
	public void setDelDatetime(Date delDatetime) {
		this.delDatetime = delDatetime;
	}
	public String getTableno() {
		return tableno;
	}
	public void setTableno(String tableno) {
		this.tableno = tableno;
	}
	public String getAuditUser() {
		return auditUser;
	}
	public void setAuditUser(String auditUser) {
		this.auditUser = auditUser;
	}
	public String getAuditRemark() {
		return auditRemark;
	}
	public void setAuditRemark(String auditRemark) {
		this.auditRemark = auditRemark;
	}
	public static Long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
