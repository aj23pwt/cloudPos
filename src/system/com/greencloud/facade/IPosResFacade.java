package com.greencloud.facade;

import java.util.List;
import java.util.Map;

import com.aua.util.SQLHelper;
import com.greencloud.dto.EdmSendDto;
import com.greencloud.dto.POSInterfaceCardFkDto;
import com.greencloud.dto.POSInterfaceFoFkDto;
import com.greencloud.dto.POSInterfaceGuestFkDto;
import com.greencloud.entity.EdmTemplet;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.PosAccess;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosModeDef;
import com.greencloud.entity.PosPay;
import com.greencloud.entity.PosRes;
import com.greencloud.entity.PosResOrder;
import com.greencloud.entity.PosStation;

public interface IPosResFacade {
	public List<PosRes> getResList(String sql);
	public List<PosPay> getAllResPayList(String sql);
	public List<PosMaster> getMasterList(String sql);
	public String getResAccnt(Object object);
	public void saveAccess(String tnum,String pcode,String punit);
	public List<PosAccess> getAccessList();
	public String saveRes(PosRes res);
	public void savePosStation(PosStation posStation);
	
	public void updateRes(Object object);
	
	public void updateResSta(Object object);
	 
	public List<PosResOrder> getResPluList(PosResOrder object);
	public List<PosPay> getResPayList(PosPay object);	
	public <T> List<T> getTableMap( String hotelGroupId, String hotelId,String date,String shift,String pccode,String status,String type,String flag);
	
	public List<Object> getPosAccntList(String ename,Object object);
	public <T> List<T> getShiftCloseList(String hotelGroupId,String hotelId,String pccode,String empid,String shift,String biz_date,String reportNo);
	
	public List<PosModeDef> getPosModeDefList(PosModeDef posModeDef);
	
	public <T> List<T> getPosVipQuery(String searchText);
	
	public List<Object> getPosAccntContainHistoryList(String ename,Object object);
	
	public void savePosMasterContainHistory(Object object);
	
	public List<PosResOrder> saveOrUpdateResOrder(PosResOrder object);
	
//	 public List<POSInterfaceGuestDto> getCompanyListRes(String key);
	 
//	分库协议单位、会员、宾客获取
	 public List<POSInterfaceGuestFkDto> getCompanyResFkList(String key);
	 public List<POSInterfaceFoFkDto> getFoResFkList(String key);
	 public List<POSInterfaceCardFkDto> getCardResFkList(String key);
	 
	 public List<POSInterfaceCardFkDto> getCardFkList(String key);
	 public List<POSInterfaceGuestFkDto> getCompanyFkList(String key);
	 public List<POSInterfaceGuestFkDto> getGuestFkList(String key);
	 
	 public void updateMasterChooseRes(PosRes posRes ,PosMaster posMaster);
	 public <T extends EntityInfo> List<T> getDataBySql(String clazz,String sql);
	 public List<EdmSendDto> sendRsvSms2(String templetCode, List<String> rsvIds, List<String> names, Long hotelGroupId, Long hotelId);
	 public void updateAndPostSmsBatchDto(@SuppressWarnings("rawtypes") List<Map> maps, String templetCode, Long hotelGroupId, Long hotelId);
}
