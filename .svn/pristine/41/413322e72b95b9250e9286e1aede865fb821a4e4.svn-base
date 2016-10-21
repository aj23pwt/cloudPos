package com.greencloud.listener;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.event.PostInsertEvent;
import org.hibernate.event.PostInsertEventListener;

import com.aua.util.StringHelper;
import com.greencloud.dao.ICacheDao;
import com.greencloud.dao.ILogDao;
import com.greencloud.dao.ISysOptionDao;
import com.greencloud.entity.LogInfo;
import com.greencloud.entity.LogInfoConfig;
import com.greencloud.entity.OperationInfo;
import com.greencloud.entity.SysOption;
import com.greencloud.util.DateUtil;
import com.greencloud.util.HibernateUtil;
import com.greencloud.util.UserManager;

public class PostInsertPosListener implements PostInsertEventListener {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3155497534683183603L;
	private ICacheDao cacheDao;
	private ILogDao logDao;
	public void setCacheDao(ICacheDao cacheDao) {
		this.cacheDao = cacheDao;
	}
	public void setLogDao(ILogDao logDao) {
		this.logDao = logDao;
	}

	@Override
	public void onPostInsert(PostInsertEvent event) {
		String entityName = event.getPersister().getEntityName();
		int lastIndex = entityName.lastIndexOf(".");
		if(lastIndex == -1){
			return;
		}
		entityName = entityName.substring(lastIndex + 1);
		
		Long hotelGroupId = UserManager.getHotelGroupId();
		Long hotelId = UserManager.getHotelId();
		
		/**
	     * insert操作需要insertLog实体名集合
	     * Cairo  2013-11-27
	     * 临时做法，后期需要植入log体系
	     */
		String insertLogEntityNames ="";
		SysOption sysOption	= logDao.findSysOptionByCatalogItem("system","insert_log_entity_names",
				hotelGroupId,hotelId);
		if(sysOption != null && StringHelper.isNotNull(sysOption.getSetValue())){
			insertLogEntityNames = sysOption.getSetValue().trim();
		}
		
		if(StringHelper.isNull(entityName)){
			return;
		}else if(insertLogEntityNames.indexOf(entityName) == -1){
			return;
		}
		
		//此处可改为hibernate mapping的方法得到表名，更加正确，因
		//我们的系统采用的就是这种方法，所以直接这样搞了,提高性能
		entityName = HibernateUtil.addUnderscores(entityName).toUpperCase();
		List<LogInfoConfig> configList = logDao.listLogInfoConfig(entityName,
				hotelId, hotelGroupId);
		if(configList.isEmpty()){
			return;
		}
		
		//查找出
		if(event.getEntity() instanceof OperationInfo){
			OperationInfo operationInfo = (OperationInfo) event.getEntity();
			hotelGroupId = operationInfo.getHotelGroupId();
			hotelId = operationInfo.getHotelId();
			cacheDao.checkCodeCahche(entityName, hotelGroupId, hotelId);
		}
		// 新属性
		String[] propertyNames = event.getPersister().getPropertyNames();
		Object[] newsValues = event.getState();
		
		Date now = new Date();
		String needTranslate;
		String columnName = "";
		LogInfoConfig config;
		for (int i = 0; i < newsValues.length; i++) {
			if(newsValues[i] != null && StringHelper.isNotNull(obj2String(newsValues[i]))){
				columnName = HibernateUtil.addUnderscores(propertyNames[i]);
				for(int k =0;k<configList.size();k++){
					config = configList.get(k);
					if(columnName.toUpperCase().equals(config.getEntityColumn())){
						LogInfo log = new LogInfo();
						log.setDescript(config.getDescript());
						log.setDescriptEn(config.getDescriptEn());
						log.setColumnName(columnName);
						log.setCreateDatetime(now);
						log.setCreateUser(UserManager.getUserName());
						log.setEntityId(Long.parseLong(event.getId().toString()));
						log.setEntityName(entityName);
						log.setHotelGroupId(hotelGroupId);
						log.setHotelId(hotelId);
						log.setNewValue(obj2String(newsValues[i]));
						log.setOldValue("");
						log.setStationCode(UserManager.getWorkStationCode());
						needTranslate = "N";
						if(config.getSqlDefine() != null && config.getSqlDefine().trim().length() > 0){
							needTranslate = "Y";
						}
						log.setNeedTranslate(needTranslate);
						logDao.saveLogInfo(log);
						configList.remove(config);
						break;
					}
				}
			}
		}
	}
	
	private String obj2String(Object obj) {
		String ret = "";
		if (obj == null) return "";
		if (obj instanceof Date) {
			ret = DateUtil.getNewFormatDateString((Date) obj);
		}else if (obj instanceof byte[]) {
			ret = "it's byte data.";
		}else if(obj instanceof BigDecimal){
			ret = NumberFormat.getInstance().format(obj);
		}else{
			ret = String.valueOf(obj);
		}
		if(ret.length() > 1000){
			ret = ret.substring(0, 999);
		}
		return ret;
	}

}
