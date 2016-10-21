package com.greencloud.facade.impl;

import java.util.ArrayList;
import java.util.List;

import com.greencloud.entity.PosIp;
import com.greencloud.entity.PosModeDef;
import com.greencloud.entity.PosSortAll;
import com.greencloud.facade.IPosCodeFacade;
import com.greencloud.service.IPosIpService;
import com.greencloud.service.IPosModeDefService;
import com.greencloud.service.IPosSortAllService;
import com.greencloud.service.IPosSubService;
import com.greencloud.util.UserManager;

public class PosCodeFacadeImpl implements IPosCodeFacade{
	
	private IPosSortAllService  posSortAllService;
	private IPosSubService posSubService;
	private IPosModeDefService posModeDefService;
	private IPosIpService posIpService;

	public void setPosModeDefService(IPosModeDefService posModeDefService) {
		this.posModeDefService = posModeDefService;
	}

	public void setPosSubService(IPosSubService posSubService) {
		this.posSubService = posSubService;
	}

	public void setPosSortAllService(IPosSortAllService posSortAllService) {
		this.posSortAllService = posSortAllService;
	}
	
	public void setPosIpService(IPosIpService posIpService) {
		this.posIpService = posIpService;
	}

	@Override
	public List<PosSortAll> getPosSortAll() {
		return posSortAllService.getPosSortAll(UserManager.getHotelGroupId(), UserManager.getHotelId());
	}

	@Override
	public void saveCode(Object object) {
		posSubService.saveCode(object);
	}

	@Override
	public void saveCodeGroup(Object object, String hotels) {
		posSubService.saveCodeGroup(object, hotels, UserManager.getHotelGroupId());
	}

	@Override
	public void deleteCode(Object object) {
		posSubService.deleteCode(object, UserManager.getHotelGroupId());
	}

	@Override
	public void updateCodeGroup(Object object) {
		posSubService.updateCodeGroup(object, UserManager.getHotelGroupId());
	}

	@Override
	public void updateCodeSta(Object object) {
		posSubService.updateCodeSta(object, UserManager.getHotelGroupId());
	}

	@Override
	public void updateCode(Object object) {
		// TODO Auto-generated method stub
		posSubService.updateCode(object);
	}

	@Override
	public void saveCodeCollection(ArrayList<Object> arr) {
		// TODO Auto-generated method stub
		posSubService.saveCodeCollection(arr);
	}

	@Override
	public void saveModeDeatil(PosModeDef posModeDef) {
		// TODO Auto-generated method stub
		posModeDefService.save(posModeDef);
		
	}
	
	@Override
	public void updatePosip(PosIp posIp){
		// TODO Auto-generated method stub
		posIpService.updatePosIp(posIp);
	}
	
	@Override
	public List<PosIp> getPosIpAll(PosIp posIp){
		posIp.setHotelGroupId(UserManager.getHotelGroupId());
		posIp.setHotelId(UserManager.getHotelId());		
		return posIpService.listPosIp(posIp);
	}
	
	@Override
	public List<PosIp> getPosIpByCode(String code){
//		PosIp posIp = new PosIp();
//		posIp.setHotelGroupId(UserManager.getHotelGroupId());
//		posIp.setHotelId(UserManager.getHotelId());	
//		posIp.setCode(code);
		return posIpService.getPosIpByCode(UserManager.getHotelGroupId(),UserManager.getHotelId(),code);
	}

	@Override
	public String checkDetailByCode(Object object,boolean isGroup) {
		return posSubService.checkDetailByCode(object,isGroup);
	}
	
	@Override
	public void updateNewHotelInit(long hotelGroupId,long hotelId,String type) {
		posIpService.updateNewHotelInit(hotelGroupId,hotelId,type);
	}

	@Override
	public void savePosIp(PosIp posIp) {
		posIpService.savePosIp(posIp);		
	}
}
