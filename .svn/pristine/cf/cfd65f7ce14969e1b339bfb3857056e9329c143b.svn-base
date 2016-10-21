package com.greencloud.facade.impl;

import java.util.List;

import com.greencloud.dto.CateringDto;
import com.greencloud.dto.CateringSearchDto;
import com.greencloud.facade.IPosCateringFacadeService;
import com.greencloud.service.IPosCateringService;

/**
 * 
 * @author pwt
 * @email pwt@ipms.cn
 *
 */
public class PosCateringFacadeServiceImpl extends AbstractFacadeServiceImpl implements IPosCateringFacadeService {

	/**
	 * 
	 */
	private static final long serialVersionUID = -712269817042048152L;

	private IPosCateringService posCateringService;
	
	public void setPosCateringService(IPosCateringService posCateringService) {
		this.posCateringService = posCateringService;
	}

	/**
	 *
	 */
	@Override
	@SuppressWarnings("rawtypes")
	public List listCateringPlace(Long hotelGroupId,Long hotelId){
		hotelGroupId = checkHotelGroupId(hotelGroupId);
		hotelId = checkHotelId(hotelId);
		return posCateringService.listCateringPlace(hotelGroupId, hotelId);
	}
	
	@Override
	public List<CateringDto> findCateringDtoByIds(Long hotelGroupId,Long hotelId,List<String> ids){
		hotelGroupId = checkHotelGroupId(hotelGroupId);
		hotelId = checkHotelId(hotelId);
		
		return posCateringService.listCateringDtoByIds(hotelGroupId,hotelId,ids);
	}
	

	@SuppressWarnings("rawtypes")
	@Override
	public List listItemsBySearchDto(Long hotelGroupId, Long hotelId,CateringSearchDto csdto) {
		hotelGroupId = checkHotelGroupId(hotelGroupId);
		hotelId = checkHotelId(hotelId);
		return posCateringService.listItemsBySearchDto(hotelGroupId, hotelId,csdto);
	}

	
}
