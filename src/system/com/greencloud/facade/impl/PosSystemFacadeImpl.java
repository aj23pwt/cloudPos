package com.greencloud.facade.impl;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import com.greencloud.dto.CondstDto;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.Hotel;
import com.greencloud.entity.PosPccode;
import com.greencloud.entity.PosPccodeAuditFlag;
import com.greencloud.entity.PosStation;
import com.greencloud.entity.ReportCenter;
import com.greencloud.entity.SysListMeta;
import com.greencloud.entity.SysOption;
import com.greencloud.facade.IPosSystemFacade;
import com.greencloud.entity.PosSelectedObject;
import com.greencloud.service.IHotelService;
import com.greencloud.service.IPosConddtlService;
import com.greencloud.service.IPosMasterService;
import com.greencloud.service.IPosPccodeAuditFlagService;
import com.greencloud.service.IPosSelectedObjectService;
import com.greencloud.service.IPosStationService;
import com.greencloud.service.IPosSubService;
import com.greencloud.service.ISysListMetaService;
import com.greencloud.service.ISysOptionService;
import com.greencloud.service.IUserPosAuthService;
import com.greencloud.service.impl.PosStationServiceImpl;
import com.greencloud.util.Assert;
import com.greencloud.util.DateUtil;
import com.greencloud.util.StringUtil;
import com.greencloud.util.UserManager;
import com.greencloud.utils.PropertiesUtil4Sync;
import com.greencloud.utils.XmlUtil4SpringQuartz;

public class PosSystemFacadeImpl implements IPosSystemFacade {
	private IPosSubService  posSubService;
	private IHotelService hotelService;
	private IPosConddtlService posConddtlService;
	private ISysListMetaService sysListMetaService;
	private IUserPosAuthService userPosAuthService;
	private IPosStationService posStationService;
	private ISysOptionService sysOptionService;
	private IPosPccodeAuditFlagService posPccodeAuditFlagService ;
	private IPosSelectedObjectService posSelectedObjectService;
	private IPosMasterService posMasterService;
	
	public void setPosPccodeAuditFlagService(
			IPosPccodeAuditFlagService posPccodeAuditFlagService)
	{
		this.posPccodeAuditFlagService = posPccodeAuditFlagService;
	}
	public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}
	public void setPosStationService(IPosStationService posStationService)
	{
		this.posStationService = posStationService;
	}

	public void setUserPosAuthService(IUserPosAuthService userPosAuthService) {
		this.userPosAuthService = userPosAuthService;
	}

	public void setSysListMetaService(ISysListMetaService sysListMetaService) {
		this.sysListMetaService = sysListMetaService;
	}

	public void setPosConddtlService(IPosConddtlService posConddtlService) {
		this.posConddtlService = posConddtlService;
	}

	public void setHotelService(IHotelService hotelService) {
		this.hotelService = hotelService;
	}

	public void setPosSubService(IPosSubService posSubService) {
		this.posSubService = posSubService;
	}
	
	public void setPosSelectedObjectService(IPosSelectedObjectService posSelectedObjectService) {
		this.posSelectedObjectService = posSelectedObjectService;
	}
	public IPosMasterService getPosMasterService() {
		return posMasterService;
	}
	public void setPosMasterService(IPosMasterService posMasterService) {
		this.posMasterService = posMasterService;
	}
	
	@Override
	public List<Object> getDataBySql(String sql) {
		return posSubService.getDataBySql(sql);
	}

	@Override
	public void updateDataBySql(String sql) {
		posSubService.updateDataBySql(sql);
	}

	@Override
	public List<CodeBase> getCodeBaseByParentCode(String parentCode) {
		return posSubService.getCodeBaseByParentCode(UserManager.getHotelGroupId(),UserManager.getHotelId(),parentCode);
	}

	@Override
	public Object getCodeDetail(Object object) {
		Object codeDetail = null;
		try
		{
			codeDetail =  posSubService.getCodeDetail(object);
		}
		catch(Exception e)
		{
				e.printStackTrace();				
		}
		return codeDetail;
	}

	@Override
	public List<Object> getCodeList(String ename,Object object) {
		return posSubService.getCodeList(ename,object);
	}

	@Override
	public String getHotelTree(Boolean filterR) {
		Hotel hotel= new Hotel();
		hotel.setHotelGroupId(UserManager.getHotelGroupId());
		return hotelService.getHotelTree(UserManager.getHotelGroupId(), hotel,null);
	}

	@Override
	public List<CondstDto> getCondstDto(String pccode, String sortCode) {
		return posConddtlService.getCondstDto(UserManager.getHotelGroupId(), UserManager.getHotelId(), pccode, sortCode);
	}

	@Override
	public List<Object> getHotelAnalysis(String biz_date) {
		return posSubService.getHotelAnalysis(UserManager.getHotelGroupId(), UserManager.getHotelId(), biz_date);
	}

	@Override
	public Object getCodeDetailHistory(String ename,Object object) {
		return posSubService.getCodeDetailHistory(ename, object);
	}

	@Override
	public String updatePosAuditProcess() {
		return  posSubService.updatePosAuditProcess(UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public List<ReportCenter> getReportCenterByCategory(String category) {
		return posSubService.getReportCenterByCategory(UserManager.getHotelGroupId(), UserManager.getHotelId(), category);
	}

	@Override
	public String getsysListMetaId(String code,String type) {
		if("HOTELGROUP".equalsIgnoreCase(type)){
			 SysListMeta sysListMeta = sysListMetaService.findSysListMetaByCode(code, UserManager.getHotelGroupId(), (long) 0);
		     Assert.notNull(sysListMeta);
		     return sysListMeta.getId().toString();
		}else{
			 SysListMeta sysListMeta = sysListMetaService.findSysListMetaByCode(code, UserManager.getHotelGroupId(), UserManager.getHotelId());
		     Assert.notNull(sysListMeta);
		     return sysListMeta.getId().toString();
		}
		
	}

	@Override
	public String getSyncProperties() {
		// TODO Auto-generated method stub
		StringBuilder s = new StringBuilder();
		String url = PropertiesUtil4Sync.getProperty("SycHttpUrl");
		if(StringUtil.isNotEmpty(url)){
			s.append(url.substring(7,url.indexOf("/pos")));
		}
		s.append(",");
		s.append(PropertiesUtil4Sync.getProperty("hotelGroupId"));
		s.append(",");
		s.append(PropertiesUtil4Sync.getProperty("hotelId"));
		return s.toString();
	}

	@Override
	public void saveSyncProperties(String properties) {
		// TODO Auto-generated method stub
		String [] properArr=  properties.split(",");
		try {
			PropertiesUtil4Sync.setProper("SycHttpUrl","http://"+ properArr[0]+"/pos");
			PropertiesUtil4Sync.setProper("hotelGroupId", properArr[1]);
			PropertiesUtil4Sync.setProper("hotelId", properArr[2]);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public String saveSyncSpringQuartz(String tasks) {
		// TODO Auto-generated method stub
		XmlUtil4SpringQuartz xmlUtil4SpringQuartz = new XmlUtil4SpringQuartz();
		String msg = "error";
		try {
			msg = xmlUtil4SpringQuartz.updateSpringQuartz(tasks);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}

	@Override
	public String getUserPosAuthTreeDto() {
		// TODO Auto-generated method stub
		return userPosAuthService.getUserPosAuthTreeDto(UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public String getUserPosAuthTreeDtoByUser(String userCode) {
		// TODO Auto-generated method stub
		return userPosAuthService.getUserPosAuthTreeDtoByUser(UserManager.getHotelGroupId(), UserManager.getHotelId(), userCode);
	}

	@Override
	public List<Object> getHotelAnalysisShift(String biz_date,String flag) {
		// TODO Auto-generated method stub
		return posSubService.getHotelAnalysisShift(UserManager.getHotelGroupId(), UserManager.getHotelId(),biz_date, flag);
	}

	
	@Override
	public Date setCashier(String cashier) {
		if(cashier != null && !cashier.equals("")){
			UserManager.setCashier(Long.parseLong(cashier));
		}
		
		return UserManager.getBizDate();
	}

	@Override
	public String getCondstTreeDto(String pccode, String sortCode)
	{
		// TODO Auto-generated method stub
		return posConddtlService.getCondstTreeDto(UserManager.getHotelGroupId(), UserManager.getHotelId(), pccode, sortCode);
	}

	@Override
	public String getPosRemarkTreeDto(String pccode, String sortCode)
	{
		// TODO Auto-generated method stub
		return posConddtlService.getPosRemarkTreeDto(UserManager.getHotelGroupId(), UserManager.getHotelId(), pccode, sortCode);
	}

	@Override
	public void updatePosPccodeAuditFlag(String pcid)
	{
		PosStation posStation = new PosStation();
		posStation.setHotelGroupId(UserManager.getHotelGroupId());
		posStation.setHotelId(UserManager.getHotelId());
		posStation.setCode(pcid);
		List<PosStation> list = posStationService.listPosStation(posStation);
		if(list != null){
			String pccodes = list.get(0).getPccodes();
			if(StringUtil.isNotEmpty(pccodes)){
				SysOption sysOption =  sysOptionService.findSysOptionByCatalogItem("system", "pos_biz_date",UserManager.getHotelGroupId(),UserManager.getHotelId());
			    String[] array = pccodes.split(",");  
			    for(int i = 0; i < array.length; i++){ 
                    PosPccodeAuditFlag posPccodeAuditFlag = new PosPccodeAuditFlag();
                    posPccodeAuditFlag.setHotelGroupId(UserManager.getHotelGroupId());
                    posPccodeAuditFlag.setHotelId(UserManager.getHotelId());
                    posPccodeAuditFlag.setPosPccode(array[i]);
                    posPccodeAuditFlag.setPosPccodeDescript(array[i]);
                    posPccodeAuditFlag.setBizDate(DateUtil.parseDateWevFormat(sysOption.getSetValue()));
                    posPccodeAuditFlag.setBizDate1(DateUtil.addDays(DateUtil.parseDateWevFormat(sysOption.getSetValue()), -1));
                    posPccodeAuditFlag.setIsAudit("T");
                    posPccodeAuditFlag.setAuditUser(UserManager.getUserCode());
                    posPccodeAuditFlag.setStationAudit(pcid);
                    posPccodeAuditFlag.setIsRmposted("F");
                    posPccodeAuditFlagService.save(posPccodeAuditFlag);
			    }
			}
		}
	}
	@Override
	public List<PosPccodeAuditFlag> getPosPccodeAuditFlagList(
			PosPccodeAuditFlag posPccodeAuditFlag)
	{
		// TODO Auto-generated method stub
		return posPccodeAuditFlagService.listPosPccodeAuditFlag(posPccodeAuditFlag);
	}
	@Override
	public void savePosSelectedObject(String accnt, String pcrec, String mode) {
		posSelectedObjectService.savePosSelectedObject(UserManager.getHotelGroupId(), UserManager.getHotelId(), UserManager.getWorkStationCode(), UserManager.getWorkStationDescript(), UserManager.getUserCode(), accnt, pcrec, mode);
	}
	@Override
	public void deletePosSelectedObject() {
		posSelectedObjectService.deletePosSelectedObject(UserManager.getHotelId(), UserManager.getHotelGroupId(), UserManager.getWorkStationCode());
	}
	@Override
	public List<PosSelectedObject> getPosSelectedObjectByAccnt(String accnt,
			String pcrec) {
		return posSelectedObjectService.getPosSelectedObjectByAccnt(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt, pcrec,UserManager.getWorkStationCode());
	}
	@Override
	public String getPassWordCheck(String userId, String userCode,String passWord) {
		return posMasterService.getPassWordCheck(UserManager.getHotelGroupId(), UserManager.getHotelId(), userId, userCode, passWord);
	}

	
}
