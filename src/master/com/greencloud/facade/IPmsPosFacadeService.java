


package com.greencloud.facade;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.greencloud.dto.KaiYuanCardPosDto;
import com.greencloud.dto.KaiYuanCardPosOldDto;
import com.greencloud.dto.POSDiscountMode;
import com.greencloud.dto.POSInterfaceArDto;
import com.greencloud.dto.POSInterfaceArFkDto;
import com.greencloud.dto.POSInterfaceCardDto;
import com.greencloud.dto.POSInterfaceCardFkDto;
import com.greencloud.dto.POSInterfaceFoDto;
import com.greencloud.dto.POSInterfaceFoFkDto;
import com.greencloud.dto.POSInterfaceGuestDto;
import com.greencloud.dto.POSInterfaceGuestFkDto;
import com.greencloud.dto.POSInterfaceScanDto;
import com.greencloud.dto.PosMemberPointDto;
import com.greencloud.dto.PosPayDto;
import com.greencloud.dto.PosUserDto;
import com.greencloud.dto.PosinterfaceFaceArGuestDto;
import com.greencloud.dto.SearchInfoQianHengDto;

public interface  IPmsPosFacadeService{
	
	public List<POSInterfaceFoDto> getPosFoDto(long hotelGroupId,long hotelId,String key,String rsvClass);
	public List<POSInterfaceArDto> getPosArDto(long hotelGroupId,long hotelId,String key);
	public List<PosinterfaceFaceArGuestDto> getPosArGuestDto(long hotelGroupId,long hotelId,long arId, String relationCode);
	public List<POSInterfaceCardDto> listDiscountModeOfVIP(PosUserDto posUserDto, String info);
	public List<POSInterfaceGuestDto> listDiscountModeOfGuest(PosUserDto posUserDto, String info);
	public List<POSInterfaceGuestDto> listDiscountModeOfCompany(PosUserDto posUserDto, String info);
	
	public String updatePosAccntIn(PosUserDto posUserDto,String menuNo,String tableNo,List<PosPayDto> posPayDto,String remark);
	public String getPosToPmsCredit(long hotelGroupId,long hotelId,String biz_date);
	
//  添加分库版的协议单位、会员、宾客查询
	public List<POSInterfaceFoFkDto> getPosFoFkDto(long hotelGroupId,long hotelId,String key,String rsvClass);
	public List<POSInterfaceArFkDto> getPosArFkDto(long hotelGroupId,long hotelId,String key);
	public List<POSInterfaceGuestFkDto> listDiscountModeOfCompanyFk(PosUserDto posUserDto, String info);
	public List<POSInterfaceCardFkDto> listDiscountModeOfVIPFk(PosUserDto posUserDto, String info);
	public List<POSInterfaceGuestFkDto> listDiscountModeOfGuestFk(PosUserDto posUserDto, String info);

	public void updateUserPassword(Long userId,String oldPwd,String pwd);
	
	public String saveScanAccount(String scanChannel, Long hotelGroupId, Long hotelId, String authCode,String descript, String hotelOutId, Long masterId, String masterno, BigDecimal totalFee) throws Exception ;
	public String saveReturnScanAccount(String scanChannel, Long hotelGroupId,Long hotelId, String hotelOutId,String setTradeNo, Long masterId, String masterno, BigDecimal totalFee) throws Exception ;
	
	public List<POSInterfaceScanDto> getScanList(long hotelGroupId,long hotelId, String key);
	public void savePosMemberPoint(PosUserDto posUserDto,List<PosMemberPointDto> posPoint);
	
//开元会员卡查询
	public KaiYuanCardPosDto listKaiYuanDiscountModeOfVIP(PosUserDto posUserDto, String info);
	public String getSetValueFromSysOption(long hotelGroupId,long hotelId,String catalog,String item);
	public List<POSInterfaceCardFkDto> listDiscountModeOfVIPLvKa(PosUserDto posUserDto, String info,String passWord,String isNeedPd);
}
