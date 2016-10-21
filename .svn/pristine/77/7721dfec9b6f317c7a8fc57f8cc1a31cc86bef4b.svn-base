package com.greencloud.service;

import java.util.List;

import com.aua.service.IBaseService;
import com.greencloud.dto.CateringDto;
import com.greencloud.dto.CateringSearchDto;
import com.greencloud.entity.CateringPlace;

public interface IPosCateringService  extends IBaseService {

	List listItemsBySearchDto(Long hotelGroupId, Long hotelId,CateringSearchDto csdto);
	List<CateringDto> listCateringDtoByIds(Long hotelGroupId, Long hotelId,List<String> ids);
	List<CateringPlace> listCateringPlace(Long hotelGroupId, Long hotelId,String... places);
}
