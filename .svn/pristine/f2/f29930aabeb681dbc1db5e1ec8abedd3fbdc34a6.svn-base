package com.greencloud.facade;

import java.io.Serializable;
import java.util.List;

import com.greencloud.dto.CateringDto;
import com.greencloud.dto.CateringSearchDto;

public interface IPosCateringFacadeService extends Serializable {

	@SuppressWarnings("rawtypes")
	List listCateringPlace(Long hotelGroupId, Long hotelId);

	
	@SuppressWarnings("rawtypes")
	List listItemsBySearchDto(Long hotelGroupId, Long hotelId,CateringSearchDto csdto);


	List<CateringDto> findCateringDtoByIds(Long hotelGroupId, Long hotelId,List<String> ids);

}
