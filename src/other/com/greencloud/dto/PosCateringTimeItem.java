package com.greencloud.dto;

import java.io.Serializable;
import java.util.Date;

public class PosCateringTimeItem implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1506831545640546287L;
	/**
	 * pwt
	 */
	// 日期
	private Date date;
	// 时段定义代码
	private String timePeriod;
	// 占用状�?
	private int occSta;
	//状�?
	private String rsvSta;
	//名称
	private String rsvName;
	//营业点code
	private String cateringPlacePccode;
	//营业点code
	private String cateringPlacePccodeName;
	//地点code
	private String cateringPlace;
	//地点描叙
	private String cateringPlaceName;
	// 预订单号
	private String rsvAccnt;
	//会议类型
	private String category;
	//�?���?
	private String salesman;
	//班次
	private String cateringShift;
	//预订单ID
	private String rsvId;
	
	public String getCateringPlacePccodeName() {
		return cateringPlacePccodeName;
	}

	public void setCateringPlacePccodeName(String cateringPlacePccodeName) {
		this.cateringPlacePccodeName = cateringPlacePccodeName;
	}
	public String getRsvAccnt() {
		return rsvAccnt;
	}

	public void setRsvAccnt(String rsvAccnt) {
		this.rsvAccnt = rsvAccnt;
	}
	public String getRsvName()
	{
		return rsvName;
	}

	public void setRsvName(String rsvName)
	{
		this.rsvName = rsvName;
	}

	public String getCateringPlacePccode()
	{
		return cateringPlacePccode;
	}

	public void setCateringPlacePccode(String cateringPlacePccode)
	{
		this.cateringPlacePccode = cateringPlacePccode;
	}

	public String getCateringShift()
	{
		return cateringShift;
	}

	public void setCateringShift(String cateringShift)
	{
		this.cateringShift = cateringShift;
	}

	public String getSalesman() {
		return salesman;
	}
	
	public String getCateringPlaceName() {
		return cateringPlaceName;
	}
	public void setCateringPlaceName(String cateringPlaceName) {
		this.cateringPlaceName = cateringPlaceName;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRsvSta() {
		return rsvSta;
	}
	
	public void setRsvSta(String rsvSta) {
		this.rsvSta = rsvSta;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTimePeriod() {
		return timePeriod;
	}

	public void setTimePeriod(String timePeriod) {
		this.timePeriod = timePeriod;
	}

	public int getOccSta() {
		return occSta;
	}

	public void setOccSta(int occSta) {
		this.occSta = occSta;
	}

	public String getCateringPlace() {
		return cateringPlace;
	}

	public void setCateringPlace(String cateringPlace) {
		this.cateringPlace = cateringPlace;
	}

	public String getRsvId() {
		return rsvId;
	}
	
	public void setRsvId(String rsvId) {
		this.rsvId = rsvId;
	}

}
