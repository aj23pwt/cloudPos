package com.greencloud.quartz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.SyncData;
import com.greencloud.service.FICommonService;
import com.greencloud.service.ISyncDataService;
import com.greencloud.service.ISyncIpService;
import com.sun.xml.bind.v2.ClassFactory;

public class JobSyncData {

	private ISyncDataService syncDataService;
	private ISyncIpService syncIpService;
	private String serverType;
	private FICommonService fCommonService;
	private static int count = 0;
	/**
		查1条数据 有没有
		  	没有 return
		查同批次的1000条记录，含不同entityName syncType
		  	若entityName，syncType相同，则合并；
		  	若发现不同，则发送前面的数据，建新的数据；
		  	若遍历到底，发送前面合并的数据；
		  保证按数据生成的顺序发送。
	 */
	public void SyncData() {
		System.out.println("sync data begin " + count);
		if (count == 1){
			System.out.println("sync data end , another thread is working " + count);
			return;
		}
		boolean success = false;
		String flag = "";
		String canSync = "F";
		try {
			canSync = fCommonService.updateSyncFlag("sync_data");
			if(canSync.equals("F")){
				return;
			}
			count = 1;
			success = false;
			// 取出第一条
			SyncData syncData = syncDataService.listTopOne(null);
			if(syncData==null){
				//查1条数据 有没有       没有 return
				count=0;
				return;
			}
			
			flag = syncData.getFlag();
			System.out.println("FLAG:"+flag);
			Long hotelGroupId = syncData.getHotelGroupId();
	
			// 查询同第一条同批次操作的增删改记录
			syncData = new SyncData();
			syncData.setHotelGroupId(hotelGroupId);
			syncData.setFlag(flag);
			// 查同批次的1000条记录，含不同entityName syncType
			List<SyncData> ls = syncDataService.list(syncData);
			
			String curEntityName = null;
			String curSyncType = null;
			List<Object> entityInfos = new ArrayList<Object>(0);//记录当前归并的记录
			List<List<String>> entityIps = new ArrayList<List<String>>(0);//记录当前归并的记录的目标IP地址
			List<Long> sdIds = new ArrayList<Long>(0);
			
			Map<String, Class> mapClass = new HashMap<String, Class>(0);
			for(SyncData sd : ls){
				//记录当前归并的类名、操作名
				if(curEntityName==null)
					curEntityName = sd.getEntityName();
				System.out.println(curEntityName);
				if(curSyncType==null)
					curSyncType = sd.getSyncType();
				System.out.println(curSyncType);
				if(!curEntityName.equals(sd.getEntityName()) || !curSyncType.equals(sd.getSyncType())){
					System.out.println("进入");
					//不相同，发送已归并的数据
					if(entityInfos.size()>0){
						syncDataService.deleteAndSend(hotelGroupId,flag, curEntityName, curSyncType, sdIds, entityInfos, entityIps);
						success = true;
						entityInfos.clear();
						entityIps.clear();
						sdIds.clear();
						curEntityName = sd.getEntityName();
						curSyncType = sd.getSyncType();
					}
				}
				
				//归并当前的数据
				Class clazz = null;
				if(mapClass.containsKey(curEntityName)){
					clazz = mapClass.get(curEntityName);
				}
				else{
					clazz = Class.forName("com.greencloud.entity."+curEntityName); 
					mapClass.put(curEntityName, clazz);
				}
				if(sd.getJsonStr() == null){
					if(curSyncType.equals("DELETE")){
						EntityInfo o = (EntityInfo)ClassFactory.create(clazz);
						o.setId(sd.getEntityId());
						entityInfos.add(o);
					}
					else{
						entityInfos.add(syncDataService.load(sd));
					}
				}
				else{
					entityInfos.add(JSON.parseObject(sd.getJsonStr(), clazz));
				}
				
				
				
				entityIps.add(syncIpService.listEffectIps(
						sd.getHotelGroupId(), sd.getHotelId(),
						curEntityName, serverType));
				System.out.println("entityIps:"+entityIps.get(0).toString());
				
				sdIds.add(sd.getId());
				System.out.println(sd.getId());
			}
			
			//发送最后一组数据
			if(entityInfos.size()>0){
				
				System.out.println(hotelGroupId+flag+curEntityName+curSyncType+sdIds+entityInfos+entityIps);
				syncDataService.deleteAndSend(hotelGroupId,flag, curEntityName, curSyncType, sdIds, entityInfos, entityIps);
				success = true;
			}
			
		} catch (RuntimeException e) {
			System.out.println(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("sync data end , this thread work success and " + (success?"upload data success; "+"flag is : " + flag:"and not upload data"));
			if(canSync.equals("T"))
				fCommonService.updateSyncFlagRelease("sync_data");
			count = 0;
			if (success) {
				SyncData();
			}
		}
	}
	
	
	
	public void setfCommonService(FICommonService fCommonService) {
		this.fCommonService = fCommonService;
	}

	public void setServerType(String serverType) {
		this.serverType = serverType;
	}

	public void setSyncIpService(ISyncIpService syncIpService) {
		this.syncIpService = syncIpService;
	}

	public void setSyncDataService(ISyncDataService syncDataService) {
		this.syncDataService = syncDataService;
	}

}