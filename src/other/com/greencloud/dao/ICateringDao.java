package com.greencloud.dao;

import java.util.List;
import java.util.Map;

import com.aua.dao.IBaseDao;
import com.aua.util.Container;
import com.greencloud.dto.CateringSearchDto;
import com.greencloud.entity.Catering;
import com.greencloud.entity.CateringResource;
import com.greencloud.entity.CateringResourceMap;

public interface ICateringDao extends IBaseDao {

	boolean isResourceInUse(Long hotelGroupId, Long hotelId, String code);

	List<CateringResource> listCateringResourceByCateringId(Long hotelGroupId, Long hotelId,Long cateringId);

	List<CateringResourceMap> listEffectResourceMapByResourceCode(Long hotelGroupId, Long hotelId, String cateringResource);

	Container<Catering> listCateringBySearchDto(Long hotelGroupId, Long hotelId,CateringSearchDto csdto);

	/**
	 * 统计主单宴会数量
	 * @param hotelGroupId
	 * @param hotelId
	 * @param rsvId
	 * @return
	 */
	int countRsvCatering(Long hotelGroupId, Long hotelId, Long rsvId);
}
