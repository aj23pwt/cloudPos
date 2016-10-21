package com.greencloud.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.greencloud.dao.ISyncDataDao;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.SyncData;
import com.greencloud.facade.ISyncService;
import com.greencloud.facade.SyncType;
import com.greencloud.service.ISyncDataService;

public class SyncDataServiceImpl implements ISyncDataService {

	private ISyncDataDao syncDataDao;
	private ISyncService syncSender;

	public void setSyncSender(ISyncService syncSender) {
		this.syncSender = syncSender;
	}
	private String serverType;
	public void setServerType(String serverType) {
		this.serverType = serverType;
	}
	public void setSyncDataDao(ISyncDataDao syncDataDao) {
		this.syncDataDao = syncDataDao;
	}

	@Override
	public List<SyncData> list(SyncData syncData) {
		return syncDataDao.list(syncData);
	}

	@Override
	public EntityInfo load(SyncData sd) {
		return syncDataDao.load(sd);
	}

	@Override
	public void deleteByFlag(String flag) {
		syncDataDao.deleteByFlag(flag);
	}

	@Override
	public void saveSyncData(String entityName, List<Object> entities,
			String syncType) {
		syncDataDao.saveSyncData(entityName, entities, syncType);
	}

	@Override
	public void deleteByEntityFlagSyncType(Long hotelGroupId, String flag,
			String entityName, String syncType, List<Long> ids) {
		syncDataDao.deleteByEntityFlagSyncType(hotelGroupId, flag, entityName, syncType, ids);
	}
	@Override
	public List<EntityInfo> loadByIds(List<Long> list, String entityName) {
		return syncDataDao.loadByIds(list, entityName);
	}
	@Override
	public void deleteAndSend(Long hotelGroupId, String flag,
			String curEntityName, String syncType, List<Long> sdIds,
			List<Object> entityInfos, List<List<String>> entityIps) {
		
		deleteByEntityFlagSyncType(hotelGroupId, flag, curEntityName, syncType, sdIds);
		System.out.println("deleteAndSend");
		
		syncSender.syncData(SyncType.valueOf(syncType), entityInfos,
				entityIps,getExclusionField(curEntityName), getKeyField(syncType,curEntityName));
	}
	
	/**
	 * 返回entityName不更新的字段
	 * @param entityName
	 * @return
	 */
	private List<String> getExclusionField(String entityName){
		if(entityName.equalsIgnoreCase("RoomType")){
			List<String> s = new ArrayList<String>(0);
			s.add("quantity");
			return s;
		}
		return Collections.EMPTY_LIST;
	}
	
	/**
	 * 返回UPDATE_KEY DELETE_KEY操作时，对应entityName的keyFields
	 * @param entityName
	 * @return
	 */
	private List<String> getKeyField(String syncType, String entityName){
	    if(syncType==null || syncType.isEmpty())
	        return Collections.EMPTY_LIST;
	    if(!syncType.equals("UPDATE_KEY") && !syncType.equals("DELETE_KEY") && !syncType.equals("ADD") && !syncType.equals("ADD_EX_ID"))
	        return Collections.EMPTY_LIST;
	    if(entityName.equalsIgnoreCase("RepGrpBusinessD")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("statisDate");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepGrpBusinessM")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("statisMonth");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepGrpIncomeD")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("statisDate");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepGrpIncomeM")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("statisMonth");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepJourHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
            s.add("code");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepRmsaleHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("repType");
	        s.add("building");
	        s.add("code");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepRevenueTypeHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("codeType");
	        s.add("code");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("Budget")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("budgetDate");
	        s.add("category");
	        s.add("item");
	        s.add("targetCode");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepTrialBalanceHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("itemType");
	        s.add("itemCode");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepJieHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("classno");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepDaiHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("classno");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepJiedaiHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("classno");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("RepZeroPriceHistory")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("accnt");
	        return s;
	    }
	    else if(entityName.equalsIgnoreCase("CuxPmsDetail")){
	        List<String> s = new ArrayList<String>(0);
	        s.add("hotelGroupId");
	        s.add("hotelId");
	        s.add("bizDate");
	        s.add("code");
	        return s;
	    }
        else if(entityName.equalsIgnoreCase("CodeRatecodeDetail")){
            List<String> s = new ArrayList<String>(0);
            s.add("hotelGroupId");
            s.add("hotelId");
            s.add("date");
            s.add("code");
            s.add("rmtype");
            return s;
        }
        else if(entityName.equalsIgnoreCase("UserAuthCache")){
            List<String> s = new ArrayList<String>(0);
            s.add("hotelGroupId");
            s.add("hotelId");
            s.add("entityType");
            s.add("entityId");
            s.add("authHotelGroupId");
            s.add("authHotelId");
            return s;
        }
        else if(syncType.equals("ADD")){
            //其他同步类，如果走ADD，则默认带一个ID主键
            List<String> s = new ArrayList<String>(0);
            s.add("id");
            return s;
        }
	    return Collections.EMPTY_LIST;
	}
	@Override
	public List<String> listEntityName() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public SyncData listTopOne(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}
}