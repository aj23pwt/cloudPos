package com.greencloud.facade.impl;

import com.greencloud.facade.IAuditProcessFacadeService;
import com.greencloud.service.IAuditProcessService;

public class AuditProcessFacadeServiceImpl implements
		IAuditProcessFacadeService {

	private IAuditProcessService auditProcessService;
	
	public void setAuditProcessService(IAuditProcessService auditProcessService) {
		this.auditProcessService = auditProcessService;
	}

	@Override
	public int countDoneAuditProcess(Long hotelGroupId, Long hotelId) {
		return auditProcessService.countDoneAuditProcess(hotelGroupId, hotelId);
	}

	@Override
	public int countDoneAuditProcess1(Long hotelGroupId, Long hotelId) {
		return auditProcessService.countDoneAuditProcess1(hotelGroupId, hotelId);
	}

}