package com.greencloud.facade.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.dao.IPosIpDao;
import com.greencloud.dto.POSInterfaceArDto;
import com.greencloud.dto.POSInterfaceArFkDto;
import com.greencloud.dto.POSInterfaceCardDto;
import com.greencloud.dto.POSInterfaceCardFkDto;
import com.greencloud.dto.POSInterfaceFoDto;
import com.greencloud.dto.POSInterfaceFoFkDto;
import com.greencloud.dto.POSInterfaceGuestDto;
import com.greencloud.dto.POSInterfaceGuestFkDto;
import com.greencloud.dto.POSInterfaceScanDto;
import com.greencloud.dto.PosAuditProcessCkeckDto;
import com.greencloud.dto.PosLinkDto;
import com.greencloud.dto.PosMasterDto;
import com.greencloud.dto.PosinterfaceFaceArGuestDto;
import com.greencloud.entity.PosAccntSync;
import com.greencloud.entity.PosAccount;
import com.greencloud.entity.PosDetail;
import com.greencloud.entity.PosHotelTransfer;
import com.greencloud.entity.PosIp;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosRes;
import com.greencloud.entity.User;
import com.greencloud.exception.BizException;
import com.greencloud.facade.IPosMasterFacade;
import com.greencloud.facade.IPosSycFacade;
import com.greencloud.facade.IUserAuthFacadeService;
import com.greencloud.hessian.HessianProxyFactory;
import com.greencloud.hessian.HessianProxyFactoryBean;
import com.greencloud.service.IKaiYuanInterfaceService;
import com.greencloud.service.IPosAccntSyncService;
import com.greencloud.service.IPosAccountService;
import com.greencloud.service.IPosDetailService;
import com.greencloud.service.IPosDishcardService;
import com.greencloud.service.IPosHotelTransferService;
import com.greencloud.service.IPosMasterService;
import com.greencloud.service.IPosResService;
import com.greencloud.service.IUserService;
import com.greencloud.service.impl.KaiYuanInterfaceServiceImpl;
import com.greencloud.util.MessageDigestUtil;
import com.greencloud.util.ModelUtil;
import com.greencloud.util.UserManager;

public class PosMasterFacadeImpl implements IPosMasterFacade {

	
	private IPosMasterService posMasterService ;
	private IPosResService posResService ;
	private IPosDetailService posDetailService ;
	private IPosAccntSyncService posAccntSyncService;
	private IUserService userService;
	private IPosIpDao posIpDao;
	private IPosSycFacade posSycFacade;
	private IPosHotelTransferService posHotelTransferService;
	private IPosDishcardService posDishcardService;
	private IPosAccountService posAccountService;
	private IKaiYuanInterfaceService kaiYuanInterfaceService;


	
	public void setPosHotelTransferService(
			IPosHotelTransferService posHotelTransferService)
	{
		this.posHotelTransferService = posHotelTransferService;
	}
	public void setPosSycFacade(IPosSycFacade posSycFacade) {
		this.posSycFacade = posSycFacade;
	}
	public void setPosAccntSyncService(IPosAccntSyncService posAccntSyncService) {
		this.posAccntSyncService = posAccntSyncService;
	}
	public IPosResService getPosResService() {
		return posResService;
	}
	public void setPosResService(IPosResService posResService) {
		this.posResService = posResService;
	}
	public IPosMasterService getPosMasterService() {
		return posMasterService;
	}
	public void setPosMasterService(IPosMasterService posMasterService) {
		this.posMasterService = posMasterService;
	}
	public void setPosDetailService(IPosDetailService posDetailService) {
		this.posDetailService = posDetailService;
	}
	public void setPosDishcardService(IPosDishcardService posDishcardService) {
		this.posDishcardService = posDishcardService;
	}
	public void setPosAccountService(IPosAccountService posAccountService) {
		this.posAccountService = posAccountService;
	}
	public void setKaiYuanInterfaceService(IKaiYuanInterfaceService kaiYuanInterfaceService) {
		this.kaiYuanInterfaceService = kaiYuanInterfaceService;
	}
	/** 
	* @Title: 
	* @Description: TODO(新开单) 
	* @param @param posMaster
	* @param @param pcid
	* @param @return   accnt,+提示信息
	* @return 
	* @throws 
	*/
	@Override
	public String savePosMaster(PosMaster posMaster,String pcid) {
		return posMasterService.saveMaster(posMaster,pcid);
	}
	/** 
	* @Title: 
	* @Description: TODO(app2 预订转登记) 
	* @param @param res
	* @param @param posMaster
	* @param @param pcid
	* @param @return    设定文件 
	* @return 
	* @throws 
	*/
	@Override
	public String updateResNewMaster(PosRes res, PosMaster posMaster,String pcid) {
		return posMasterService.updateResNewMaster(res, posMaster, pcid);
	}
	
	/** 
	* @Title: 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param accnt
	* @param @return    设定文件 
	* @return 
	* @throws 
	*/
	@Override
	public PosMasterDto getPosMasterDtoByAccnt(String accnt,String tableNo,String sta) {
		return posMasterService.getPosMasterDtoByAccnt(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt,tableNo,sta);
	}
	@Override
	public String updateTableNoByAccnt(String bizDate, String accnt,String shift, String oldTableNo, String newTableNo) {
		String ret = "";
		ret = posMasterService.updateTableNoByAccnt(UserManager.getHotelGroupId(), UserManager.getHotelId(), bizDate, accnt, shift, oldTableNo, newTableNo, "0", UserManager.getUserCode());
		if ("1".equals(ret.substring(0, 1))){
			String kitret = this.updateKitchenMsg(accnt, "3", "A","0", oldTableNo, newTableNo,"");
//					posDishcardService.updateKitchenMsg(UserManager.getHotelId(), UserManager.getHotelGroupId(), accnt, "3", "A", UserManager.getWorkStationId().toString(), UserManager.getUserCode(), oldTableNo, newTableNo);
			if(!"1".equals(kitret.substring(0, 1))){
				ret = ret + ",厨房消息发送失败";
			}
		}
		return ret;
	}
	/** 
	* @Title: 
	* @Description: TODO(联单&&撤联) 
	* @param @param oldAccnt
	* @param @param newAccnt
	* @param @param flag flag = 1 表示 撤联操作 flag=2 表示 联单操作 ！！！与flex端 紧密相连
	* @param @return    设定文件 
	* @return 
	* @throws 
	*/
	@Override
	public String updateMasterPcrec(String oldAccnt, String newAccnt,String flag) {
		return posMasterService.updateMasterPcrec(UserManager.getHotelGroupId(), UserManager.getHotelId(), oldAccnt, newAccnt, flag);
	}
	@Override
	public PosMasterDto updateGetPosMasterDtoForCo(String accnt, String tableNo,Date bizDate) {
		posMasterService.updateGetPosMasterDtoForCo1(UserManager.getHotelGroupId(), UserManager.getHotelId(),  accnt, tableNo, bizDate);
		
		PosMasterDto pmd=posMasterService.updateGetPosMasterDtoForCo2(UserManager.getHotelGroupId(), UserManager.getHotelId(),  accnt, tableNo, bizDate);
		return pmd;
	}
	@Override
	public String updateCheckoutRevoke(String bizDate, String billno, String shift,String flag, String user) {
		
		
		return posMasterService.updateCheckoutRevoke(UserManager.getHotelGroupId(), UserManager.getHotelId(), bizDate, billno, shift, flag ,user);
	}
	
	@Override
	public List<POSInterfaceFoDto> getFoList(String key, String rsvClass) {
		return posMasterService.getFoList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key, rsvClass);
	}
	@Override
	public List<POSInterfaceArDto> getArList(String key) {
		return posMasterService.getArList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<PosinterfaceFaceArGuestDto> getArGuestList(long arId, String relationCode) {
		return posMasterService.getArGuestList(UserManager.getHotelGroupId(), UserManager.getHotelId(), arId ,relationCode);
	}
	@Override
	public List<POSInterfaceCardDto> getCardList(String key) {
		return posMasterService.getCardList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	/** 
	* @Title: 
	* @Description: TODO(消单) 
	* @param @param isSure
	* @param @param accnt
	* @param @param shift
	* @param @param user
	* @param @return    设定文件 
	* @return 
	* @throws 
	*/
	@Override
	public String updateMasterRevoke(Boolean isSure, String accnt,
			String shift, String user,String workStation,String reason) {
		if(!isSure){
			PosDetail posDetail = new PosDetail();
			posDetail.setHotelGroupId(UserManager.getHotelGroupId());
			posDetail.setHotelId(UserManager.getHotelId());
			posDetail.setAccnt(accnt);
			posDetail.setSta("I");
			return	String.valueOf(posDetailService.countPosDetail(posDetail));
		}else{
			return posMasterService.updateMasterRevoke(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt, shift, user,workStation,reason);
		}
	}
	@Override
	public <T> List<T> getPosDetailModeView(String bizDate,String accnts,String flag) {
		return posMasterService.getPosDetailModeView(UserManager.getHotelGroupId(), UserManager.getHotelId(), bizDate, accnts,flag);
	}
	@Override
	public void updatePosDec(String accnts, String dec) {
		posMasterService.updatePosDec(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnts, dec);
	}
	/** 
	* @Title: 
	* @Description: TODO(并桌) 
	* @param @param oldAccnt
	* @param @param newAccnt
	* @param @param oldTableno
	* @param @param newTbleno
	* @param @param flag
	* @param @return    设定文件 
	* @return 
	* @throws 
	*/
	@Override
	public String updateMasterMergerTable(String oldAccnt, String newAccnt, String oldTableno, String newTbleno, String flag) {
		return posMasterService.updateMasterMergerTable(UserManager.getHotelGroupId(), UserManager.getHotelId(), oldAccnt, newAccnt, oldTableno, newTbleno, flag, UserManager.getUserCode());
	}
	@Override
	public List<POSInterfaceGuestDto> getGuestList(String key) {
		return posMasterService.getGuestList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<POSInterfaceGuestDto> getCompanyList(String key) {
		return posMasterService.getCompanyList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key);
	}
	@Override
	public List<PosAccntSync> getPosAccntSyncList() {
		PosAccntSync posAccntSync = new PosAccntSync();
		posAccntSync.setHotelGroupId(UserManager.getHotelGroupId());
		posAccntSync.setHotelId(UserManager.getHotelId());
		posAccntSync.setIsSync("F");
		//获取本地需要同步的账务主单
		return  posAccntSyncService.listPosAccntSync(posAccntSync);
	}
	@Override
	public void updatePosMode(String accnts, String mode) {
		posMasterService.updatePosMode(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnts, mode);
	}
	@Override
	public List<PosLinkDto> getPosLinkDtot(String accnt, String tableNo,Date bizDate) {
		posMasterService.updateGetPosMasterDtoForCo1(UserManager.getHotelGroupId(), UserManager.getHotelId(),  accnt, tableNo, bizDate);
		
		return posMasterService.getPosLinkDtot(UserManager.getHotelGroupId(), UserManager.getHotelId(),  accnt, tableNo, bizDate);
	}
	@Override
	public void updatePosSuspend(String accnt, String shift, String user) {
		posMasterService.updatePosSuspend(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt, shift, user);
	}
	
	//密码修改
	public IUserService getUserService() {
		return userService;
	}
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	@Override
	public void updateUserPassword(Long userId,String oldPwd,String newPwd){
		posMasterService.updateUserPassword(userId, oldPwd, newPwd);
	}
	
	public IPosIpDao getPosIpDao() {
		return posIpDao;
	}
	public void setPosIpDao(IPosIpDao posIpDao) {
		this.posIpDao = posIpDao;
	}
	
	@Override
	public List<PosAuditProcessCkeckDto> updatePosAuditProcessCkeck(
			String biz_date) {
		// TODO Auto-generated method stub
		return  posMasterService.updatePosAuditProcessCkeck(UserManager.getHotelGroupId(), UserManager.getHotelId(),  biz_date);
	}
	@Override
	public <T> List<T> getTableMapTakeAway(String hotelGroupId, String hotelId,
			String date, String shift, String pccode, String status,
			String type, String flag)
	{
		// TODO Auto-generated method stub
		return posMasterService.getTableMapTakeAway(hotelGroupId, hotelId, date, shift, pccode, status, type, flag);
	}
	@Override
	public String saveSplitPosMasterDto(String type, String accnt,
			String tableNo, List<PosMasterDto> splitPosMasterDto)
	{
		// TODO Auto-generated method stub
		return posMasterService.saveSplitPosMasterDto(type, accnt, tableNo, splitPosMasterDto,UserManager.getHotelGroupId(), UserManager.getHotelId(),UserManager.getUserCode(),UserManager.getWorkStationId());
	}
	
	@Override
	public void updatePosAuditBeginCheck(long hotelGroupId, long hotelId, String bizDate) {		
		if(posMasterService.updatePosAuditBeginCheck(hotelGroupId, hotelId, bizDate).equals("1")){
			posSycFacade.saveSyncMaster();
		};		
	}
	@Override
	public List<PosHotelTransfer> getPosHotelTransfer()
	{
		PosHotelTransfer posHotelTransfer = new PosHotelTransfer();
		posHotelTransfer.setHotelGroupId(UserManager.getHotelGroupId());
		posHotelTransfer.setHotelId(UserManager.getHotelId());
		return posHotelTransferService.listPosHotelTransfer(posHotelTransfer);
	}
	@Override
	public List<POSInterfaceFoDto> getFoListHotelTransfer(
			PosHotelTransfer hotelTransferData, String key, String rsvClass)
	{
		return posMasterService.getFoListHotelTransfer(hotelTransferData,key, rsvClass);
	}
	@Override
	public List<POSInterfaceArDto> getArListHotelTransfer(
			PosHotelTransfer hotelTransferData, String key)
	{
		return posMasterService.getArListHotelTransfer(hotelTransferData, key);
	}
	@Override
	public void updatePosAccntSyncByPosMasterChanged(long hotelGroupId,long hotelId, String accnt) {
		posMasterService.updatePosAccntSyncByPosMasterChanged(hotelGroupId, hotelId, accnt);
	}
	@Override
	public PosMaster getPosMaterByAccnt(String accnt){
		return posMasterService.getPosMaterByAccnt(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt);
	}
	@Override
    public String updateKitchenMsg (String accnt,String type,String mode,String id,String oldTableNo,String newTableNo,String kitmsg){
		return posDishcardService.updateKitchenMsg(UserManager.getHotelId(), UserManager.getHotelGroupId(), accnt, type, mode, UserManager.getWorkStationId().toString(), UserManager.getUserCode(),Integer.parseInt(id), oldTableNo, newTableNo,kitmsg);
	}
	@Override
	public List<POSInterfaceFoFkDto> getFoFkList(String key, String rsvClass) {
		return posMasterService.getFoFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key, rsvClass);
	}
	@Override
	public List<POSInterfaceArFkDto> getArFkList(String key) {		
		return posMasterService.getArFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<POSInterfaceGuestFkDto> getGuestFkList(String key) {
		return posMasterService.getGuestFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<POSInterfaceGuestFkDto> getCompanyFkList(String key) {
		return posMasterService.getCompanyFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<POSInterfaceCardFkDto> getCardFkList(String key) {
		return posMasterService.getCardFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key);
	}
	@Override
	public List<PosAccount> getPosAccountPayView(String bizDate, String accnts) {
		return posAccountService.getPosAccountPayView(UserManager.getHotelGroupId(), UserManager.getHotelId(), bizDate, accnts);
	}

	@Override
	public List<POSInterfaceScanDto> getScanList(String key) {
		return posMasterService.getScanList(UserManager.getHotelGroupId(), UserManager.getHotelId(),  key);
	}
	@Override
	public List<POSInterfaceFoFkDto> getFoListHotelTransferFk(PosHotelTransfer hotelTransferData, String key, String rsvClass) {
		return posMasterService.getFoListHotelTransferFk(hotelTransferData,key, rsvClass);
	}
	@Override
	public List<POSInterfaceArFkDto> getArListHotelTransferFk(PosHotelTransfer hotelTransferData, String key) {
		return posMasterService.getArListHotelTransferFk(hotelTransferData, key);
	}
	@Override
	public void updateKaiyuanVipDiscount(String accnt,String cardno,String mode,BigDecimal dsc,BigDecimal srv,BigDecimal tax) {
		posMasterService.updateKaiyuanVipDiscount(UserManager.getHotelGroupId(), UserManager.getHotelId(), UserManager.getBizDate(), accnt,cardno,mode,dsc,srv,tax);
	}
	@Override
	public void updateKaiyuanVipInfo(String accnt,String cardno, String foodDiscount,
			String beveDiscount, String miscDiscount, String discount1,
			String discount2) {
		kaiYuanInterfaceService.updateCardInfo(UserManager.getHotelGroupId(), UserManager.getHotelId(), UserManager.getBizDate(), accnt,cardno,UserManager.getUserCode(), foodDiscount, beveDiscount, miscDiscount, discount1, discount2);
	}
	@Override
	public List<POSInterfaceCardFkDto> getKaiYuanCardFkList(String key,String pccode) {
		return posMasterService.getKaiYuanCardFkList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key,pccode);
	}
	@Override
	public List<POSInterfaceCardFkDto> getKaiYuanCardFkListByPos(String accnt,String pccode,String type1, String key) {
		
		return posMasterService.updateKaiYuanCardFkListByPos(UserManager.getHotelGroupId(), UserManager.getHotelId(), accnt, pccode,type1, UserManager.getWorkStationCode(), UserManager.getUserCode(),UserManager.getBizDate(), key);
	}
	@Override
	public List<POSInterfaceCardFkDto> getCardLvKaList(String key,String passWord,String isNeedPd) {
		return posMasterService.getCardLvKaList(UserManager.getHotelGroupId(), UserManager.getHotelId(), key, passWord,isNeedPd);
	}
	
}
