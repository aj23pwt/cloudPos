package com.greencloud.facade.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.aua.util.DateHelper;
import com.greencloud.dao.IPosPccodeNoteDao;
import com.greencloud.dto.OrderPageDto;
import com.greencloud.dto.PosPluDto;
import com.greencloud.dto.PosTableDto;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.PosAccess;
import com.greencloud.entity.PosPccode;
import com.greencloud.entity.PosPccodeNote;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosSortAll;
import com.greencloud.entity.PosStation;
import com.greencloud.entity.SysOption;
import com.greencloud.entity.WorkStation;
import com.greencloud.facade.IPosTableFacade;
import com.greencloud.service.ICodeBaseService;
import com.greencloud.service.IPosAccessService;
import com.greencloud.service.IPosPccodeNoteService;
import com.greencloud.service.IPosPccodeService;
import com.greencloud.service.IPosPluAllService;
import com.greencloud.service.IPosSortAllService;
import com.greencloud.service.IPosStationService;
import com.greencloud.service.ISysOptionService;
import com.greencloud.service.IWorkStationService;
import com.greencloud.util.UserManager;

public class PosTableFacadeImpl implements IPosTableFacade {
	private IPosStationService posStationService;
	private IPosPccodeService posPccodeService;
	private ICodeBaseService codeBaseService;
	private IPosSortAllService posSortAllService;
	private IPosPluAllService posPluAllService ;
	private IPosPccodeNoteService posPccodeNoteService;
	private IPosAccessService posAccessService;
	private IWorkStationService workStationService;
	private ISysOptionService sysOptionService;
	
	
	public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}

	public IWorkStationService getWorkStationService() {
		return workStationService;
	}

	public void setWorkStationService(IWorkStationService workStationService) {
		this.workStationService = workStationService;
	}

	public void setPosAccessService(IPosAccessService posAccessService) {
		this.posAccessService = posAccessService;
	}

	public void setPosPccodeNoteService(IPosPccodeNoteService posPccodeNoteService) {
		this.posPccodeNoteService = posPccodeNoteService;
	}

	public void setPosPluAllService(IPosPluAllService posPluAllService) {
		this.posPluAllService = posPluAllService;
	}

	public void setPosSortAllService(IPosSortAllService posSortAllService) {
		this.posSortAllService = posSortAllService;
	}

	public void setCodeBaseService(ICodeBaseService codeBaseService) {
		this.codeBaseService = codeBaseService;
	}

	public void setPosPccodeService(IPosPccodeService posPccodeService) {
		this.posPccodeService = posPccodeService;
	}

	public void setPosStationService(IPosStationService posStationService) {
		this.posStationService = posStationService;
	}

	@Override
	public List<PosTableDto> getPosTable() {
		return posStationService.getPosTable();
	}

	@Override
	public List<PosPccode> getPosPccode() {
		List<PosPccode> blist =new ArrayList<PosPccode>();
		
		PosStation posStation = new PosStation();
		posStation.setHotelGroupId(UserManager.getHotelGroupId());
		posStation.setHotelId(UserManager.getHotelId());
		posStation.setCode(UserManager.getWorkStationCode());
		List<PosStation> list = posStationService.listPosStation(posStation);
		if(list!=null && list.size()>0){
			PosStation posStationGet =  list.get(0);
			if(posStationGet.getPccodes() != null && !posStationGet.getPccodes().equals("")){
				String pccodes=posStationGet.getPccodes();
				String [] pcs=pccodes.split(",");
				if(pcs != null && pcs.length>0){
					for(int i=0;i<pcs.length;i++){
						String code=pcs[i];
						PosPccode posPccode=this.getPosPccodeByCode(code);
						blist.add(posPccode);
					}
				}
			}
		}
		
		return blist;
	}
	private PosPccode getPosPccodeByCode(String code){
		 PosPccode  posPccode=new PosPccode();
		 posPccode.setHotelGroupId(UserManager.getHotelGroupId());
		 posPccode.setHotelId(UserManager.getHotelId());
		 posPccode.setIsHalt("F");
		 posPccode.setCode(code);
		List<PosPccode> list=posPccodeService.listPosPccode(posPccode);
		if(list!=null && list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public List<CodeBase> getTableType() {
		CodeBase codeBase = new CodeBase();
		codeBase.setHotelGroupId(UserManager.getHotelGroupId());
		codeBase.setHotelId(UserManager.getHotelId());
		codeBase.setParentCode("pos_table_type");
		codeBase.setIsHalt("F");
		return codeBaseService.listCodeBase(codeBase);
	}
	
	@Override
	public List<CodeBase> getCashierData() {
		CodeBase codeBase = new CodeBase();
		codeBase.setHotelGroupId(UserManager.getHotelGroupId());
		codeBase.setHotelId(UserManager.getHotelId());
		codeBase.setParentCode("pos_cashier");
		codeBase.setIsHalt("F");
		return codeBaseService.listCodeBase(codeBase);
	}

	@Override
	public OrderPageDto getPosSortAll(String pcCode) {
		
		OrderPageDto orderPageDto = new OrderPageDto();
		
		String noteCode="";
		PosPccodeNote posPccodeNote = new PosPccodeNote();
		posPccodeNote.setHotelGroupId(UserManager.getHotelGroupId());
		posPccodeNote.setHotelId(UserManager.getHotelId());
		posPccodeNote.setPccode(pcCode);
		posPccodeNote.setIsHalt("F");
		List<PosPccodeNote> clist =posPccodeNoteService.listPosPccodeNote(posPccodeNote);
		if(clist != null && clist.size()>0){
			noteCode = noteCode+"(";
			for(Iterator<PosPccodeNote> j = clist.iterator();j.hasNext();){
				PosPccodeNote posPccodeNoteGet = j.next();
				if(j.hasNext()){
					noteCode = noteCode+"'"+posPccodeNoteGet.getNoteCode()+"',";
				}else{
					noteCode = noteCode+"'"+posPccodeNoteGet.getNoteCode()+"'";
				}
			}
			noteCode = noteCode+")";
		}
		
		
		List<PosSortAll> list = posSortAllService.listPosSortAllByPcode(UserManager.getHotelGroupId(), UserManager.getHotelId(), noteCode);
		orderPageDto.setList1(list);
		
		List<PosPluAll> list2 = new ArrayList<PosPluAll>();
		
		String sortCode="";
		if(list != null && list.size()>0){
			sortCode = sortCode+"(";
			for(Iterator<PosSortAll>k = list.iterator();k.hasNext();){
				PosSortAll PosSortAllGet = k.next();
				if(k.hasNext()){
					sortCode = sortCode+"'"+PosSortAllGet.getCode()+"',";
				}else{
					sortCode = sortCode+"'"+PosSortAllGet.getCode()+"'";
				}
			}
			sortCode = sortCode+")";
			
			list2 = posPluAllService.listPosPluAllBySort(UserManager.getHotelGroupId(), UserManager.getHotelId(), sortCode);
		}
		orderPageDto.setList2(list2);
		
		PosAccess posAccess = new PosAccess();
		posAccess.setHotelGroupId(UserManager.getHotelGroupId());
		posAccess.setHotelId(UserManager.getHotelId());
		posAccess.setBizDate(UserManager.getBizDate());
		List<PosAccess> list3 = posAccessService.listPosAccessForOrder(posAccess);
		orderPageDto.setList3(list3);
		return orderPageDto;
	}

	@Override
	public PosPluDto getPosPluAllBySort(String sort) {
//		PosPluAll posPluAll = new PosPluAll();
//		posPluAll.setHotelGroupId(UserManager.getHotelGroupId());
//		posPluAll.setHotelId(UserManager.getHotelId());
//		if(sort != null && !sort.equals("")){
//			posPluAll.setSortCode(sort);
//		}
//		posPluAll.setIsHalt("F");
		PosPluDto posPluDto = new PosPluDto();
		
		if(sort != null && !sort.equals("") && sort.indexOf("(")==-1){
			sort = "('"+sort+"')";
		}
		
		List<PosPluAll> list1 = posPluAllService.listPosPluAllBySort(UserManager.getHotelGroupId(), UserManager.getHotelId(),  sort);
		
		PosAccess posAccess = new PosAccess();
		posAccess.setHotelGroupId(UserManager.getHotelGroupId());
		posAccess.setHotelId(UserManager.getHotelId());
		posAccess.setBizDate(UserManager.getBizDate());
		List<PosAccess> list2 = posAccessService.listPosAccessForOrder(posAccess);
		
		posPluDto.setList1(list1);
		posPluDto.setList2(list2);
		return posPluDto;
	}

	@Override
	public Date setCashier(String cashier) {
		if(cashier != null && !cashier.equals("")){
			UserManager.setCashier(Long.parseLong(cashier));
		}
		
		return UserManager.getBizDate();
	}

	@Override
	public List<WorkStation> getWorkStation() {
		 WorkStation workStation = new WorkStation();
		 workStation.setHotelGroupId(UserManager.getHotelGroupId());
		 workStation.setHotelId(UserManager.getHotelId());
		 workStation.setIsHalt("F");
		return workStationService.listWorkStation(workStation);
	}

	@Override
	public List<PosPccode> getPosPccodeAll() {
		 PosPccode  posPccode=new PosPccode();
		 posPccode.setHotelGroupId(UserManager.getHotelGroupId());
		 posPccode.setHotelId(UserManager.getHotelId());
		 posPccode.setIsHalt("F");
		return posPccodeService.listPosPccode(posPccode);
	}

}
