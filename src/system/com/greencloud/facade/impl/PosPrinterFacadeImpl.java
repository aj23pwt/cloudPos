package com.greencloud.facade.impl;

import java.util.List;

import com.greencloud.entity.PosDishcard;
import com.greencloud.entity.PosPrinter;
import com.greencloud.entity.PosPrnscope;
import com.greencloud.entity.PosPserver;
import com.greencloud.entity.PosStation;
import com.greencloud.facade.IPosPrinterFacade;
import com.greencloud.service.IPosDishcardService;
import com.greencloud.service.IPosPrinterService;
import com.greencloud.service.IPosPrnscopeService;
import com.greencloud.service.IPosStationService;
import com.greencloud.util.UserManager;

public class PosPrinterFacadeImpl implements IPosPrinterFacade {

	private IPosPrinterService posPrinterService;
	private IPosPrnscopeService posPrnscopeService;
	private IPosStationService posStationService;
	private IPosDishcardService posDishcardService;
	
	public void setPosDishcardService(IPosDishcardService posDishcardService) {
		this.posDishcardService = posDishcardService;
	}

	public void setPosStationService(IPosStationService posStationService) {
		this.posStationService = posStationService;
	}

	public void setPosPrnscopeService(IPosPrnscopeService posPrnscopeService) {
		this.posPrnscopeService = posPrnscopeService;
	}

	public void setPosPrinterService(IPosPrinterService posPrinterService) {
		this.posPrinterService = posPrinterService;
	}

	@Override
	public List<PosPrinter> getPrinterList(PosPrinter posPrinter) {
		// TODO Auto-generated method stub
		posPrinter.setHotelGroupId(UserManager.getHotelGroupId());
		posPrinter.setHotelId(UserManager.getHotelId());
		return posPrinterService.listPosPrinter(posPrinter);
	}

	@Override
	public void savePrinter(PosPrinter posPrinter) {
		posPrinter.setHotelGroupId(UserManager.getHotelGroupId());
		posPrinter.setHotelId(UserManager.getHotelId());
		posPrinterService.savePosPrinter(posPrinter);
	}

	@Override
	public void updatePrinter(PosPrinter posPrinter) {
		// TODO Auto-generated method stub
		posPrinterService.updatePosPrinter(posPrinter);
	}

	@Override
	public void deletePrinter(PosPrinter posPrinter) {
		// TODO Auto-generated method stub
		posPrinterService.delete(posPrinter);;
	}

	@Override
	public void saveSortPrnscope(PosPrnscope posPrnscope,String saveType) {
		posPrnscope.setHotelGroupId(UserManager.getHotelGroupId());
		posPrnscope.setHotelId(UserManager.getHotelId());
		PosPrnscope checkPosPrnscope = new PosPrnscope();
		checkPosPrnscope.setHotelGroupId(posPrnscope.getHotelGroupId());
		checkPosPrnscope.setHotelId(posPrnscope.getHotelId());
		checkPosPrnscope.setPccode(posPrnscope.getPccode());
		//修改菜类
		if(saveType.equalsIgnoreCase("sort")){
		   checkPosPrnscope.setPlusort(posPrnscope.getPlusort());
		   checkPosPrnscope.setPlucode(posPrnscope.getPlucode());
		   //checkPosPrnscope 不包含打印机信息 
		   if(posPrnscopeService.listPosPrnscope(checkPosPrnscope).size()>0){
			   checkPosPrnscope = posPrnscopeService.listPosPrnscope(checkPosPrnscope).get(0);
			   checkPosPrnscope.setPrinters(posPrnscope.getPrinters());
			   posPrnscopeService.saveOrUpdatePosPrnscope(checkPosPrnscope);
			}
			else{
			    posPrnscopeService.savePosPrnscope(posPrnscope);
			}
		}else if(saveType.equalsIgnoreCase("plu")){
			checkPosPrnscope.setPlusort(posPrnscope.getPlusort());
			checkPosPrnscope.setPlucode(posPrnscope.getPlucode());
			 //checkPosPrnscope 不包含打印机信息 
			if(posPrnscopeService.listPosPrnscope(checkPosPrnscope).size()>0 && posPrnscope.getPrinters() != null && !"".equalsIgnoreCase(posPrnscope.getPrinters())){
				   checkPosPrnscope = posPrnscopeService.listPosPrnscope(checkPosPrnscope).get(0);
				   checkPosPrnscope.setPrinters(posPrnscope.getPrinters());
				   posPrnscopeService.saveOrUpdatePosPrnscope(checkPosPrnscope);
			}else if(posPrnscopeService.listPosPrnscope(checkPosPrnscope).size()>0 && (posPrnscope.getPrinters() == null || "".equalsIgnoreCase(posPrnscope.getPrinters()))){
				   checkPosPrnscope = posPrnscopeService.listPosPrnscope(checkPosPrnscope).get(0);
				   posPrnscopeService.delete(checkPosPrnscope);
			}else{
				    posPrnscopeService.savePosPrnscope(posPrnscope);
			}
		}
	}

	@Override
	public void updateStation(PosStation station) {
		// TODO Auto-generated method stub
		posStationService.updatePosStation(station);
	}

	@Override
	public List<PosStation> getStationList(PosStation station) {
		station.setHotelGroupId(UserManager.getHotelGroupId());
		station.setHotelId(UserManager.getHotelId());
		return posStationService.listPosStation(station);
	}

	@Override
	public PosPrnscope findPosPrnscope(PosPrnscope posPrnscope) {
		// TODO Auto-generated method stub
		posPrnscope.setHotelGroupId(UserManager.getHotelGroupId());
		posPrnscope.setHotelId(UserManager.getHotelId());
		if(posPrnscopeService.listPosPrnscope(posPrnscope).size()>0){
			return posPrnscopeService.listPosPrnscope(posPrnscope).get(0);
		}else 
			return null;
		
	}

	@Override
	public List<PosDishcard> getPosDishcardList(PosDishcard posDishcard) {
		posDishcard.setHotelGroupId(UserManager.getHotelGroupId());
		posDishcard.setHotelId(UserManager.getHotelId());
		return posDishcardService.listPosDishcard(posDishcard);
	}

	@Override
	public List<PosDishcard> getPosDishcardListBysql(String sql) {
		// TODO Auto-generated method stub
		return posDishcardService.getPosDishcardListBysql(sql);
	}
	
	@Override
	public void savaPosPserver(PosPserver posPserver)
	{
		posPrinterService.savePosPserver(posPserver);
	}
	@Override
	public void updatePosPserver(PosPserver posPserver)
	{
		posPrinterService.updatePosPserver(posPserver);
	}
	@Override
	public void saveOrUpdatePosPserver(PosPserver posPserver)
	{
		posPrinterService.saveOrUpdatePosPserver(posPserver);
	}
	@Override
	public List<PosPserver> getPosPserver(PosPserver posPserver)
	{
		posPserver.setHotelGroupId(UserManager.getHotelGroupId());
		posPserver.setHotelId(UserManager.getHotelId());
		return posPrinterService.listPosPserver(posPserver);
	}
	@Override
	public void deletePosPserver(PosPserver posPserver)
	{
		posPrinterService.delete(posPserver);
	}
}