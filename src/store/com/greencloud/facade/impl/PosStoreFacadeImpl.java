package com.greencloud.facade.impl;

import java.util.ArrayList;
import java.util.List;

import com.greencloud.dto.MasterObj;
import com.greencloud.dto.PosStoreDto;
import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.entity.PosPccode;
import com.greencloud.entity.PosStoreBar;
import com.greencloud.entity.PosStoreArticle;
import com.greencloud.entity.PosStoreClass;
import com.greencloud.entity.PosStoreDetail;
import com.greencloud.entity.PosStoreMaster;
import com.greencloud.entity.PosStoreMasterWithBar;
import com.greencloud.entity.PosStorePluArticle;
import com.greencloud.entity.PosStoreSubclass;
import com.greencloud.entity.PosStoreUnit;
import com.greencloud.facade.IPosStoreFacade;
import com.greencloud.service.IPosPccodeService;
import com.greencloud.service.IPosStoreBarService;
import com.greencloud.service.IPosStoreArticleService;
import com.greencloud.service.IPosStoreClassService;
import com.greencloud.service.IPosStoreDetailService;
import com.greencloud.service.IPosStoreMasterService;
import com.greencloud.service.IPosStorePluArticleService;
import com.greencloud.service.IPosStoreSubclassService;
import com.greencloud.service.IPosStoreUnitService;
import com.greencloud.util.UserManager;

public class PosStoreFacadeImpl implements IPosStoreFacade {
	private IPosStoreArticleService posStoreArticleService;
	private IPosStoreClassService posStoreClassService;
	private IPosStoreSubclassService posStoreSubclassService;
	private IPosStoreBarService posStoreBarService;
	private IPosStoreMasterService posStoreMasterService;
	private IPosStoreDetailService posStoreDetailService;
	private IPosPccodeService posPccodeService;
	private IPosStoreUnitService posStoreUnitService;
	private IPosStorePluArticleService posStorePluArticleService;

	public void setPosStorePluArticleService(
			IPosStorePluArticleService posStorePluArticleService) {
		this.posStorePluArticleService = posStorePluArticleService;
	}

	public void setPosStoreUnitService(IPosStoreUnitService posStoreUnitService) {
		this.posStoreUnitService = posStoreUnitService;
	}

	public void setPosPccodeService(IPosPccodeService posPccodeService) {
		this.posPccodeService = posPccodeService;
	}

	public void setPosStoreArticleService(
			IPosStoreArticleService posStoreArticleService) {
		this.posStoreArticleService = posStoreArticleService;
	}

	public void setPosStoreClassService(
			IPosStoreClassService posStoreClassService) {
		this.posStoreClassService = posStoreClassService;
	}

	public void setPosStoreSubclassService(
			IPosStoreSubclassService posStoreSubclassService) {
		this.posStoreSubclassService = posStoreSubclassService;
	}

	public void setPosStoreBarService(IPosStoreBarService posStoreBarService) {
		this.posStoreBarService = posStoreBarService;
	}

	public void setPosStoreMasterService(
			IPosStoreMasterService posStoreMasterService) {
		this.posStoreMasterService = posStoreMasterService;
	}

	public void setPosStoreDetailService(
			IPosStoreDetailService posStoreDetailService) {
		this.posStoreDetailService = posStoreDetailService;
	}

	@Override
	public List<PosStoreDto> getStoreTree() {
		return posStoreArticleService.getStoreTree(
				UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public List<PosStoreClass> getPosStoreClassById() {
		return posStoreClassService.getPosStoreClassById(
				UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public List<PosStoreSubclass> getPosStoreSubClassBycode(String scode) {
		return posStoreSubclassService.getPosStoreSubClassBycode(
				UserManager.getHotelGroupId(), UserManager.getHotelId(), scode);
	}

	@Override
	public List<PosStoreArticle> getPosStoreArticleBycode(String acode) {
		return posStoreArticleService.getPosStoreArticleBycode(
				UserManager.getHotelGroupId(), UserManager.getHotelId(), acode);
	}

	@Override
	public void updatePosClassByDto(PosStoreEditDto posStoreEditDto) {
		posStoreClassService.updatePosClassByDto(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posStoreEditDto);
	}

	@Override
	public void updatePosSubClassByDto(PosStoreEditDto posStoreEditDto) {
		posStoreSubclassService.updatePosSubClassByDto(
				UserManager.getHotelGroupId(), UserManager.getHotelId(),
				posStoreEditDto);
	}

	@Override
	public void updatePosArticleByDto(PosStoreEditDto posStoreEditDto) {
		posStoreArticleService.updatePosArticleByDto(
				UserManager.getHotelGroupId(), UserManager.getHotelId(),
				posStoreEditDto);
	}

	@Override
	public void saveGroupPosClass(PosStoreClass posStoreClass, String hotels) {
		posStoreClassService.saveGroupPosClass(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), posStoreClass, hotels);
	}

	@Override
	public void saveGroupPosSubClass(PosStoreSubclass posStoreSubclass,
			String hotels) {
		posStoreSubclassService.saveGroupPosSubClass(
				UserManager.getHotelGroupId(), UserManager.getHotelId(),
				posStoreSubclass, hotels);
	}

	@Override
	public void saveGroupPosArticle(PosStoreArticle posStoreArticle,
			String hotels) {
		posStoreArticleService.saveGroupPosArticle(
				UserManager.getHotelGroupId(), UserManager.getHotelId(),
				posStoreArticle);
	}

	@Override
	public void deleteGroupPosClass(long id) {
		posStoreClassService.deleteGroupPosClass(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), id);
	}

	@Override
	public void deleteGroupPosSubClass(PosStoreSubclass posStoreSubclass) {
		posStoreSubclassService.deleteGroupPosSubClass(
				UserManager.getHotelGroupId(), UserManager.getHotelId(),
				posStoreSubclass);
	}

	@Override
	public void deleteGroupPosArticle(PosStoreArticle posStoreArticle) {
		posStoreArticleService.deleteGroupPosArticle(
				UserManager.getHotelGroupId(), UserManager.getHotelId(),
				posStoreArticle);
	}

	@Override
	public List<PosStoreSubclass> checkDataSubClass(String scode) {
		return posStoreSubclassService.checkDataSubClass(
				UserManager.getHotelGroupId(), UserManager.getHotelId(), scode);
	}

	@Override
	public List<PosStoreArticle> checkDataArticle(String scode) {
		return posStoreArticleService.checkDataArticle(
				UserManager.getHotelGroupId(), UserManager.getHotelId(), scode);
	}

	@Override
	public String posStoreMaxCode(String type, String pCode) {
		return posStoreArticleService.posStoreMaxCode(
				UserManager.getHotelGroupId(), UserManager.getHotelId(), type,
				pCode);
	}

	@Override
	public void getArticleMess(String acode, String code) {
		posStoreArticleService.getArticleMess(UserManager.getHotelGroupId(),
				UserManager.getHotelId(), acode, code);

	}

	@Override
	public PosStoreClass findPosStoreClassById(Long id) {
		PosStoreClass posStoreClass = new PosStoreClass();
		posStoreClass.setId(id);
		posStoreClass.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreClass.setHotelId(UserManager.getHotelId());
		List<PosStoreClass> list = posStoreClassService
				.listPosStoreClass(posStoreClass);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public PosStoreSubclass findPosStoreSubClassById(Long id) {
		PosStoreSubclass posStoreSubclass = new PosStoreSubclass();
		posStoreSubclass.setId(id);
		posStoreSubclass.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreSubclass.setHotelId(UserManager.getHotelId());
		List<PosStoreSubclass> list = posStoreSubclassService
				.listPosStoreSubclass(posStoreSubclass);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public PosStoreArticle findPosStoreArticleById(Long id) {
		PosStoreArticle posStoreArticle = new PosStoreArticle();
		posStoreArticle.setId(id);
		posStoreArticle.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreArticle.setHotelId(UserManager.getHotelId());
		List<PosStoreArticle> list = posStoreArticleService
				.listPosStoreArticle(posStoreArticle);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<PosStoreBar> listPosStoreBar() {
		// TODO Auto-generated method stub
		PosStoreBar posStoreBar = new PosStoreBar();
		posStoreBar.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreBar.setHotelId(UserManager.getHotelId());
		return posStoreBarService.listPosStoreBar(posStoreBar);
	}

	@Override
	public void updatePosStoreBar(PosStoreBar posStoreBar) {
		// TODO Auto-generated method stub
		posStoreBarService.updatePosStoreBar(posStoreBar);
	}

	@Override
	public void savePosStoreBar(PosStoreBar posStoreBar) {
		// TODO Auto-generated method stub
		posStoreBarService.savePosStoreBar(posStoreBar);
	}

	@Override
	public void deletePosStoreBar(PosStoreBar posStoreBar) {
		// TODO Auto-generated method stub
		posStoreBarService.delete(posStoreBar);
	}

	@Override
	public void savePosStoreMasterAndDetails(PosStoreMaster posStoreMaster,
			ArrayList<Object> posStoreDetailList) {
		posStoreMasterService.savePosStoreMasterAndDetails(posStoreMaster,
				posStoreDetailList, UserManager.getHotelGroupId(),
				UserManager.getHotelId());

	}

	@Override
	public void updatePosStoreMasterAndDetails(PosStoreMaster posStoreMaster,
			ArrayList<Object> posStoreDetailList) {
		posStoreMasterService.updatePosStoreMasterAndDetails(posStoreMaster, posStoreDetailList);

	}

	@Override
	public void deletePosStoreMasterAndDetails(PosStoreMaster posStoreMaster,
			ArrayList<Object> posStoreDetailList) {
		posStoreMasterService.deletePosStoreMasterAndDetails(posStoreMaster, posStoreDetailList);

	}

	@Override
	public List<PosStoreArticle> listPosStoreArticle() {
		// TODO Auto-generated method stub
		PosStoreArticle posStoreArticle = new PosStoreArticle();
		posStoreArticle.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreArticle.setHotelId(UserManager.getHotelId());
		return posStoreArticleService.listPosStoreArticle(posStoreArticle);
	}

	@Override
	public List<PosStoreMaster> listPosStoreMaster() {
		PosStoreMaster posStoreMaster = new PosStoreMaster();
		posStoreMaster.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreMaster.setHotelId(UserManager.getHotelId());
		// TODO Auto-generated method stub
		return posStoreMasterService.listPosStoreMaster(posStoreMaster);
	}

	@Override
	public PosStoreMaster findPosStoreMasterByAccnt(String accnt) {
		PosStoreMaster posStoreMaster = new PosStoreMaster();
		posStoreMaster.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreMaster.setHotelId(UserManager.getHotelId());
		posStoreMaster.setAccnt(accnt);
		List<PosStoreMaster> list =  posStoreMasterService.listPosStoreMaster(posStoreMaster);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<PosStoreDetail> listPosStoreDetailByAccnt(String accnt) {
		PosStoreDetail posStoreDetail = new PosStoreDetail();
		posStoreDetail.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreDetail.setHotelId(UserManager.getHotelId());
		posStoreDetail.setAccnt(accnt);
		return posStoreDetailService.listPosStoreDetail(posStoreDetail);
	}

	@Override
	public List<PosPccode> listPosStorePccode() {
		PosPccode pccode = new PosPccode();
		pccode.setHotelGroupId(UserManager.getHotelGroupId());
		pccode.setHotelId(UserManager.getHotelId());
		return posPccodeService.listPosPccode(pccode);
	}

	@Override
	public List<PosStoreMasterWithBar> listPosStoreMasterWithBar() {
		List<PosStoreBar> barList = listPosStoreBar();
		List<PosStoreMaster> masterList = listPosStoreMaster();
		List<PosStoreMasterWithBar> resultList = new ArrayList<PosStoreMasterWithBar>();
		if(masterList != null && masterList.size() > 0){
			for(PosStoreMaster masterItem : masterList){
				PosStoreMasterWithBar masterWithBar = new PosStoreMasterWithBar();
				masterWithBar.setAccnt(masterItem.getAccnt());
				masterWithBar.setCreateDatetime(masterItem.getCreateDatetime());
				masterWithBar.setCreateUser(masterItem.getCreateUser());
				masterWithBar.setDate(masterItem.getDate());
				masterWithBar.setHotelGroupId(masterItem.getHotelGroupId());
				masterWithBar.setHotelId(masterItem.getHotelId());
				masterWithBar.setId(masterItem.getId());
				masterWithBar.setInvoice(masterItem.getInvoice());
				masterWithBar.setModifyDatetime(masterItem.getModifyDatetime());
				masterWithBar.setModifyUser(masterItem.getModifyUser());
				masterWithBar.setRemark(masterItem.getRemark());
				masterWithBar.setType(masterItem.getType());
				masterWithBar.setUserCode(masterItem.getUserCode());
				masterWithBar.setSourceCode(masterItem.getSourceCode());
				masterWithBar.setTargetCode(masterItem.getTargetCode());
				if(barList != null && barList.size() > 0){
					
					for(PosStoreBar barItem : barList){
						if(barItem.getCode().equals(masterItem.getSourceCode())){
							masterWithBar.setSourceBar(barItem.getDescript());
						}
						if(!"02".equals(masterItem.getType()) && barItem.getCode().equals(masterItem.getTargetCode())){
							masterWithBar.setTarget(barItem.getDescript());
						}
					}
				}
				resultList.add(masterWithBar);
			}
		}
		return resultList;
	}

	@Override
	public List<Object> listPosSotreInventory() {
		return posStoreBarService.updateAndGetPosStoreInventory(UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public List<PosStoreUnit> listPosStoreUnit() {
		PosStoreUnit posStoreUnit = new PosStoreUnit();
		posStoreUnit.setHotelGroupId(UserManager.getHotelGroupId());
		posStoreUnit.setHotelId(UserManager.getHotelId());
		return posStoreUnitService.listPosStoreUnit(posStoreUnit);
	}

	@Override
	public void updatePosStoreUnit(PosStoreUnit posStoreUnit) {
		posStoreUnitService.updatePosStoreUnit(posStoreUnit);
		
	}

	@Override
	public void savePosStoreUnit(PosStoreUnit posStoreUnit) {
		// TODO Auto-generated method stub
		posStoreUnitService.savePosStoreUnit(posStoreUnit);
	}

	@Override
	public void deletePosStoreUnit(PosStoreUnit posStoreUnit) {
		// TODO Auto-generated method stub
		posStoreUnitService.delete(posStoreUnit);
	}

	@Override
	public void saveOrUpdatePluArticle(PosStorePluArticle posStorePluArticle) {
		// TODO Auto-generated method stub
		posStorePluArticleService.saveOrUpdatePosStorePluArticle(posStorePluArticle);
	}

	@Override
	public void deletePluArticle(PosStorePluArticle posStorePluArticle) {
		// TODO Auto-generated method stub
		posStorePluArticleService.deletePluArticle(posStorePluArticle);
	}

}
