package com.greencloud.service;

import java.math.BigDecimal;
import java.util.Date;

import com.aua.service.IBaseService;
import com.greencloud.dto.KaiYuanCardPosDto;

public interface IKaiYuanInterfaceService {
	
	public void updateCardInfo(long hotelGroupId,long hotelId,Date bizDate,String accnt,String cardno,String userCode,String foodDiscount,String beveDiscount, String miscDiscount, String discount1,String discount2);
	
	public String updateCardConsume(long hotelGroupId,long hotelId,Date bizDate,String billNo,BigDecimal pay,String type,String cardno,String flag,long gsts,String hotelCode,String accnt,String pccode);
	
	public KaiYuanCardPosDto updateByCardSearchDtoForPos(Long hotelGroupId,Long hotelId,String accnt,String sataionCode,String cardNo,String userCode,String pccode,String type1);
}
