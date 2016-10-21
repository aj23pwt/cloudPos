package com.greencloud.facade;

import java.util.ArrayList;
import java.util.List;

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

public interface IPosStoreFacade {
	List<PosStoreDto> getStoreTree();
//	public List<PosPriceDto> getPriceTree();
	
//	public List<PosPrice> getPosPriceByPluId(long id);
	public List<PosStoreClass> getPosStoreClassById();
	public List<PosStoreSubclass> getPosStoreSubClassBycode(String scode);
	public List<PosStoreArticle> getPosStoreArticleBycode(String acode);
	public PosStoreClass findPosStoreClassById(Long id);
	public PosStoreSubclass findPosStoreSubClassById(Long id);
	public PosStoreArticle findPosStoreArticleById(Long id);
	public List<PosStoreBar> listPosStoreBar();
	public List<PosStoreArticle> listPosStoreArticle();
	public List<PosStoreMaster> listPosStoreMaster();
	public List<PosStoreMasterWithBar> listPosStoreMasterWithBar();
	public List<PosPccode> listPosStorePccode();
	public List<PosStoreUnit> listPosStoreUnit();
	/**
	 * 修改菜价
	 * @param posPrcieEditDto
	 */
//	public void updatePosPriceByDto(PosPrcieEditDto posPrcieEditDto);
	public void updatePosClassByDto(PosStoreEditDto posStoreEditDto);
	public void updatePosSubClassByDto(PosStoreEditDto posStoreEditDto);
	public void updatePosArticleByDto(PosStoreEditDto posStoreEditDto);
	public void updatePosStoreBar(PosStoreBar posStoreBar);
	public void updatePosStoreUnit(PosStoreUnit posStoreUnit);
	
//	public void saveGroupPosPrice(PosPrice posPrice, String hotels);
	public void saveGroupPosClass(PosStoreClass posStoreClass,String hotels);
	public void saveGroupPosSubClass(PosStoreSubclass posStoreSubclass,String hotels);
	public void saveGroupPosArticle(PosStoreArticle posStoreArticle,String hotels);
	public void savePosStoreBar(PosStoreBar posStoreBar);
	public void savePosStoreUnit(PosStoreUnit posStoreUnit);
	public void saveOrUpdatePluArticle(PosStorePluArticle posStorePluArticle);
	
//	public void deleteGroupPosPrice(PosPrice posPrice);
	public void deleteGroupPosClass(long id);
	public void deleteGroupPosSubClass(PosStoreSubclass posStoreSubclass);
	public void deleteGroupPosArticle(PosStoreArticle posStoreArticle);
	public void deletePosStoreBar(PosStoreBar posStoreBar);
	public void deletePosStoreUnit(PosStoreUnit posStoreUnit);
	
	public List<PosStoreSubclass> checkDataSubClass(String scode);
	public List<PosStoreArticle> checkDataArticle(String scode);
	
	public String posStoreMaxCode(String type,String pCode);
	public void getArticleMess(String acode,String code);
	public List<Object> listPosSotreInventory(); 
	
	public void savePosStoreMasterAndDetails(PosStoreMaster posStoreMaster, ArrayList<Object> posStoreDetailList);
	public void updatePosStoreMasterAndDetails(PosStoreMaster posStoreMaster, ArrayList<Object> posStoreDetailList);
	public void deletePosStoreMasterAndDetails(PosStoreMaster posStoreMaster, ArrayList<Object> posStoreDetailList);
	public PosStoreMaster findPosStoreMasterByAccnt(String accnt);
	public List<PosStoreDetail> listPosStoreDetailByAccnt(String accnt);
	
	public void deletePluArticle(PosStorePluArticle posStorePluArticle);
}