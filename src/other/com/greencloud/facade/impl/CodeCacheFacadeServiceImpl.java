package com.greencloud.facade.impl;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.NoSuchBeanDefinitionException;

import com.greencloud.entity.App;
import com.greencloud.entity.CardLevel;
import com.greencloud.entity.CodeArticle;
import com.greencloud.entity.CodeBankcardLink;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.CodeCache;
import com.greencloud.entity.CodeCountry;
import com.greencloud.entity.CodeCurrency;
import com.greencloud.entity.CodeReason;
import com.greencloud.entity.CodeRentalShowPeriod;
import com.greencloud.entity.CodeRound;
import com.greencloud.entity.CodeTransaction;
import com.greencloud.entity.DoorcardDevice;
import com.greencloud.entity.PhoneCallno;
import com.greencloud.entity.PhoneChargeCode;
import com.greencloud.entity.PhoneExtno;
import com.greencloud.entity.PhoneParams;
import com.greencloud.entity.PhonePeriodDiscount;
import com.greencloud.entity.PhoneServiceCode;
import com.greencloud.entity.PosConddtl;
import com.greencloud.entity.PosCondst;
import com.greencloud.entity.PosIp;
import com.greencloud.entity.PosPccodeNote;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosSortAll;
import com.greencloud.entity.SalesGroup;
import com.greencloud.entity.SalesMan;
import com.greencloud.entity.ShortcutKey;
import com.greencloud.entity.SysConstraint;
import com.greencloud.entity.SysConstraintRule;
import com.greencloud.entity.SysHelp;
import com.greencloud.entity.SysListMeta;
import com.greencloud.entity.SysOption;
import com.greencloud.entity.TabToolbar;
import com.greencloud.entity.Toolbar;
import com.greencloud.entity.UserPosAuth;
import com.greencloud.entity.UserPosAuthUserAuth;
import com.greencloud.entity.WorkBtn;
import com.greencloud.entity.WorkSheet;
import com.greencloud.entity.WorkSheetBtnCfg;
import com.greencloud.entity.WorkSheetStatusCfg;
import com.greencloud.entity.WorkStatus;
import com.greencloud.facade.ICardFacadeService;
import com.greencloud.facade.ICodeCacheFacadeService;
import com.greencloud.facade.IDoorcardDeviceFacadeService;
import com.greencloud.facade.IPhoneCallnoFacadeService;
import com.greencloud.facade.IPhoneChargeCodeFacadeService;
import com.greencloud.facade.IPhoneExtnoFacadeService;
import com.greencloud.facade.IPhoneParamsFacadeService;
import com.greencloud.facade.IPhonePeriodDiscountFacadeService;
import com.greencloud.facade.IPhoneServiceCodeFacadeService;
import com.greencloud.facade.ICodeCacheFacadeService;
import com.greencloud.service.FICommonService;
import com.greencloud.service.IAppService;
import com.greencloud.service.ICodeArticleService;
import com.greencloud.service.ICodeBankcardLinkService;
import com.greencloud.service.ICodeBaseService;
import com.greencloud.service.ICodeCacheService;
import com.greencloud.service.ICodeCountryService;
import com.greencloud.service.ICodeCurrencyService;
import com.greencloud.service.ICodeReasonService;
import com.greencloud.service.ICodeRentalShowPeriodService;
import com.greencloud.service.ICodeRoundService;
import com.greencloud.service.ICodeTransactionService;
import com.greencloud.service.IPosConddtlService;
import com.greencloud.service.IPosCondstService;
import com.greencloud.service.IPosIpService;
import com.greencloud.service.IPosPccodeNoteService;
import com.greencloud.service.IPosPluAllService;
import com.greencloud.service.IPosSortAllService;
import com.greencloud.service.IShortcutKeyService;
import com.greencloud.service.ISysConstraintRuleService;
import com.greencloud.service.ISysConstraintService;
import com.greencloud.service.ISysHelpService;
import com.greencloud.service.ISysListMetaService;
import com.greencloud.service.ISysOptionService;
import com.greencloud.service.ITabToolbarService;
import com.greencloud.service.IToolbarService;
import com.greencloud.service.IUserPosAuthService;
import com.greencloud.service.IUserPosAuthUserAuthService;
import com.greencloud.service.IWorkBtnService;
import com.greencloud.service.IWorkSheetBtnCfgService;
import com.greencloud.service.IWorkSheetService;
import com.greencloud.service.IWorkSheetStatusCfgService;
import com.greencloud.service.IWorkStatusService;
import com.greencloud.util.AmfCompressUtil;
import com.greencloud.util.ServiceLocator;
import com.greencloud.util.UserManager;

public class CodeCacheFacadeServiceImpl implements ICodeCacheFacadeService {
	
	private IPosSortAllService posSortAllService;
	private IPosIpService posIpService;
	private IPosPluAllService posPluAllService;
	private IPosCondstService posCondstService;
	private IPosConddtlService posConddtlService;
	private IPosPccodeNoteService posPccodeNoteService;
	private IUserPosAuthService userPosAuthService;
	private IUserPosAuthUserAuthService userPosAuthUserAuthService;
	
	public void setUserPosAuthService(IUserPosAuthService userPosAuthService) {
		this.userPosAuthService = userPosAuthService;
	}
	public void setUserPosAuthUserAuthService(
			IUserPosAuthUserAuthService userPosAuthUserAuthService) {
		this.userPosAuthUserAuthService = userPosAuthUserAuthService;
	}
	public void setPosPccodeNoteService(IPosPccodeNoteService posPccodeNoteService) {
		this.posPccodeNoteService = posPccodeNoteService;
	}
	public void setPosConddtlService(IPosConddtlService posConddtlService) {
		this.posConddtlService = posConddtlService;
	}
	public void setPosCondstService(IPosCondstService posCondstService) {
		this.posCondstService = posCondstService;
	}
	public void setPosPluAllService(IPosPluAllService posPluAllService) {
		this.posPluAllService = posPluAllService;
	}
	public void setPosIpService(IPosIpService posIpService) {
		this.posIpService = posIpService;
	}
	public void setPosSortAllService(IPosSortAllService posSortAllService) {
		this.posSortAllService = posSortAllService;
	}
	@Override
	public List<PosSortAll> findPosSortAll(Date modifyDatetime) {
		return posSortAllService.findPosSortAll(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}

	@Override
	public List<PosIp> findPosIp(Date modifyDatetime) {
		return posIpService.findPosIp(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}

	
	@Override
	public List<PosPluAll> findPosPluAll(Date modifyDatetime) {
		return posPluAllService.findPosPluAll(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	
	
	@Override
	public List<PosCondst> findPosCondst(Date modifyDatetime) {
		return posCondstService.findPosCondst(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	@Override
	public List<PosConddtl> findPosConddtl(Date modifyDatetime) {
		return posConddtlService.findPosConddtl(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	
	@Override
	public List<PosPccodeNote> findPosPccodeNote(Date modifyDatetime) {
		return posPccodeNoteService.findPosPccodeNote(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	
	
	
	
	
	private ICodeCacheService codeCacheService;
	private ICodeBaseService  codeBaseService;
	private ITabToolbarService  tabToolbarService;
	private ISysOptionService sysOptionService;
	private ICodeTransactionService codeTransactionService;
	private ICodeArticleService codeArticleService;
	private ICodeReasonService codeReasonService;
	private IToolbarService toolbarService;
	private ISysHelpService sysHelpService;
	private ICodeCurrencyService codeCurrencyService;
	private ICodeRentalShowPeriodService codeRentalShowPeriodService;
	private ICodeBankcardLinkService codeBankcardLinkService;
	private ICodeRoundService codeRoundService;      
	private ICodeCountryService codeCountryService;      
	private ISysConstraintService sysConstraintService;
	private ISysConstraintRuleService sysConstraintRuleService;
	private IWorkSheetService workSheetService;
	private IWorkStatusService workStatusService;
	private IWorkBtnService workBtnService;
	private IWorkSheetStatusCfgService workSheetStatusCfgService;
	private IWorkSheetBtnCfgService workSheetBtnCfgService;
	private ServiceLocator serviceLocator;
	private IShortcutKeyService shortcutKeyService;
	
	public void setShortcutKeyService(IShortcutKeyService shortcutKeyService) {
		this.shortcutKeyService = shortcutKeyService;
	}
	public void setServiceLocator(ServiceLocator serviceLocator) {
	
		this.serviceLocator = serviceLocator;
	}
	public void setWorkSheetService(IWorkSheetService workSheetService) {
		this.workSheetService = workSheetService;
	}
	public void setWorkStatusService(IWorkStatusService workStatusService) {
		this.workStatusService = workStatusService;
	}
	public void setWorkBtnService(IWorkBtnService workBtnService) {
		this.workBtnService = workBtnService;
	}
	public void setWorkSheetStatusCfgService(
			IWorkSheetStatusCfgService workSheetStatusCfgService) {
		this.workSheetStatusCfgService = workSheetStatusCfgService;
	}
	public void setWorkSheetBtnCfgService(
			IWorkSheetBtnCfgService workSheetBtnCfgService) {
		this.workSheetBtnCfgService = workSheetBtnCfgService;
	}

	private ISysListMetaService sysListMetaService;
	
	public void setSysListMetaService(ISysListMetaService sysListMetaService) {
		this.sysListMetaService = sysListMetaService;
	}
	public void setSysConstraintService(ISysConstraintService sysConstraintService) {
		this.sysConstraintService = sysConstraintService;
	}
	public void setSysConstraintRuleService(
			ISysConstraintRuleService sysConstraintRuleService) {
		this.sysConstraintRuleService = sysConstraintRuleService;
	}
	public void setCodeRoundService(ICodeRoundService codeRoundService) {
		this.codeRoundService = codeRoundService;
	}
	public void setCodeCountryService(ICodeCountryService codeCountryService) {
		this.codeCountryService = codeCountryService;
	}
	public void setCodeBankcardLinkService(
			ICodeBankcardLinkService codeBankcardLinkService) {
		this.codeBankcardLinkService = codeBankcardLinkService;
	}
	public void setCodeRentalShowPeriodService(ICodeRentalShowPeriodService codeRentalShowPeriodService) {
		this.codeRentalShowPeriodService = codeRentalShowPeriodService;
	}
	public void setCodeCurrencyService(ICodeCurrencyService codeCurrencyService) {
		this.codeCurrencyService = codeCurrencyService;
	}
	public void setSysHelpService(ISysHelpService sysHelpService) {
		this.sysHelpService = sysHelpService;
	}
	public void setToolbarService(IToolbarService toolbarService) {
		this.toolbarService = toolbarService;
	}
	public void setCodeReasonService(ICodeReasonService codeReasonService) {
		this.codeReasonService = codeReasonService;
	}
	public void setCodeArticleService(ICodeArticleService codeArticleService) {
		this.codeArticleService = codeArticleService;
	}
	
	private IAppService appService;
	public void setAppService(IAppService appService) {
		this.appService = appService;
	}
	public void setCodeTransactionService(
			ICodeTransactionService codeTransactionService) {
		this.codeTransactionService = codeTransactionService;
	}
	public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}
	public void setTabToolbarService(ITabToolbarService tabToolbarService) {
		this.tabToolbarService = tabToolbarService;
	}
	public void setCodeCacheService(ICodeCacheService codeCacheService) {
		this.codeCacheService = codeCacheService;
	}
	public void setCodeBaseService(ICodeBaseService codeBaseService) {
		this.codeBaseService = codeBaseService;
	}

	@Override
	public List<CodeCache> findAllCodeCaches() {
		List<CodeCache> codeCaches = codeCacheService.findAllCodeCaches(UserManager.getHotelGroupId(),UserManager.getHotelId());
		return codeCaches;
	}
	@Override
	public List<CodeBase> findCodeBase(Date modifyDatetime) {
		return codeBaseService.findCodeBase(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	@Override
	public List<TabToolbar> findTabToolBar(Date modifyDatetime) {
		return tabToolbarService.findTabToolbar(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	
	public List<TabToolbar> findTabToolBarByCondition(String winName,String entityType,
			String entityPeriod,String entityStatus,Long hotelGroupId,Long hotelId){
		return tabToolbarService.findTabToolBarByCondition(winName, entityType, entityPeriod, entityStatus, hotelGroupId, hotelId);
	}
	
	public List<TabToolbar> findLinkTabToolBarByCondition(String winName,String entityType,
			String entityPeriod,String entityStatus,Long hotelGroupId,Long hotelId){
		return tabToolbarService.findLinkTabToolBarByCondition(winName, entityType, entityPeriod, entityStatus, hotelGroupId, hotelId);
	}
	
	@Override
	public List<SysOption> findSysOption(Date modifyDatetime) {
		return sysOptionService.findSysOption(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<CodeTransaction> findCodeTransaction(Date modifyDatetime) {
		return codeTransactionService.findCodeTransaction(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	
	@Override
    public List<CodeTransaction> findCodeTransaction2(Long hotelId,Date modifyDatetime) {
	    return codeTransactionService.findCodeTransaction(UserManager.getHotelGroupId(),hotelId, modifyDatetime);
    }
	   
	@Override
	public List<CodeArticle> findCodeArticle(Date modifyDatetime) {
		return codeArticleService.findCodeArticle(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	
	@Override
	public List<CodeReason> findCodeReason(Date modifyDatetime) {
		return codeReasonService.findCodeReason(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	
	/**
	 * 保存CodeCache
	 */
	public void saveCodeCache(CodeCache codeCache){
		codeCache.setHotelGroupId(UserManager.getHotelGroupId());
		codeCache.setHotelId(UserManager.getHotelId());
		codeCacheService.saveCodeCache(codeCache);
	}
	
	/**
	 * 更新CodeCache
	 */
	public void updateCodeCache(CodeCache codeCache){
		codeCacheService.updateCodeCache(codeCache);
	}
	
	/**
	 * 删除CodeCache
	 */
	public void deleteCodeCache(CodeCache codeCache){
		codeCacheService.deleteCodeCache(codeCache);
	}
	/**
	 * 按id查找roomfilter
	 * @param id
	 * @return RoomFilter
	 */
	public CodeCache findCodeCacheById(Long id){
		return codeCacheService.findCodeCacheByIdNoLazy(id);
	}
	
	public CodeCache findCodeCacheByCode(Long hotelId,String entityName){
        return codeCacheService.findCodeCacheByEntityName(entityName, UserManager.getHotelGroupId(), hotelId);
    }
	@Override
	public List<App> findApp(Date modifyDatetime) {
		return appService.findApp(modifyDatetime);
	}
	@Override
	public List<Toolbar> findToolbar(Date modifyDatetime) {
		return toolbarService.findToolbar(UserManager.getHotelGroupId(), UserManager.getHotelId(),modifyDatetime);
	}
	@Override
	public List<SysHelp> findSysHelp(Date modifyDatetime) {
		return sysHelpService.findSysHelp(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	@Override
	public List<CodeCurrency> findCodeCurrency(Date modifyDatetime) {
		return codeCurrencyService.findCodeCurrency(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	@Override
	public List<CodeRentalShowPeriod> findCodeRentalShowPeriod(Date modifyDatetime) {
		return codeRentalShowPeriodService.findCodeRentalShowPeriod(UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime);
	}
	@Override
	public List<CodeBankcardLink> findCodeBankcardLink(Date modifyDatetime) {
		return codeBankcardLinkService.findCodeBankcardLink(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<CodeRound> findCodeRound(Date modifyDatetime) {
		return codeRoundService.findCodeRound(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);                    
	}
	@Override
	public List<CodeCountry> findCodeCountry(Date modifyDatetime) {
		return codeCountryService.findCodeCountry(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<SysConstraint> findSysConstraint(Date modifyDatetime) {
		return sysConstraintService.findSysConstraint(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<SysConstraintRule> findSysConstraintRule(Date modifyDatetime) {
		return sysConstraintRuleService.findSysConstraintRule(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<SysListMeta> findSysListMeta(Date modifyDatetime) {
		return sysListMetaService.findSysListMeta(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<WorkSheet> findWorkSheet(Date modifyDatetime) {
		return workSheetService.findWorkSheet(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<WorkStatus> findWorkStatus(Date modifyDatetime) {
		return workStatusService.findWorkStatus(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<WorkBtn> findWorkBtn(Date modifyDatetime) {
		return workBtnService.findWorkBtn(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<WorkSheetStatusCfg> findWorkSheetStatusCfg(Date modifyDatetime) {
		return workSheetStatusCfgService.findWorkSheetStatusCfg(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<WorkSheetBtnCfg> findWorkSheetBtnCfg(Date modifyDatetime) {
		return workSheetBtnCfgService.findWorkSheetBtnCfg(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<ShortcutKey> findShortcutKey(Date modifyDatetime) {
		return shortcutKeyService.findShortcutKey(UserManager.getHotelGroupId(),UserManager.getHotelId(), modifyDatetime);
	}
	
	@Override
	public byte[] findCompressedCache(Date modifyDatetime, String entityName) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException {
		
		entityName=entityName.substring(entityName.lastIndexOf(".")+1);
		String firstChar=entityName.substring(0, 1);
		String afterChars=entityName.substring(1);
		String Lname=firstChar.toLowerCase()+afterChars;
		
		try {
			Object service=serviceLocator.getService(Lname+"Service");
			Class classtype=service.getClass();
			Method findMethod = classtype.getDeclaredMethod("find"+entityName, Long.class,Long.class,Date.class);
			
			AmfCompressUtil au=new AmfCompressUtil();
			return au.compressObject(findMethod.invoke(service, UserManager.getHotelGroupId(),UserManager.getHotelId(),modifyDatetime));
			
		}catch (NoSuchBeanDefinitionException e) {
			//忽略
		} catch (Exception e) {
			throw new RuntimeException(e);  
		}
		
		return new byte[0];
	}
	@Override
	public List<SalesGroup> findSalesGroup(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SalesMan> findSalesMan(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PhoneCallno> findPhoneCallno(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PhoneChargeCode> findPhoneChargeCode(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PhoneExtno> findPhoneExtno(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PhoneParams> findPhoneParams(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PhonePeriodDiscount> findPhonePeriodDiscount(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<PhoneServiceCode> findPhoneServiceCode(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<DoorcardDevice> findDoorcardDevice(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<CardLevel> findCardLevel(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<UserPosAuth> findUserPosAuth(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return  userPosAuthService.findUserPosAuth(UserManager.getHotelGroupId(), UserManager.getHotelId(), modifyDatetime);
	}
	@Override
	public List<UserPosAuthUserAuth> findUserPosAuthUserAuth(Date modifyDatetime) {
		// TODO Auto-generated method stub
		return userPosAuthUserAuthService.findUserPosAuthUserAuth(UserManager.getHotelGroupId(), UserManager.getHotelId(), modifyDatetime);
	}
}