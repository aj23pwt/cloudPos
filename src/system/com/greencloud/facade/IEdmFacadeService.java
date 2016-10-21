package com.greencloud.facade;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.greencloud.dto.EdmSendDto;

public interface IEdmFacadeService extends Serializable {
	
	public EdmSendDto builderByTemplet(Long hotelGroupId, Long hotelId,String templetCode, boolean isAuto, Map<String, Object> objectMap);
	public void postSmsBatchDto(@SuppressWarnings("rawtypes") List<Map> maps, String templetCode);
}
