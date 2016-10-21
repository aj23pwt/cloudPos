package com.greencloud.facade.impl;

import java.util.List;

import com.greencloud.dto.PosAuditBeginCheckDth;
import com.greencloud.facade.IPosToPosFacade;
import com.greencloud.service.IPosMasterService;

public class PosToPosFacadeImpl implements IPosToPosFacade {
	private IPosMasterService posMasterService;
	
	public void setPosMasterService(IPosMasterService posMasterService) {
		this.posMasterService = posMasterService;
	}
	
	@Override
	public List<PosAuditBeginCheckDth> getPosAuditBeginCheckRomate(long hotelGroupId, long hotelId, String bizDate) {
		return posMasterService.getPosAuditBeginCheckRomate(hotelGroupId, hotelId, bizDate);
	}
}
