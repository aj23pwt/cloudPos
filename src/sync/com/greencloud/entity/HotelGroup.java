package com.greencloud.entity;

import java.util.Date;

/**
 * HotelGroup 集团实体类
 * @author cys
 */
public class HotelGroup extends  BaseEntity implements Cloneable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3892065008773352950L;
	protected Long id;
	/**
	 * 代码
	 */
	private String code;

	/**
	 * 状态
	 */
	private String sta;
	/**
	 * 审核
	 */
	private String audit;
	/**
	 * 中文描述
	 */
	private String descript;
	/**
	 * 英文描述
	 */
	private String descriptEn;
	/**
	 * 简称
	 */
	private String descriptShort;
	/**
	 * 国家代码
	 */
	private String country;
	/**
	 * 城市
	 */
	private String city;
	/**
	 * 地址1
	 */
	private String address1;
	/**
	 * 地址2
	 */
	private String address2;
	/**
	 * 酒店总机
	 */
	private String phone;
	/**
	 * 传真
	 */
	private String fax;
	/**
	 * 预定电话
	 */
	private String phoneRsv;
	/**
	 * 网址
	 */
	private String website;
	/**
	 * 邮件
	 */
	private String email;
	/**
	 * DNS
	 */
	private String dns;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * logo
	 */
	private byte[] logo;
	/**
	 * 照片
	 */
	private String photo;
	/**
	 * 网页介绍
	 */
	private String htmlInfo;
	/**
	 * 排序
	 */
	private Integer listOrder;
	/**
	 * 创建用户
	 */
	private String createUser;
	/**
	 * 创建时间
	 */
	private Date createDatetime;
	/**
	 * 修改用户
	 */
	private String modifyUser;
	/**
	 * 修改时间
	 */
	private Date modifyDatetime;
	
	/**
	 * 是否是单体酒店   T=单体酒店 F=集团
	 */
	private String isSingle;

	private String appType;
	
	public String getIsSingle() {
		return isSingle;
	}

	public void setIsSingle(String isSingle) {
		this.isSingle = isSingle;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSta() {
		return this.sta;
	}

	public void setSta(String sta) {
		this.sta = sta;
	}

	public String getAudit() {
		return this.audit;
	}

	public void setAudit(String audit) {
		this.audit = audit;
	}

	public String getDescript() {
		return this.descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getDescriptEn() {
		return this.descriptEn;
	}

	public void setDescriptEn(String descriptEn) {
		this.descriptEn = descriptEn;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFax() {
		return this.fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPhoneRsv() {
		return this.phoneRsv;
	}

	public void setPhoneRsv(String phoneRsv) {
		this.phoneRsv = phoneRsv;
	}

	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDns() {
		return this.dns;
	}

	public void setDns(String dns) {
		this.dns = dns;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getHtmlInfo() {
		return this.htmlInfo;
	}

	public void setHtmlInfo(String htmlInfo) {
		this.htmlInfo = htmlInfo;
	}

	public Integer getListOrder() {
		return this.listOrder;
	}

	public void setListOrder(Integer listOrder) {
		this.listOrder = listOrder;
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

	public String getModifyUser() {
		return modifyUser;
	}

	public void setModifyUser(String modifyUser) {
		this.modifyUser = modifyUser;
	}

	public Date getModifyDatetime() {
		return modifyDatetime;
	}

	public void setModifyDatetime(Date modifyDatetime) {
		this.modifyDatetime = modifyDatetime;
	}

	public String getDescriptShort() {
		return descriptShort;
	}

	public void setDescriptShort(String descriptShort) {
		this.descriptShort = descriptShort;
	}

	public byte[] getLogo() {
		if(logo!=null)
			return logo.clone();
		return null;
	}

	public void setLogo(byte[] logo) {
		if(logo!=null)
			this.logo = logo.clone();
		else
			this.logo = null;
	}

	public String getAppType() {
		return appType;
	}

	public void setAppType(String appType) {
		this.appType = appType;
	}

}
