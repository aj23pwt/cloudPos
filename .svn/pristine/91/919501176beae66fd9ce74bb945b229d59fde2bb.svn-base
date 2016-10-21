package com.greencloud.entity;

import java.util.Date;

import com.aua.util.StringHelper;

/**
 * 云餐饮接口日志表
 * @author pwt
 * @date 2016-01-07
 */
public class PosWebInterfaceLog extends OperationInfo {
	/**
	 * 
	 */
	private static final Long serialVersionUID = -4371574700594011690L;
	/**
	 * 集团代码
	 */
	private String hotelGroupCode;
	/**
	 * 酒店代码
	 */
	private String hotelCode;
	/**
	 * 日志类型
	 */
	public static final class LogType {
		/**
		 * 上传
		 */
		public static final String UP = "UP";
		/**
		 * 下载
		 */
		public static final String DOWN = "DOWN";
	}
	/**
	 * 日志类型
	 * UP:上行;DOWN:下行
	 */
	private String logType = "UP";
	/**
	 * 订单操作类型
	 * @author Cairo
	 * @date 2015-05-15
	 */
	public static final class Model{
		/**
		 * 新建/保存
		 */
		public static final String SAVE = "SAVE";
		/**
		 * 修改
		 */
		public static final String UPDATE = "UPDATE";
		/**
		 * 取消
		 */
		public static final String CANCEL = "CANCEL";
		/**
		 * No-Show
		 * 未出�?
		 */
		public static final String NOSHOW = "NO_SHOW";
		/**
		 * 恢复
		 */
		public static final String RESTORE = "RESTORE";
		/**
		 * 后补预订
		 */
		public static final String WAIT_LIST = "WAIT_LIST";
		/**
		 * 入住
		 */
		public static final String CHECK_IN = "CHECK_IN";
		/**
		 * 取消入住
		 */
		public static final String CANCEL_CHECK_IN = "CANCEL_CHECK_IN";
		/**
		 * 结账/离店
		 */
		public static final String CHECK_OUT = "CHECK_OUT";
		/**
		 * 挂账
		 */
		public static final String SUSPEND = "SUSPEND";
		/**
		 * 重新入住
		 */
		public static final String AGAIN_CHECKIN = "AGAIN_CHECKIN";
		/**
		 * 删除
		 */
		public static final String DELETE = "DELETE";
	}
	/**
	 * �?��模块
	 */
	private String model = "";
	/**
	 * 日志类型
	 */
	public static final class MessageType {
		/**
		 * 预订单业�?
		 */
		public static final String POS_RESERVATION = "POS_RESERVATION";
		/**
		 * 房型房量
		 */
		public static final String RTAV = "RTAV";
		/**
		 * 产品基础信息
		 */
		public static final String PRODUCT_BASE = "PRODUCT_BASE";
		/**
		 * 淘宝支付
		 */
		public static final String TAOBAO_WEB_PAY = "TAOBAO_WEB_PAY";
	}
	/**
	 * 消息类型
	 */
	private String messageType = "";
	/**
	 * 消息编号
	 * [P/C]+yyyyMMdd+8位流�?
	 */
	private String messageNo = "";
	/**
	 * 处理状�? 
	 */
	public static final class Status{
		/**
		 * 等待处理
		 */
		public static final String WAIT = "WAIT";
		/**
		 * 正在处理
		 */
		public static final String BUSY = "BUSY";
		/**
		 * 处理成功
		 */
		public static final String SUCCESS = "SUCCESS";
		/**
		 * 处理失败
		 */
		public static final String FAIL = "FAIL";
	}
	/**
	 * 处理状�? 
	 * WAIT:等待处理
	 * BUSY:正在处理
	 * SUCCESS:成功
	 * FALT:失败
	 */
	private String status = "SUCCESS";
	/**
	 * pos预订�?
	 */
	private String posRsvNo = "";
	
	/**
	 * 其他预订�?
	 */
	private String otherNo = "";
	private String resource = "";
	private String openid = "";
	private String appid = "";
	/**
	 * 正文XML
	 */
	private String requestXml = "";
	/**
	 * 返回信息
	 */
	private String resultXml = "";
	/**
	 * 备注信息
	 * 用于存放转换关系备注
	 */
	private String remark = "";
	/**
	 * 营业日期
	 */
	private Date bizDate;
	/**
	 * 标记
	 * T/F
	 */
	private String flag = "F";
	
	
	public String getHotelGroupCode() {
		return hotelGroupCode;
	}
	public void setHotelGroupCode(String hotelGroupCode) {
		this.hotelGroupCode = hotelGroupCode;
	}
	public String getHotelCode() {
		return hotelCode;
	}
	public void setHotelCode(String hotelCode) {
		this.hotelCode = hotelCode;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}
	public String getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(String messageNo) {
		this.messageNo = messageNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPosRsvNo() {
		return posRsvNo;
	}
	public void setPosRsvNo(String posRsvNo) {
		this.posRsvNo = posRsvNo;
	}
	public String getOtherNo() {
		return otherNo;
	}
	public void setOtherNo(String otherNo) {
		this.otherNo = otherNo;
	}
	public String getResource() {
		return resource;
	}
	public void setResource(String resource) {
		this.resource = resource;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getRequestXml() {
		return requestXml;
	}
	public void setRequestXml(String requestXml) {
		if(StringHelper.isNotNull(requestXml) && requestXml.length()>10000)
			this.requestXml = requestXml.substring(0, 10000);
		else
			this.requestXml = requestXml;
	}
	public String getResultXml() {
		return resultXml;
	}
	public void setResultXml(String resultXml) {
		if(StringHelper.isNotNull(resultXml) && resultXml.length()>4096)
			this.resultXml = resultXml.substring(0, 4096);
		else
			this.resultXml = resultXml;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getBizDate() {
		return bizDate;
	}
	public void setBizDate(Date bizDate) {
		this.bizDate = bizDate;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
}
