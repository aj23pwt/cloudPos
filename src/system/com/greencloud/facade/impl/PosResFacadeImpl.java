package com.greencloud.facade.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.aua.util.BeanUtils;
import com.greencloud.dto.EdmSendDto;
import com.greencloud.dto.POSInterfaceCardFkDto;
import com.greencloud.dto.POSInterfaceFoFkDto;
import com.greencloud.dto.POSInterfaceGuestFkDto;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.PosAccess;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosMasterHistory;
import com.greencloud.entity.PosModeDef;
import com.greencloud.entity.PosPay;
import com.greencloud.entity.PosRes;
import com.greencloud.entity.PosResOrder;
import com.greencloud.entity.PosStation;
import com.greencloud.facade.IPosResFacade;
import com.greencloud.service.IPosAccessService;
import com.greencloud.service.IPosDetailService;
import com.greencloud.service.IPosMasterHistoryService;
import com.greencloud.service.IPosMasterService;
import com.greencloud.service.IPosModeDefService;
import com.greencloud.service.IPosPayService;
import com.greencloud.service.IPosResOrderService;
import com.greencloud.service.IPosResService;
import com.greencloud.service.IPosStationService;
import com.greencloud.service.IPosSubService;
import com.greencloud.util.ModelUtil;
import com.greencloud.util.SQLHelper;
import com.greencloud.util.UserManager;


public class PosResFacadeImpl implements IPosResFacade {
	private IPosSubService posSubService;
	private IPosResService  posResService;
	private IPosMasterService posMasterService ;
	private IPosMasterHistoryService posMasterHistoryService ;
	private IPosDetailService posDetailService;
	private IPosAccessService posAccessService;
	private IPosStationService posStationService;
	private IPosModeDefService posModeDefService; 
	
	public void setPosMasterHistoryService(
			IPosMasterHistoryService posMasterHistoryService) {
		this.posMasterHistoryService = posMasterHistoryService;
	}
	public IPosStationService getPosStationService() {
		return posStationService;
	}
	public void setPosStationService(IPosStationService posStationService) {
		this.posStationService = posStationService;
	}
	public void setPosModeDefService(IPosModeDefService posModeDefService) {
		this.posModeDefService = posModeDefService;
	}
	public IPosAccessService getPosAccessService() {
		return posAccessService;
	}
	public void setPosAccessService(IPosAccessService posAccessService) {
		this.posAccessService = posAccessService;
	}
	public IPosDetailService getPosDetailService() {
		return posDetailService;
	}
	public void setPosDetailService(IPosDetailService posDetailService) {
		this.posDetailService = posDetailService;
	}
	private IPosResOrderService posResOrderService ;
	private IPosPayService posPayService ;
	public IPosPayService getPosPayService() {
		return posPayService;
	}
	public void setPosPayService(IPosPayService posPayService) {
		this.posPayService = posPayService;
	}
	public IPosResOrderService getPosResOrderService() {
		return posResOrderService;
	}
	public void setPosResOrderService(IPosResOrderService posResOrderService) {
		this.posResOrderService = posResOrderService;
	}
	public IPosResService getPosResService() {
		return posResService;
	}
	public IPosSubService getPosSubService() {
		return posSubService;
	}
	public IPosMasterService getPosMasterService() {
		return posMasterService;
	}
	public void setPosMasterService(IPosMasterService posMasterService) {
		this.posMasterService = posMasterService;
	}
	public void setPosSubService(IPosSubService posSubService) {
		this.posSubService = posSubService;
	}
	public void setPosResService(IPosResService posResService) {
		this.posResService = posResService;
	}

	@Override
	public List<PosRes> getResList(String sql) {
		// TODO Auto-generated method stub
		return posResService.getResList(sql);
	}
	@Override
	public String getResAccnt(Object object) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void updateRes(Object object) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void updateResSta(Object object) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public String saveRes(PosRes posres) {
		// TODO Auto-generated method stub
		return posResService.saveRes(posres);
	}
	@Override
	public List<PosResOrder> getResPluList(PosResOrder posResOrder) {
		// TODO Auto-generated method stub
		return  posResOrderService.listPosResOrder(posResOrder);
	}
	@Override
	public List<PosPay> getResPayList(PosPay posPay) {
		// TODO Auto-generated method stub
		return posPayService.listPosPay(posPay);
	}
	@Override
	public <T> List<T> getTableMap( String hotelGroupId, String hotelId,String date,String shift,String pccode,String status,String type,String flag) {
		// TODO Auto-generated method stub
		return posResService.getTableMap(hotelGroupId,hotelId,date,shift, pccode, status, type,flag);
	}
	@Override
	public List<PosMaster> getMasterList(String sql) {
		// TODO Auto-generated method stub
		return posMasterService.getMasterList(sql);
	}
	@Override
	public List<Object> getPosAccntList(String ename, Object object) {
		// TODO Auto-generated method stub
		return posSubService.getPosAccntList(ename, object);
	}
	@Override
	//用于定金管理页面(拼装sql)
	public List<PosPay> getAllResPayList(String sql) {
		// TODO Auto-generated method stub
		return posPayService.getPosPayList(sql);
	}
	@Override
	public <T> List<T> getShiftCloseList(String hotelGroupId, String hotelId,String pccode, String empid, String shift,String biz_date,String reportNo) {
		return posDetailService.getShiftCloseList(hotelGroupId,hotelId,pccode,empid,shift,biz_date,reportNo);
	}
	@Override
	public void saveAccess(String tnum, String pcode, String punit) {
		PosAccess posAccess = new PosAccess();
		posAccess.setHotelGroupId(UserManager.getHotelGroupId());
		posAccess.setHotelId(UserManager.getHotelId());
		posAccess.setBizDate(UserManager.getBizDate());
		posAccess.setPluCode(pcode);
		posAccess.setPluUnit(punit);
		posAccess.setNumber(new BigDecimal(tnum));
		posAccess.setNumber1(new BigDecimal("0"));
		posAccess.setNumber2(new BigDecimal("0"));
		posAccess.setIsHalt("F");
	    posAccessService.savePosAccess(posAccess);
	}

	@Override
	public List<PosAccess> getAccessList() {
		return posAccessService.listPosAccess(null);
	}
	@Override
	public void savePosStation(PosStation posStation) {
		posStationService.savePosStation(posStation);
	}
	@Override
	public List<PosModeDef> getPosModeDefList(PosModeDef posModeDef) {
		// TODO Auto-generated method stub
		return posModeDefService.listPosModeDef(posModeDef);
	}
	@Override
	public <T> List<T> getPosVipQuery(String searchText) {
		// TODO Auto-generated method stub
		return posResService.getPosVipQuery(UserManager.getHotelGroupId(),UserManager.getHotelId(), searchText);
	}
	@Override
	public List<Object> getPosAccntContainHistoryList(String ename,
			Object object) {
		// TODO Auto-generated method stub
		return posSubService.getPosAccntContainHistoryList(ename, object);
	}
	@Override
	public void savePosMasterContainHistory(Object object) {
		PosMaster posMaster = new PosMaster();
		posMaster.setId( (Long) ModelUtil.getPropertyValue(object, "id") );
		posMaster.setAccnt((String) ModelUtil.getPropertyValue(object, "accnt"));
		if(posMasterService.listPosMaster(posMaster) != null && posMasterService.listPosMaster(posMaster).size() == 1  ){
			try {
				BeanUtils.copyProperties(posMaster, object);
				posMasterService.updatePosMaster(posMaster);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
			PosMasterHistory posMasterHistory  = new PosMasterHistory();
			posMasterHistory.setId((Long) ModelUtil.getPropertyValue(object, "id"));
			posMasterHistory.setAccnt((String) ModelUtil.getPropertyValue(object, "accnt"));
			if(posMasterHistoryService.listPosMasterHistory(posMasterHistory) !=null
					&& posMasterHistoryService.listPosMasterHistory(posMasterHistory).size()==1){
				try {
					BeanUtils.copyProperties(posMasterHistory, object);
					posMasterHistoryService.updatePosMasterHistory(posMasterHistory);
				} catch (IllegalAccessException | InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	@Override
	public List<PosResOrder> saveOrUpdateResOrder(PosResOrder object)
	{
		return posResService.saveOrUpdateResOrder(object);
	}
	
//  添加分库版的协议单位、会员、宾客查询
	@Override
	public List<POSInterfaceGuestFkDto> getCompanyResFkList(String key) {
		return posMasterService.getCompanyFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key);
	}
	
	@Override
	public List<POSInterfaceFoFkDto> getFoResFkList(String key) {
		return null;
//		return posMasterService.getGuestFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key);
	}
	
	@Override
	public List<POSInterfaceCardFkDto> getCardResFkList(String key) {
		return posMasterService.getCardFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key);
	}	
	@Override
	public void updateMasterChooseRes(PosRes posRes ,PosMaster posMaster) {
		// TODO Auto-generated method stub
		posResService.updateMasterChooseRes(posRes, posMaster);
	}
	@SuppressWarnings("unchecked")
	@Override
	public <T extends EntityInfo> List<T> getDataBySql(String clazz,
			String sql) {
		// TODO Auto-generated method stub
		try {
			 SQLHelper sh = new SQLHelper(sql);
			return posSubService.getDataBySql((Class<T>) Class.forName(clazz), sh);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public List<EdmSendDto> sendRsvSms2(String templetCode,
			List<String> rsvIds, List<String> names, Long hotelGroupId,
			Long hotelId) {
		return posResService.sendRsvSms2(templetCode, rsvIds, names, hotelGroupId, hotelId);
	}

	@Override
	public List<POSInterfaceCardFkDto> getCardFkList(String key) {
		return posMasterService.getCardFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<POSInterfaceGuestFkDto> getCompanyFkList(String key) {
		return posMasterService.getCompanyFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<POSInterfaceGuestFkDto> getGuestFkList(String key) {
		return posMasterService.getGuestFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public void updateAndPostSmsBatchDto(List<Map> maps, String templetCode,Long hotelGroupId, Long hotelId) {
		posResService.updateAndPostSmsBatchDto(maps, templetCode,hotelGroupId,hotelId);
		
	}
}
