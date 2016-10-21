package com.greencloud.facade.impl;

import com.greencloud.util.UserManager;
public abstract class AbstractFacadeServiceImpl {

	protected Long checkHotelGroupId(Long hotelGroupId){
		if(hotelGroupId == null)
			return UserManager.getHotelGroupId();
		
		return hotelGroupId;
	}
	
	protected Long checkHotelId(Long hotelId){
		if(hotelId == null)
			return UserManager.getHotelId();
		
		return hotelId;
	}
	
}
