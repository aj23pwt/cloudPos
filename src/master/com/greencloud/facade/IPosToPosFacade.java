package com.greencloud.facade;

import java.io.Serializable;
import java.util.List;

import com.greencloud.dto.PosAuditBeginCheckDth;

public interface IPosToPosFacade {
	public List<PosAuditBeginCheckDth> getPosAuditBeginCheckRomate(long hotelGroupId,long hotelId,String bizDate);

}