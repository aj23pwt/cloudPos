package com.greencloud.entity;

import java.math.BigDecimal;
import java.util.Date;

public abstract class AbstractCatering extends OperationInfo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7512660902866405861L;

	/**
	 * 
	 */

	public static final class Sta {
		/**
		 * waiting
		 */
		public static final String W = "W";
		/**
		 * 不确�?
		 */
		public static final String R = "R";
		/**
		 * 确认使用
		 */
		public static final String I = "I";
		/**
		 * 取消
		 */
		public static final String X = "X";
		/**
		 * 删除
		 */
		public static final String D = "D";
		/**
		 * 维修
		 */
		public static final String O = "O";
		/**
		 * 担保
		 */
		public static final String G = "G";
		/**
		 * 自用
		 */
		public static final String S = "S";
	}

	/**
	 * 订单类型
	 */
	private String rsvType;
	/**
	 * 订单id
	 */
	private Long rsvId;

	/**
	 * 订单名称
	 */
	private String rsvName;

	/**
	 * 宴会编号
	 */
	private String catNo;

	/**
	 * 主题
	 */
	private String theme;
	/**
	 * 指示�?
	 */
	private String board;
	/**
	 * 宴会类型
	 */
	private String category;

	/**
	 * 预订状�?
	 */
	private String sta;

	/**
	 * �?��时间
	 */
	private Date dateBegin;

	/**
	 * 结束时间
	 */
	private Date dateEnd;

	/**
	 * 人数
	 */
	private Long peopleNumber;

	/**
	 * 场地
	 */
	private String cateringPlace;

	/**
	 * 场地费用
	 */
	private BigDecimal rate;

	/**
	 * 资源费用
	 */
	private BigDecimal resRate;
	
	private BigDecimal comRate;

	private String remark;

	private Long tables;

	private String salesman;

	private String linkman;

	private String phone;

	private Long companyId;
	
	private String extraFlag;

	/**
	 * 取得有效状�?的字符串
	 * 
	 * @return
	 */
	public static String effectSta() {
		return Sta.R + "," + Sta.I + "," + Sta.O + "," + Sta.G + "," + Sta.S;
	}

	public static String[] effectStaArray() {
		return effectSta().split(",");
	}
	
	public static String itemShowSta() {
		return Sta.W + "," + Sta.R + "," + Sta.I + "," + Sta.O + "," + Sta.G + "," + Sta.S;
	}
	
	public static String[] itemShowStaArray(){
		return new String[]{Sta.W,Sta.R,Sta.I,Sta.O,Sta.G,Sta.S};
	}

	public boolean isEffectSta() {
		return effectSta().contains(sta);
	}

	public String getRsvType() {
		return rsvType;
	}

	public void setRsvType(String rsvType) {
		this.rsvType = rsvType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getRsvId() {
		return rsvId;
	}

	public void setRsvId(Long rsvId) {
		this.rsvId = rsvId;
	}

	public String getRsvName() {
		return rsvName;
	}

	public void setRsvName(String rsvName) {
		this.rsvName = rsvName;
	}

	public String getCatNo() {
		return catNo;
	}

	public void setCatNo(String catNo) {
		this.catNo = catNo;
	}

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSta() {
		return sta;
	}

	public void setSta(String sta) {
		this.sta = sta;
	}

	public Date getDateBegin() {
		return dateBegin;
	}

	public void setDateBegin(Date dateBegin) {
		this.dateBegin = dateBegin;
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}

	public Long getPeopleNumber() {
		return peopleNumber;
	}

	public void setPeopleNumber(Long peopleNumber) {
		this.peopleNumber = peopleNumber;
	}

	public String getCateringPlace() {
		return cateringPlace;
	}

	public void setCateringPlace(String cateringPlace) {
		this.cateringPlace = cateringPlace;
	}

	public BigDecimal getRate() {
		return rate;
	}

	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}

	public BigDecimal getResRate() {
		return resRate;
	}
	
	public void setResRate(BigDecimal resRate) {
		this.resRate = resRate;
	}

	public Long getTables() {
		return tables;
	}

	public void setTables(Long tables) {
		this.tables = tables;
	}

	public String getSalesman() {
		return salesman;
	}

	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}

	public String getLinkman() {
		return linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getExtraFlag() {
		return extraFlag;
	}
	
	public void setExtraFlag(String extraFlag) {
		this.extraFlag = extraFlag;
	}

	public BigDecimal getComRate() {
		return comRate;
	}

	public void setComRate(BigDecimal comRate) {
		this.comRate = comRate;
	}
}
