package com.greencloud.dao.impl;

import static com.aua.util.StringHelper.isNotNull;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

import com.aua.dao.impl.BaseDaoImpl;
import com.aua.util.BeanUtils;
import com.aua.util.Container;
import com.aua.util.DateHelper;
import com.aua.util.SQLHelper;
import com.aua.util.StringHelper;
import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.constant.CodeBaseConstant;
import com.greencloud.constant.EntityConstant;
import com.greencloud.dao.IMasterBaseDao;
import com.greencloud.dto.CRSQueryDto;
import com.greencloud.dto.CRSSyncObj;
import com.greencloud.dto.CrsResrvDto;
import com.greencloud.dto.CrsResrvSimpleDto;
import com.greencloud.dto.DoorcardMakeDto;
import com.greencloud.dto.DoorcardReadedDto;
import com.greencloud.dto.MasterBaseIdAndRoomDto;
import com.greencloud.dto.MasterChannelDto;
import com.greencloud.dto.MasterContinueStayDto;
import com.greencloud.dto.MasterGuestSimpleDto;
import com.greencloud.dto.MasterInterfaceSimpleDto;
import com.greencloud.dto.MasterLinkDto;
import com.greencloud.dto.MasterLinkOwnerSiteDot;
import com.greencloud.dto.MasterNotToDto;
import com.greencloud.dto.MasterPoliceDto;
import com.greencloud.dto.MasterRoomClassDto;
import com.greencloud.dto.MasterSimpleInfoDto;
import com.greencloud.dto.MasterTaobaoDto;
import com.greencloud.dto.MasterWeChatDto;
import com.greencloud.dto.POSInterfaceFoDto;
import com.greencloud.dto.POSMasterEnquiryDto;
import com.greencloud.dto.PointRoomObj;
import com.greencloud.dto.PosInterfaceSearchDto;
import com.greencloud.dto.RoomInfoDto;
import com.greencloud.dto.RoomStaClassDto;
import com.greencloud.dto.SmartMasterBase;
import com.greencloud.dto.VolumeMasterDto;
import com.greencloud.dto.VolumnMasterLinkDto;
import com.greencloud.dto.YYMasterGuestDto;
import com.greencloud.dto.ZeroRateDto;
import com.greencloud.entity.CrsResrvSync;
import com.greencloud.entity.InterfaceCmd;
import com.greencloud.entity.MasterBase;
import com.greencloud.entity.RoomDayuseDefine;
import com.greencloud.entity.RoomTemporary;
import com.greencloud.entity.RsvSrc;
import com.greencloud.entity.WebRmtypeAvailSync;
import com.greencloud.exception.BizException;
import com.greencloud.util.DateUtil;
import com.greencloud.util.SqlCreateUtil;
import com.greencloud.util.StringUtil;
import com.greencloud.util.UserManager;

/**
 * operate Master into db
 * 
 * @author
 * @version 1.0
 * @date 2010-11-15 06:58
 */
public class MasterBaseDaoImpl extends BaseDaoImpl implements IMasterBaseDao {
	private SysOptionDaoImpl sysOptionDao;
	
	public void setSysOptionDao(SysOptionDaoImpl sysOptionDao) {
		this.sysOptionDao = sysOptionDao;
	}
	/**
	 * save master object method
	 * 
	 * @param master
	 *            Master
	 * @throws DataAccessException
	 * @author
	 * @version 1.0
	 * @date 2010-11-15 06:58
	 */
	public void save(MasterBase masterBase) throws DataAccessException {
		super.save(masterBase);
	}

	/**
	 * update master method
	 * 
	 * @param master
	 *            Master
	 * @throws DataAccessException
	 * @author
	 * @version 1.0
	 * @date 2010-11-15 06:58
	 */
	public void update(MasterBase masterBase) throws DataAccessException {
		super.update(masterBase);
	}

	/**
	 * save or update master object method
	 * 
	 * @param master
	 *            Master
	 * @throws DataAccessException
	 * @author
	 * @version 1.0
	 * @date 2010-11-15 06:58
	 */
	public void saveOrUpdate(MasterBase masterBase) throws DataAccessException {
		super.saveOrUpdate(masterBase);
	}

	/**
	 * query master collection method
	 * 
	 * @param master
	 *            Master send query vo
	 * @param firstResult
	 * @param maxResults
	 * @throws DataAccessException
	 * @author
	 * @version 1.0
	 * @date 2010-11-15 06:58
	 */
	 public List<MasterBase> list(MasterBase masterBase, int firstResult, int maxResults) throws DataAccessException {
		SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
		spellSQL(sh, masterBase);
		sh.appendSql(" ORDER BY obj.id");
		sh.setFirstResult(firstResult);
		sh.setMaxResults(maxResults);
		return find(sh);
	}

	/**
	 * query collection method
	 * 
	 * @param master
	 *            Master send query vo
	 * @throws DataAccessException
	 * @author
	 * @version 1.0
	 * @date 2010-11-15 06MasterBase
	 */
	public List<MasterBase> list(MasterBase masterBase) throws DataAccessException {
		SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
		spellSQL(sh, masterBase);
		sh.appendSql(" ORDER BY obj.id");
		return find(sh);
	}
	
	
	@Override
	public List<MasterBase> listGrp(MasterBase masterBase)throws DataAccessException {
		SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
		spellSQL(sh, masterBase);
		sh.appendSql(" ORDER BY obj.rsvClass desc,obj.grpFlag desc,obj.sta,obj.rmno,obj.id");
		return find(sh);
	}

	/**
	 * count obj amount
	 * 
	 * @param master
	 *            Master query vo
	 * @throws DataAccessException
	 * @author
	 * @date 2010-11-15MasterBase
	 */
	public int count(MasterBase masterBase) throws DataAccessException {
		SQLHelper sh = new SQLHelper("SELECT count(obj.id) FROM MasterBase obj WHERE 1=1 ");
		spellSQL(sh, masterBase);
		return count(sh);
	}

	/**
	 * query a master by id
	 * 
	 * @param id
	 * @throws DataAccessException
	 * @author
	 * @dMasterBase10-11-15 06:58
	 */
	public MasterBase load(Long id) throws DataAccessException {
		return load(MasterBase.class, id);
	}

	/*
	 * basic spell SQL method
	 * 
	 * @param master query vo
	 * 
	 * @throws DataAccessException
	 * 
	 * @author weihuawon
	 * 
	 * @date 2010-11-15 06:58
	 */
	private void spellSQL(SQLHelper sh,MasterBase masterBase){
	    if(masterBase != null){
	    	int length = sh.getSQL().length();
	    	if(masterBase.getId()!= null){
	            sh.appendSql(" AND obj.id = ? ");
	            sh.insertValue(masterBase.getId());
	         }
	         if(masterBase.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(masterBase.getHotelGroupId());
	         }
	         if(masterBase.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(masterBase.getHotelId());
	         }
	        if(masterBase.getRsvId()!= null){
	           sh.appendSql(" AND obj.rsvId = ? ");
	           sh.insertValue(masterBase.getRsvId());
	        }
	        if(masterBase.getRsvSrcId()!= null){
		           sh.appendSql(" AND obj.rsvSrcId = ? ");
		           sh.insertValue(masterBase.getRsvSrcId());
		        }
	        if(isNotNull(masterBase.getRsvClass())){
	           sh.appendSql(" AND obj.rsvClass = ? ");
	           sh.insertValue(masterBase.getRsvClass().trim());
	        }
	        if(masterBase.getMasterId()!= null){
	           sh.appendSql(" AND obj.masterId = ? ");
	           sh.insertValue(masterBase.getMasterId());
	        }
	        if(masterBase.getGrpAccnt()!= null){
	           sh.appendSql(" AND obj.grpAccnt = ? ");
	           sh.insertValue(masterBase.getGrpAccnt());
	        }
	        if(isNotNull(masterBase.getGrpFlag())){
		           sh.appendSql(" AND obj.grpFlag = ? ");
		           sh.insertValue(masterBase.getGrpFlag().trim());
		        }
	        if(masterBase.getBlockId()!= null){
	           sh.appendSql(" AND obj.blockId = ? ");
	           sh.insertValue(masterBase.getBlockId());
	        }
	       if(masterBase.getBizDate()!= null){
	           sh.appendSql(" AND obj.bizDate = ? ");
	           sh.insertValue(masterBase.getBizDate());
	        }
	        if (isNotNull(masterBase.getSta())) {
				//未结
				if(!masterBase.getSta().equals("WJ"))
	        	{
					sh.appendSql(" AND obj.sta = ? ");
					sh.insertValue(masterBase.getSta().trim());
	        	}else
	        	{
	        		sh.appendSql(" AND (obj.sta = 'I' or obj.sta='R' or obj.sta = 'S')");
	        	}
			}
	        if(isNotNull(masterBase.getRmtype())){
	           sh.appendSql(" AND obj.rmtype = ? ");
	           sh.insertValue(masterBase.getRmtype().trim());
	        }
	        if(isNotNull(masterBase.getRmno())){
	           sh.appendSql(" AND obj.rmno = ? ");
	           sh.insertValue(masterBase.getRmno().trim());
	        }
	       if(masterBase.getRmnum()!= null){
	           sh.appendSql(" AND obj.rmnum = ? ");
	           sh.insertValue(masterBase.getRmnum());
	        }
	       if(masterBase.getArr()!= null){
	           sh.appendSql(" AND obj.arr = ? ");
	           sh.insertValue(masterBase.getArr());
	        }
	       if(masterBase.getDep()!= null){
	           sh.appendSql(" AND obj.dep = ? ");
	           sh.insertValue(masterBase.getDep());
	        }
	       if(masterBase.getAdult()!= null){
	           sh.appendSql(" AND obj.adult = ? ");
	           sh.insertValue(masterBase.getAdult());
	        }
	       if(masterBase.getChildren()!= null){
	           sh.appendSql(" AND obj.children = ? ");
	           sh.insertValue(masterBase.getChildren());
	        }
	        if(isNotNull(masterBase.getResSta())){
	           sh.appendSql(" AND obj.resSta = ? ");
	           sh.insertValue(masterBase.getResSta().trim());
	        }
	       if(masterBase.getResDep()!= null){
	           sh.appendSql(" AND obj.resDep = ? ");
	           sh.insertValue(masterBase.getResDep());
	        }
	       if(masterBase.getRackRate()!= null){
	           sh.appendSql(" AND obj.rackRate = ? ");
	           sh.insertValue(masterBase.getRackRate());
	        }
	       if(masterBase.getNegoRate()!= null){
	           sh.appendSql(" AND obj.negoRate = ? ");
	           sh.insertValue(masterBase.getNegoRate());
	        }
	       if(masterBase.getRealRate()!= null){
	           sh.appendSql(" AND obj.realRate = ? ");
	           sh.insertValue(masterBase.getRealRate());
	        }
	        if(isNotNull(masterBase.getDscReason())){
	           sh.appendSql(" AND obj.dscReason = ? ");
	           sh.insertValue(masterBase.getDscReason().trim());
	        }
	       if(masterBase.getDscAmount()!= null){
	           sh.appendSql(" AND obj.dscAmount = ? ");
	           sh.insertValue(masterBase.getDscAmount());
	        }
	       if(masterBase.getDscPercent()!= null){
	           sh.appendSql(" AND obj.dscPercent = ? ");
	           sh.insertValue(masterBase.getDscPercent());
	        }
	        if(isNotNull(masterBase.getExpSta())){
	           sh.appendSql(" AND obj.expSta = ? ");
	           sh.insertValue(masterBase.getExpSta().trim());
	        }
	        if(isNotNull(masterBase.getTmSta())){
		           sh.appendSql(" AND obj.tmSta = ? ");
		           sh.insertValue(masterBase.getTmSta().trim());
		    }
	        if(isNotNull(masterBase.getRmpostSta())){
	           sh.appendSql(" AND obj.rmpostSta = ? ");
	           sh.insertValue(masterBase.getRmpostSta().trim());
	        }
	        if(isNotNull(masterBase.getIsRmposted())){
	           sh.appendSql(" AND obj.isRmposted = ? ");
	           sh.insertValue(masterBase.getIsRmposted().trim());
	        }
	        if(isNotNull(masterBase.getTag0())){
	           sh.appendSql(" AND obj.tag0 = ? ");
	           sh.insertValue(masterBase.getTag0().trim());
	        }
	        if(masterBase.getCompanyId()!=null){
	           sh.appendSql(" AND obj.companyId = ? ");
	           sh.insertValue(masterBase.getCompanyId());
	        }
	        if(masterBase.getAgentId()!= null){
	           sh.appendSql(" AND obj.agentId = ? ");
	           sh.insertValue(masterBase.getAgentId());
	        }
	        if(masterBase.getSourceId()!= null){
	           sh.appendSql(" AND obj.sourceId = ? ");
	           sh.insertValue(masterBase.getSourceId());
	        }
	        if(isNotNull(masterBase.getMemberType())){
	           sh.appendSql(" AND obj.memberType = ? ");
	           sh.insertValue(masterBase.getMemberType().trim());
	        }
	        if(isNotNull(masterBase.getMemberNo())){
	           sh.appendSql(" AND obj.memberNo = ? ");
	           sh.insertValue(masterBase.getMemberNo().trim());
	        }
	        if(isNotNull(masterBase.getSalesman())){
	           sh.appendSql(" AND obj.salesman = ? ");
	           sh.insertValue(masterBase.getSalesman().trim());
	        }
	        if(isNotNull(masterBase.getArno())){
	           sh.appendSql(" AND obj.arno = ? ");
	           sh.insertValue(masterBase.getArno());
	        }
	        if(isNotNull(masterBase.getBuilding())){
	           sh.appendSql(" AND obj.building = ? ");
	           sh.insertValue(masterBase.getBuilding().trim());
	        }
	        if(isNotNull(masterBase.getSrc())){
	           sh.appendSql(" AND obj.src = ? ");
	           sh.insertValue(masterBase.getSrc().trim());
	        }
	        if(isNotNull(masterBase.getMarket())){
	           sh.appendSql(" AND obj.market = ? ");
	           sh.insertValue(masterBase.getMarket().trim());
	        }
	        if(isNotNull(masterBase.getRsvType())){
	           sh.appendSql(" AND obj.rsvType = ? ");
	           sh.insertValue(masterBase.getRsvType().trim());
	        }
	        if(isNotNull(masterBase.getChannel())){
	           sh.appendSql(" AND obj.channel = ? ");
	           sh.insertValue(masterBase.getChannel().trim());
	        }
	        if(isNotNull(masterBase.getRatecode())){
	           sh.appendSql(" AND obj.ratecode = ? ");
	           sh.insertValue(masterBase.getRatecode().trim());
	        }
	        if(isNotNull(masterBase.getCmscode())){
	           sh.appendSql(" AND obj.cmscode = ? ");
	           sh.insertValue(masterBase.getCmscode().trim());
	        }
	        if(isNotNull(masterBase.getPackages())){
	           sh.appendSql(" AND obj.packages = ? ");
	           sh.insertValue(masterBase.getPackages().trim());
	        }
	        if(isNotNull(masterBase.getSpecials())){
	           sh.appendSql(" AND obj.specials = ? ");
	           sh.insertValue(masterBase.getSpecials().trim());
	        }
	        if(isNotNull(masterBase.getAmenities())){
	           sh.appendSql(" AND obj.amenities = ? ");
	           sh.insertValue(masterBase.getAmenities().trim());
	        }
	        if(isNotNull(masterBase.getIsFixRate())){
	           sh.appendSql(" AND obj.isFixRate = ? ");
	           sh.insertValue(masterBase.getIsFixRate().trim());
	        }
	        if(isNotNull(masterBase.getIsFixRmno())){
	           sh.appendSql(" AND obj.isFixRmno = ? ");
	           sh.insertValue(masterBase.getIsFixRmno().trim());
	        }
	        if(isNotNull(masterBase.getIsSure())){
	           sh.appendSql(" AND obj.isSure = ? ");
	           sh.insertValue(masterBase.getIsSure().trim());
	        }
	        if(isNotNull(masterBase.getIsPermanent())){
	           sh.appendSql(" AND obj.isPermanent = ? ");
	           sh.insertValue(masterBase.getIsPermanent().trim());
	        }
	        if(isNotNull(masterBase.getIsWalkin())){
	           sh.appendSql(" AND obj.isWalkin = ? ");
	           sh.insertValue(masterBase.getIsWalkin().trim());
	        }
	        if(isNotNull(masterBase.getIsSecret())){
	           sh.appendSql(" AND obj.isSecret = ? ");
	           sh.insertValue(masterBase.getIsSecret().trim());
	        }
	        if(isNotNull(masterBase.getIsSecretRate())){
	           sh.appendSql(" AND obj.isSecretRate = ? ");
	           sh.insertValue(masterBase.getIsSecretRate().trim());
	        }
	        if(isNotNull(masterBase.getPostingFlag())){
	           sh.appendSql(" AND obj.postingFlag = ? ");
	           sh.insertValue(masterBase.getPostingFlag().trim());
	        }
	        if(isNotNull(masterBase.getScFlag())){
	           sh.appendSql(" AND obj.scFlag = ? ");
	           sh.insertValue(masterBase.getScFlag().trim());
	        }
	        if(isNotNull(masterBase.getExtraFlag())){
	           sh.appendSql(" AND obj.extraFlag = ? ");
	           sh.insertValue(masterBase.getExtraFlag().trim());
	        }
	       if(masterBase.getExtraBedNum()!= null){
	           sh.appendSql(" AND obj.extraBedNum = ? ");
	           sh.insertValue(masterBase.getExtraBedNum());
	        }
	       if(masterBase.getExtraBedRate()!= null){
	           sh.appendSql(" AND obj.extraBedRate = ? ");
	           sh.insertValue(masterBase.getExtraBedRate());
	        }
	       if(masterBase.getCribNum()!= null){
	           sh.appendSql(" AND obj.cribNum = ? ");
	           sh.insertValue(masterBase.getCribNum());
	        }
	       if(masterBase.getCribRate()!= null){
	           sh.appendSql(" AND obj.cribRate = ? ");
	           sh.insertValue(masterBase.getCribRate());
	        }
	        if(isNotNull(masterBase.getPayCode())){
	           sh.appendSql(" AND obj.payCode = ? ");
	           sh.insertValue(masterBase.getPayCode().trim());
	        }
	       if(masterBase.getLimitAmt()!= null){
	           sh.appendSql(" AND obj.limitAmt = ? ");
	           sh.insertValue(masterBase.getLimitAmt());
	        }
	        if(isNotNull(masterBase.getCreditNo())){
	           sh.appendSql(" AND obj.creditNo = ? ");
	           sh.insertValue(masterBase.getCreditNo().trim());
	        }
	        if(isNotNull(masterBase.getCreditMan())){
	           sh.appendSql(" AND obj.creditMan = ? ");
	           sh.insertValue(masterBase.getCreditMan().trim());
	        }
	        if(isNotNull(masterBase.getCreditCompany())){
	           sh.appendSql(" AND obj.creditCompany = ? ");
	           sh.insertValue(masterBase.getCreditCompany().trim());
	        }
	       if(masterBase.getCharge()!= null){
	           sh.appendSql(" AND obj.charge = ? ");
	           sh.insertValue(masterBase.getCharge());
	        }
	       if(masterBase.getPay()!= null){
	           sh.appendSql(" AND obj.pay = ? ");
	           sh.insertValue(masterBase.getPay());
	        }
	       if(masterBase.getCredit()!= null){
	           sh.appendSql(" AND obj.credit = ? ");
	           sh.insertValue(masterBase.getCredit());
	        }
	       if(masterBase.getLastNum()!= null){
	           sh.appendSql(" AND obj.lastNum = ? ");
	           sh.insertValue(masterBase.getLastNum());
	        }
	       if(masterBase.getLastNumLink()!= null){
	           sh.appendSql(" AND obj.lastNumLink = ? ");
	           sh.insertValue(masterBase.getLastNumLink());
	        }
	        if(masterBase.getRmoccId()!= null){
	           sh.appendSql(" AND obj.rmoccId = ? ");
	           sh.insertValue(masterBase.getRmoccId());
	        }
	        if(masterBase.getLinkId()!= null){
	           sh.appendSql(" AND obj.linkId = ? ");
	           sh.insertValue(masterBase.getLinkId());
	        }
	        if(masterBase.getPkgLinkId()!= null){
	           sh.appendSql(" AND obj.pkgLinkId = ? ");
	           sh.insertValue(masterBase.getPkgLinkId());
	        }
	        if(isNotNull(masterBase.getRsvNo())){
	           sh.appendSql(" AND obj.rsvNo = ? ");
	           sh.insertValue(masterBase.getRsvNo().trim());
	        }
	        if(isNotNull(masterBase.getCrsNo())){
	           sh.appendSql(" AND obj.crsNo = ? ");
	           sh.insertValue(masterBase.getCrsNo().trim());
	        }
	        if(isNotNull(masterBase.getWhereFrom())){
	           sh.appendSql(" AND obj.whereFrom = ? ");
	           sh.insertValue(masterBase.getWhereFrom().trim());
	        }
	        if(isNotNull(masterBase.getWhereTo())){
	           sh.appendSql(" AND obj.whereTo = ? ");
	           sh.insertValue(masterBase.getWhereTo().trim());
	        }
	        if(isNotNull(masterBase.getPurpose())){
	           sh.appendSql(" AND obj.purpose = ? ");
	           sh.insertValue(masterBase.getPurpose().trim());
	        }
	        if(isNotNull(masterBase.getRemark())){
	           sh.appendSql(" AND obj.remark = ? ");
	           sh.insertValue(masterBase.getRemark().trim());
	        }
	        if(isNotNull(masterBase.getCoMsg())){
	           sh.appendSql(" AND obj.coMsg = ? ");
	           sh.insertValue(masterBase.getCoMsg().trim());
	        }
	        if(isNotNull(masterBase.getIsOwner())){
		           sh.appendSql(" AND obj.isOwner = ? ");
		           sh.insertValue(masterBase.getIsOwner().trim());
	        }
	        if(masterBase.getOwnerId()!= null){
	            sh.appendSql(" AND obj.ownerId = ? ");
	            sh.insertValue(masterBase.getOwnerId());
	         }
	        if(length == sh.getSQL().length()){
	        	throw new BizException("查询主单MasterBase记录时，无任何有效条件！\n请联系绿云客服处理。", 
	        			BizExceptionConstant.INVALID_PARAM, BizException.BIZ_TYPE.TYPE_1);	        	
	        }
	    }
	  }


	@Override
	public List<MasterSimpleInfoDto> findMastSimpleInfoDtos(String roomNo, Long hotelGroupId, Long hotelId, Date date,
					Integer days) {
		date = DateHelper.shortDate(date);
		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, days);
		Date endDate = c.getTime();
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" select                                                                              ");
		sh.appendSql(" a.arr,                                                                              ");
		sh.appendSql("  a.dep,                                                                             ");
		sh.appendSql("  a.amenities,                                                                       ");
		sh.appendSql("  b.name,                                                                            ");
		sh.appendSql("  b.sex as sex,                                                                      ");
		sh.appendSql("  b.id_no as idNo,                                                                   ");
		sh.appendSql("  b.nation,                                                                          ");
		sh.appendSql("  g.name as companyName,                                                     ");
		sh.appendSql("  a.member_type as memberType,                                                       ");
		sh.appendSql("  f.descript as memberTypeDescript,                                                  ");
		sh.appendSql("  f.descript_en as memberTypeDescriptEn,                                             ");
		sh.appendSql("  d.descript as nationDescript,                                                      ");
		sh.appendSql("  d.descript_en as nationDescriptEn,                                                 ");
		sh.appendSql("  e.descript as sexDescript,                                                         ");
		sh.appendSql("  e.descript_en as sexDescriptEn                                                     ");
		sh.appendSql(" from master_base a                                                                  ");
		sh.appendSql(" left join master_guest b on a.id = b.id                                             ");
		sh.appendSql(" left join code_country d on b.nation = d.code                                       ");
		sh.appendSql(" and a.hotel_group_id = d.hotel_group_id                                             ");
		sh.appendSql(" and a.hotel_id = d.hotel_id                                                         ");
		sh.appendSql(" left join code_base e on b.sex = e.code                                             ");
		sh.appendSql(" and b.hotel_group_id = e.hotel_group_id                                             ");
		sh.appendSql(" and b.hotel_id = e.hotel_id                                                         ");
		sh.appendSql(" and e.parent_code = ?                                                               ");
		sh.insertValue(CodeBaseConstant.SEX);
		sh.appendSql(" left join code_base f on a.member_type = f.code                                     ");
		sh.appendSql(" and a.hotel_group_id = f.hotel_group_id                                             ");
		sh.appendSql(" and a.hotel_id = f.hotel_id                                                         ");
		sh.appendSql(" and f.parent_code = ?                                                               ");
		sh.insertValue(CodeBaseConstant.VIP);
		sh.appendSql("  left join company_base g on b.profile_id= g.id                                    ");
		sh.appendSql(" where                                                                               ");
		sh.appendSql("     a.rmno =?                                                                       ");
		sh.insertValue(roomNo.trim());
		sh.appendSql(" and (a.sta =?  or a.sta=? )                                                         ");
		sh.insertValue(MasterBase.Sta.I);
		sh.insertValue(MasterBase.Sta.R);
		sh.appendSql(" and (a.rsv_class=? or a.rsv_class=?) ");
		sh.insertValue(MasterBase.RsvClass.F);
		sh.insertValue(MasterBase.RsvClass.D);
		sh.appendSql(" and a.hotel_group_id =?                                                             ");
		sh.insertValue(hotelGroupId);
		sh.appendSql(" and a.hotel_id =?                                                                   ");
		sh.insertValue(hotelId);
		// 第一种情况 比较开始时间在订单时间之 内的
		sh.appendSql(" and((date(a.arr) <= ?");
		sh.insertValue(date);
		sh.appendSql("     			and date(a.dep) >= ?)");
		sh.insertValue(date);
		// 第二种情况 比较结束时间在订单时间之 内的
		sh.appendSql(" or(date(a.arr) <= ? ");
		sh.insertValue(endDate);
		sh.appendSql(" 				and date(a.dep) >= ?)");
		sh.insertValue(endDate);
		// 第三种情况比较开始/结束时间在订单时间之内的
		sh.appendSql(" or(date(a.arr) <= ? ");
		sh.insertValue(date);
		sh.appendSql(" 				and date(a.dep) >= ?)");
		sh.insertValue(endDate);
		sh.appendSql(" or(date(a.arr) >=? ");
		sh.insertValue(date);
		// 第四种情况比较开始/结束时间在订单时间之外的
		sh.appendSql(" 				and date(a.dep) <= ?)");
		sh.insertValue(endDate);
		sh.appendSql(" ) ");
		return findByNativeSQL(sh, MasterSimpleInfoDto.class);
	}
	
	/**
	 * 根据给定的订单ID查询联房记录列表方法 这里是需要显示所有跟这个订单相关的订单。 
	 * 次序如下： 1、自己 id = masterId 
	 *           2、同住关系的 房号相同 
	 *           3、同一个预订号的 预订号相同 
	 *           4、联房的 linkId与pkgLinkId相同 
	 *           5、同一个团队的 团队Id相同
	 * @param hotelId			酒店ID
	 * @param hotelGroupId		集团ID
	 * @param masterId  		主单ID
	 * @param liveId 			同住ID
	 * @param linkId			 联房ID 相同则表示联房
	 * @param pkgLinkId			包价联房Id 相同则表示包价联房
	 * @param grpAccnt			团队号 相同则表示同一团队
	 * @param stas				状态列表(多个状态请使用','分隔)
	 * @param hasSelf			是否包含自己
	 * @param linkHasLive		联房列表是否包含同住(仅针对联房列表有效)
	 * @param linkHasGrp		联房列表是否包含同团队(需要查询团队列表时，请传true)
	 * @param hasResrv			是否检索预订单
	 * @param hasHistory		是否检索历史主单
	 * @return List<MasterLinkDto>
	 * @author Cairo
	 * @modify Cairo
	 * @modifyDate 2014-08-14
	 */
	@Override
	public List<MasterLinkDto> listMasterBaseLink(Long hotelId,Long hotelGroupId,Long masterId,
			  Long liveId,Long linkId,Long pkgLinkId,Long grpAccnt,String stas,
			  boolean hasSelf,boolean linkHasLive,boolean linkHasGrp, boolean hasResrv,boolean hasHistory){
		  SQLHelper sh = new SQLHelper();
		  List<MasterLinkDto> list = new ArrayList<MasterLinkDto>();
		  if(masterId != null && hasSelf){
			  sqlMasterLink(sh, "F","",hotelId,hotelGroupId);
	          sh.appendSql(" and a.id = ?");
			  sh.insertValue(masterId);
			  list = findByNativeSQL(sh, MasterLinkDto.class);
			  sh.clear();
		  }
		  if(linkHasLive && liveId != null && !liveId.equals(0l)){
			  sqlMasterLink(sh, "I",stas,hotelId,hotelGroupId);
			  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class = 'F' ");
			  sh.appendSql(" and a.master_id = ? ");
			  sh.insertValue(liveId);
			  sh.appendSql(" and a.id <> ? ");
			  sh.insertValue(masterId);
			  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
			  sh.clear();
			  if(hasHistory){
				  sqlMasterHistoryLink(sh, "I",stas,hotelId,hotelGroupId);
				  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class = 'F' ");
				  sh.appendSql(" and a.master_id = ? ");
				  sh.insertValue(liveId);
				  sh.appendSql(" and a.id <> ? ");
				  sh.insertValue(masterId);
				  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				  sh.clear();
			  }
		  }
		  if((linkId != null && !linkId.equals(0l)) || 
				  ( pkgLinkId != null && !pkgLinkId.equals(0l))){
			  // 查询联房预订单
			  if(hasResrv){
				  sqlMasterLink(sh, "L",stas, hotelId, hotelGroupId);
				  sh.appendSql(" AND a.id = a.rsv_id AND a.is_resrv = 'T' AND a.rsv_class = 'F' ");
				  sh.appendSql(" and a.id <> ? ");
				  sh.insertValue(masterId);
				  sh.appendSql(" and ( 1=2 ");
				  if(linkId != null && !linkId.equals(0l)){
					    sh.appendSql(" or a.link_id = ?  ");
					    sh.insertValue(linkId);
				  }
//				  if(pkgLinkId != null && !pkgLinkId.equals(0l)){
//					    sh.appendSql(" or a.pkg_link_id = ?  ");
//					    sh.insertValue(pkgLinkId);
//				  }
				  sh.appendSql(") ");
				  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				  sh.clear();
				  if(hasHistory){
					  sqlMasterHistoryLink(sh, "L",stas,hotelId,hotelGroupId);
					  sh.appendSql(" AND a.id = a.rsv_id AND a.is_resrv = 'T' AND a.rsv_class = 'F' ");
					  sh.appendSql(" and a.id <> ? ");
					  sh.insertValue(masterId);
					  sh.appendSql(" and ( 1=2 ");
					  if(linkId != null && !linkId.equals(0l)){
						    sh.appendSql(" or a.link_id = ?  ");
						    sh.insertValue(linkId);
					  }
//					  if(pkgLinkId != null && !pkgLinkId.equals(0l)){
//						    sh.appendSql(" or a.pkg_link_id = ?  ");
//						    sh.insertValue(pkgLinkId);
//					  }
					  sh.appendSql(") ");
					  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
					  sh.clear();
				  }
			  }
			  sqlMasterLink(sh, "L",stas,hotelId,hotelGroupId);
			  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' ");
			  sh.appendSql(" and a.id <> ? ");
			  sh.insertValue(masterId);
			  if(!linkHasLive && liveId != null && !liveId.equals(0l)){
				  sh.appendSql(" and a.master_id <> ? ");
				  sh.insertValue(liveId);
			  }
			  sh.appendSql(" and ( 1=2");
			  if(linkId != null && !linkId.equals(0l)){
				  sh.appendSql(" or a.link_id = ? ");
				  sh.insertValue(linkId);
			  }
//			  if(pkgLinkId != null && !pkgLinkId.equals(0l)){
//				  sh.appendSql(" or a.pkg_link_id = ?   ");
//				  sh.insertValue(pkgLinkId);
//			  }
			  sh.appendSql(" ) ");
			  sh.appendSql(" and a.grp_accnt = '0' ");
			  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
			  sh.clear();
			  if(hasHistory){
				  sqlMasterHistoryLink(sh, "L",stas,hotelId,hotelGroupId);
				  sh.appendSql(" and a.id <> ? ");
				  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F'");
				  sh.insertValue(masterId);
				  if(!linkHasLive && liveId != null && !liveId.equals(0l)){
					  sh.appendSql(" and a.master_id <> ? ");
					  sh.insertValue(liveId);
				  }
				  sh.appendSql(" and ( 1=2");
				  if(linkId != null && !linkId.equals(0l)){
					  sh.appendSql(" or a.link_id = ? ");
					  sh.insertValue(linkId);
				  }
	//			  if(pkgLinkId != null && !pkgLinkId.equals(0l)){
	//				  sh.appendSql(" or a.pkg_link_id = ?   ");
	//				  sh.insertValue(pkgLinkId);
	//			  }
				  sh.appendSql(" ) ");
				  sh.appendSql(" and a.grp_accnt = '0' ");
				  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				  sh.clear();
			  }
		  }
		  if(linkHasGrp && grpAccnt != null && !grpAccnt.equals(0l)){
			  // 查询团队预订主单
			  sqlMasterLink(sh, "G","", hotelId, hotelGroupId);
			  sh.appendSql(" AND a.id = ? ");
			  sh.insertValue(grpAccnt);
			  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
			  sh.clear();
			  // 查询团队其他成员
			  sqlMasterLink(sh, "G",stas,hotelId,hotelGroupId);
			  sh.appendSql(" and a.id <> ? and a.grp_accnt = ? ");
			  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class IN ('F','D') ");
			  sh.insertValue(masterId);
			  sh.insertValue(grpAccnt);
			  if(liveId != null && !liveId.equals(0l)){
				  sh.appendSql(" and a.master_id <> ? ");
				  sh.insertValue(liveId);
			  }	
			  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
			  sh.clear();
			  if(hasHistory){
				  // 查询历史团队预订主单
				  sqlMasterHistoryLink(sh, "G","", hotelId, hotelGroupId);
				  sh.appendSql(" AND a.id = ? ");
				  sh.insertValue(grpAccnt);
				  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				  sh.clear();
				  // 查询历史团队其他成员
				  sqlMasterHistoryLink(sh, "G",stas,hotelId,hotelGroupId);
				  sh.appendSql(" and a.id <> ? and a.grp_accnt = ? ");
				  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class IN ('F','D') ");
				  sh.insertValue(masterId);
				  sh.insertValue(grpAccnt);
				  if(liveId != null && !liveId.equals(0l)){
					  sh.appendSql(" and a.master_id <> ? ");
					  sh.insertValue(liveId);
				  }	
				  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				  sh.clear();
			  }
		  }
		  return list;
	  }
	  
	  /**	
	   * 拼接LinkMaster_sql方法
	   */
	  private void sqlMasterLink(SQLHelper sh,String str,String stas,Long hotelId,Long hotelGroupId){
		  sh.appendSql(" SELECT                              ");
		  sh.appendSql("	a.id              id,            ");
		  sh.appendSql("    a.rsv_id       AS resrvId,       ");
		  sh.appendSql("	'C'               type,          ");
		  sh.appendSql("	a.rsv_class       rsvClass,      ");
		  sh.appendSql("	'"+str+"'          flag,         ");
		  sh.appendSql("	b.name            `name`,        ");
		  sh.appendSql("	b.name2    nameCombine,   ");
		  sh.appendSql("	b.sex				sex,		 ");
		  sh.appendSql("	a.sta             sta,           ");
		  sh.appendSql("	a.ratecode		rateCode,	     ");
		  sh.appendSql("	IF(a.id <> a.rsv_id,a.rmtype,'') rmType,");
		  sh.appendSql("	a.rmnum           rmNum,         ");
		  sh.appendSql("	if(rsv_class = 'H','消费帐',a.rmno) rmNo,");
		  sh.appendSql("    a.rmno_son        rmnoSon, ");
		  sh.appendSql("	(a.adult+a.children)    adultNum,");
		  sh.appendSql("	a.adult           adult,  	     ");
		  sh.appendSql("	a.children		children,  	     ");
		  sh.appendSql("	a.arr             arr,           ");
		  sh.appendSql("	a.dep             dep,           ");
		  sh.appendSql("	DATEDIFF(a.dep,a.arr)    dayNum, ");
		  sh.appendSql("	IF(a.id <> a.rsv_id,a.real_rate,0) realRate,");
		  sh.appendSql("	a.packages        packages,      ");
		  sh.appendSql("    a.charge          charge,        ");
		  sh.appendSql("    a.pay             pay,           ");
		  sh.appendSql("	(a.charge - a.pay)    balance,   ");
		  sh.appendSql("	a.credit          credit,        ");
		  sh.appendSql("	a.market          market,        ");
		  sh.appendSql("	a.rsv_no          rsvNo,         ");
		  sh.appendSql("	a.master_id       masterId,      ");
		  sh.appendSql("    a.amenities		amenities,       ");
		  sh.appendSql("    a.remark		    remark,      ");
		  sh.appendSql("	a.link_id         linkId,        ");
		  sh.appendSql("	a.pkg_link_id     pkgLinkId,     ");
		  sh.appendSql("	0				    rsvId,       ");
		  sh.appendSql("    b.vip				vip,		 ");
		  sh.appendSql("	b.profile_id		profileId,	 ");
		  sh.appendSql("	b.profile_type	profileType	     ");
		  sh.appendSql(" FROM master_base a,                 ");
		  sh.appendSql("    master_guest b              	 ");
		  sh.appendSql(" WHERE b.id = a.id  ");
		  sh.appendSql("    AND a.hotel_group_id = ?         ");
		  sh.appendSql("    AND a.hotel_id = ?               ");
		  sh.insertValue(hotelGroupId);
		  sh.insertValue(hotelId);
		  sh.appendSql("     AND b.hotel_group_id = ? 	 	 ");
		  sh.appendSql("     AND b.hotel_id = ?           	 ");
		  sh.insertValue(hotelGroupId);
		  sh.insertValue(hotelId);
		  if(isNotNull(stas)){
			  sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
		  }
	  }
	  
	  /**	
	   * 拼接LinkMaster_sql方法
	   */
	  private void sqlMasterHistoryLink(SQLHelper sh,String str,String stas,Long hotelId,Long hotelGroupId){
		  sh.appendSql("	  SELECT                                ");
		  sh.appendSql("	  a.id              id,                 ");
		  sh.appendSql("      a.rsv_id       AS resrvId,            ");
		  sh.appendSql("	  'H'               type,               ");
		  sh.appendSql("	  a.rsv_class       rsvClass,           ");
		  sh.appendSql("	  '"+str+"'          flag,              ");
		  sh.appendSql("	  b.name            `name`,             ");
		  sh.appendSql("	  b.name2    nameCombine,        ");
		  sh.appendSql("	  b.sex				sex,				");
		  sh.appendSql("	  a.sta             sta,                ");
		  sh.appendSql("	  a.ratecode		rateCode,			");
		  sh.appendSql("	  a.rmtype          rmType,             ");
		  sh.appendSql("	  a.rmnum           rmNum,              ");
		  sh.appendSql("	  if(rsv_class = 'H','消费帐',a.rmno) rmNo,");
		  sh.appendSql("      a.rmno_son        rmnoSon, ");
		  sh.appendSql("	  (a.adult+a.children)    adultNum,     ");
		  sh.appendSql("	  a.adult           adult,  			");
		  sh.appendSql("	  a.children		children,  			");
		  sh.appendSql("	  a.arr             arr,                ");
		  sh.appendSql("	  a.dep             dep,                ");
		  sh.appendSql("	  DATEDIFF(a.dep,a.arr)    dayNum,      ");
		  sh.appendSql("	  a.real_rate       realRate,           ");
		  sh.appendSql("	  a.packages        packages,           ");
		  sh.appendSql("      a.charge          charge,           ");
		  sh.appendSql("      a.pay             pay,              ");
		  sh.appendSql("	  (a.charge - a.pay)    balance,        ");
		  sh.appendSql("	  a.credit          credit,             ");
		  sh.appendSql("	  a.market          market,             ");
		  sh.appendSql("	  a.rsv_no          rsvNo,              ");
		  sh.appendSql("	  a.master_id       masterId,         	");
		  sh.appendSql("      a.amenities		amenities,          ");
		  sh.appendSql("      a.remark		    remark,             ");
		  sh.appendSql("	  a.link_id         linkId,             ");
		  sh.appendSql("	  a.pkg_link_id     pkgLinkId,          ");
		  sh.appendSql("	  0				    rsvId,           	");
		  sh.appendSql("      b.vip				vip,				");
		  sh.appendSql("	  b.profile_id		profileId,			");
		  sh.appendSql("	  b.profile_type	profileType			");
		  sh.appendSql("	  FROM master_base_history a,           ");
		  sh.appendSql("	    master_guest_history b		    	");
		  sh.appendSql("      WHERE a.id = b.id ");
		  sh.appendSql("          AND a.hotel_group_id = ? 			");
		  sh.appendSql("          AND a.hotel_id = ?          		");
		  sh.insertValue(hotelGroupId);
		  sh.insertValue(hotelId);
		  sh.appendSql("          AND b.hotel_group_id = ?         ");
		  sh.appendSql("          AND b.hotel_id = ?               ");
		  sh.insertValue(hotelGroupId);
		  sh.insertValue(hotelId);
		  if(isNotNull(stas)){
			  sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
		  }
	  }
	  
	  
	    /**
		 * 根据给定信息查询登记单联房信息列表
		 * 
		 * @param hotelGroupId      集团ID
		 * @param hotelId			酒店ID
		 * @param masterId			登记单ID
		 * @param liveId			同住ID
		 * @param linkId 			联房ID
		 * @param pkgLinkId         包价联房ID
		 * @param stas				状态列表(多个状态请使用','分隔)
		 * @param hasSelf			是否包含自己
		 * @param hasLive			是否包含同住人
		 * @param hasResrv			是否检索预订单
		 * @param hasHistory		是否检索历史主单
		 * @return List<MasterLinkDto>
		 * @modify Cairo
	     * @modifyDate 2014-08-19
		 */
	    @Override
		public List<MasterLinkDto> listMasterBaseLink(Long hotelGroupId,Long hotelId, Long masterId,Long liveId,
				Long linkId, Long pkgLinkId,String stas, Boolean hasSelf, Boolean hasLive,Boolean hasResrv,Boolean hasHistory){
		    SQLHelper sh = new SQLHelper();
		    List<MasterLinkDto> list = new ArrayList<MasterLinkDto>();
		    if(masterId != null && hasSelf){
				  sqlMasterLink(sh, "F","",hotelId,hotelGroupId);
		          sh.appendSql(" and a.id = ?");
				  sh.insertValue(masterId);
				  list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				  sh.clear();
			}
		    if(hasLive && liveId != null && !liveId.equals(0l)){
			    sqlMasterLink(sh, "I",stas,hotelId,hotelGroupId);
			    sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class = 'F' ");
			    sh.appendSql(" and a.master_id = ? ");
			    sh.insertValue(liveId);
			    sh.appendSql(" and a.id <> ? ");
			    sh.insertValue(masterId);
			    list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				sh.clear();
		    }
		    if(hasResrv){
		    	 // 查询联房预订单
			    sqlMasterLink(sh, "L",stas, hotelId, hotelGroupId);
			    sh.appendSql(" AND a.id = a.rsv_id AND a.is_resrv = 'T' AND a.rsv_class = 'F' ");
			    sh.appendSql(" and a.id <> ? ");
			    sh.insertValue(masterId);
			    sh.appendSql(" and ( 1=2 ");
			    if(linkId != null && !linkId.equals(0l)){
				    sh.appendSql(" or a.link_id = ?  ");
				    sh.insertValue(linkId);
			    }
//			    if(pkgLinkId != null && !pkgLinkId.equals(0l)){
//				    sh.appendSql(" or a.pkg_link_id = ?  ");
//				    sh.insertValue(pkgLinkId);
//			    }
			    sh.appendSql(") ");
		    	list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
				sh.clear();
				if(hasHistory){
					sqlMasterHistoryLink(sh, "L",stas, hotelId, hotelGroupId);
					sh.appendSql(" AND a.id = a.rsv_id AND a.is_resrv = 'T' AND a.rsv_class = 'F' ");
				    sh.appendSql(" and a.id <> ? ");
				    sh.insertValue(masterId);
				    sh.appendSql(" and ( 1=2 ");
				    if(linkId != null && !linkId.equals(0l)){
					    sh.appendSql(" or a.link_id = ?  ");
					    sh.insertValue(linkId);
				    }
//				    if(pkgLinkId != null && !pkgLinkId.equals(0l)){
//					    sh.appendSql(" or a.pkg_link_id = ?  ");
//					    sh.insertValue(pkgLinkId);
//				    }
				    sh.appendSql(") ");
					list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
					sh.clear();
				}
		    }
		    sqlMasterLink(sh, "L",stas,hotelId,hotelGroupId);
		    sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' ");
		    sh.appendSql(" and a.id <> ? ");
		    sh.insertValue(masterId);
		    if(liveId != null && !liveId.equals(0l)){
			    sh.appendSql(" and a.master_id <> ? ");
			    sh.insertValue(liveId);
		    }
		    sh.appendSql(" and ( 1=2 ");
		    if(linkId != null && !linkId.equals(0l)){
			    sh.appendSql(" or a.link_id = ?  ");
			    sh.insertValue(linkId);
		    }
//		    if(pkgLinkId != null && !pkgLinkId.equals(0l)){
//			    sh.appendSql(" or a.pkg_link_id = ?  ");
//			    sh.insertValue(pkgLinkId);
//		    }
		    sh.appendSql(") ");
		    list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
			sh.clear();
			if(hasHistory){
			    sqlMasterHistoryLink(sh, "L",stas, hotelId, hotelGroupId);
			    sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' ");
			    if(!hasSelf){
				    sh.appendSql(" and a.id <> ? ");
				    sh.insertValue(masterId);
			    }
			    if(liveId != null && !liveId.equals(0l)){
				    sh.appendSql(" and a.master_id <> ? ");
				    sh.insertValue(liveId);
			    }
			    sh.appendSql(" and ( 1=2 ");
			    if(linkId != null && !linkId.equals(0l)){
				    sh.appendSql(" or a.link_id = ?  ");
				    sh.insertValue(linkId);
			    }
	//		    if(pkgLinkId != null && !pkgLinkId.equals(0l)){
	//			    sh.appendSql(" or a.pkg_link_id = ?  ");
	//			    sh.insertValue(pkgLinkId);
	//		    }
			    sh.appendSql(" )"); 
			    list.addAll(findByNativeSQL(sh, MasterLinkDto.class));
			}
		    return list;
	  }
	  
	  /**
	   * 根据给定登记单Id查询关系登记单数量
	   * @param hotelGroupId		集团ID
	   * @param hotelId				酒店ID
	   * @param masterBaseId		登记单ID
	   * @param liveId				同住ID(MasterBase.masterId)
	   * @param linkId				联房ID
	   * @param pkgLinkId			包价联房ID
	   * @param grpAccnt			团队ID
	   * @return Integer
	   * @author Cairo
	   * @serialData 2011-03-31
	   */
	  public Integer countMasterBaseList(Long hotelGroupId,Long hotelId,Long masterBaseId,Long liveId,Long linkId,Long pkgLinkId,Long grpAccnt){
		  SQLHelper sh = new SQLHelper();
		  sh.appendSql("select count(1) from master_base where hotel_group_id = ? and hotel_id = ? AND rsv_class <> 'H' ");
		  sh.insertValue(hotelGroupId);
		  sh.insertValue(hotelId);
		  sh.appendSql(" and ( 1=2 ");
		  if(masterBaseId != null && !masterBaseId.equals(0l)){
			  sh.appendSql(" or id = ? ");
			  sh.insertValue(masterBaseId);
		  }
		  if(liveId != null && !liveId.equals(0l)){
			  sh.appendSql(" or master_id = ? ");
			  sh.insertValue(liveId);
		  }
		  if(linkId != null && !linkId.equals(0l)){
			  sh.appendSql(" or link_id = ? ");
			  sh.insertValue(linkId);
		  }
		  if(pkgLinkId != null && !pkgLinkId.equals(0l)){
			  sh.appendSql(" or pkg_link_id = ? ");
			  sh.insertValue(pkgLinkId);
		  }
		  if(grpAccnt != null && !grpAccnt.equals(0l)){
			  sh.appendSql(" or grp_accnt = ? ");
			  sh.insertValue(grpAccnt);
		  }
		  sh.appendSql(" )");
		  return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
	  }
	  
	  /**
	   * 根据给定条件查询订单列表 （综合排房界面使用）
	   * @param startDate				到达时间
	   * @param rmType					房类
	   * @param rsvNo					房号
	   * @param name					姓名
	   * @param companyId				公司Id
	   * @param isOlnyVip				是否只查询VIP记录
	   * @param hasAmenities			是否只查询有客房布置要求的记录
	   * @param hasPointsRoom			是否包含已分房记录
	   * @param hasCheckIn				是否包含已入住记录
	   * @param hotelGroupId			集团Id
	   * @param hotelId					酒店Id
	   * @return List<MasterListDot>	符合条件记录
	   * @author Cairo
	   * @serialData 2011-03-04
	   */
	  @Override
	  public List<MasterLinkDto> findMasterList(Date startDate,String rmType,String rsvNo,String name,String companyId,Boolean isOlnyVip,Boolean hasAmenities,Boolean hasPointsRoom,Boolean hasCheckIn,Long hotelGroupId,Long hotelId){
		  StringBuilder sb = new StringBuilder();
		  startDate = DateHelper.shortDate(startDate);
		  SQLHelper sh = new SQLHelper();
		  sh.appendSql("select a.id id,a.rsv_id as resrvId,a.rsv_class rsvClass,'F' flag,b.name name,b.name_combine nameCombine,b.sex sex,a.sta sta,a.ratecode rateCode,");
		  sh.appendSql("a.rmtype rmType,a.rmnum rmNum,a.rmno rmNo,(a.adult+a.children) adultNum,a.adult adult, a.children children,");
		  sh.appendSql("a.arr arr,a.dep dep,DATEDIFF(a.dep,a.arr) dayNum,a.real_rate realRate,a.packages packages,a.charge charge,a.pay pay,(a.charge-a.pay) balance,");
		  sh.appendSql("a.credit credit,a.market market,a.rsv_no rsvNo,a.master_id masterId,a.amenities amenities,a.remark	remark,");
		  sh.appendSql("a.link_id linkId, a.pkg_link_id pkgLinkId,0 rsvId,b.vip vip,b.profile_id profileId,b.profile_type profileType");
		  sh.appendSql(" from master_base a,master_guest b where ");
		  sh.appendSql("a.id = b.id and a.hotel_group_id = ? and a.hotel_id = ? and a.rsv_class = 'F' ");
		  sh.insertValue(hotelGroupId);
		  sh.insertValue(hotelId);
		  if(startDate != null){
			  sh.appendSql(" and date(a.arr) =? ");
			  sh.insertValue(startDate);
		  }
		  if(!"".equals(rmType)){
			  sh.appendSql(" and a.rmtype = ? ");
			  sh.insertValue(rmType);
		  }
		  if(!"".equals(rsvNo)){
			  sh.appendSql(" and (a.rsv_no like ? or crs_no like ? ) ");
			  sh.insertValue("'"+ rsvNo +"%'");
			  sh.insertValue("'"+ rsvNo +"%'");
		  }
		  if(!"".equals(name)){
			  sh.appendSql(" and b.name_combine like ? ");
			  sh.insertValue("'"+ name +"%'");
			  sh.insertValue("'"+ name +"%'");
		  }
		  if(!"".equals(companyId)){
			  sh.appendSql(" and a.company_id = ? ");
			  sh.insertValue(companyId);
		  }
		  if(isOlnyVip){
			  sh.appendSql(" and a.member_type > 0 ");
		  }
		  if(!hasAmenities){
			  sh.appendSql(" and a.amenities = '' ");		  
		  }
		  if(!hasPointsRoom){
			  sh.appendSql(" and (a.rmno = '' or a.rmno like '#%' ) ");
		  }
		  if(!hasCheckIn){
			  sh.appendSql(" and a.sta = 'R' ");
		  }else{
			  sh.appendSql(" and (a.sta = 'R' or a.sta = 'I') ");
		  }
		  sh.appendSql(" order by a.id ");
		  sh.appendSql(sb.toString());
		  return findByNativeSQL(sh,MasterLinkDto.class);
	  }
	  
	  /**
	   * 查询订单同住人集合 
	   * @param masterId			订单Id
	   * @param liveId				同住ID
	   * @param hotelGroupId		集团Id
	   * @param hotelId				酒店Id
	   * @param rmno				房号
	   * @param hasSelf				是否包含自己信息(T/F)
	   * @param stas				登记单状态（可选，没有请传null，多个状态使用','分隔）
	   * @param hasHistory			是否历史记录
	   * @return List<MasterLinkDto>
	   * @modifa Cairo
	   * @modifyDate 2014-08-12
	   * @modifyRemark 此处修改，为了优化sql检索效率
	   */
	  @Override
	  public List<MasterLinkDto> findMasterLiveList(Long masterId,Long liveId,String rmno,
			  Long hotelGroupId,Long hotelId,Boolean hasSelf,String stas,Boolean hasHistory){
		  SQLHelper sh = new SQLHelper();
		  sqlMasterLink(sh, "I",stas,hotelId,hotelGroupId);
		  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class IN ('F','D') ");
		  if(isNotNull(rmno)){
			  sh.appendSql(" and a.rmno = ? ");
			  sh.insertValue(rmno);
		  }
		  if(liveId != null){
			  sh.appendSql(" and a.master_id = ? ");
			  sh.insertValue(liveId);
		  }
		  if(!hasSelf){
			  sh.appendSql(" and a.id <> ? ");
			  sh.insertValue(masterId);
		  }
		  sh.appendSql(" ORDER BY a.sta,a.arr ");
		  List<MasterLinkDto> list = findByNativeSQL(sh, MasterLinkDto.class);
		  if(!hasHistory){
			  return list;
		  }
          // 此处加上历史同住关联查询sql 
		  sh.clear();
		  sqlMasterHistoryLink(sh, "I",stas, hotelId, hotelGroupId);
		  sh.appendSql(" AND a.id <> a.rsv_id AND a.is_resrv = 'F' AND a.rsv_class = 'F' ");
		  if(isNotNull(rmno)){
			  sh.appendSql(" and a.rmno = ? ");
			  sh.insertValue(rmno);
		  }
		  if(liveId != null){
			  sh.appendSql(" and a.master_id = ? ");
			  sh.insertValue(liveId);
		  }
		  if(!hasSelf){
			  sh.appendSql(" and a.id <> ? ");
			  sh.insertValue(masterId);
		  }
		  sh.appendSql(" ORDER BY a.sta,a.arr ");
		  list.addAll(findByNativeSQL(sh,MasterLinkDto.class));
		  return list;
	  }
	  
	  @Override
		public void updateOccIds(List<Long> rsvOccIds, Long id) {
			if (rsvOccIds != null && !rsvOccIds.isEmpty()) {
				SQLHelper sh = new SQLHelper();
				sh.appendSql(" update master_base a  set a.rmocc_id=? where 1=1   ");
				sh.insertValue(id);
				sh.appendOrSql(" or a.rmocc_id=? ", rsvOccIds);
				bulkUpdateByNativeSQL(sh);
			}
		}
	  
	  	/**
		 * 查询市场码来源码缺失主单数量
		 * @param hotelGroupId	集团Id
		 * @param hotelId		酒店Id
		 * @author Cairo 
		 * @serialData 2011-03-02
		 */
		@Override
		public Integer findInfoMissingMasterList(Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT a.id FROM master_base a " +
					"WHERE a.rsv_class <> 'H' (a.market IS NULL OR a.market ='' " +
					"OR a.src IS NULL OR a.src= ''" +
					" OR NOT EXISTS (SELECT 1 FROM code_base WHERE " +
					" a.market=CODE AND parent_code='market_code')" +
					" OR  NOT EXISTS (SELECT 1 FROM code_base WHERE  " +
					"a.src=CODE AND parent_code='src_code')) " +
					"AND a.hotel_group_id=? AND a.hotel_id=? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			List<MasterNotToDto> list = findByNativeSQL(sh,MasterNotToDto.class);
			return list.size();
		}
		
		/**
		 * 根据时间与姓名查询Wait-List订单列表
		 * @param date				时间
		 * @param name				姓名
		 * @param hotelGroupId		集团Id
		 * @param hotelId			酒店Id
		 * @return	list<Map>			object结果列表
		 * @author Cairo
		 * @serialData 2011-03-03
		 * @modify Cairo
		 * @modifyDate 2015-02-08
		 */
		@SuppressWarnings("rawtypes")
		@Override
		public List<Map> findWaitListMaster(Date date,String name,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select a.id as id,a.rsv_id AS resrvId,a.rsv_class AS rsvClass,a.rsv_no AS rsvNo,a.crs_no AS crsNo,b.name as name,");
			sh.appendSql(" b.profile_id as profileId,c.rmtype as rmtype, c.rmnum as rmNum, a.rmno as rmNo,a.adult as adult, ");
			sh.appendSql(" c.real_rate as realRate,c.rsv_arr_date as arr,c.rsv_dep_date as dep, a.sta as sta,");
			sh.appendSql(" a.company_id AS companyId,a.agent_id AS agentId,a.source_id AS sourceId, ");
			sh.appendSql(" b.phone,b.fax,b.vip,b.nation,a.remark, ");
			sh.appendSql(" IFNULL(d.descript,a.market) as market, ");
			sh.appendSql(" IFNULL(e.descript,a.src) as src, ");
			sh.appendSql(" IFNULL(f.descript,a.channel) as channel, ");
			sh.appendSql("a.biz_date as bizDate,b.profile_id AS guestId " );
			sh.appendSql(" FROM master_base as a  ");
			sh.appendSql(" JOIN master_guest as b ");
			sh.appendSql("   ON a.id = b.id AND b.hotel_group_id = ? AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" JOIN rsv_src_wait_list as c ");
			sh.appendSql("   ON a.id = c.accnt AND c.hotel_group_id = ? AND c.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" LEFT JOIN code_base as d ON d.hotel_group_id = ? ");
			sh.appendSql("    AND d.hotel_id = ? AND d.code = a.market AND d.parent_code = 'market_code' ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" LEFT JOIN code_base as e ON e.hotel_group_id = ? ");
			sh.appendSql("    AND e.hotel_id = ? AND e.code = a.src AND e.parent_code = 'src_code' ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" LEFT JOIN code_base as f ON f.hotel_group_id = ? ");
			sh.appendSql("    AND f.hotel_id = ? AND f.code = a.channel AND f.parent_code = 'channel' ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" where a.rsv_class IN('F','G') AND a.is_resrv = 'T' AND a.rsv_id = a.id AND a.sta = 'W' ");
			if(date != null){
				sh.appendSql("  AND DATE(a.arr) <= ? ");
				sh.insertValue(date);
			}
			sh.appendSql("and a.hotel_group_id = ? and a.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(isNotNull(name)){
				sh.appendSql(" and b.name like '"+name+"%'");
			}
			return findByNativeSQL(sh,Map.class);
		}
		
		public String getIsSureRate(Long masterId,Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper("select obj.isSureRate from MasterBase obj where 1=1");
			if(masterId!=null){
				sh.appendSql(" and obj.masterId = ? ");
				sh.insertValue(masterId);
			}
			if (hotelId!= null) {
				sh.appendSql(" AND obj.hotelId = ? ");
				sh.insertValue(hotelId);
			}
			if (hotelGroupId != null) {
				sh.appendSql(" AND obj.hotelGroupId = ? ");
				sh.insertValue(hotelGroupId);
			}
			return (String)this.find(sh).get(0);
		}
		
		public void setSureRate(Long masterId,String isSureRate,Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper("update MasterBase  set isSureRate = ? where 1=1 ");
			sh.insertValue(isSureRate);
			sh.appendSql(" and masterId = ? ");
			sh.insertValue(masterId);
			if (hotelId!= null) {
				sh.appendSql(" AND hotelId = ? ");
				sh.insertValue(hotelId);
			}
			if (hotelGroupId != null) {
				sh.appendSql(" AND hotelGroupId = ? ");
				sh.insertValue(hotelGroupId);
			}
			this.bulkUpdate(sh);
		}
		
		@Override
		public int updateAllTmSta(Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("UPDATE MasterBase obj  SET obj.tmSta = obj.sta where obj.hotelGroupId=? AND obj.hotelId=? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return bulkUpdate(sh);
		}
       
		@Override
		public List<MasterBase> findMasterBase(Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper(" SELECT obj FROM MasterBase obj WHERE obj.hotelGroupId=? AND obj.hotelId=? AND (obj.rsvClass=? OR obj.rsvClass=?)   AND (obj.sta=? OR obj.sta=?) ORDER BY obj.masterId,obj.arr ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(MasterBase.RsvClass.F);
			sh.insertValue(MasterBase.RsvClass.D);
			sh.insertValue(MasterBase.Sta.R);
			sh.insertValue(MasterBase.Sta.I);
			return find(sh);
		}

		@Override
		public List<MasterBase> findPartTimeRoomByRoomNo(String roomno,
				Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1  ");
			sh.appendSql(" AND obj.rsvClass =?  and obj.rmno=? and obj.hotelGroupId=? AND obj.hotelId=? and obj.sta='I' ");
			sh.insertValue(MasterBase.RsvClass.D);
			sh.insertValue(roomno);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return find(sh);
		}
		
		/**
		 * 根据预订单Id或团队主单Id查询成员登记单列表
		 * @param resrvId				预订单Id(可选，没有请传null)
		 * @param grpAccnt				团队主单Id(可选，没有请传null)
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店Id
		 * @param stas					状态集合(可选，多个状态请使用逗号","分隔)
		 * @return Integer				
		 * @author Cairo
		 * @date 2011-03-28
		 * @modify Cairo
		 * @modifyDate 2013-06-08
		 */
		@Override
		public Integer findMasterBaseSizeByResrvIdOrGrpAccnt(Long resrvId,
				Long grpAccnt,Long hotelGroupId,Long hotelId,String stas){
			SQLHelper sh = new SQLHelper();
	  	  	sh.appendSql(" SELECT count(1) as num ");
	  	  	sh.appendSql(" FROM master_base  ");
	  	  	sh.appendSql(" WHERE hotel_group_id = ?  ");
	  	  	sh.appendSql("     AND hotel_id = ? ");
	  	  	sh.insertValue(hotelGroupId);
	  	  	sh.insertValue(hotelId);
	  	  	sh.appendSql("     AND rsv_class = 'F' ");
	  	    sh.appendSql("     AND id <> rsv_id   ");
	  	  	if(resrvId != null){
	  	  		sh.appendSql(" AND rsv_id = ? ");
	  	  		sh.insertValue(resrvId);
	  	  	}
	  	  	if(grpAccnt != null){
	  	  		sh.appendSql("  AND grp_accnt = ? ");
	  	  		sh.insertValue(grpAccnt);
	  	  	}
	  	  	if(isNotNull(stas)){
	  	  		sh.appendOrSql(" OR sta = ? ",stas.split(EntityConstant.COMMA));
	  	  	}
	  	  	return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
		}
		
		/**
		 * 根据登记单Id查询同住人数
		 * @param liveId				登记单同住ID
		 * @param rmNo					房号
		 * @param excludeMasterIds		需要排除的登记单ID
		 * @param hotelGroupId			集团Id
		 * @param hotelId				酒店ID
		 * @return Integer
		 * @author Cairo
		 * @serialData 2011-04-01
		 */
		@Override
		public Integer findMasterBaseLivePeopleSize(Long liveId,String rmNo,List<Long> excludeMasterIds,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT COUNT(1) FROM master_base ");
			sh.appendSql("WHERE sta = 'I' AND id <> rsv_id ");
			sh.appendSql("   AND rsv_class IN ('F','D')    ");
			sh.appendSql("   AND hotel_group_id = ?        ");
			sh.appendSql("   AND hotel_id = ?              ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(liveId != null && !liveId.equals(0l)){
				sh.appendSql(" AND master_id = ? ");
				sh.insertValue(liveId);
			}
			if(isNotNull(rmNo)){
				sh.appendSql(" AND rmno = ? ");
				sh.insertValue(rmNo);
			}
			// 新增排除登记单ID条件，用于换房操作判断是否有其他不同步处理登记单
			if(excludeMasterIds != null && !excludeMasterIds.isEmpty()){
				for(int i=0;i<excludeMasterIds.size();i++){
					if(excludeMasterIds.get(i) != null){
						sh.appendSql(" AND id <> ? ");
						sh.insertValue(excludeMasterIds.get(i));
					}
				}
			}
			return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
		}
		
		/**
		 * 根据房号查询相关登记单信息列表
		 * @param arrDate			到日
		 * @param depDate			离日
		 * @param rmNo				房号
		 * @param rsvClass 			登记单类型
		 * @param stas				登记单状态(多个状态使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return	List<MasterRoomDto>
		 * @author Cairo
		 * @serialData 2011-10-25
		 */
		@Override
		public List<MasterLinkDto> findMasterByRoomNo(Date arrDate,Date depDate,String rmNo,
				String rsvClass,String sta,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	  SELECT                                ");
			sh.appendSql("	  a.id              id,                 ");
			sh.appendSql("    a.rsv_id       AS resrvId,            ");
			sh.appendSql("	  a.rsv_class       rsvClass,           ");
			sh.appendSql("	  'I'         		flag,             	");
			sh.appendSql("	  b.name            `name`,             ");
			sh.appendSql("	  b.name_combine    nameCombine,        ");
			sh.appendSql("	  b.sex				sex,				");
			sh.appendSql("	  a.sta             sta,                ");
			sh.appendSql("	  a.ratecode		rateCode,			");
			sh.appendSql("	  a.rmtype          rmType,             ");
			sh.appendSql("	  a.rmnum           rmNum,              ");
			sh.appendSql("	  a.rmno            rmNo,               ");
			sh.appendSql("	  a.rmno_son        rmnoSon,            ");
			sh.appendSql("	  (a.adult+a.children)    adultNum,     ");
			sh.appendSql("	  a.adult           adult,  			");
			sh.appendSql("	  a.children		children,  			");
			sh.appendSql("	  a.arr             arr,                ");
			sh.appendSql("	  a.dep             dep,                ");
			sh.appendSql("	  DATEDIFF(a.dep,a.arr)    dayNum,      ");
			sh.appendSql("	  a.real_rate       realRate,           ");
			sh.appendSql("	  a.packages        packages,           ");
			sh.appendSql("    a.charge          charge,            	");
			sh.appendSql("    a.pay             pay,               	");
			sh.appendSql("	  (a.charge - a.pay)    balance,        ");
			sh.appendSql("	  a.credit          credit,             ");
			sh.appendSql("	  a.market          market,             ");
			sh.appendSql("	  a.rsv_no          rsvNo,              ");
			sh.appendSql("	  a.master_id       masterId,         	");
			sh.appendSql("    a.amenities		amenities,          ");
			sh.appendSql("    a.remark		    remark,             ");
			sh.appendSql("	  a.link_id         linkId,             ");
			sh.appendSql("	  a.pkg_link_id     pkgLinkId,          ");
			sh.appendSql("	  0				    rsvId,           	");
			sh.appendSql("    b.vip				vip,				");
			sh.appendSql("	  b.profile_id		profileId,			");
			sh.appendSql("	  b.profile_type	profileType,		");
			sh.appendSql("	  a.is_fix_rmno		isFixRmno,			");
			sh.appendSql("	  a.is_owner		isOwner				");
			sh.appendSql("	  FROM master_base a,              		");
			sh.appendSql("	  master_guest b WHERE a.id = b.id AND a.id <> a.rsv_id AND a.rsv_class IN ('F','D') ");
			sh.appendSql(" AND a.hotel_id = ? AND a.hotel_group_id = ?");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			sh.appendSql(" AND b.hotel_id = ? AND b.hotel_group_id = ?");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			if(isNotNull(rsvClass)){
				sh.appendSql(" AND a.rsv_class = ? ");
				sh.insertValue(rsvClass);
			}
			if(isNotNull(rmNo)){
				sh.appendSql(" AND a.rmno = ? ");
				sh.insertValue(rmNo);
			}
			if(isNotNull(sta)){
				sh.appendOrSql(" OR a.sta = ? ",sta.split(","));
			}else{
				sh.appendSql(" AND a.sta = 'I' ");
			}
			if(arrDate != null && depDate != null){
				arrDate = DateHelper.shortDate(arrDate);
				depDate = DateHelper.shortDate(depDate);
				sh.appendSql(" AND ((DATE(a.arr) <= ?  ");
				sh.insertValue(arrDate);
				sh.appendSql("   AND DATE(a.dep) >= ? ) ");
				sh.insertValue(arrDate);
				sh.appendSql(" OR(DATE(a.arr) <= ?     ");
				sh.insertValue(depDate);
				sh.appendSql("   AND DATE(a.dep) >= ? ) ");
				sh.insertValue(depDate);
				sh.appendSql(" OR(DATE(a.arr) <= ?     ");
				sh.insertValue(arrDate);
				sh.appendSql("   AND DATE(a.dep) >= ? ) ");
				sh.insertValue(depDate);
				sh.appendSql(" OR(DATE(a.arr) >= ?     ");
				sh.insertValue(arrDate);
				sh.appendSql(" 	 AND DATE(a.dep) <= ? ))");
				sh.insertValue(depDate);
			}
			//次方法用于R状态登记单房态图拖拽换房，此排序勿删
			sh.appendSql(" ORDER BY a.arr ");
			return findByNativeSQL(sh,MasterLinkDto.class);
		}
		/***
		 * 
		 * @param rmNo
		 * @param hotelGroupId
		 * @param hotelId
		 * @return List<VolumnMasterLinkDto>
		 * @author zjw
		 * @serialData 2011-9-2
		 */
		public List<VolumnMasterLinkDto> findLinkIdByRoomNo(String rmNo,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select a.rmno       rmno,   ");
			sh.appendSql("b.name              name,   ");
			sh.appendSql("a.id                id,     ");
			sh.appendSql("a.link_id           linkId, ");
			sh.appendSql("a.sta sta ");
			sh.appendSql("FROM master_base a,");
			sh.appendSql("  master_guest b ");
			sh.appendSql("WHERE a.hotel_id = ?  ");
			sh.appendSql("AND  b.hotel_id = ?  ");
			sh.insertValue(hotelId);
			sh.insertValue(hotelId);
			sh.appendSql("AND  a.hotel_group_id = ?  ");
			sh.appendSql("AND  b.hotel_group_id = ?  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelGroupId);
			sh.appendSql("AND a.id = b.id AND a.rmno<>'' and a.sta='I' ");
			sh.appendSql("AND ( a.link_id IN ");
			sh.appendSql("(select     ");
			sh.appendSql(" link_id ");
			sh.appendSql(" FROM master_base ");
			sh.appendSql("WHERE hotel_id = ?  ");
			sh.insertValue(hotelId);
			sh.appendSql("AND  hotel_group_id = ?  ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("AND  sta='I'   ");
			sh.appendSql("AND  rmno IN   ");
			sh.appendSql("( ");
			String[] rmArray = rmNo.split(",");
			for (int i=0;i<rmArray.length;i++) {
				if(i>0){
					sh.appendSql(",");
				}
				sh.appendSql("?");
				sh.insertValue(rmArray[i]);
			}
			sh.appendSql(" ) ");
			sh.appendSql(" )  ");
			sh.appendSql(" OR (sta = 'I' AND rmno IN (");
			for (int i=0;i<rmArray.length;i++) {
				if(i>0){
					sh.appendSql(",");
				}
				sh.appendSql("?");
				sh.insertValue(rmArray[i]);
			}
			sh.appendSql(" ) ");
			sh.appendSql(" )  ");
			sh.appendSql(" )  ");
			sh.appendSql(" ORDER BY linkId,rmno  ");
			
			return findByNativeSQL(sh,VolumnMasterLinkDto.class);
		}
		
		/**
		 * 根据给定房号，查询是否该房号未来有预定
		 * @param roomNo				房号
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return Boolean
		 * @author Cairo
		 * @serialData 2011-04-14
		 */
		@Override
		public Boolean findRoomNoIsFuture(String roomNo,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select count(1) countNum from master_base a where (a.sta='R' or a.sta='I') and a.rmno = ? ");
			sh.insertValue(roomNo);
			sh.appendSql(" and a.arr > NOW() AND a.id <> a.rsv_id AND a.rsv_class = 'F' and a.hotel_group_id = ? and a.hotel_id = ?");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(Integer.parseInt(this.findByNativeSQL(sh).get(0)+"") > 0){
				return true;
			}
			return false;
		}
		
		/**
		 * 根据给定营业日期，查询登记单列表
		 * @param masterBase		登记对象
		 * @return List<MasterBase>
		 * @author Cairo
		 * @serialData 2011-04-18
		 */
		@Override
		public List<MasterBase> findMasterByBizDate(MasterBase masterBase){
			if(masterBase.getBizDate() == null || masterBase.getHotelGroupId() == null || masterBase.getHotelId() == null){
				//缺少必须的参数，返回空值。
				return null;
			}
			Date bizDate = masterBase.getBizDate();
			SQLHelper sh = new SQLHelper();			
			sh.appendSql("  select obj                                         ");
			sh.appendSql("  from  MasterBase obj where  obj.rsvClass = 'F' 	   ");
			sh.appendSql("  and  obj.sta = 'I'						            ");
			if(masterBase.getHotelGroupId()!= null){
	            sh.appendSql(" and  obj.hotelGroupId = ? ");
	            sh.insertValue(masterBase.getHotelGroupId());
	         }
	         if(masterBase.getHotelId()!= null){
	            sh.appendSql(" and obj.hotelId = ? ");
	            sh.insertValue(masterBase.getHotelId());
	         }
	        if(masterBase.getBizDate() != null){
				sh.appendSql(" and DATE(obj.arr) <= ? ");
				sh.insertValue(bizDate);
				sh.appendSql(" and DATE(obj.dep) > ? order by obj.id ");
				sh.insertValue(bizDate);
	        }
			return find(sh);
		}
		

		@Override
		public List<MasterBase> findAllMasterBase(Long hotelGroupId, Long hotelId) {
          SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE obj.hotelGroupId=? AND obj.hotelId=? ");
            sh.insertValue(hotelGroupId);
            sh.insertValue(hotelId);
			return find(sh);
		}
		
		/**
		 * 根据团队登记Id查询成员登记单列表
		 * @param masterGroupId			团队登记Id
		 * @param condition				查询条件（姓名，房号，预订人，预订号）
		 * @param hasResrv				是否包含预定成员
		 * @param hotelGroupId			集团Id
		 * @param hotelId				酒店Id
		 * @param firstResult			记录开始序号
		 * @param maxResults			结果集大小
		 * @return List<MasterLinkDto>
		 * @author Cairo
		 * @serialData 2011-03-14
		 */
		@Override
		public List<MasterLinkDto> findMasterByMasterGroupId(Long masterGroupId,String condition,Boolean hasResrv,
				Long hotelGroupId,Long hotelId,int firstResult ,int maxResults){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	  select  a.id      id,                 ");
			sh.appendSql("    a.rsv_id       	resrvId,            ");
			sh.appendSql("	  a.rsv_class       rsvClass,           ");
			sh.appendSql("	  'C'          		flag,               ");
			sh.appendSql("	  b.name            `name`,             ");
			sh.appendSql("	  b.name2		    nameCombine,        ");
			sh.appendSql("	  a.sta             sta,                ");
			sh.appendSql("	  a.ratecode		rateCode,			");
			sh.appendSql("	  a.rmtype          rmType,             ");
			sh.appendSql("	  a.rmnum           rmNum,              ");
			sh.appendSql("	  a.rmno            rmNo,               ");
			sh.appendSql("	  (a.adult+a.children)    adultNum,     ");
			sh.appendSql("	  a.adult           adult,  			");
			sh.appendSql("	  a.children		children,  			");
			sh.appendSql("	  a.arr             arr,                ");
			sh.appendSql("	  a.dep             dep,                ");
			sh.appendSql("	  DATEDIFF(a.dep,a.arr)    dayNum,      ");
			sh.appendSql("	  a.real_rate       realRate,           ");
			sh.appendSql("	  a.packages        packages,           ");
			sh.appendSql("	  a.specials        specials,           ");
			sh.appendSql("	  a.charge          charge,             ");
			sh.appendSql("	  a.pay             pay,                ");
			sh.appendSql("	  (a.charge - a.pay)    balance,        ");
			sh.appendSql("	  a.credit          credit,             ");
			sh.appendSql("	  a.market          market,             ");
			sh.appendSql("	  a.rsv_no          rsvNo,              ");
			sh.appendSql("	  a.master_id       masterId,           ");
			sh.appendSql("    a.amenities		amenities,          ");
			sh.appendSql("    a.remark		    remark,             ");
			sh.appendSql("	  a.link_id         linkId,             ");
			sh.appendSql("	  a.pkg_link_id     pkgLinkId,          ");
			sh.appendSql("	  c.id				rsvId,           	");
			sh.appendSql("	  b.vip 			vip,				");
			sh.appendSql("	  b.profile_id		profileId,			");
			sh.appendSql("	  b.profile_type	profileType			");
			sh.appendSql("	  from master_base a, master_guest b, rsv_src c	");
			sh.appendSql("	  where a.id = b.id and a.id = c.accnt and a.rsv_class = 'F' and c.occ_flag = 'MF'");
			sh.appendSql("	  and a.grp_accnt = ? and a.hotel_id = ? and a.hotel_group_id = ? ");
			sh.insertValue(masterGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			if(!"".equals(condition)){
				sh.appendSql(" and (b.name like ? or a.rmno like ? or a.credit_man like ? or a.credit_no like ? )");
				sh.insertValue("%"+condition+"%");
				sh.insertValue("%"+condition+"%");
				sh.insertValue("%"+condition+"%");
				sh.insertValue("%"+condition+"%");
			}
			if(!hasResrv){
				sh.appendSql(" and a.rsv_id <> ? ");
				sh.insertValue(masterGroupId);
			}
			sh.appendSql(" order by flag, sta, a.rmno,a.master_id, id ");
			if(firstResult >= 0){
				sh.setFirstResult(firstResult);
			}
			if(maxResults > 0){
				sh.setMaxResults(maxResults);
			}
			return this.findByNativeSQL(sh, MasterLinkDto.class);
		}
		
		/**
		 * 根据团队ID查询
		 * @param masterGroupId				团队登记单ID
		 * @param condition					条件
		 * @param stas						状态列表（多个状态间用“-”,忽略请传""）
		 * @param hotelGroupId				酒店ID
		 * @param hotelId					团队ID
		 * @return Integer
		 * @author Cairo
		 * @serialData 2011-04-25
		 */
		@Override
		public Integer findMasterCountByGroupId(Long masterGroupId,String condition,
				String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" select count(1) from master_base a ");
			sh.appendSql(" where a.grp_accnt = ? and a.rsv_class = 'F' ");
			sh.insertValue(masterGroupId);
			sh.appendSql(" and a.hotel_id = ? and a.hotel_group_id = ? ");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			if(!"".equals(condition)){
				sh.appendSql(" and (b.name like ? or a.rmno like ? or a.credit_man like ? or a.credit_no like ? )");
				sh.insertValue("%"+condition+"%");
				sh.insertValue("%"+condition+"%");
				sh.insertValue("%"+condition+"%");
				sh.insertValue("%"+condition+"%");
			}
			if(!"".equals(stas)){
				String[] arr = stas.split("-");
				sh.appendSql(" and ( 1=1 ");
				for(int i=0;i<arr.length;i++){
					if(!"".equals(arr[i])){
						sh.appendSql(" or a.sta = ? ");
						sh.insertValue(arr[i]);
					}
				}
				sh.appendSql(" ) "); 
			}
			return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
		}

		@Override
		public void updateMasterCreitById(Long id,String payCode,String limitAmt,String creditNo,String type) {
			SQLHelper sh = new SQLHelper();
			if(type.equals("A")){
				sh.appendSql("UPDATE ar_master     ");
				sh.appendSql("SET pay_code = ? , ");
				sh.insertValue(payCode);
				sh.appendSql("credit = ?  ");
				sh.insertValue(limitAmt);
				sh.appendSql("WHERE id = ?     ");
				sh.insertValue(id);
				bulkUpdateByNativeSQL(sh);	
			}else{
				sh.appendSql("UPDATE master_base     ");
				sh.appendSql("SET pay_code = ? , ");
				sh.insertValue(payCode);
				sh.appendSql("credit = ? , ");
				sh.insertValue(limitAmt);
				sh.appendSql("credit_no = ?  ");
				sh.insertValue(creditNo);
				sh.appendSql("WHERE id = ?     ");
				sh.insertValue(id);
				bulkUpdateByNativeSQL(sh);
			}
			
		}
		
		public List<MasterRoomClassDto> findMasterBaseByrmno(String rmno,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT 								"); 
			sh.appendSql("		b.id id,						");
			sh.appendSql("		b.hotel_group_id hotelGroupId,	");
			sh.appendSql("		b.hotel_id hotelId,				");
			sh.appendSql("		b.rsv_class rsvClass,			");
			sh.appendSql("		b.master_id masterId,			");
			sh.appendSql("		b.sta,							");
			sh.appendSql("		b.rmno,							");
			sh.appendSql("		b.rmno_son AS rmnoSon,          ");
			sh.appendSql("		b.arr,							");
			sh.appendSql("		b.dep,							");
			sh.appendSql("		b.ratecode rateCode,			");
			sh.appendSql("		b.nego_rate negoRate,			");
			sh.appendSql("		b.real_rate realRate,			");
			sh.appendSql("		b.rmtype rmtype,				");
			sh.appendSql("		b.packages packages,			");
			sh.appendSql("		b.is_fix_rmno isFixRmno,		");
			sh.appendSql("		'F' flag,						");
			sh.appendSql("		b.link_id linkId,				");
			sh.appendSql("		b.pkg_link_id pkgLinkId,		");
			sh.appendSql("		g.name guestName, 				");
			sh.appendSql("		(b.charge-b.pay) blance,		");
			sh.appendSql("		b.grp_accnt grpaccnt			");
			sh.appendSql("	FROM master_base b JOIN master_guest g	");
			sh.appendSql("	ON g.id = b.id 						");
			sh.appendSql("	WHERE (b.rsv_class = 'F' OR b.rsv_class = 'D') AND (b.sta ='I')	"); 
			sh.appendSql("	AND b.rmno = ?						");
			sh.insertValue(rmno);
			sh.appendSql("	AND b.hotel_group_id = ?			");
			sh.insertValue(hotelGroupId);
			sh.appendSql("	AND b.hotel_id = ?					");
			sh.insertValue(hotelId);
			sh.appendSql("	ORDER BY b.arr DESC					");
			return findByNativeSQL(sh, MasterRoomClassDto.class);
		}

		public List<RoomDayuseDefine> findRoomDayuseDefine(Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT obj FROM RoomDayuseDefine obj WHERE obj.isHalt='F' AND  obj.hotelGroupId= ? AND obj.hotelId = ?");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return find(sh);
		}
		
		/**
		 * 更新登记单房数及人数
		 * @param masterBaseId			登记单ID
		 * @param resrvBaseId			预订单Id
		 * @param rsvClass				预订单类型
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return void
		 * @author Cairo
		 * @serialData 2011-05-12
		 */
		public void updateMasterBaseRmNumAndAdult(Long masterBaseId,Long resrvBaseId,String rsvClass,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			//先计算成人人数
			sh.appendSql("  SELECT                                              ");
			sh.appendSql("  	(SELECT IFNULL(SUM(e.adult),0)       			");
			sh.appendSql("  	FROM master_base e                              ");
			sh.appendSql("  	WHERE e.rsv_class = 'F'                         ");
			sh.appendSql("  		AND e.grp_accnt = ?	                        ");
			sh.insertValue(masterBaseId);
			//判断预定号是否为0
			if(resrvBaseId != 0l){
				sh.appendSql("  		AND e.rsv_id = ?                        ");
				sh.insertValue(resrvBaseId);
				sh.appendSql("      ) +        						            ");
				sh.appendSql("  	(SELECT IFNULL(SUM(f.adult * f.rmnum),0)    ");
				sh.appendSql("  	FROM rsv_src f                              ");
				sh.appendSql("  	WHERE f.occ_flag = 'RG'                     ");
				sh.appendSql("  		AND f.accnt = ?                         ");
				sh.insertValue(resrvBaseId);
			}
			sh.appendSql("  )tempAdult											");
			Integer adult = Integer.parseInt(findByNativeSQL(sh).get(0)+"");
			sh.clear();
			
			//计算小孩人数                                                       "                             
			sh.appendSql("			SELECT IFNULL(SUM(g.children),0) children	");
			sh.appendSql("			FROM master_base g                     		");
			sh.appendSql("			WHERE g.rsv_class = 'F'                		");
			sh.appendSql("			AND g.grp_accnt = ?                 		");
			sh.insertValue(masterBaseId);
			Integer children = Integer.parseInt(findByNativeSQL(sh).get(0)+"");
			sh.clear();
			
			//更新房数及人数至团队登记单
			sh.appendSql("     UPDATE master_base a SET                         ");
			sh.appendSql("     a.rmnum = (SELECT                                ");
			sh.appendSql("     	(SELECT COUNT(1) FROM                           ");
			sh.appendSql("     		(SELECT DISTINCT c.rmno,c.master_id         ");
			sh.appendSql("     		FROM master_base c                          ");
			sh.appendSql("     		WHERE c.rsv_class = 'F'                     ");
			sh.appendSql("     		AND c.grp_accnt = ?                         ");
			sh.insertValue(masterBaseId);
			//判断预定号是否为0
			if(resrvBaseId != 0l){
				sh.appendSql("     		AND c.rsv_id = ?)                       ");
				sh.insertValue(resrvBaseId);
				sh.appendSql("     	temp) +                                     ");
				sh.appendSql("     	(SELECT IFNULL(SUM(d.rmnum),0)              ");
				sh.appendSql("     	 FROM rsv_src d                             ");
				sh.appendSql("     	 WHERE d.occ_flag = 'RG'                    ");
				sh.appendSql("     	 AND d.accnt = ?                            ");
				sh.insertValue(resrvBaseId);
			}else{
				sh.appendSql("  ) temp                ");
			}
			sh.appendSql("    ) rmNum),                                         ");
			sh.appendSql("     a.adult = ?,                                     ");
			sh.insertValue(adult);
			sh.appendSql("     a.children = ?                                   ");
			sh.insertValue(children);
			sh.appendSql("     WHERE a.id = ?	                                ");
			sh.insertValue(masterBaseId);
			sh.appendSql("     AND a.rsv_class = 'G'                            ");
			sh.appendSql("     AND a.hotel_group_id = ?                         ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("     AND a.hotel_id = ?                               ");
			sh.insertValue(hotelId);
			bulkUpdateByNativeSQL(sh);
		}

		/**
		 * 根据给定房号信息，查询对应登记单记录
		 * @param roomNo
		 * @pa
		 * @author Cairo
		 * @date 2013-10-14
		 */
		@Override
		public MasterBase findMasterAccntByRoomNo(String roomNo,Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj			 	   ");
			sh.appendSql(" FROM MasterBase AS obj 	   ");
			sh.appendSql(" WHERE obj.id <> obj.rsvId     ");
			sh.appendSql("     AND obj.rsvClass IN ('F','D') ");
			sh.appendSql("	   AND obj.hotelGroupId= ? ");
			sh.appendSql(" 	   AND obj.hotelId = ? 	   ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	   AND obj.sta = ? 		   ");
			sh.appendSql("	   AND obj.rmno = ?		   ");
			sh.insertValue(MasterBase.Sta.I);
			sh.insertValue(roomNo);
			sh.appendSql(" ORDER BY obj.realRate DESC,obj.id ");
			sh.setFirstResult(0);
			sh.setMaxResults(1);
			List<MasterBase> list =  find(sh);
			// 新增子房号兼容处理代码，避免传递的是rmnoSon导致的数据异常
			if(list.isEmpty()){
				if(!UserManager.checkHasVilla()){
					return null;
				}
				sh.clear();
				sh.appendSql(" SELECT obj			 	   ");
				sh.appendSql(" FROM MasterBase AS obj 	   ");
				sh.appendSql(" WHERE obj.id <> obj.rsvId     ");
				sh.appendSql("     AND obj.rsvClass IN ('F','D') ");
				sh.appendSql("	   AND obj.hotelGroupId= ? ");
				sh.appendSql(" 	   AND obj.hotelId = ? 	   ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql("	   AND obj.sta = ? 		   ");
				sh.appendSql("	   AND obj.rmnoSon = ?     ");
				sh.insertValue(MasterBase.Sta.I);
				sh.insertValue(roomNo);
				sh.appendSql(" ORDER BY obj.realRate DESC,obj.id ");
				sh.setFirstResult(0);
				sh.setMaxResults(1);
				list =  find(sh);
				if(list.isEmpty()){
					return null;
				}
			}
			return list.get(0);
		}

		@Override
		public List<Long> findMasterBase(Long hotelGroupId, Long hotelId, String rmno) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj.id  FROM MasterBase obj WHERE obj.hotelGroupId=? AND obj.hotelId=? AND obj.rmno=? AND obj.sta=? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(rmno);
			sh.insertValue(MasterBase.Sta.I);
			return find(sh);
		}
		//=====================================================================================
		//======================================王文华=======================================
		//====================================================================================
		@Override
		public MasterBase findGrpAccnt(Long resrvBaseId, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj FROM MasterBase obj WHERE obj.hotelGroupId=? AND obj.hotelId=? AND obj.rsvClass=?  AND obj.rsvId=?  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(MasterBase.RsvClass.G);
			sh.insertValue(resrvBaseId);
			List<MasterBase> masterBases = find(sh);
			if(masterBases.size()==0) {
				return null;
			}
			return masterBases.get(0);
		}
		@Override
		public void updateGrpAccntAuditNum(Long grpAccnt, Long hotelGroupId,Long hotelId){
//			MasterBase mb=findGrpAccnt(resrvBaseId, hotelGroupId, hotelId);
//			if (mb!=null){
			if (grpAccnt==0l){
				return;
			}
			MasterBase mb=load(grpAccnt);
				mb.setAdult(countMasterBaseByGrpAccnt(hotelGroupId, hotelId,grpAccnt, "I,S,O"));
				update(mb);				
//			}
		}

		@Override
		public List<MasterBase> findSampeMasterId(Long masterId, Long rmoccId, Long hotelGroupId, Long hotelId) {
            SQLHelper sh = new SQLHelper();
            sh.appendSql("SELECT obj FROM MasterBase obj WHERE obj.masterId=? AND obj.rmoccId=? AND obj.hotelGroupId=? AND obj.hotelId=? AND (obj.sta =? OR obj.sta=?) ORDER BY obj.arr ");
            sh.insertValue(masterId);
            sh.insertValue(rmoccId);
            sh.insertValue(hotelGroupId);
            sh.insertValue(hotelId);
            sh.insertValue(MasterBase.Sta.I);
            sh.insertValue(MasterBase.Sta.R);
			return find(sh);
		}

		@Override
		public List<RoomStaClassDto> findRoomStaClassDtoByRoomNo(String roomNo,Long hotelGroupId, Long hotelId) {
			String rmmapShowFutureResrv = sysOptionDao.findSysOptionByCatalogItemSetValue("house", "rmmap_show_future_resrv", hotelGroupId, hotelId);
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT * FROM (");
			sh.appendSql("	SELECT b.rsv_class rsvClass,   ");
			sh.appendSql("	  b.id           id,           ");
			sh.appendSql("	  b.rmno         rmno,         ");
			sh.appendSql("	  b.rmno_son     rmnoSon,      ");
			sh.appendSql("	  b.sta          sta,          ");
			sh.appendSql("	  b.arr          arr,          ");
			sh.appendSql("	  b.dep          dep,          ");
			sh.appendSql("	  b.market       market,       ");
			sh.appendSql("	  b.ratecode     rateCode,     ");
			sh.appendSql("	  b.real_rate    realRate,     ");
			sh.appendSql("	  b.credit       credit,       ");
			sh.appendSql("	  b.remark       remark,       ");
			sh.appendSql("	  ''             reason,       ");
			sh.appendSql("    ''             belongDept,   ");
			sh.appendSql("	  'F' 			 flag,         ");
			sh.appendSql("	  g.name         guestName,    ");
			sh.appendSql("	  (b.charge-b.pay) blance      ");
			sh.appendSql("	FROM master_base AS b,         ");
			sh.appendSql("	  master_guest AS g            ");
			sh.appendSql("	WHERE b.id = g.id              ");
			sh.appendSql("	    AND b.id <> b.rsv_id       ");
			sh.appendSql("	    AND (b.rsv_class = 'F'     ");
			sh.appendSql("	        OR b.rsv_class = 'D')  ");
			sh.appendSql("	    AND (b.sta = 'I'           ");
			sh.appendSql("	        OR (b.sta = 'R'        ");
			if("F".equals(rmmapShowFutureResrv)){
				sh.appendSql(" AND DATE(b.arr) <= ? ");
				sh.appendSql(" AND DATE(b.dep) >= ? ");
				sh.insertValue(DateUtil.parseDateNoTime((new Date())));
				sh.insertValue(DateUtil.parseDateNoTime((new Date())));
			}
			sh.appendSql("			))					   ");
			sh.appendSql("	    AND b.hotel_group_id= ?    ");
			sh.appendSql("	    AND b.hotel_id = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND b.rmno = ?  		   ");
			sh.insertValue(roomNo);
			if("T".equals(rmmapShowFutureResrv)){
				sh.appendSql("	UNION ALL									");
				sh.appendSql("	SELECT										");
				sh.appendSql("	  '-'			 rsvClass,					");
				sh.appendSql("	  b.id			 id,						");
				sh.appendSql("	  b.rmno		 rmno,						");
				sh.appendSql("	  '-'			 rmnoSon,					");
				sh.appendSql("	  b.chg_type	 sta,						");
				sh.appendSql("	  b.date_begin	 arr,						");
				sh.appendSql("	  b.date_end	 dep,						");
				sh.appendSql("	  '-'			 market,					");
				sh.appendSql("	  '-'			 rateCode,					");
				sh.appendSql("	  0.00			 realRate,					");
				sh.appendSql("	  0.00			 credit,					");
				sh.appendSql("	  b.remark       remark,	 				");
				sh.appendSql("	  CASE WHEN b.chg_type = 'OOO' OR b.chg_type = 'OS' THEN c1.descript WHEN b.chg_type = 'TMP' THEN c2.descript ELSE '' END reason,	");
				sh.appendSql("    CASE WHEN b.chg_type = 'TMP' THEN c2.belong_dept ELSE '' END belongDept, ");
				sh.appendSql("	  '-'		 	 flag,						");
				sh.appendSql("	  '-'		 	 guestName,					");
				sh.appendSql("	  0.00		 	 blance						");
				sh.appendSql("	FROM room_sta_chg b							");
				sh.appendSql("	LEFT JOIN code_base c1						");
				sh.appendSql("	  ON b.reason = c1.code						");
				sh.appendSql("	  AND c1.parent_code = 'ROOM_MAINT_REASON'	");
				sh.appendSql("	  AND c1.hotel_group_id = b.hotel_group_id	");
				sh.appendSql("	  AND c1.hotel_id = b.hotel_id				");
				sh.appendSql("	LEFT JOIN code_room_tmp c2					");
				sh.appendSql("	  ON b.chg_sta = c2.code					");
				sh.appendSql("	  AND c2.hotel_group_id = b.hotel_group_id	");
				sh.appendSql("	  AND c2.hotel_id = b.hotel_id				");
				sh.appendSql("	WHERE b.bill_sta = 'I' 						");
				sh.appendSql("	  AND b.hotel_group_id= ?					");
				sh.appendSql("	  AND b.hotel_id = ?						");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql("	  AND b.rmno = ?							");
				sh.insertValue(roomNo);
			}
			sh.appendSql(") T			   				   ");
			sh.appendSql("ORDER BY arr ASC			  	   ");
			return findByNativeSQL(sh, RoomStaClassDto.class);
		}
		
		/**
		 * 根据给定的大房号及子房号记录查询在住宾客信息
		 * @param parentCode		大房号
		 * @param rmnoSon			子房号
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<RoomStaClassDto>
		 * @author Cairo
		 * @date 2013-10-15
		 */
		@Override
		public List<RoomStaClassDto> findRoomStaClassDtoByParentRmnoAndRmnoSon(String parentCode,String rmnoSon,Long hotelGroupId, Long hotelId) {
			String rmmapShowFutureResrv = sysOptionDao.findSysOptionByCatalogItemSetValue("house", "rmmap_show_future_resrv", hotelGroupId, hotelId);
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT * FROM (");
			sh.appendSql("	SELECT b.rsv_class rsvClass,   ");
			sh.appendSql("	  b.id           id,           ");
			sh.appendSql("	  b.rmno         rmno,         ");
			sh.appendSql("	  b.rmno_son     rmnoSon,      ");
			sh.appendSql("	  b.sta          sta,          ");
			sh.appendSql("	  b.arr          arr,          ");
			sh.appendSql("	  b.dep          dep,          ");
			sh.appendSql("	  b.market       market,       ");
			sh.appendSql("	  b.ratecode     rateCode,     ");
			sh.appendSql("	  b.real_rate    realRate,     ");
			sh.appendSql("	  b.credit       credit,       ");
			sh.appendSql("	  b.remark       remark,       ");
			sh.appendSql("	  ''             reason,       ");
			sh.appendSql("    ''             belongDept,   ");
			sh.appendSql("	  'F' 			 flag,         ");
			sh.appendSql("	  g.name         guestName,    ");
			sh.appendSql("	  (b.charge-b.pay) blance      ");
			sh.appendSql("	FROM master_base AS b,         ");
			sh.appendSql("	  master_guest AS g            ");
			sh.appendSql("	WHERE b.id = g.id              ");
			sh.appendSql("	    AND b.id <> b.rsv_id       ");
			sh.appendSql("	    AND (b.rsv_class = 'F'     ");
			sh.appendSql("	        OR b.rsv_class = 'D')  ");
			sh.appendSql("	    AND (b.sta = 'I'           ");
			sh.appendSql("	        OR (b.sta = 'R'        ");
			if("F".equals(rmmapShowFutureResrv)){
				sh.appendSql(" AND DATE(b.arr) <= ? ");
				sh.appendSql(" AND DATE(b.dep) >= ? ");
				sh.insertValue(DateUtil.parseDateNoTime((new Date())));
				sh.insertValue(DateUtil.parseDateNoTime((new Date())));
			}
			sh.appendSql("			))					   ");
			sh.appendSql("	    AND b.hotel_group_id= ?    ");
			sh.appendSql("	    AND b.hotel_id = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(isNotNull(parentCode)){
				sh.appendSql("	    AND b.rmno = ?  ");
				sh.insertValue(parentCode);
			}
			sh.appendSql("      AND b.rmno_son = ? ");
			sh.insertValue(rmnoSon);
			if("T".equals(rmmapShowFutureResrv)){
				sh.appendSql("	UNION ALL									");
				sh.appendSql("	SELECT										");
				sh.appendSql("	  '-'			 rsvClass,					");
				sh.appendSql("	  b.id			 id,						");
				sh.appendSql("	  b.rmno		 rmno,						");
				sh.appendSql("	  '-'			 rmnoSon,					");
				sh.appendSql("	  b.chg_type	 sta,						");
				sh.appendSql("	  b.date_begin	 arr,						");
				sh.appendSql("	  b.date_end	 dep,						");
				sh.appendSql("	  '-'			 market,					");
				sh.appendSql("	  '-'			 rateCode,					");
				sh.appendSql("	  0.00			 realRate,					");
				sh.appendSql("	  0.00			 credit,					");
				sh.appendSql("	  b.remark       remark,	 				");
				sh.appendSql("	  CASE WHEN b.chg_type = 'OOO' OR b.chg_type = 'OS' THEN c1.descript WHEN b.chg_type='TMP' THEN c2.descript END reason,	");
				sh.appendSql("    CASE WHEN b.chg_type = 'TMP' THEN c2.belong_dept ELSE '' END belongDept, ");
				sh.appendSql("	  '-'		 	 flag,						");
				sh.appendSql("	  '-'		 	 guestName,					");
				sh.appendSql("	  0.00		 	 blance						");
				sh.appendSql("	FROM room_sta_chg b							");
				sh.appendSql("	LEFT JOIN code_base c1						");
				sh.appendSql("	  ON b.reason = c1.code						");
				sh.appendSql("	  AND c1.parent_code = 'ROOM_MAINT_REASON'	");
				sh.appendSql("	  AND c1.hotel_group_id = b.hotel_group_id	");
				sh.appendSql("	  AND c1.hotel_id = b.hotel_id				");
				sh.appendSql("	LEFT JOIN code_room_tmp c2					");
				sh.appendSql("	  ON b.chg_sta = c2.code					");
				sh.appendSql("	  AND c2.hotel_group_id = b.hotel_group_id	");
				sh.appendSql("	  AND c2.hotel_id = b.hotel_id				");
				sh.appendSql("	WHERE b.bill_sta = 'I' 						");
				sh.appendSql("	  AND b.hotel_group_id= ?					");
				sh.appendSql("	  AND b.hotel_id = ?						");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql("	  AND b.rmno = ?							");
				sh.insertValue(rmnoSon);
			}
			sh.appendSql(") T			   				   ");
			sh.appendSql("	ORDER BY arr ASC			   ");
			return findByNativeSQL(sh, RoomStaClassDto.class);
		}
		
		@Override
		public MasterBase findMasterBaseByResrvBaseId(Long resrvBaseId, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			 sh.appendSql("SELECT obj FROM MasterBase obj WHERE obj.rsvId=? AND obj.id <> ? AND obj.rsvClass = 'F' AND obj.hotelGroupId=? AND obj.hotelId=? AND (obj.sta =? OR obj.sta=?) ");
			    sh.insertValue(resrvBaseId);
			    sh.insertValue(resrvBaseId);
	            sh.insertValue(hotelGroupId);
	            sh.insertValue(hotelId);
	            sh.insertValue(MasterBase.Sta.I);
	            sh.insertValue(MasterBase.Sta.R);
			 List<MasterBase> masterBases= find(sh);
			 if(masterBases.isEmpty()) {
				 return null;
			 }
			return masterBases.get(0);
		}

		@SuppressWarnings("rawtypes")
		@Override
		public List<Map> findShareByMasterBaseId(Long id ,Long masterBaseId, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT a.id,a.rmno rmNo,a.rmno_son AS rmnoSon,b.name,a.arr,a.dep,a.real_rate as realRate,a.remark,a.is_fix_rmno isFixRmno,true selected FROM master_base a LEFT JOIN  master_guest b  ");
            sh.appendSql(" ON a.id=b.id AND a.hotel_group_id=b.hotel_group_id AND a.hotel_id=b.hotel_id ");
            sh.appendSql(" WHERE a.rsv_class <> 'H' AND a.rsv_class <> 'G' AND a.id <> a.rsv_id AND a.master_id=? AND a.id<>?  AND (a.sta=? OR a.sta=?) AND a.hotel_group_id=? AND a.hotel_id=? ");
            sh.insertValue(masterBaseId);
            sh.insertValue(id);
            sh.insertValue(MasterBase.Sta.I);
            sh.insertValue(MasterBase.Sta.R);
            sh.insertValue(hotelGroupId);
            sh.insertValue(hotelId);
			return findByNativeSQL(sh, Map.class);
		}
		
		@Override
		public List<MasterBase> findMasterBaseByRsvSrc(Long rsvsrcId,
				Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			 sh.appendSql("SELECT obj FROM MasterBase obj WHERE obj.rsvSrcId=?  AND obj.hotelGroupId=? AND obj.hotelId=?  ");
			    sh.insertValue(rsvsrcId);
	            sh.insertValue(hotelGroupId);
	            sh.insertValue(hotelId);
	            
			 List<MasterBase> masterBases= find(sh);
			 
			return masterBases;
		}

		@Override
		public MasterContinueStayDto findMasterContinueStaySelf(
				Long masterBaseId, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT a.id,b.name,a.arr,a.dep ,a.dep depn ,a.ratecode,a.ratecode oldRatecode,a.rmtype,a.rmno FROM master_base a ,master_guest b WHERE a.id=b.id  ");
			sh.appendSql("	AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id =b.hotel_id AND a.id=? AND a.hotel_group_id=? AND a.hotel_id=? AND a.sta=?   ");
			sh.insertValue(masterBaseId);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(MasterBase.Sta.I);
			List<MasterContinueStayDto> masterContinueStayDtos = findByNativeSQL(sh, MasterContinueStayDto.class);
			if(masterContinueStayDtos.isEmpty()){
			  return null;
			}else{
			  return	masterContinueStayDtos.get(0);
			}
		}

		@Override
		public List<MasterContinueStayDto> findMasterContinueStayShare(
				Long masterBaseId, Long masterId, Long hotelGroupId,
				Long hotelId) {
			SQLHelper sh =new SQLHelper();
				sh.appendSql(" SELECT a.id,b.name,a.arr,a.dep ,a.dep depn ,a.ratecode,a.ratecode oldRatecode,a.rmtype,a.rmno FROM master_base a ,master_guest b WHERE a.id=b.id  ");
				sh.appendSql(" AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id =b.hotel_id AND a.id<>? AND a.id <> a.rsv_id AND a.rsv_class = 'F' AND a.master_id=? AND a.hotel_group_id=? AND a.hotel_id=? ");
				sh.insertValue(masterBaseId);
				sh.insertValue(masterId);
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql(" AND a.sta=?  AND a.rsv_class=? ");
				sh.insertValue(MasterBase.Sta.I);
				sh.insertValue(MasterBase.RsvClass.F);
			return findByNativeSQL(sh, MasterContinueStayDto.class);
		}
		@Override
		public List<MasterContinueStayDto> findMasterContinueStayShare(
				Long masterBaseId, Long masterId, Long linkId,
				Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT a.id,b.name,a.arr,a.dep ,a.dep depn ,a.ratecode,a.ratecode oldRatecode,a.rmtype,a.rmno FROM master_base a ,master_guest b WHERE a.id=b.id  ");
			sh.appendSql(" AND a.hotel_group_id = b.hotel_group_id AND a.hotel_id =b.hotel_id AND a.id<>? AND a.id<>a.rsv_id AND a.rsv_class = 'F' AND a.master_id<>? AND a.link_id IS NOT NULL AND a.link_id<>0 AND a.link_id=? AND a.hotel_group_id=? AND a.hotel_id=? ");
			sh.insertValue(masterBaseId);
			sh.insertValue(masterId);
			sh.insertValue(linkId);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	AND a.sta=?  AND a.rsv_class=? ORDER BY master_id ");
			sh.insertValue(MasterBase.Sta.I);
			sh.insertValue(MasterBase.RsvClass.F);
	    	return findByNativeSQL(sh, MasterContinueStayDto.class);
		}

		@Override
		public void updateRoomStautsDep(String type,String rmno,Long hotelGroupId, Long hotelId) {
			if(type.equals("cleanAll")){
				SQLHelper shi = new SQLHelper();
				shi.appendSql("	DELETE FROM room_temporary ");
				shi.appendSql(" WHERE hotel_group_id=? AND hotel_id=? ");
				shi.insertValue(hotelGroupId);
				shi.insertValue(hotelId);
				bulkUpdateByNativeSQL(shi);
			}
			RoomTemporary roomTemporary = new RoomTemporary();
			roomTemporary.setRoom(rmno);
			roomTemporary.setType(type);
			roomTemporary.setTag("0");
			roomTemporary.setCreateTime(new Date());
			roomTemporary.setUpdateTime(DateUtil.addYears(new Date(), -1));
			roomTemporary.setHotelGroupId(hotelGroupId);
			if(hotelId != null && hotelId != 0l)
				roomTemporary.setHotelId(hotelId);
			save(roomTemporary);
		}
		
		
		
		@Override 
		public void deleteMasterAudit(Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper("Delete from  master_audit where hotel_id = ? and hotel_group_id = ? ");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			this.bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * 查询符合条件的R状态成员登记单记录
		 * 注意：此方法用于R状态成员登记单夜审转储过程，其他位置请慎用！
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<MasterBase>
		 * @author Cairo
		 * @date 2013-06-25
		 */
		@Override
		public List<MasterBase> findMasterBaseByBizDate(Date bizDate,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj FROM MasterBase AS obj ");
			sh.appendSql(" WHERE obj.hotelGroupId = ? ");
			sh.appendSql("    AND obj.hotelId = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("    AND obj.rsvClass = ?    ");
			sh.appendSql("    AND obj.sta = ?         ");
			sh.insertValue(MasterBase.RsvClass.F);
			sh.insertValue(MasterBase.Sta.R);
			sh.appendSql("    AND obj.id <> obj.rsvId ");
			sh.appendSql("    AND ADDDATE(DATE(obj.arr),1) <= ? ");
			sh.insertValue(bizDate);
			return find(sh);
		}
		
		/**
		 * 夜审时当前夜审主单数据需要移到临时表
		 * 1、确定要转储的登记单主单
		 * 2、确定要NoShow处理的预订主单
		 * @param type			转储类型 (RESRV:预订;MASTER:登记)
		 * @param bizDate		营业日期
		 * @param hotelId		酒店ID
		 * @param hotelGroupId	集团ID
		 * @author Cairo
		 */
		@Override 
		public void saveMasterBaseToAuditData(String type,Date bizDate,Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" INSERT INTO master_audit ");
			sh.appendSql("	   (hotel_group_id, hotel_id, id, rsv_id,is_resrv, rsv_man,             ");
			sh.appendSql("		rsv_company, mobile, group_code, group_manager, parent_id, rsv_src_id,        ");
			sh.appendSql("		master_rsvsrc_id, rsv_class, master_id, grp_accnt, grp_flag,         ");
			sh.appendSql("		block_id, biz_date, sta, rmtype, rmno,rmno_son, rmnum, arr,         ");
			sh.appendSql("		dep, cutoff_days, cutoff_date, adult, children, res_sta,   ");
			sh.appendSql("		res_dep,up_rmtype,up_reason,up_user, rack_rate, nego_rate, real_rate, dsc_reason,      ");
			sh.appendSql("		dsc_amount, dsc_percent, exp_sta, tm_sta, rmpost_sta,      ");
			sh.appendSql("		is_rmposted, tag0, company_id, agent_id, source_id,        ");
			sh.appendSql("		member_type, member_no, inner_card_id, salesman, arno,     ");
			sh.appendSql("		building, src, market, rsv_type, channel, sales_channel,   ");
			sh.appendSql("		ratecode, ratecode_category, cmscode, packages, specials,  ");
			sh.appendSql("		amenities, is_fix_rate, is_fix_rmno, is_sure, is_permanent,"); 
			sh.appendSql("		is_walkin, is_secret, is_secret_rate, posting_flag,        ");
			sh.appendSql("		sc_flag, extra_flag, extra_bed_num, extra_bed_rate,        ");
			sh.appendSql("		crib_num, crib_rate, pay_code, limit_amt, credit_no,       ");
			sh.appendSql("		credit_man, credit_company, charge, pay, credit,           ");
			sh.appendSql("		last_num, last_num_link, rmocc_id, link_id, pkg_link_id,   ");
			sh.appendSql("		rsv_no, crs_no, where_from, where_to, purpose, remark,     ");
			sh.appendSql("		co_msg, is_send, promotion, create_user, create_datetime,  ");
			sh.appendSql("		modify_user, modify_datetime, sta_ebooking, is_owner, owner_id )               ");
			sh.appendSql(" (SELECT m.hotel_group_id, m.hotel_id, m.id, m.rsv_id,is_resrv, m.rsv_man,");
			sh.appendSql("		m.rsv_company, m.mobile, m.group_code, m.group_manager, m.parent_id, m.rsv_src_id,        ");
			sh.appendSql("		m.master_rsvsrc_id, m.rsv_class, m.master_id, m.grp_accnt, m.grp_flag,         ");
			sh.appendSql("		m.block_id, m.biz_date, m.sta, m.rmtype, m.rmno,m.rmno_son, m.rmnum, m.arr,");
			sh.appendSql("		m.dep, m.cutoff_days, m.cutoff_date, m.adult, m.children, m.res_sta, ");
			sh.appendSql("		m.res_dep,m.up_rmtype,m.up_reason,m.up_user, m.rack_rate, m.nego_rate, m.real_rate, m.dsc_reason,      ");
			sh.appendSql("		m.dsc_amount, m.dsc_percent, m.exp_sta, m.tm_sta, m.rmpost_sta,      ");
			sh.appendSql("		m.is_rmposted, m.tag0, m.company_id, m.agent_id, m.source_id,        ");
			sh.appendSql("		m.member_type, m.member_no, m.inner_card_id, m.salesman, m.arno,     ");
			sh.appendSql("		m.building, m.src, m.market, m.rsv_type, m.channel, m.sales_channel, ");
			sh.appendSql("		m.ratecode, m.ratecode_category, m.cmscode, m.packages, m.specials,  ");
			sh.appendSql("		m.amenities, m.is_fix_rate, m.is_fix_rmno, m.is_sure, m.is_permanent,"); 
			sh.appendSql("		m.is_walkin, m.is_secret, m.is_secret_rate, m.posting_flag,        ");
			sh.appendSql("		m.sc_flag, m.extra_flag, m.extra_bed_num, m.extra_bed_rate,        ");
			sh.appendSql("		m.crib_num, m.crib_rate, m.pay_code, m.limit_amt, m.credit_no,       ");
			sh.appendSql("		m.credit_man, m.credit_company, m.charge, m.pay, m.credit,           ");
			sh.appendSql("		m.last_num, m.last_num_link, m.rmocc_id, m.link_id, m.pkg_link_id,   ");
			sh.appendSql("		m.rsv_no, m.crs_no, m.where_from, m.where_to, m.purpose, m.remark,   ");
			sh.appendSql("		m.co_msg, m.is_send, m.promotion, m.create_user, m.create_datetime,  ");
			sh.appendSql("		m.modify_user, m.modify_datetime, m.sta_ebooking, m.is_owner, m.owner_id                ");
			sh.appendSql(" FROM master_base m WHERE 1=1  ");
			if("MASTER".equals(type)){
				String masterToHistoryModel = sysOptionDao.findSysOptionByCatalogItem("reserve", 
						"master_to_history_model", hotelGroupId, hotelId).getSetValue().trim();
				if(!isNotNull(masterToHistoryModel)){
					masterToHistoryModel = "0";
				}
				sh.appendSql(" AND m.sta IN ('O','D','X','N')      ");
				sh.appendSql(" AND m.id <> m.rsv_id  ");
				sh.appendSql(" AND m.charge = m.pay  ");
				sh.appendSql(" AND m.credit = 0      ");
				sh.appendSql(" AND DATE(m.dep) < ?   ");
				sh.insertValue(DateUtil.addDays(bizDate,-1));
				sh.appendSql(" AND NOT EXISTS(SELECT 1 FROM account b ");	// 排除有效账务
		        sh.appendSql("   WHERE b.hotel_group_id = ? ");
		        sh.appendSql("       AND b.hotel_id = ?     ");
		        sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
		        sh.appendSql("       AND b.close_flag = ''  ");
		        sh.appendSql("       AND b.accnt = m.id)    ");
		        sh.appendSql("      AND NOT EXISTS (SELECT 1 FROM catering ");// 排除有效会议室预订
				sh.appendSql("         WHERE hotel_group_id = ? ");
				sh.appendSql("             AND hotel_id = ?     ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql("             AND rsv_type IN ('F','G') ");
				sh.appendSql("             AND sta = 'I'        ");
				sh.appendSql("             AND rsv_id = m.id)   ");
		        if("1".equals(masterToHistoryModel)){
					sh.appendSql(" AND NOT EXISTS(SELECT 1 FROM master_base ");	// 排除有效同住记录
					sh.appendSql("	  WHERE hotel_group_id = ?         ");
					sh.appendSql("	      AND hotel_id = ?             ");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					sh.appendSql("	      AND rsv_class IN ('F','D')   ");
					sh.appendSql("	      AND (charge <> pay           ");
					sh.appendSql("	         OR credit > 0             ");
					sh.appendSql("	         OR sta IN('R','I','S')    ");
					sh.appendSql("	         OR dep > ?)               ");
					sh.insertValue(bizDate);
					sh.appendSql("	      AND id <> rsv_id  ");
					sh.appendSql("	      AND master_id = m.master_id  ");
					sh.appendSql("	      AND id <> m.id )             ");
					sh.appendSql(" AND NOT EXISTS(SELECT 1 FROM master_base ");// 排除有效联房记录
					sh.appendSql("    WHERE hotel_group_id = ?         ");
					sh.appendSql("        AND hotel_id = ?             ");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					sh.appendSql("	      AND rsv_class <> 'G'         ");
					sh.appendSql("	      AND (charge <> pay           ");
					sh.appendSql("	         OR credit > 0             ");
					sh.appendSql("	         OR sta IN('R','I','S')    ");
					sh.appendSql("	         OR dep > ? )              ");
					sh.insertValue(bizDate);
					sh.appendSql("	      AND link_id = m.link_id      ");
					sh.appendSql("	      AND id <> rsv_id  ");
					sh.appendSql("	      AND id <> m.id )             ");
					sh.appendSql(" AND NOT EXISTS(SELECT 1 FROM master_base ");// 排除有效团队记录
					sh.appendSql("    WHERE hotel_group_id = ?         ");
					sh.appendSql("        AND hotel_id = ?             ");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					sh.appendSql("	      AND rsv_class IN('F','G')    ");
					sh.appendSql("	      AND (charge <> pay           ");
					sh.appendSql("	         OR credit > 0             ");
					sh.appendSql("	         OR sta IN('R','I','S')    ");
					sh.appendSql("	         OR dep > ? )              ");
					sh.insertValue(bizDate);
					sh.appendSql("	      AND grp_accnt IS NOT NULL    ");
					sh.appendSql("	      AND grp_accnt <> 0           ");
					sh.appendSql("	      AND id <> rsv_id  ");
					sh.appendSql("	      AND grp_accnt = m.grp_accnt  ");
					sh.appendSql("	      AND id <> m.id )             ");
		        }
			}else{
				sh.appendSql(" AND m.is_resrv = 'T' ");
				sh.appendSql(" AND m.id = m.rsv_id  ");
				if("RESRV".equals(type)){
					sh.appendSql(" AND m.sta IN('R','I') ");
				}else{ // WaitList分支
					sh.appendSql(" AND m.sta = 'W' ");
				}
				sh.appendSql(" AND m.rsv_class IN ('F','G')    ");
				sh.appendSql(" AND ADDDATE(DATE(m.arr),1) <= ? ");
				sh.insertValue(bizDate);
			}
			sh.appendSql(" AND m.hotel_group_id = ? AND m.hotel_id = ? ) ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			this.bulkUpdateByNativeSQL(sh);
		}
		/**
		 * 判断登记单是否全部结账,在夜审信息转历史之外的方法可能不准确,仅限夜审转历史方法使用
		 * @param ids
		 * @param hotelId
		 * @param hotelGroupId
		 * @return 结账的登记单数
		 */
		public int getRmbDone(List<Long> ids,Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper("select count(1) from master_audit ma where 1=1 ");
			sh.appendOrSql(" or ma.id = ? ", ids);
			sh.appendSql(" and ma.hotel_id = ? and ma.hotel_group_id = ? ");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			return this.countByNativeSQL(sh);
		}
		
		/**
		 * 生成master_Base_history数据
		 * @param hotelId
		 * @param hotelGroupId
		 */
		@Override 
		public void saveMasterBaseHistory(Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper("Insert into master_base_history ");
			sh.appendSql("	   (hotel_group_id, hotel_id, id, rsv_id,is_resrv, rsv_man,    ");
			sh.appendSql("		rsv_company, mobile, group_code, group_manager, parent_id, rsv_src_id,        ");
			sh.appendSql("		master_rsvsrc_id, rsv_class, master_id, grp_accnt, grp_flag,         ");
			sh.appendSql("		block_id, biz_date, sta, rmtype, rmno,rmno_son, rmnum, arr,");
			sh.appendSql("		dep, cutoff_days, cutoff_date, adult, children, res_sta,   ");
			sh.appendSql("		res_dep,up_rmtype,up_reason,up_user, rack_rate, nego_rate, real_rate, dsc_reason,      ");
			sh.appendSql("		dsc_amount, dsc_percent, exp_sta, tm_sta, rmpost_sta,      ");
			sh.appendSql("		is_rmposted, tag0, company_id, agent_id, source_id,        ");
			sh.appendSql("		member_type, member_no, inner_card_id, salesman, arno,     ");
			sh.appendSql("		building, src, market, rsv_type, channel, sales_channel,   ");
			sh.appendSql("		ratecode, ratecode_category, cmscode, packages, specials,  ");
			sh.appendSql("		amenities, is_fix_rate, is_fix_rmno, is_sure, is_permanent,"); 
			sh.appendSql("		is_walkin, is_secret, is_secret_rate, posting_flag,        ");
			sh.appendSql("		sc_flag, extra_flag, extra_bed_num, extra_bed_rate,        ");
			sh.appendSql("		crib_num, crib_rate, pay_code, limit_amt, credit_no,       ");
			sh.appendSql("		credit_man, credit_company, charge, pay, credit,           ");
			sh.appendSql("		last_num, last_num_link, rmocc_id, link_id, pkg_link_id,   ");
			sh.appendSql("		rsv_no, crs_no, where_from, where_to, purpose, remark,     ");
			sh.appendSql("		co_msg, is_send, promotion, create_user, create_datetime,  ");
			sh.appendSql("		modify_user, modify_datetime, sta_ebooking, is_owner, owner_id )               ");
			sh.appendSql(" (SELECT a.hotel_group_id, a.hotel_id, a.id, a.rsv_id,is_resrv, a.rsv_man,");
			sh.appendSql("		a.rsv_company, a.mobile, a.group_code, a.group_manager, a.parent_id, a.rsv_src_id,        ");
			sh.appendSql("		a.master_rsvsrc_id, a.rsv_class, a.master_id, a.grp_accnt, a.grp_flag,        ");
			sh.appendSql("		a.block_id, a.biz_date, a.sta, a.rmtype, a.rmno,a.rmno_son, a.rmnum, a.arr,");
			sh.appendSql("		a.dep, a.cutoff_days, a.cutoff_date, a.adult, a.children, a.res_sta, ");
			sh.appendSql("		a.res_dep,a.up_rmtype,a.up_reason,a.up_user, a.rack_rate, a.nego_rate, a.real_rate, a.dsc_reason,      ");
			sh.appendSql("		a.dsc_amount, a.dsc_percent, a.exp_sta, a.tm_sta, a.rmpost_sta,      ");
			sh.appendSql("		a.is_rmposted, a.tag0, a.company_id, a.agent_id, a.source_id,        ");
			sh.appendSql("		a.member_type, a.member_no, a.inner_card_id, a.salesman, a.arno,     ");
			sh.appendSql("		a.building, a.src, a.market, a.rsv_type, a.channel, a.sales_channel, ");
			sh.appendSql("		a.ratecode, a.ratecode_category, a.cmscode, a.packages, a.specials,  ");
			sh.appendSql("		a.amenities, a.is_fix_rate, a.is_fix_rmno, a.is_sure, a.is_permanent,"); 
			sh.appendSql("		a.is_walkin, a.is_secret, a.is_secret_rate, a.posting_flag,          ");
			sh.appendSql("		a.sc_flag, a.extra_flag, a.extra_bed_num, a.extra_bed_rate,          ");
			sh.appendSql("		a.crib_num, a.crib_rate, a.pay_code, a.limit_amt, a.credit_no,       ");
			sh.appendSql("		a.credit_man, a.credit_company, a.charge, a.pay, a.credit,           ");
			sh.appendSql("		a.last_num, a.last_num_link, a.rmocc_id, a.link_id, a.pkg_link_id,   ");
			sh.appendSql("		a.rsv_no, a.crs_no, a.where_from, a.where_to, a.purpose, a.remark,   ");
			sh.appendSql("		a.co_msg, a.is_send, a.promotion, a.create_user, a.create_datetime,  ");
			sh.appendSql("		a.modify_user, a.modify_datetime, a.sta_ebooking, a.is_owner, a.owner_id                ");
			sh.appendSql(" FROM master_audit a where a.hotel_id =? and a.hotel_group_id = ? )");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			this.bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * 删除masterBase表中的已移向临时表的数据
		 * @param hotelId
		 * @param hotelGroupId
		 */
		public void deleteMasterBaseOnHistory(Date bizDate,Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" DELETE a FROM master_base AS a, ");
			sh.appendSql("     master_audit AS b ");
			sh.appendSql(" WHERE a.id = b.id ");
			sh.appendSql("     AND a.hotel_group_id = ? ");
			sh.appendSql("     AND a.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ? ");
			sh.appendSql("     AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND NOT EXISTS (SELECT 1 FROM master_guest WHERE hotel_group_id = ? AND hotel_id = ? AND id = a.id) ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			this.bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * 自动NoShow预订单记录
		 * @param type				NoShow类型（1：按天，0：全部）
		 * @param bizDate			营业日期
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return void
		 * @author Cairo
		 * @date 2012-06-06
		 */
		@Override
		public void updateMasterNoShow(String type,Date bizDate,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" UPDATE master_base a          ");
			sh.appendSql("     SET a.res_sta = 'R',      ");
			sh.appendSql("         a.sta = 'N',          ");
			sh.appendSql("         a.biz_date = ?,       ");
			sh.insertValue(bizDate);
			sh.appendSql("         a.modify_datetime = ? ");
			sh.insertValue(new Date());
			sh.appendSql(" WHERE a.sta = 'R'             ");
			sh.appendSql("     AND a.rsv_class IN ('F','G') ");
			if("1".equals(type)){
				sh.appendSql(" AND DATE(a.arr) < ? ");	// 排除明日抵离数据
				sh.insertValue(bizDate);
				sh.appendSql(" AND DATE(a.dep) <= ?   ");
				sh.insertValue(bizDate);
			}else{	
				sh.appendSql(" AND ADDDATE(DATE(a.arr),1) <= ? ");
				sh.insertValue(bizDate);
			}
			sh.appendSql("     AND a.id = a.rsv_id ");
			sh.appendSql("     AND a.hotel_group_id = ?  ");
			sh.appendSql("     AND a.hotel_id = ?        ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND NOT EXISTS( SELECT 1 FROM rsv_src b WHERE ");	// 排除存在有效预定的
			sh.appendSql("       (b.occ_flag = 'RF' OR b.occ_flag = 'RG') ");
			sh.appendSql("       AND b.hotel_group_id = ? AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("       AND b.arr_date >= ? AND b.accnt = a.id) ");
			sh.insertValue(bizDate);
			sh.appendSql("       AND NOT EXISTS(SELECT 1 FROM (SELECT       ");		// 排除存在有效成员的
			sh.appendSql(" 		             c.id,c.rsv_id                  ");
		    sh.appendSql("               FROM master_base c                 ");
		    sh.appendSql("               WHERE c.rsv_class = 'F'            ");
		    sh.appendSql("                   AND c.sta = 'R'                ");
		    sh.appendSql("                   AND c.hotel_group_id = ?       ");
		    sh.appendSql("                   AND c.hotel_id = ?             ");
		    sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
		    sh.appendSql("                   AND DATE(c.arr) >= ? ) AS temp ");
		    sh.insertValue(bizDate);
		    sh.appendSql("           WHERE id <> a.id AND rsv_id = a.id )   ");
			this.bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * NoShow失效的(抵离日期为同一天)预订单资源记录
		 * @param type				NoShow类型（1：按天，0：全部）
		 * @param bizDate			营业日期
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return void
		 * @author Cairo
		 * @date 2012-06-06 
		 */
		@Override
		public void updateNoShowInvalidMasterBase(String type,Date bizDate,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" UPDATE master_base a    ");
			sh.appendSql(" SET a.res_sta = 'R',    ");
			sh.appendSql("    a.sta = 'N',    	   ");
			sh.appendSql("    a.biz_date = ?,      ");
			sh.insertValue(bizDate);
			sh.appendSql("    a.modify_datetime = ?");
			sh.insertValue(new Date());
			sh.appendSql(" WHERE DATE(a.arr) = DATE(a.dep) ");
			if("1".equals(type)){
				sh.appendSql(" AND DATE(a.arr) < ? ");	// 排除明日抵离数据
				sh.insertValue(bizDate);
				sh.appendSql(" AND DATE(a.dep) <= ?   ");
				sh.insertValue(bizDate);
			}else{
				sh.appendSql(" AND DATE(a.arr) = ? ");
				sh.insertValue(bizDate);
			}
			
			sh.appendSql("    AND a.id = a.rsv_id ");
			sh.appendSql("    AND a.sta = 'R'     ");
			sh.appendSql(" 	  AND a.hotel_group_id = ? ");
			sh.appendSql("    AND a.hotel_id = ?       ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("    AND EXISTS(SELECT 1 FROM master_audit as aa ");			// 新增master_audit条件，避免多余的NoShow操作 Cairo 2013-12-17
			sh.appendSql("      WHERE aa.hotel_group_id = ? ");
			sh.appendSql("      AND aa.hotel_id = ?  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("      AND aa.id = a.id ) ");
			sh.appendSql("    AND NOT EXISTS ( SELECT 1 FROM rsv_src b WHERE ");		// 排除存在有效预定的
			sh.appendSql("      (b.occ_flag = 'RF' OR b.occ_flag = 'RG') ");
			sh.appendSql("      AND b.hotel_group_id = ? AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("      AND b.arr_date >= ? AND b.accnt = a.id) ");
			sh.insertValue(bizDate);
			sh.appendSql("       AND NOT EXISTS(SELECT 1 FROM (SELECT       ");			// 排除存在有效成员的
			sh.appendSql(" 		             c.id,c.rsv_id                  ");
		    sh.appendSql("               FROM master_base c                 ");
		    sh.appendSql("               WHERE c.rsv_class = 'F'            ");
		    sh.appendSql("                   AND c.sta = 'R'                ");
		    sh.appendSql("                   AND c.hotel_group_id = ?       ");
		    sh.appendSql("                   AND c.hotel_id = ?             ");
		    sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
		    sh.appendSql("                   AND DATE(c.arr) >= ? ) AS temp ");
		    sh.insertValue(bizDate);
		    sh.appendSql("           WHERE id <> a.id AND rsv_id = a.id )   ");
			this.bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * 夜审时当前夜审主单数据需要移到临时表
		 * 1、确定要转储预订主单
		 * @param bizDate			营业日期
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return void
		 * @author Cairo
		 * @date 2012-06-06
		 */
		@Override
		public void saveMasterBaseToHistory(Date bizDate,Long hotelId,Long hotelGroupId){
			String masterToHistoryModel = sysOptionDao.findSysOptionByCatalogItem("reserve", 
					"master_to_history_model", hotelGroupId, hotelId).getSetValue().trim();
			if(!isNotNull(masterToHistoryModel)){
				masterToHistoryModel = "0";
			}
			SQLHelper sh = new SQLHelper("Insert into master_audit ");
			sh.appendSql("	   (hotel_group_id, hotel_id, id, rsv_id,is_resrv, rsv_man,    ");
			sh.appendSql("		rsv_company, mobile, group_code, group_manager, rsv_src_id,        ");
			sh.appendSql("		master_rsvsrc_id, rsv_class, master_id, grp_accnt,         ");
			sh.appendSql("		block_id, biz_date, sta, rmtype, rmno,rmno_son, rmnum, arr,");
			sh.appendSql("		dep, cutoff_days, cutoff_date, adult, children, res_sta,   ");
			sh.appendSql("		res_dep,up_rmtype,up_reason,up_user, rack_rate, nego_rate, real_rate, dsc_reason,      ");
			sh.appendSql("		dsc_amount, dsc_percent, exp_sta, tm_sta, rmpost_sta,      ");
			sh.appendSql("		is_rmposted, tag0, company_id, agent_id, source_id,        ");
			sh.appendSql("		member_type, member_no, inner_card_id, salesman, arno,     ");
			sh.appendSql("		building, src, market, rsv_type, channel, sales_channel,   ");
			sh.appendSql("		ratecode, ratecode_category, cmscode, packages, specials,  ");
			sh.appendSql("		amenities, is_fix_rate, is_fix_rmno, is_sure, is_permanent,"); 
			sh.appendSql("		is_walkin, is_secret, is_secret_rate, posting_flag,        ");
			sh.appendSql("		sc_flag, extra_flag, extra_bed_num, extra_bed_rate,        ");
			sh.appendSql("		crib_num, crib_rate, pay_code, limit_amt, credit_no,       ");
			sh.appendSql("		credit_man, credit_company, charge, pay, credit,           ");
			sh.appendSql("		last_num, last_num_link, rmocc_id, link_id, pkg_link_id,   ");
			sh.appendSql("		rsv_no, crs_no, where_from, where_to, purpose, remark,     ");
			sh.appendSql("		co_msg, is_send, promotion, create_user, create_datetime,  ");
			sh.appendSql("		modify_user, modify_datetime, sta_ebooking )               ");
			sh.appendSql(" (SELECT a.hotel_group_id, a.hotel_id, a.id, a.rsv_id,is_resrv, a.rsv_man,");
			sh.appendSql("		a.rsv_company, a.mobile, a.group_code, a.group_manager, a.rsv_src_id,        ");
			sh.appendSql("		a.master_rsvsrc_id, a.rsv_class, a.master_id, a.grp_accnt,         ");
			sh.appendSql("		a.block_id, a.biz_date, a.sta, a.rmtype, a.rmno,a.rmno_son, a.rmnum, a.arr,");
			sh.appendSql("		a.dep, a.cutoff_days, a.cutoff_date, a.adult, a.children, a.res_sta, ");
			sh.appendSql("		a.res_dep,a.up_rmtype,a.up_reason,a.up_user, a.rack_rate, a.nego_rate, a.real_rate, a.dsc_reason,      ");
			sh.appendSql("		a.dsc_amount, a.dsc_percent, a.exp_sta, a.tm_sta, a.rmpost_sta,      ");
			sh.appendSql("		a.is_rmposted, a.tag0, a.company_id, a.agent_id, a.source_id,        ");
			sh.appendSql("		a.member_type, a.member_no, a.inner_card_id, a.salesman, a.arno,     ");
			sh.appendSql("		a.building, a.src, a.market, a.rsv_type, a.channel, a.sales_channel, ");
			sh.appendSql("		a.ratecode, a.ratecode_category, a.cmscode, a.packages, a.specials,  ");
			sh.appendSql("		a.amenities, a.is_fix_rate, a.is_fix_rmno, a.is_sure, a.is_permanent,"); 
			sh.appendSql("		a.is_walkin, a.is_secret, a.is_secret_rate, a.posting_flag,          ");
			sh.appendSql("		a.sc_flag, a.extra_flag, a.extra_bed_num, a.extra_bed_rate,          ");
			sh.appendSql("		a.crib_num, a.crib_rate, a.pay_code, a.limit_amt, a.credit_no,       ");
			sh.appendSql("		a.credit_man, a.credit_company, a.charge, a.pay, a.credit,           ");
			sh.appendSql("		a.last_num, a.last_num_link, a.rmocc_id, a.link_id, a.pkg_link_id,   ");
			sh.appendSql("		a.rsv_no, a.crs_no, a.where_from, a.where_to, a.purpose, a.remark,   ");
			sh.appendSql("		a.co_msg, a.is_send, a.promotion, a.create_user, a.create_datetime,  ");
			sh.appendSql("		a.modify_user, a.modify_datetime, a.sta_ebooking                ");
			sh.appendSql(" FROM master_base AS a ");
			sh.appendSql(" 		LEFT JOIN rsv_src AS b       ");
			sh.appendSql(" 		  ON a.id = b.accnt          ");
			sh.appendSql(" 			AND (b.occ_flag = 'RF'   ");
			sh.appendSql(" 			  OR b.occ_flag = 'RG')  ");
			sh.appendSql(" 			AND b.hotel_group_id = ? ");
			sh.appendSql(" 			AND b.hotel_id = ?       ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" 	WHERE a.hotel_group_id = ?      ");
			sh.appendSql(" 		AND a.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" 		AND a.id = a.rsv_id         ");
			sh.appendSql(" 		AND a.rsv_class IN ('F','G')");
			sh.appendSql("      AND a.sta IN ('N','X','O','D')");
			sh.appendSql("      AND a.credit = 0            ");
			sh.appendSql(" 		AND a.charge = a.pay        ");
			sh.appendSql(" 		AND DATE(a.dep) < ?         ");
			sh.insertValue(DateUtil.addDays(bizDate,-1));
			sh.appendSql("		AND NOT EXISTS(SELECT 1 FROM account b ");	// 排除有效账务
	        sh.appendSql("         WHERE b.hotel_group_id = ?");
	        sh.appendSql("             AND b.hotel_id = ?    ");
	        sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
	        sh.appendSql("             AND b.close_flag = '' ");
	        sh.appendSql("             AND b.accnt = a.id)   ");
	        sh.appendSql("      AND NOT EXISTS (SELECT 1 FROM master_base ");// 排除有效状态成员
			sh.appendSql("         WHERE hotel_group_id = ? ");
			sh.appendSql("             AND hotel_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" 			   AND rsv_id = a.id    ");
			sh.appendSql(" 			   AND id <> a.id       ");
			sh.appendSql("             AND rsv_class = 'F'  ");
			sh.appendSql("	           AND (charge <> pay   ");
			sh.appendSql("                OR credit > 0     ");
			sh.appendSql("	        	  OR sta IN('R','I','S')");
			sh.appendSql("	              OR DATE(dep) > ? ))     ");
			sh.insertValue(DateUtil.addDays(bizDate,-1));
			sh.appendSql("      AND NOT EXISTS (SELECT 1 FROM catering ");// 排除有效会议室预订
			sh.appendSql("         WHERE hotel_group_id = ? ");
			sh.appendSql("             AND hotel_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("             AND rsv_type IN ('F','G') ");
			sh.appendSql("             AND sta = 'I'        ");
			sh.appendSql("             AND rsv_id = a.id)   ");
	        if("1".equals(masterToHistoryModel)){	        	
				sh.appendSql("      AND NOT EXISTS (SELECT 1 FROM master_base ");// 排除有效联房
				sh.appendSql("         WHERE hotel_group_id = ? ");
				sh.appendSql("             AND hotel_id = ?     ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql(" 			   AND link_id = a.link_id ");
				sh.appendSql(" 			   AND id <> a.id       ");
				sh.appendSql("             AND rsv_class <> 'G' ");
				sh.appendSql("	           AND (charge <> pay   ");
				sh.appendSql("                OR credit > 0     ");
				sh.appendSql("	        	  OR sta IN('R','I','S')");
				sh.appendSql("	              OR dep > ? ))     ");
				sh.insertValue(bizDate);
				sh.appendSql("      AND NOT EXISTS (SELECT 1 FROM master_base ");// 排除有效团队成员
				sh.appendSql("         WHERE hotel_group_id = ? ");
				sh.appendSql("             AND hotel_id = ?     ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql(" 			   AND grp_accnt = a.grp_accnt ");
				sh.appendSql(" 			   AND grp_accnt <> 0   ");
				sh.appendSql(" 			   AND grp_accnt IS NOT NULL ");
				sh.appendSql(" 			   AND id <> a.id       ");
				sh.appendSql("             AND rsv_class = 'F'  ");
				sh.appendSql("	           AND (charge <> pay   ");
				sh.appendSql("                OR credit > 0     ");
				sh.appendSql("	        	  OR sta IN('R','I','S')");
				sh.appendSql("	              OR dep > ? ))      ");
				sh.insertValue(bizDate);
	        }
	        sh.appendSql(" 	GROUP BY a.id                   ");
			sh.appendSql(" 	HAVING IFNULL(SUM(b.rmnum),0) = 0 ) ");
			this.bulkUpdateByNativeSQL(sh);
		}

		/**
		 * 根据快捷条件查询当前登记单列表
		 * @param subSql				过滤条件（房号、姓名、预定号）
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return
		 */
		public List<MasterLinkDto> findMasterByQuickConditions(String subSql,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	  SELECT                                ");
			sh.appendSql("	  a.id              id,                 ");
			sh.appendSql("    a.rsv_id       AS resrvId,            ");
			sh.appendSql("	  a.rsv_class       rsvClass,           ");
			sh.appendSql("	  'F'          		flag,               ");
			sh.appendSql("	  b.name            `name`,             ");
			sh.appendSql("	  b.name_combine    nameCombine,        ");
			sh.appendSql("	  a.sta             sta,                ");
			sh.appendSql("	  a.ratecode		rateCode,			");
			sh.appendSql("	  a.rmtype          rmType,             ");
			sh.appendSql("	  a.rmnum           rmNum,              ");
			sh.appendSql("	  a.rmno            rmNo,               ");
			sh.appendSql("	  (a.adult+a.children)    adultNum,     ");
			sh.appendSql("	  a.adult           adult,  			");
			sh.appendSql("	  a.children		children,  			");
			sh.appendSql("	  a.arr             arr,                ");
			sh.appendSql("	  a.dep             dep,                ");
			sh.appendSql("	  DATEDIFF(a.dep,a.arr)    dayNum,      ");
			sh.appendSql("	  a.real_rate       realRate,           ");
			sh.appendSql("	  a.packages        packages,           ");
			sh.appendSql("	  a.charge          charge,           ");
			sh.appendSql("	  a.pay             pay,           ");
			sh.appendSql("	  (a.charge - a.pay)    balance,        ");
			sh.appendSql("	  a.credit          credit,             ");
			sh.appendSql("	  a.market          market,             ");
			sh.appendSql("	  a.rsv_no          rsvNo,              ");
			sh.appendSql("	  a.master_id       masterId,           ");
			sh.appendSql("    a.amenities		amenities,          ");
			sh.appendSql("    a.remark		    remark,             ");
			sh.appendSql("	  a.link_id         linkId,             ");
			sh.appendSql("	  a.pkg_link_id     pkgLinkId,          ");
			sh.appendSql("	  0				    rsvId,           	");
			sh.appendSql("	  b.vip 			vip,				");
			sh.appendSql("	  b.profile_id		profileId,			");
			sh.appendSql("	  b.profile_type	profileType			");
			sh.appendSql("	  FROM   master_base a, master_guest b  ");
			sh.appendSql(" where a.id = b.id and a.rsv_class <> 'H' ");
			sh.appendSql("    AND (a.id <> a.rsv_id OR (a.id = a.rsv_id AND a.rsv_class = 'G')) ");
			if(isNotNull(subSql)){
				sh.appendSql(" and "+subSql);
			}
			sh.appendSql(" and a.hotel_id = ? and a.hotel_group_id = ? ");
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			return findByNativeSQL(sh,MasterLinkDto.class);
		}
		
		@Override
		public Integer findresrvMasterSize(Long resrvId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select obj.id  from MasterBase obj where obj.rsvId = ?  and obj.rsvClass = 'F'");

				sh.insertValue(resrvId);

			return find(sh).size();
		}
		
		@Override
		public List<ZeroRateDto> findZeroRate(Long hotelGroupId, Long hotelId,Date bizDate) {
			SQLHelper sh = new SQLHelper();
	        sh.appendSql("SELECT b.id,b.rmno,b.rmtype,b.real_rate as realRate,b.market,c.name,c.nation,c.sex,b.remark,b.arr,b.dep FROM " +
	        		"(SELECT id,master_id,SUM(real_rate) real_rate FROM master_base " +
	        		"WHERE hotel_id=? and hotel_group_id=? AND arr<? AND sta='I'  AND rmno<>'' AND rmno IS NOT NULL GROUP BY master_id)"+
	        		"AS a,master_base b,master_guest c" +
	        		" WHERE a.master_id=b.master_id   AND a.real_rate='0.00' AND c.id=b.id AND " +
	        		"c.hotel_id=? and c.hotel_group_id=? " +
	        		"and b.hotel_id=? and b.hotel_group_id=? ");
	        sh.insertValue(hotelId);
	        sh.insertValue(hotelGroupId);
	        sh.insertValue(bizDate);
	        sh.insertValue(hotelId);
	        sh.insertValue(hotelGroupId);
	        sh.insertValue(hotelId);
	        sh.insertValue(hotelGroupId);
			return findByNativeSQL(sh,ZeroRateDto.class);
		}

		@Override
		public List<MasterBase> findMasterBaseByResrvId(Long rsvId,String stas,Long hotelGroupId,Long hotelId,boolean hasSelf) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT obj FROM MasterBase obj WHERE ");
			sh.appendSql(" obj.rsvId = ? ");
			sh.insertValue(rsvId);
			if(!hasSelf){
				sh.appendSql(" AND obj.id <> ? ");
				sh.insertValue(rsvId);
			}
			sh.appendSql(" AND obj.hotelGroupId = ? ");
			sh.appendSql(" AND obj.hotelId = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("AND obj.rsvClass = ? ");
			sh.insertValue(MasterBase.RsvClass.F);
			if(isNotNull(stas))
				sh.appendOrSql("OR obj.sta = ?", stas.split(CodeBaseConstant.MULTIPLE_SEPARATE));
			return find(sh);
		}		 
		  
	  @Override
		public int countMasterBaseByGrpAccnt(Long hotelGroupId,Long hotelId,Long resrvId,
				String stas) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select count(*) from MasterBase where hotelGroupId = ? and hotelId = ? and grpAccnt= ? AND id <> ? and rsvClass = 'F'  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(resrvId);
			sh.insertValue(resrvId);
			if(stas!=null)
				sh.appendOrSql(" OR sta = ? ", stas.split(CodeBaseConstant.MULTIPLE_SEPARATE));
			return count(sh);
		}
		
		/**
		 * 每日房价查询同住专用
		 * @param masterId
		 * @param beginDate
		 * @param endDate
		 * @return
		 */
		public List<BigInteger> findLiveIdForDailyRate(Long masterId,Date beginDate,Date endDate,Long hotelId,Long hotelGroupId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT a.id FROM master_base a WHERE a.master_id = ? AND a.hotel_id=? AND a.hotel_group_id=? ");
			sh.insertValue(masterId);
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			
			sh.appendSql(" and ((a.dep<=? and a.dep>=?) or (a.arr<=? and a.arr>= ?)) ");
			sh.insertValue(endDate);
			sh.insertValue(beginDate);
			sh.insertValue(endDate);
			sh.insertValue(beginDate);
			
			sh.appendSql(" UNION ALL  SELECT b.id FROM master_base_history b where b.master_id = ? and b.hotel_id=? and b.hotel_group_id=? ");
			sh.insertValue(masterId);
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			
			sh.appendSql(" and ((b.dep<=? and b.dep>=?) or (b.arr<=? and b.arr>= ?))");
			sh.insertValue(endDate);
			sh.insertValue(beginDate);
			sh.insertValue(endDate);
			sh.insertValue(beginDate);
			
			return findByNativeSQL(sh);
		}


		@Override
		public MasterBase findMaserByLiveIdRmno(Long liveId, String rmno,Long hotelGroupId,Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj						");
			sh.appendSql("	FROM MasterBase obj				");
			sh.appendSql("	WHERE obj.rsvClass IN ('F','D')	");
			sh.appendSql("	AND obj.sta= 'I'				");
			sh.appendSql("	AND obj.masterId = ?			");
			sh.insertValue(liveId);
			sh.appendSql("	AND obj.rmno= ?					");
			sh.insertValue(rmno);
			sh.appendSql("	AND obj.hotelGroupId = ?		");
			sh.appendSql("	AND obj.hotelId = ?				");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			List<MasterBase> mbs= find(sh);
			if(mbs.isEmpty()){
				return null;
			}else{
				return mbs.get(0);
			}
		}

		
		/**
		 * 更新联房用户ExtraFlag标识方法
		 * @param subExtraFlag			需要更新的某一位ExtraFlag
		 * @param subExtraFlagIndex		需要更新的位数(1-30)
		 * @param linkId				联房ID
		 * @param pkgLinkId				包价联房ID
		 * @param hotelGroupId			是否同步更新联房用户
		 * @param hotelId				是否同步更新同团队用户
		 * @return Booblen
		 * @author Cairo
		 * @serialData 2011-08-12
		 */
		public Boolean updateLinkExtraFlag(String subExtraFlag,int subExtraFlagIndex,Long linkId,Long pkgLinkId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	UPDATE master_base a                                                               ");
			sh.appendSql("	SET a.extra_flag =																   ");
			if(subExtraFlagIndex > 0){
				sh.appendSql("		CONCAT(SUBSTRING(extra_flag,1,?),?,SUBSTRING(extra_flag,?))     ");
				sh.insertValue(subExtraFlagIndex - 1);
				sh.insertValue(subExtraFlag.trim());
				sh.insertValue(subExtraFlagIndex + 1);
			}else if(subExtraFlagIndex == 0){
				sh.appendSql("		CONCAT(SUBSTRING(extra_flag,0,1),?,SUBSTRING(extra_flag,2))     ");
				sh.insertValue(subExtraFlag.trim());
			}else{
				return false;
			}
			sh.appendSql("	WHERE a.hotel_group_id = ?                                                         ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("	    AND a.hotel_id = ?                                                             ");
			sh.insertValue(hotelId);
			if((linkId != null || pkgLinkId != null) && (linkId != 0l || pkgLinkId != 0l)){
				sh.appendSql(" and ( 1=2 ");
				if(linkId != null && linkId != 0){
					sh.appendSql(" or a.link_id = ? or a.id = ? ");
					sh.insertValue(linkId);
					sh.insertValue(linkId);
				}
				if(pkgLinkId != null && pkgLinkId != 0){
					sh.appendSql(" or a.pkg_link_id = ? or a.id = ?  ");
					sh.insertValue(pkgLinkId);
					sh.insertValue(pkgLinkId);
				}
				sh.appendSql(")");
			}else{
				return false;
			}
			bulkUpdateByNativeSQL(sh);
			return true;
		}
		
		/**
		 * 更新联房用户ExtraFlag标识方法
		 * @param subExtraFlag			需要更新的某一位ExtraFlag
		 * @param subExtraFlagIndex		需要更新的位数(1-30)
		 * @param grpAccnt				团队ID
		 * @param hotelGroupId			是否同步更新联房用户
		 * @param hotelId				是否同步更新同团队用户
		 * @return Booblen
		 * @author Cairo
		 * @serialData 2011-08-12
		 */
		public Boolean updateGrpExtraFlag(String subExtraFlag,int subExtraFlagIndex,Long grpAccnt,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	UPDATE master_base a                                                               ");
			sh.appendSql("	SET a.extra_flag =																   ");
			if(subExtraFlagIndex > 0){
				sh.appendSql("		CONCAT(SUBSTRING(extra_flag,1,?),?,SUBSTRING(extra_flag,?))     ");
				sh.insertValue(subExtraFlagIndex - 1);
				sh.insertValue(subExtraFlag.trim());
				sh.insertValue(subExtraFlagIndex + 1);
			}else if(subExtraFlagIndex == 0){
				sh.appendSql("		CONCAT(SUBSTRING(extra_flag,0,1),?,SUBSTRING(extra_flag,2))     ");
				sh.insertValue(subExtraFlag.trim());
			}else{
				return false;
			}
			sh.appendSql("	WHERE a.hotel_group_id = ?                                                         ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("	    AND a.hotel_id = ?                                                             ");
			sh.insertValue(hotelId);
			if(grpAccnt != null && grpAccnt != 0l){
				sh.appendSql("  AND a.grp_accnt = ?															   ");
				sh.insertValue(grpAccnt);
			}else{
				return false;
			}
			bulkUpdateByNativeSQL(sh);
			return true;
		}
		
		/**
		 * 更新给定登记单ExtraFlag标识方法
		 * @param subExtraFlag			需要更新的某一位ExtraFlag
		 * @param subExtraFlagIndex		需要更新的位数(1-30)
		 * @param masterBaseId			登记单ID
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return Booblen
		 * @author Cairo
		 * @serialData 2011-08-12
		 */
		@Override
		public void updateMasterExtraFlag(String subExtraFlag,int subExtraFlagIndex,
				Long masterBaseId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	UPDATE master_base a      ");
			sh.appendSql("	SET a.extra_flag =		  ");
			if(subExtraFlagIndex > 0){
				sh.appendSql("		CONCAT(SUBSTRING(extra_flag,1,?),?,SUBSTRING(extra_flag,?)) ");
				sh.insertValue(subExtraFlagIndex - 1);
				sh.insertValue(subExtraFlag.trim());
				sh.insertValue(subExtraFlagIndex + 1);
			}else if(subExtraFlagIndex == 0){
				sh.appendSql("		CONCAT(SUBSTRING(extra_flag,0,1),?,SUBSTRING(extra_flag,2)) ");
				sh.insertValue(subExtraFlag.trim());
			}else{
				return;
			}
			sh.appendSql("	WHERE a.hotel_group_id = ?  ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("	    AND a.hotel_id = ?      ");
			sh.insertValue(hotelId);
			if(masterBaseId != null && masterBaseId != 0l){
				sh.appendSql("  AND a.id = ?			");
				sh.insertValue(masterBaseId);
			}else{
				return;
			}
			bulkUpdateByNativeSQL(sh);
			return;
		}

		@Override
		public MasterBase findMasterBaseById(Long masterBaseId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT obj FROM MasterBase obj where obj.id=? ");
			sh.insertValue(masterBaseId);
			List<MasterBase> list = find(sh);
			if(list.isEmpty()){
				return null;
			}
			return list.get(0);
		}
		/**
		 * 联房发卡信息查询---
		 * @param linkId
		 * @author zjw
		 */

		@Override
		public List<DoorcardMakeDto> findDoorcardInfo(
				Long hotelGroupId, Long hotelId, Long linkId,Long resrvId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select   " +
					"a.rmno  rmno, " +
					"a.rmno_son rmnoSon, "+
					"b.name  name," +
					"a.arr arr," +
					"a.dep dep," +
					"a.id  id , " +
					"a.rsv_id rsvId," +
					"a.link_id linkId, "+
					"a.master_id masterId "+
					"From master_base a,master_guest  b " +
					"where " +
					"a.hotel_id = ?  " +
					"AND a.hotel_group_id = ? " +
					"AND b.hotel_id  = ?  " +
					"AND b.hotel_group_id = ? " );				
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			if (linkId !=null){
//				String Id = "a.link_id";
				sh.appendSql("AND a.link_id = ? " );
//				sh.insertValue(Id);
				sh.insertValue(linkId);
			}else if (resrvId !=null){
				sh.appendSql("AND a.grp_accnt = ? " );
//				sh.insertValue(Id);
				sh.insertValue(resrvId);
			}else
			{//防止link_id and rsv_id都为空值
				sh.appendSql(" AND a.id =0");
			}			
			sh.appendSql(" AND a.rsv_class='F' ");
			//联房只有在住状态和预定状态可发卡
			sh.appendSql(" AND (a.sta = 'I' OR a.sta = 'R')");
			sh.appendSql(" AND a.rmno <> '' ");
			sh.appendSql(" AND LEFT(a.rmno,1) <> '#' ");
			sh.appendSql(" AND a.id =b.id ORDER BY a.rmno");
			return findByNativeSQL(sh,DoorcardMakeDto.class);
		}
		
		@Override
		public List<DoorcardMakeDto> findDoorcardInfoOfCheckINByResrv(
				Long hotelGroupId, Long hotelId,Long resrvId,String sta) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("select   " +
					"a.rmno  rmno, " +
					"a.rmno_son rmnoSon, "+
					"b.name  name," +
					"a.arr arr," +
					"a.dep dep," +
					"a.id  id , " +
					"a.rsv_id rsvId," +
					"a.link_id linkId, "+
					"a.master_id masterId "+
					"From master_base a,master_guest  b " +
					"where " +
					"a.hotel_id = ?  " +
					"AND a.hotel_group_id = ? " +
					"AND b.hotel_id  = ?  " +
					"AND b.hotel_group_id = ? " );				
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(hotelGroupId);
			if (resrvId !=null){
				sh.appendSql("AND a.rsv_id = ? " );
//				sh.insertValue(Id);
				sh.insertValue(resrvId);
			}else
			{//防止link_id and rsv_id都为空值
				sh.appendSql(" AND a.id =0");
			}
			sh.appendSql(" AND a.rsv_class='F' ");
			sh.appendSql(" AND a.sta = ? ");
			sh.insertValue(sta);
			sh.appendSql(" AND a.rmno <> '' ");
			sh.appendSql(" AND LEFT(a.rmno,1) <> '#' ");
			sh.appendSql(" AND a.id =b.id ORDER BY a.rmno");
			return findByNativeSQL(sh,DoorcardMakeDto.class);
		}
	
		/**
		 * 根据给定条件查询符合条件的登记单记录
		 */
		@Override
		public List<SmartMasterBase> findMasterByName(String sysStr,String str,
				boolean isResrv,Long hotelId,Long hotelGroupId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT                          ");
			sh.appendSql("  m.sta       type,             ");
			sh.appendSql("  g.name    name,               ");
			sh.appendSql("  m.arr     arr,                ");
			sh.appendSql("  m.dep     dep,                ");
			sh.appendSql("  m.rmno    rmno,               ");
			sh.appendSql("  m.master_id    masterId,      ");
			sh.appendSql("  m.id    id               	  ");
			sh.appendSql("FROM master_Base m,             ");
			sh.appendSql("  master_guest g                ");
			sh.appendSql("WHERE m.id = g.id               ");
			if(isResrv){
				sh.appendSql(" AND m.id = m.rsv_id        ");
				sh.appendSql(" AND m.rsv_class IN ('F','G') ");
			}else{
				sh.appendSql(" AND m.id <> m.rsv_id       ");
				sh.appendSql(" AND m.rsv_class <> 'H'     ");
			}
			sh.appendSql("    AND m.hotel_group_id = ?    ");
			sh.appendSql("    AND m.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("    AND g.hotel_group_id = ?    ");
			sh.appendSql("    AND g.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			List<String> sqlList=new ArrayList<String>();
			sqlList.add("g.name");
			sqlList.add("m.id");
			sqlList.add("m.rmno");
			sqlList.add("m.rsv_no");
			sqlList.add("g.phone");
			sqlList.add("g.mobile");
			sqlList.add("m.crs_no");
			sqlList.add("m.credit_man");
			sqlList.add("g.fax");
			if(isResrv)
			{
				sqlList.add("m.group_code");//根据团队代码搜索团队主单
			}
			sh.appendSql(SqlCreateUtil.sqlCreate(sqlList, sysStr, str));
			sh.appendSql("    ORDER BY  m.sta,m.modify_datetime desc         ");
			return findByNativeSQL(sh,SmartMasterBase.class);
		}
		@Override
		public List<SmartMasterBase> findMasterByCompanyName(
				String companyName, Long hotelId, Long hotelGroupId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("SELECT                          ");
			sh.appendSql("  m.sta       type,             ");
			sh.appendSql("  g.name    name,               ");
			sh.appendSql("  m.arr     arr,                ");
			sh.appendSql("  m.dep     dep,                ");
			sh.appendSql("  m.rmno    rmno,               ");
			sh.appendSql("  m.master_id    masterId,      ");
			sh.appendSql("  m.id    id                	  ");
			sh.appendSql("FROM master_Base m LEFT JOIN company_base c ON m.hotel_group_id=c.hotel_group_id AND c.hotel_id=0 AND c.name_combine LIKE '"+companyName+"%',             ");
			sh.appendSql("  master_guest g                ");
			sh.appendSql("WHERE m.id = g.id               ");
			sh.appendSql("    AND m.id <> m.rsv_id        ");
			sh.appendSql("    AND m.rsv_class <> 'H'      ");
			sh.appendSql("    AND m.hotel_group_id = ?    ");
			sh.appendSql("    AND m.hotel_id = ?  and  (m.company_id=c.id OR m.agent_id=c.id OR m.source_id=c.id )       ");
			sh.appendSql("    ORDER BY  m.sta,m.modify_datetime desc         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return findByNativeSQL(sh,SmartMasterBase.class);
		}
		@Override
		public List<POSMasterEnquiryDto> findPosInfoGroup(PosInterfaceSearchDto dto) {
//			SQLHelper sh = new SQLHelper();
//			sh.appendSql("	SELECT                                     ");
//			sh.appendSql("	  '"+dto.getSerialNum()+"' AS serialNum,   ");
//			sh.appendSql("	  a.rmno      AS rmno,                     ");
//			sh.appendSql("	  a.id        AS accnt,                    ");
//			sh.appendSql("	  b.name      AS name,                     ");
//			sh.appendSql("	  a.arr       AS arr,                      ");
//			sh.appendSql("	  a.dep       AS dep,                      ");			
//			sh.appendSql("	  (a.charge - a.pay) AS amount,            ");
//			sh.appendSql("	  a.sta       AS sta,                      ");
//			sh.appendSql("	  a.grp_accnt AS groupId   ,               ");
//			sh.appendSql("	  a.remark AS remark      ,                ");
//			sh.appendSql("	  a.salesman AS salesman      ,            ");
//			sh.appendSql("	  a.specials AS specials      ,            ");
//			sh.appendSql("	  a.co_msg AS coMsg      ,                  ");
//			sh.appendSql("	  c.name AS saleDescript,                        ");
//			sh.appendSql("    a.credit as credit                       ");
//			sh.appendSql("	FROM master_base AS a                      ");
//			sh.appendSql("	  LEFT JOIN master_guest AS b              ");
//			sh.appendSql("	    ON a.id = b.id                         ");
//			sh.appendSql("	  LEFT JOIN sales_man AS c              ");
//			sh.appendSql("	   ON a.salesman=c.code and c.hotel_group_id=a.hotel_group_id and c.hotel_id=0 ");
//			sh.appendSql("	WHERE a.hotel_group_id = ?                 ");
//			sh.appendSql("	    AND a.hotel_id = ?                     ");
//			sh.insertValue(dto.getHotelGroupId());
//			sh.insertValue(dto.getHotelId());
//		//含消费帐
//		//	sh.appendSql("	    AND a.rsv_class <> 'H'                 ");
//			sh.appendSql("	    AND a.sta in ('I','S')              ");
//			sh.appendSql("	    AND a.rsv_class ='G'              ");
//			sh.appendSql("	    order by sta                           ");	
			
//			dto.findPosInfoSub(0, "a.rmno",sh);
//			dto.findPosInfoSub( 1, "CAST(a.id AS CHAR(30))", sh);
//			dto.findPosInfoSub( 2, "b.name",sh);
//			dto.findPosInfoSub(3, "b.mobile", sh);
//			dto.findPosInfoSub(4, "CAST(a.rsv_id AS CHAR(30))", sh);
//			dto.findPosInfoSub(5, "a.rsv_no", sh);
//			dto.findPosInfoSub(6, "a.crs_no", sh);
			String baseSql = "SELECT '"+dto.getSerialNum()+"' AS serialNum,a.rsv_class as rsvClass,a.rmno as rmno,a.id as accnt,a.rsv_id as rsvId,a.is_resrv as isResrv,b.name as name,b.name2 as name2,a.arr as arr, " +
			" a.dep as dep,(a.charge - a.pay) AS amount,a.sta AS sta,a.grp_accnt as groupId,a.remark as remark, " +
			" a.salesman as salesman,a.specials as specials,a.co_msg as coMsg,c.name AS saleDescript,a.credit as credit,a.packages as packages,a.company_id as companyId,a.agent_id as agentId,a.source_id as sourceId " +
			" from master_base as a join master_guest as b on a.id = b.id and a.hotel_group_id = b.hotel_group_id and a.hotel_id = b.hotel_id left join sales_man as c on a.salesman=c.code and c.hotel_group_id=a.hotel_group_id and c.hotel_id=0 " +
			" where a.hotel_group_id = ? and a.hotel_id = ? and a.sta IN('I','S','R') AND a.rsv_class ='G' and a.rsv_id = a.id ";
			/** 账号，rsv_id正则表达式 **/
			Pattern pattern = Pattern.compile("\\d*");
            Matcher matcher = pattern.matcher(dto.getSearchInfo());
			
			SQLHelper sh = new SQLHelper();
			
			if(dto.findWheConcat(0,"a.rmno")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(0, "a.rmno",sh);
		    }
			if(matcher.matches()){
				if(dto.findWheConcat(1, "a.id")){
					if(StringUtil.isBlank(sh.getSQL())){
						sh = sh.appendSql(baseSql);
					}else{
						sh = sh.appendSql(" union "+baseSql);
					}
			    	
			        
			    	sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			        dto.findPosInfoSub(1, "a.id",sh);
			    }
			}
			
			if(dto.findWheConcat(2, "b.name")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(2, "b.name",sh);
		    }
			if(dto.findWheConcat(3, "b.mobile")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(3, "b.mobile",sh);
		    }
			if(matcher.matches()){
				if(dto.findWheConcat(4, "a.rsv_id")){
					if(StringUtil.isBlank(sh.getSQL())){
						sh = sh.appendSql(baseSql);
					}else{
						sh = sh.appendSql(" union "+baseSql);
					}
			    	
			        
			    	sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			    	dto.findPosInfoSub(4, "a.rsv_id", sh);
			    }
			}
			
			if(dto.findWheConcat(5, "a.rsv_no")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		    	dto.findPosInfoSub(5, "a.rsv_no", sh);
		    }
			if(dto.findWheConcat(6,"a.crs_no")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(6, "a.crs_no",sh);
		    }
			sh.appendSql("	    order by sta,accnt                           ");
			sh.appendSql(dto.getLimitStr());
			return findByNativeSQL(sh,POSMasterEnquiryDto.class);
		}
		@Override
		public List<POSMasterEnquiryDto> findPosInfo(PosInterfaceSearchDto dto,String isOSearch,String isLinkSearch,Date bizDate) {
			String baseSql = "SELECT '"+dto.getSerialNum()+"' AS serialNum,a.rsv_class as rsvClass,a.rmno as rmno,a.id as accnt,a.rsv_id as rsvId,a.is_resrv as isResrv,if(mgg.name is null or mgg.name = '',b.name,concat(b.name,'[',mgg.name,']')) as name,if(mgg.name2 is null or mgg.name2 = '',b.name2,concat(b.name2,'【',mgg.name2,'】')) as name2,a.arr as arr, " +
					" a.dep as dep,(a.charge - a.pay) AS amount,a.sta AS sta,a.grp_accnt as groupId,a.remark as remark, " +
					" a.salesman as salesman,a.specials as specials,a.co_msg as coMsg,c.name AS saleDescript,a.credit as credit,a.packages as packages,a.company_id as companyId,a.agent_id as agentId,a.source_id as sourceId " +
					" from master_base as a join master_guest as b on a.id = b.id and b.hotel_group_id = a.hotel_group_id and b.hotel_id = a.hotel_id" +
					" left join sales_man as c on a.salesman=c.code and c.hotel_group_id=a.hotel_group_id and c.hotel_id=0 " +
					" left join master_guest mgg on a.hotel_group_id = mgg.hotel_group_id and a.hotel_id = mgg.hotel_id and a.grp_accnt = mgg.id "+
					" where a.hotel_group_id = ? and a.hotel_id = ? AND a.sta IN('I','R','S') AND a.rsv_class IN('F','H','D') " +
					" AND NOT EXISTS(SELECT 1 FROM master_base d WHERE d.id <> d.rsv_id and a.id = d.rsv_id AND d.rsv_class = 'F' " +
					" AND d.sta in('I','R','S') AND d.hotel_group_id = a.hotel_group_id AND d.hotel_id = a.hotel_id) " +
					" AND IF(a.id = a.rsv_id,EXISTS (SELECT 1 FROM rsv_src AS e WHERE e.hotel_group_id = a.hotel_group_id AND e.hotel_id = a.hotel_id AND e.occ_flag IN ('RF','RG')"+
					" AND e.accnt = a.id AND e.rmnum > 0),1=1) ";
			String baseSqlGroup = "SELECT '"+dto.getSerialNum()+"' AS serialNum,a.rsv_class as rsvClass,a.rmno as rmno,a.id as accnt,a.rsv_id as rsvId,a.is_resrv as isResrv,if(mgg.name is null or mgg.name = '',b.name,concat(b.name,'[',mgg.name,']')) as name,if(mgg.name2 is null or mgg.name2 = '',b.name2,concat(b.name2,'【',mgg.name2,'】')) as name2,a.arr as arr, " +
					" a.dep as dep,(a.charge - a.pay) AS amount,a.sta AS sta,a.grp_accnt as groupId,a.remark as remark, " +
					" a.salesman as salesman,a.specials as specials,a.co_msg as coMsg,c.name AS saleDescript,a.credit as credit,a.packages as packages,a.company_id as companyId,a.agent_id as agentId,a.source_id as sourceId " +
					" from master_base as a join master_guest as b on a.id = b.id and b.hotel_group_id = a.hotel_group_id and b.hotel_id = a.hotel_id " +
					" left join sales_man as c on a.salesman=c.code and c.hotel_group_id=a.hotel_group_id and c.hotel_id=0 " +
					" left join master_guest mgg on a.hotel_group_id = mgg.hotel_group_id and a.hotel_id = mgg.hotel_id and a.grp_accnt = mgg.id "+
					" where a.hotel_group_id = ? and a.hotel_id = ? and a.rsv_id = a.id AND a.rsv_class = 'G' AND a.sta IN('I','R','S') ";
			// 查询当天退房的O状态的登记单
			String baseSqlOSta = "SELECT '"+dto.getSerialNum()+"' AS serialNum,a.rsv_class as rsvClass,a.rmno as rmno,a.id as accnt,a.rsv_id as rsvId,a.is_resrv as isResrv,if(mgg.name is null or mgg.name = '',b.name,concat(b.name,'[',mgg.name,']')) as name,if(mgg.name2 is null or mgg.name2 = '',b.name2,concat(b.name2,'【',mgg.name2,'】')) as name2,a.arr as arr, " +
			" a.dep as dep,(a.charge - a.pay) AS amount,a.sta AS sta,a.grp_accnt as groupId,a.remark as remark, " +
			" a.salesman as salesman,a.specials as specials,a.co_msg as coMsg,c.name AS saleDescript,a.credit as credit,a.packages as packages,a.company_id as companyId,a.agent_id as agentId,a.source_id as sourceId " +
			" from master_base as a join master_guest as b on a.id = b.id and b.hotel_group_id = a.hotel_group_id and b.hotel_id = a.hotel_id" +
			" left join sales_man as c on a.salesman=c.code and c.hotel_group_id=a.hotel_group_id and c.hotel_id=0 " +
			" left join master_guest mgg on a.hotel_group_id = mgg.hotel_group_id and a.hotel_id = mgg.hotel_id and a.grp_accnt = mgg.id "+
			" where a.hotel_group_id = ? and a.hotel_id = ? AND a.biz_date = ? AND a.sta ='O' AND a.rsv_class IN('F','H','G','D') ";
			// 查询联房的登记单
			String baseSqlLink = "SELECT '"+dto.getSerialNum()+"' AS serialNum,mb.rsv_class as rsvClass,mb.rmno as rmno,mb.id as accnt,mb.rsv_id as rsvId,mb.is_resrv as isResrv,if(mgg.name is null or mgg.name = '',mg.name,concat(mg.name,'[',mgg.name,']')) as name,if(mgg.name2 is null or mgg.name2 = '',mg.name2,concat(mg.name2,'【',mgg.name2,'】')) as name2,mb.arr as arr, " +
			" mb.dep as dep,(mb.charge - mb.pay) AS amount,mb.sta AS sta,mb.grp_accnt as groupId,mb.remark as remark, " +
			" mb.salesman as salesman,mb.specials as specials,mb.co_msg as coMsg,c.name AS saleDescript,mb.credit as credit,a.packages as packages,a.company_id as companyId,a.agent_id as agentId,a.source_id as sourceId " +
			" from master_base a inner join master_base mb on a.hotel_group_id = mb.hotel_group_id and a.hotel_id = mb.hotel_id and a.link_id = mb.link_id and a.id <> mb.id " +
			" and mb.id <> mb.rsv_id and mb.is_resrv <> 'T' and mb.grp_accnt = 0 " +
			" join master_guest as b on a.id = b.id and b.hotel_group_id = a.hotel_group_id and b.hotel_id = a.hotel_id " +
			" inner join master_guest mg on mb.id = mg.id and mg.hotel_group_id = mb.hotel_group_id and mg.hotel_id = mb.hotel_id "+
			" left join sales_man as c on mb.salesman=c.code and c.hotel_group_id=mb.hotel_group_id and c.hotel_id=0 " +
			" left join master_guest mgg on mb.hotel_group_id = mgg.hotel_group_id and mb.hotel_id = mgg.hotel_id and mb.grp_accnt = mgg.id "+
			" where a.hotel_group_id = ? and a.hotel_id = ? AND a.sta IN('I','R','S') AND a.rsv_class IN('F','H') " +
			" AND NOT EXISTS(SELECT 1 FROM master_base d WHERE d.id <> d.rsv_id and a.id = d.rsv_id AND d.rsv_class = 'F' " +
			" AND d.sta in('I','R','S') AND d.hotel_group_id = a.hotel_group_id AND d.hotel_id = a.hotel_id) " +
			" AND IF(a.id = a.rsv_id,EXISTS (SELECT 1 FROM rsv_src AS e WHERE e.hotel_group_id = a.hotel_group_id AND e.hotel_id = a.hotel_id AND e.occ_flag IN ('RF','RG')"+
			" AND e.accnt = a.id AND e.rmnum > 0),1=1) ";
			SQLHelper sh = new SQLHelper();
//			sh.appendSql("	SELECT                                     ");
//			sh.appendSql("	  '"+dto.getSerialNum()+"' AS serialNum,   ");
//			sh.appendSql("	  a.rmno      AS rmno,                     ");
//			sh.appendSql("	  a.id        AS accnt,                    ");
//			sh.appendSql("	  b.name      AS name,                     ");
//			sh.appendSql("	  a.arr       AS arr,                      ");
//			sh.appendSql("	  a.dep       AS dep,                      ");			
//			sh.appendSql("	  (a.charge - a.pay) AS amount,            ");
//			sh.appendSql("	  a.sta       AS sta,                      ");
//			sh.appendSql("	  a.grp_accnt AS groupId   ,               ");
//			sh.appendSql("	  a.remark AS remark      ,                ");
//			sh.appendSql("	  a.salesman AS salesman      ,            ");
//			sh.appendSql("	  a.specials AS specials      ,            ");
//			sh.appendSql("	  a.co_msg AS coMsg      ,                  ");
//			sh.appendSql("	  c.name AS saleDescript,                        ");
//			sh.appendSql("    a.credit as credit                        ");
//			sh.appendSql("	FROM master_base AS a                      ");
//			sh.appendSql("	  LEFT JOIN master_guest AS b              ");
//			sh.appendSql("	    ON a.id = b.id                         ");
//			sh.appendSql("	  LEFT JOIN sales_man AS c              ");
//			sh.appendSql("	   ON a.salesman=c.code and c.hotel_group_id=a.hotel_group_id and c.hotel_id=0 ");
//			sh.appendSql("	WHERE a.hotel_group_id = ?                 ");
//			sh.appendSql("	    AND a.hotel_id = ?                     ");
//			sh.insertValue(dto.getHotelGroupId());
//			sh.insertValue(dto.getHotelId());
//		//含消费帐
//		//	sh.appendSql("	    AND a.rsv_class <> 'H'                 ");
//			sh.appendSql("	    AND a.sta in ('I','S')              ");
			/** 账号，rsv_id正则表达式 **/
			Pattern pattern = Pattern.compile("\\d*");
            Matcher matcher = pattern.matcher(dto.getSearchInfo());
            
			if(dto.findWheConcat(0,"a.rmno")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);					
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(0, "a.rmno",sh);
		        
		        sh = sh.appendSql(" union "+baseSqlGroup);
		        sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(0, "a.rmno",sh);
		        
		        if("T".equals(isOSearch)){
		        	sh = sh.appendSql(" union "+baseSqlOSta);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	sh.insertValue(bizDate);
		        	dto.findPosInfoSub(0, "a.rmno",sh);
		        }
		        if("T".equals(isLinkSearch)){
		        	sh = sh.appendSql(" union "+baseSqlLink);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	dto.findPosInfoSub(0, "a.rmno",sh);
		        }
		    }
			
			if(matcher.matches()){
				if(dto.findWheConcat(1, "a.id")){
					if(StringUtil.isBlank(sh.getSQL())){
						sh = sh.appendSql(baseSql);
					}else{
						sh = sh.appendSql(" union "+baseSql);
					}
			    	
			        
			    	sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			        dto.findPosInfoSub(1, "a.id",sh);
			        
			        sh = sh.appendSql(" union "+baseSqlGroup);
			        sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			        dto.findPosInfoSub(1, "a.id",sh);
			        
			        if("T".equals(isOSearch)){
			        	sh = sh.appendSql(" union "+baseSqlOSta);
			        	sh.insertValue(dto.getHotelGroupId());
			        	sh.insertValue(dto.getHotelId());
			        	sh.insertValue(bizDate);
			        	dto.findPosInfoSub(1, "a.id",sh);
			        }
			        if("T".equals(isLinkSearch)){
			        	sh = sh.appendSql(" union "+baseSqlLink);
			        	sh.insertValue(dto.getHotelGroupId());
			        	sh.insertValue(dto.getHotelId());
			        	dto.findPosInfoSub(1, "a.id",sh);
			        }

			    }
			}
			
			
			
			if(dto.findWheConcat(2, "b.name")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(2, "b.name",sh);
		        
		        sh = sh.appendSql(" union "+baseSqlGroup);
		        sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(2, "b.name",sh);
		        
		        if("T".equals(isOSearch)){
		        	sh = sh.appendSql(" union "+baseSqlOSta);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	sh.insertValue(bizDate);
		        	dto.findPosInfoSub(2, "b.name",sh);
		        }
		        if("T".equals(isLinkSearch)){
		        	sh = sh.appendSql(" union "+baseSqlLink);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	dto.findPosInfoSub(2, "b.name",sh);
		        }

		    }
			
			if(matcher.matches()){
				if(dto.findWheConcat(3, "b.mobile")){
					if(StringUtil.isBlank(sh.getSQL())){
						sh = sh.appendSql(baseSql);
					}else{
						sh = sh.appendSql(" union "+baseSql);
					}
			    	
			        
			    	sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			        dto.findPosInfoSub(3, "b.mobile",sh);
			        
			        sh = sh.appendSql(" union "+baseSqlGroup);
			        sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			        dto.findPosInfoSub(3, "b.mobile",sh);
			        
			        if("T".equals(isOSearch)){
			        	sh = sh.appendSql(" union "+baseSqlOSta);
			        	sh.insertValue(dto.getHotelGroupId());
			        	sh.insertValue(dto.getHotelId());
			        	sh.insertValue(bizDate);
			        	dto.findPosInfoSub(3, "b.mobile",sh);
			        }
			        if("T".equals(isLinkSearch)){
			        	sh = sh.appendSql(" union "+baseSqlLink);
			        	sh.insertValue(dto.getHotelGroupId());
			        	sh.insertValue(dto.getHotelId());
			        	dto.findPosInfoSub(3, "b.mobile",sh);
			        }

			    }
			}
			
			
			if(matcher.matches()){
				if(dto.findWheConcat(4, "a.rsv_id")){
					if(StringUtil.isBlank(sh.getSQL())){
						sh = sh.appendSql(baseSql);
					}else{
						sh = sh.appendSql(" union "+baseSql);
					}
			    	
			        
			    	sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			    	dto.findPosInfoSub(4, "a.rsv_id", sh);
			    	
			    	sh = sh.appendSql(" union "+baseSqlGroup);
			    	sh.insertValue(dto.getHotelGroupId());
			    	sh.insertValue(dto.getHotelId());
			    	dto.findPosInfoSub(4, "a.rsv_id", sh);
			    	
			    	if("T".equals(isOSearch)){
			        	sh = sh.appendSql(" union "+baseSqlOSta);
			        	sh.insertValue(dto.getHotelGroupId());
			        	sh.insertValue(dto.getHotelId());
			        	sh.insertValue(bizDate);
			        	dto.findPosInfoSub(4, "a.rsv_id",sh);
			        }
			        if("T".equals(isLinkSearch)){
			        	sh = sh.appendSql(" union "+baseSqlLink);
			        	sh.insertValue(dto.getHotelGroupId());
			        	sh.insertValue(dto.getHotelId());
			        	dto.findPosInfoSub(4, "a.rsv_id",sh);
			        }

			    }
			}
			
			
			if(dto.findWheConcat(5, "a.rsv_no")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		    	dto.findPosInfoSub(5, "a.rsv_no", sh);
		    	
		    	sh = sh.appendSql(" union "+baseSqlGroup);
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		    	dto.findPosInfoSub(5, "a.rsv_no", sh);
		    	
		    	if("T".equals(isOSearch)){
		        	sh = sh.appendSql(" union "+baseSqlOSta);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	sh.insertValue(bizDate);
		        	dto.findPosInfoSub(5, "a.rsv_no",sh);
		        }
		        if("T".equals(isLinkSearch)){
		        	sh = sh.appendSql(" union "+baseSqlLink);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	dto.findPosInfoSub(5, "a.rsv_no",sh);
		        }
		    }
			
			if(dto.findWheConcat(6,"a.crs_no")){
				if(StringUtil.isBlank(sh.getSQL())){
					sh = sh.appendSql(baseSql);
				}else{
					sh = sh.appendSql(" union "+baseSql);
				}
		    	
		        
		    	sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(6, "a.crs_no",sh);
		        
		        sh = sh.appendSql(" union "+baseSqlGroup);
		        sh.insertValue(dto.getHotelGroupId());
		    	sh.insertValue(dto.getHotelId());
		        dto.findPosInfoSub(6, "a.crs_no",sh);
		        
		        if("T".equals(isOSearch)){
		        	sh = sh.appendSql(" union "+baseSqlOSta);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	sh.insertValue(bizDate);
		        	dto.findPosInfoSub(6, "a.crs_no",sh);
		        }
		        if("T".equals(isLinkSearch)){
		        	sh = sh.appendSql(" union "+baseSqlLink);
		        	sh.insertValue(dto.getHotelGroupId());
		        	sh.insertValue(dto.getHotelId());
		        	dto.findPosInfoSub(6, "a.crs_no",sh);
		        }
		    }
//			dto.startSh(sh);
//			dto.findPosInfoSub(0, "a.rmno",sh);
//			dto.findPosInfoSub( 1, "CAST(a.id AS CHAR(30))", sh);
//			dto.findPosInfoSub( 2, "b.name",sh);
//			dto.findPosInfoSub(3, "b.mobile", sh);
//			dto.findPosInfoSub(4, "CAST(a.rsv_id AS CHAR(30))", sh);
//			dto.findPosInfoSub(5, "a.rsv_no", sh);
//			dto.findPosInfoSub(6, "a.crs_no", sh);
//			dto.endSh(sh);
			
			
			sh.appendSql("	    order by sta,accnt                            ");	
			sh.appendSql(dto.getLimitStr());
			return findByNativeSQL(sh,POSMasterEnquiryDto.class);
		}
		
		/**
		 * 查询预订单联房信息集合大小
		 * @param resrvBaseId			预订单ID
		 * @param linkId				联房ID
		 * @param pkgLinkId				包价联房ID
		 * @param hasSelf				是否统计包含自己
		 * @param hasMaster				是否统计包含登记
		 * @param hasResrv              是否统计预订单
		 * @param hasHistory			是否统计历史
		 * @param stas					状态列表(多个状态使用','分隔)
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return Integer
		 * @author Cairo
		 * @serialData 2012-01-05
		 * @modify Cairo
		 * @modifyDatetime 2014-08-20
		 */
		@Override
		public Integer findResrvBaseLinkSize(Long resrvBaseId,Long linkId,Long pkgLinkId,
				Boolean hasSelf,Boolean hasMaster,Boolean hasResrv,Boolean hasHistory,String stas,Long hotelGroupId,Long hotelId){
			Integer linkSize = 1;
			SQLHelper sh = new SQLHelper();
			if(hasMaster){
				sh.clear();
				sh.appendSql(" SELECT COUNT(1)               ");
				sh.appendSql(" FROM master_base a            ");
				sh.appendSql(" WHERE a.rsv_class IN ('F','D')");
				sh.appendSql("     AND a.rsv_id <> a.id      ");
				sh.appendSql("     AND a.is_resrv = 'F'      ");
				sh.appendSql("     AND a.hotel_group_id = ?  ");
				sh.appendSql("     AND a.hotel_id = ?        ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql(" AND a.id <> ? ");
				sh.insertValue(resrvBaseId);
				if(isNotNull(stas)){
					sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
				}
				sh.appendSql(" and ( 1=2 ");
				if(linkId != null && !linkId.equals(0l)){
				  sh.appendSql(" or a.link_id = ? ");
				  sh.insertValue(linkId);
				}
	//			if(pkgLinkId != null && !pkgLinkId.equals(0l)){
	//			  sh.appendSql(" or a.pkg_link_id = ? ");
	//			  sh.insertValue(pkgLinkId);
	//			}
				sh.appendSql(" ) ");
				linkSize += Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
				sh.clear();
				if(hasResrv){
					sh.appendSql(" SELECT COUNT(1)             ");
					sh.appendSql(" FROM master_base a          ");
					sh.appendSql(" WHERE a.rsv_class =  'F'	   ");
					sh.appendSql("     AND a.rsv_id = a.id     ");
					sh.appendSql("     AND a.is_resrv = 'T'    ");
					sh.appendSql("     AND a.hotel_group_id = ?");
					sh.appendSql("     AND a.hotel_id = ?      ");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					sh.appendSql(" AND a.id <> ? ");
					sh.insertValue(resrvBaseId);
					if(isNotNull(stas)){
						sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
					}
					sh.appendSql(" and ( 1=2 ");
					if(linkId != null && !linkId.equals(0l)){
					  sh.appendSql(" or a.link_id = ? ");
					  sh.insertValue(linkId);
					}
		//			if(pkgLinkId != null && !pkgLinkId.equals(0l)){
		//			  sh.appendSql(" or a.pkg_link_id = ? ");
		//			  sh.insertValue(pkgLinkId);
		//			}
					sh.appendSql(" ) ");
					linkSize += Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
					sh.clear();
				}
				if(!hasHistory){
					return linkSize;
				}
				sh.appendSql(" SELECT COUNT(1)             ");
				sh.appendSql(" FROM master_base_history a  ");
				sh.appendSql(" WHERE a.rsv_class IN ('F','D')");
				sh.appendSql("     AND a.hotel_group_id = ?");
				sh.appendSql("     AND a.hotel_id = ?      ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql(" AND a.id <> ? ");
				sh.insertValue(resrvBaseId);
				if(!hasResrv){
					sh.appendSql(" AND a.id <> a.rsv_id ");
					sh.appendSql(" AND a.is_resrv = 'F' ");
				}
				if(isNotNull(stas)){
					sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
				}
				sh.appendSql(" and ( 1=2 ");
				if(linkId != null && !linkId.equals(0l)){
				  sh.appendSql(" or a.link_id = ? ");
				  sh.insertValue(linkId);
				}
	//			if(pkgLinkId != null && !pkgLinkId.equals(0l)){
	//			  sh.appendSql(" or a.pkg_link_id = ? ");
	//			  sh.insertValue(pkgLinkId);
	//			}
				sh.appendSql(" ) ");
				linkSize += Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
			}
			return linkSize;
		}
		
		/**
		 * 更新其他同住人同住ID
		 */
		@Override
		public void updateMasterLiveId(Long liveId,List<Long> shareMasterBaseIds,Long hotelGroupId,Long hotelId){
			boolean hasLiveKey = false;
			if(shareMasterBaseIds != null && !shareMasterBaseIds.isEmpty()){
				for(Long shareMasterBaseId : shareMasterBaseIds){
					if(liveId.equals(shareMasterBaseId)){
						hasLiveKey = true;
						break;
					}
				}
				if(!hasLiveKey){
					SQLHelper sh = new SQLHelper();
					sh.appendSql("	UPDATE MasterBase obj					");
					sh.appendSql("	SET obj.masterId = ?					");
					sh.insertValue(shareMasterBaseIds.get(0));
					sh.appendSql("	WHERE obj.masterId = ? 					");
					sh.insertValue(liveId);
					sh.appendOrSql(" OR obj.id = ? ", shareMasterBaseIds);
					sh.appendSql("	AND obj.hotelGroupId = ?				");
					sh.appendSql("	AND obj.hotelId = ?    					");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					bulkUpdate(sh);
					sh.clear();
					sh.appendSql("	UPDATE RsvSrc obj						");
					sh.appendSql("	SET obj.masterId = ?					");
					sh.insertValue(shareMasterBaseIds.get(0));
					sh.appendSql("	WHERE obj.masterId = ? 					");
					sh.insertValue(liveId);
					sh.appendOrSql(" OR obj.accnt = ? ", shareMasterBaseIds);
					sh.appendSql("	AND obj.hotelGroupId = ?				");
					sh.appendSql("	AND obj.hotelId = ?    					");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					bulkUpdate(sh);
				}else{
					SQLHelper sh = new SQLHelper();
					sh.appendSql("	SELECT obj								");
					sh.appendSql("	FROM MasterBase obj						");
					sh.appendSql("	WHERE obj.masterId = ? 					");
					sh.insertValue(liveId);
					for(Long shareMasterBaseId : shareMasterBaseIds){
						sh.appendSql(" AND obj.id <> ? ");
						sh.insertValue(shareMasterBaseId);
					}
					sh.appendSql("	AND obj.hotelGroupId = ?				");
					sh.appendSql("	AND obj.hotelId = ?    					");
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					List<MasterBase> masterBaseList = find(sh);
					if(masterBaseList != null && !masterBaseList.isEmpty()){
						sh.clear();
						sh.appendSql("	UPDATE MasterBase obj				");
						sh.appendSql("	SET obj.masterId = ?				");
						sh.insertValue(masterBaseList.get(0).getId());
						sh.appendSql("	WHERE obj.masterId = ? 				");
						sh.insertValue(liveId);
						for(Long shareMasterBaseId : shareMasterBaseIds){
							sh.appendSql(" AND obj.id <> ? ");
							sh.insertValue(shareMasterBaseId);
						}
						sh.appendSql("	AND obj.hotelGroupId = ?			");
						sh.appendSql("	AND obj.hotelId = ?    				");
						sh.insertValue(hotelGroupId);
						sh.insertValue(hotelId);
						bulkUpdate(sh);
						sh.clear();
						sh.appendSql("	UPDATE RsvSrc obj					");
						sh.appendSql("	SET obj.masterId = ?				");
						sh.insertValue(masterBaseList.get(0).getId());
						sh.appendSql("	WHERE obj.masterId = ? 				");
						sh.insertValue(liveId);
						for(Long shareMasterBaseId : shareMasterBaseIds){
							sh.appendSql(" AND obj.accnt <> ? ");
							sh.insertValue(shareMasterBaseId);
						}
						sh.appendSql("	AND obj.hotelGroupId = ?			");
						sh.appendSql("	AND obj.hotelId = ?    				");
						sh.insertValue(hotelGroupId);
						sh.insertValue(hotelId);
						bulkUpdate(sh);
					}
				}
			}
		}
		
		@Override
		public List<MasterBaseIdAndRoomDto> findMasterBaseIdAndRoomDtoById(Long id,
				String rsvClass,Long grpAccnt,Long linkId, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			if(rsvClass.equals(MasterBase.RsvClass.G)){
				sh.appendSql("SELECT                      ");
				sh.appendSql("  id accnt,                       ");
				sh.appendSql("  rmno rmno                     ");
				sh.appendSql("FROM master_base            ");
				sh.appendSql("WHERE (rsv_class = 'F' or rsv_class = 'D')       ");
				sh.appendSql("    AND grp_accnt <> id   ");
				sh.appendSql("    AND grp_accnt = ?   ");
				sh.insertValue(grpAccnt);
				sh.appendSql("    AND hotel_group_id = ?  ");
				sh.insertValue(hotelGroupId);
				sh.appendSql("    AND hotel_id = ?        ");
				sh.insertValue(hotelId);
				return findByNativeSQL(sh,MasterBaseIdAndRoomDto.class);
			}else{
				sh.appendSql("SELECT                      ");
				sh.appendSql("  id accnt,                       ");
				sh.appendSql("  rmno rmno                     ");
				sh.appendSql("FROM master_base            ");
				sh.appendSql("WHERE (rsv_class = 'F' or rsv_class = 'D')      ");
				sh.appendSql("    AND link_id = ?   ");
				sh.insertValue(linkId);
				sh.appendSql("    AND hotel_group_id = ?  ");
				sh.insertValue(hotelGroupId);
				sh.appendSql("    AND hotel_id = ?        ");
				sh.insertValue(hotelId);
				return findByNativeSQL(sh,MasterBaseIdAndRoomDto.class);
			}
		}
		
		/**
		 * 根据给定条件，输出批量处理查询sql
		 * @param masterIds		登记单ID列表，多个ID之间使用","分隔
		 * @param stas		          状态列表，默认一般是("R,I")
		 * @param type			查询模式（R:预订单查询；G:团队查询；F:ID列表查询）
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 */
		@Override
		public List<VolumeMasterDto> findVolumeMasterDtoByMasterIds(String masterIds,
				String rsvClasses,String stas,String type,Long hotelGorupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT a.id          AS id,        ");
			sh.appendSql("   a.rsv_id         AS rsvId,       ");
			sh.appendSql("   a.rsv_class      AS rsvClass,    ");
			sh.appendSql("   a.master_id      AS masterId,    ");
			sh.appendSql("   a.grp_accnt      AS grpAccnt,    ");
			sh.appendSql("   a.grp_flag       AS grpFlag,	  ");
			sh.appendSql("   a.link_id        AS linkId,	  ");
			sh.appendSql("   a.sta            AS sta,         ");
			sh.appendSql("   a.rmtype         AS rmtype,      ");
			sh.appendSql("   a.rmno           AS rmno,        ");
			sh.appendSql("   a.rmno_son       AS rmnoSon,     ");
			sh.appendSql("   IFNULL(j.flag ,'') AS rmSta,     ");
			sh.appendSql("   a.arr            AS arr,         ");
			sh.appendSql("   a.dep            AS dep,         ");
			sh.appendSql("   a.adult          AS adult,       ");
			sh.appendSql("   a.nego_rate      AS negoRate,    ");
			sh.appendSql("   a.real_rate      AS realRate,    ");
			sh.appendSql("   a.dsc_reason     AS dscReason,   ");
			sh.appendSql("   a.company_id     AS companyId,   ");
			sh.appendSql("   a.agent_id       AS agentId,     ");
			sh.appendSql("   a.source_id      AS sourceId,    ");
			sh.appendSql("   a.salesman       AS salesMan,    ");
			sh.appendSql("   a.src            AS src,         ");
			sh.appendSql("   a.market         AS market,      ");
			sh.appendSql("   a.rsv_type       AS rsvType,     ");
			sh.appendSql("   a.channel        AS channel,     ");
			sh.appendSql("   a.ratecode       AS rateCode,    ");
			sh.appendSql("   a.cmscode        AS cmsCode,     ");
			sh.appendSql("   a.packages       AS packages,    ");
			sh.appendSql("   a.specials       AS specials,    ");
			sh.appendSql("   a.amenities      AS amenities,   ");
			sh.appendSql("   a.is_secret_rate AS isSecretRate,");
			sh.appendSql("   a.is_permanent   AS isPermanent, ");
			sh.appendSql("   a.posting_flag   AS postingFlag, ");
			sh.appendSql("   a.extra_flag     AS extraFlag,   ");
			sh.appendSql("   a.remark         AS remark,      ");
			sh.appendSql("   a.co_msg         AS coMsg,       ");
			sh.appendSql("   IFNULL(e.int_cmd,SUBSTRING(a.extra_flag,12,1)) AS phoneLv,    ");
			sh.appendSql("   IFNULL(f.int_cmd,SUBSTRING(a.extra_flag,13,1)) AS vodLv,      ");
			sh.appendSql("   IFNULL(g.int_cmd,SUBSTRING(a.extra_flag,14,1)) AS internetLv, ");
			sh.appendSql("   IFNULL(c.id,0)        AS subAccnt,   ");
			sh.appendSql("   IFNULL(d.id,0)        AS grpSubAccnt,");
			sh.appendSql("   b.profile_id     AS profileId,   ");
			sh.appendSql("   b.name           AS `name`,      ");
			sh.appendSql("   b.last_name      AS lastName,    ");
			sh.appendSql("   b.first_name     AS firstName,   ");
			sh.appendSql("   b.name2          AS name2,       ");
			sh.appendSql("   b.name3          AS name3,       ");
			sh.appendSql("   b.name_combine   AS nameCombine, ");
			sh.appendSql("   b.sex            AS sex,         ");
			sh.appendSql("   b.language       AS `language`,  ");
			sh.appendSql("   b.title          AS title,       ");
			sh.appendSql("   b.salutation     AS salutation,  ");
			sh.appendSql("   b.birth          AS birth,       ");
			sh.appendSql("   b.race           AS race,        ");
			sh.appendSql("   b.religion       AS religion,    ");
			sh.appendSql("   b.career         AS career,      ");
			sh.appendSql("   b.occupation     AS occupation,  ");
			sh.appendSql("   b.nation         AS nation,      ");
			sh.appendSql("   b.country        AS country,     ");
			sh.appendSql("   b.state          AS state,       ");
			sh.appendSql("   b.city           AS city,        ");
			sh.appendSql("   b.division       AS division,    ");
			sh.appendSql("   b.street         AS street,      ");
			sh.appendSql("   b.zipcode        AS zipCode,     ");
			sh.appendSql("   b.id_code        AS idCode,      ");
			sh.appendSql("   b.id_no          AS idNo,        ");
			sh.appendSql("   b.id_end         AS idEnd,       ");
			sh.appendSql("   b.vip            AS vip,         ");
			sh.appendSql("   b.visa_type      AS visaType,    ");
			sh.appendSql("   b.visa_no        AS visaNo,      ");
			sh.appendSql("   b.visa_begin     AS visaBegin,   ");
			sh.appendSql("   b.visa_end       AS visaEnd,     ");
			sh.appendSql("   b.visa_grant     AS visaGrant,   ");
			sh.appendSql("   b.enter_port     AS enterPort,   ");
			sh.appendSql("   b.enter_date     AS enterDate,   ");
			sh.appendSql("   b.enter_date_end AS enterDateEnd,");
			sh.appendSql("   a.credit_man     AS number,      ");
			sh.appendSql("   b.remark         AS guestRemark  ");
			sh.appendSql(" FROM master_base AS a              ");
			sh.appendSql("   JOIN master_guest AS b           ");
			sh.appendSql(" 	  ON b.id = a.id               ");
			sh.appendSql(" 	  AND b.hotel_group_id = ?    ");
			sh.appendSql(" 	  AND b.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("	 LEFT JOIN account_sub AS c     ");
			sh.appendSql("	   ON c.accnt = a.id            ");
			sh.appendSql("	   AND c.type = 'SUBACCNT'      ");
			sh.appendSql("	   AND c.tag = 'SYS_FIX'        ");
			sh.appendSql("	   AND c.hotel_group_id = ?    ");
			sh.appendSql("	   AND c.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN account_sub AS d      ");
			sh.appendSql(" 	   ON d.accnt = a.id            ");
			sh.appendSql(" 	   AND d.type = 'SUBACCNT'      ");
			sh.appendSql(" 	   AND d.tag = 'SYS_MOD'        ");
			sh.appendSql(" 	   AND d.hotel_group_id = ?    ");
			sh.appendSql(" 	   AND d.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN interface_action AS e ");
			sh.appendSql(" 	   ON e.accnt = a.id            ");
			sh.appendSql(" 	   AND e.int_type = 'p_grade'   ");
			sh.appendSql(" 	   AND e.hotel_group_id = ?    ");
			sh.appendSql(" 	   AND e.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN interface_action AS f ");
			sh.appendSql("	   ON f.accnt = a.id            ");
			sh.appendSql("	   AND f.int_type = 'vod_grade' ");
			sh.appendSql("	   AND f.hotel_group_id = ?    ");
			sh.appendSql("	   AND f.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN interface_action AS g ");
			sh.appendSql("	   ON g.accnt = a.id            ");
			sh.appendSql("	   AND g.int_type = 'int_grade' ");
			sh.appendSql("	   AND g.hotel_group_id = ?    ");
			sh.appendSql("	   AND g.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);                          
			sh.insertValue(hotelId);
			sh.appendSql("  LEFT JOIN room_sta AS gg        ");
			sh.appendSql("	  ON gg.hotel_group_id = ?      ");
			sh.appendSql("	    AND gg.hotel_id = ?         ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND a.rmno = gg.rmno        ");
			sh.appendSql("  LEFT JOIN code_base AS j        ");
			sh.appendSql("	  ON j.hotel_group_id = ?       ");
			sh.appendSql("	    AND j.hotel_id = ?          ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND j.parent_code = 'room_sta_map'");
			sh.appendSql("	    AND j.code = CONCAT(gg.sta_occ,gg.sta)"); 
			sh.appendSql("  WHERE a.hotel_group_id = ?        ");
			sh.appendSql("      AND a.hotel_id = ?            ");
			sh.insertValue(hotelGorupId);
			sh.insertValue(hotelId);
			sh.appendSql("      AND a.rsv_class <> 'H' ");
			sh.appendSql("      AND a.id <> a.rsv_id   ");
			sh.appendSql("      AND a.is_resrv = 'F'   ");
			if(isNotNull(rsvClasses)){
				sh.appendOrSql(" OR a.rsv_class = ? ",rsvClasses.split(EntityConstant.COMMA));
			}else{
				sh.appendSql(" AND a.rsv_class = 'F' ");
			}
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(EntityConstant.COMMA));
			}else{
				sh.appendSql(" AND a.sta IN ('I','R')  ");
			}
			if("R".equals(type)){
				sh.appendSql(" AND a.rsv_id = ? AND a.id <> ? ");
				sh.insertValue(masterIds);
				sh.insertValue(masterIds);
			}else if("G".equals(type)){
				sh.appendSql(" AND a.grp_accnt = ? AND a.id <> ? ");
				sh.insertValue(masterIds);
				sh.insertValue(masterIds);
			}else{
				sh.appendOrSql(" Or a.id = ? ",masterIds.split(EntityConstant.COMMA));
			}
			sh.appendSql(" GROUP BY a.id ");	// 按主单分组，避免重复记录
			sh.appendSql(" ORDER BY a.rmno+0,a.rmno_son+0,a.master_id,a.id ");
			return findByNativeSQL(sh,VolumeMasterDto.class);
		}
		
		/**
		 * 根据给定团队ID查询指定状态成员数量
		 * @param groupId				预订单ID
		 * @param stas					登记单状态
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return Integer
		 * @author Cairo
		 * @date 2012-05-28
		 */
		@Override
		public Integer findMasterBaseNumGroupId(Long groupId,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT                       ");
			sh.appendSql("	  COUNT(1)                   ");
			sh.appendSql("	FROM master_base             ");
			sh.appendSql("	WHERE grp_accnt = ?          ");
			sh.insertValue(groupId);
			sh.appendSql("      AND rsv_class = 'F'     ");
			sh.appendSql("      AND id <> rsv_id         ");
			if(isNotNull(stas)){
				 sh.appendOrSql(" OR sta = ? " ,stas.split(EntityConstant.COMMA));
			}
			sh.appendSql("	    AND hotel_group_id = ?   ");
			sh.appendSql("	    AND hotel_id = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
		}
		
		/**
		 * 根据给定条件，查询符合条件的在住同住主登记单记录
		 * @param rsvClass			登记单类型
		 * @param sta				登记单状态
		 * @param masterId			同住ID
		 * @param rmNo				房号
		 * @param occId				资源占用ID
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return MasterBase
		 * @author Cairo
		 * @date 2012-04-23
		 */
		@Override
		public MasterBase findLiveMainMasterBase(String rsvClass,String sta,Long masterId,
				String rmNo,Long occId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj                      ");
			sh.appendSql("	FROM MasterBase AS obj          ");
			sh.appendSql("	WHERE obj.rsvClass = ?          ");
			sh.insertValue(rsvClass);
			if(isNotNull(sta)){
				sh.appendSql("	    AND obj.sta = ?         ");
				sh.insertValue(sta);
			}
			sh.appendSql("      AND obj.id <> obj.masterId  ");
			sh.appendSql("	    AND obj.masterId = ?        ");
			sh.insertValue(masterId);
			sh.appendSql("	    AND obj.id = ?              ");
			sh.insertValue(masterId);
			sh.appendSql("	    AND obj.rmno = ?            ");
			sh.insertValue(rmNo);
			if(occId != null){
				sh.appendSql("      AND obj.rmoccId = ?     ");
				sh.insertValue(occId);
			}
			sh.appendSql("	    AND obj.hotelGroupId = ?    ");
			sh.appendSql("	    AND obj.hotelId = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			List<MasterBase> list=find(sh);
			if(list != null && list.size() > 0){
				return list.get(0);
			}
			return null;
		}
		
		/**
		 * 根据给定条件更新同住ID
		 * @param oldMasterId		原有同住ID
		 * @param masterId			新的同住ID
		 * @param rmno				房号
		 * @param occId				资源占用ID(没有请传NULL)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return void
		 * @author Cairo
		 * @date 2012-04-24
		 */
		@Override
		public void updateMasterIdByOldMasterId(Long oldMasterId,Long masterId,
				String rmno,Long occId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	UPDATE MasterBase AS a			");
			sh.appendSql("	SET a.masterId = ?				");
			sh.insertValue(masterId);
			sh.appendSql("	WHERE a.id <> a.rsvId			");
			sh.appendSql("	AND a.rsvClass = ?				");
			sh.insertValue(MasterBase.RsvClass.F);
			sh.appendSql("	AND (a.sta = ? OR a.sta = ?)	");
			sh.insertValue(MasterBase.Sta.R);
			sh.insertValue(MasterBase.Sta.I);
			sh.appendSql("	AND a.masterId = ?				");
			sh.insertValue(oldMasterId);
			sh.appendSql("	AND a.rmno = ? 					");
			sh.insertValue(rmno);
			if(occId != null){
				sh.appendSql(" AND a.rmoccId = ? ");
				sh.insertValue(occId);
			}
			sh.appendSql("	AND a.hotelGroupId = ?			");
			sh.appendSql("	AND a.hotelId = ?				");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			bulkUpdate(sh);
		}
		
		@Override
		public List<MasterBase> listOrderBySta(MasterBase masterBase)
				throws DataAccessException {
			SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
			spellSQL(sh, masterBase);
			sh.appendSql(" AND obj.sta <> 'D' ");
			sh.appendSql(" ORDER BY obj.sta,obj.rmno,obj.id");
			return find(sh);
		}
		@Override
		public List<MasterBase> listCreditGuestNameIdno(MasterBase tmp) {
			List<MasterBase> mbs = new ArrayList<MasterBase>(0);
			List<MasterBase> tmps = new ArrayList<MasterBase>(0);

			//同住
			SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
			sh.appendSql(" and obj.masterId = ? ");
			sh.appendSql(" and obj.id <> ? ");
			sh.insertValue(tmp.getMasterId());
			sh.insertValue(tmp.getId());
			sh.appendSql(" ORDER BY obj.id");
			tmps = find(sh);
			if(tmp!=null){
				mbs.addAll(tmps);
			}
			sh.clear();
			
			//联房
			if(tmp.getLinkId()!=null){
				sh.setSql(" SELECT obj FROM MasterBase obj WHERE 1=1  ");
				sh.appendSql(" and obj.linkId = ? ");
				sh.appendSql(" and obj.id <> ? ");
				sh.appendSql(" and obj.hotelGroupId = ? ");
				sh.appendSql(" and obj.hotelId = ? ");
				sh.appendSql(" and obj.masterId <> ? ");
				sh.insertValue(tmp.getLinkId());
				sh.insertValue(tmp.getId());
				sh.insertValue(tmp.getHotelGroupId());
				sh.insertValue(tmp.getHotelId());
				sh.insertValue(tmp.getMasterId());
				sh.appendSql(" ORDER BY obj.id");
				tmps = find(sh);
				if(tmp!=null){
					mbs.addAll(tmps);
				}
				sh.clear();
			}

			//团队
			if(tmp.getGrpAccnt()!=null && !tmp.getGrpAccnt().equals(0L)){
				sh.setSql(" SELECT obj FROM MasterBase obj WHERE 1=1  ");
				sh.appendSql(" and obj.grpAccnt = ? ");
				sh.appendSql(" and obj.hotelGroupId = ? ");
				sh.appendSql(" and obj.hotelId = ? ");
				sh.appendSql(" and obj.id <> ? ");
				sh.appendSql(" and obj.masterId <> ? ");
				sh.appendSql(" and obj.rsvClass = ? ");
				sh.insertValue(tmp.getGrpAccnt());
				sh.insertValue(tmp.getHotelGroupId());
				sh.insertValue(tmp.getHotelId());
				sh.insertValue(tmp.getId());
				sh.insertValue(tmp.getMasterId());
				sh.insertValue(MasterBase.RsvClass.F);
				sh.appendSql(" ORDER BY obj.id");
				tmps = find(sh);
				if(tmp!=null){
					mbs.addAll(tmps);
				}
				sh.clear();
			}
			
			return mbs;
		}
		
		/**
		 * 根据给定房号及同住ID，查询同住人列表
		 * @param masterId
		 * @param rmno
		 * @param sta
		 * @param filterId
		 * @param hotelGroupId
		 * @param hotelId
		 * @return List<MasterBase>
		 * @author Cairo
		 * @date 2012-08-07
		 */
		@Override
		public List<MasterBase> findMasterBaseByLiveIdAndRmno(Long masterId, String rmno, String sta, Long filterId, Long hotelGroupId, Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj                   ");
			sh.appendSql("	  FROM MasterBase obj        ");
			sh.appendSql("	WHERE obj.hotelGroupId = ?   ");
			sh.appendSql("	    AND obj.hotelId = ?      ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(masterId != null){
				sh.appendSql(" AND obj.masterId = ? ");
				sh.insertValue(masterId);
			}
			if(StringHelper.isNotNull(rmno)){
				sh.appendSql(" AND obj.rmno = ? ");
				sh.insertValue(rmno);
			}
			if(StringHelper.isNotNull(sta)){
				sh.appendOrSql(" OR obj.sta = ? ", sta.split(CodeBaseConstant.MULTIPLE_SEPARATE));
			}
			if(filterId != null && filterId != 0L){
				sh.appendSql(" AND obj.id <> ?	");
				sh.insertValue(filterId);
			}
			return find(sh);
		}
		
		/**
		 * 根据给定房号及同住ID，查询同住人列表
		 * @param rmno				房号
		 * @param rRmno				需要排除的房号
		 * @param liveId			同住ID
		 * @param rLiveId			需要排除的同住ID
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<MasterBase>
		 * @author Cairo
		 * @date 2012-08-07
		 */
		@Override
		public List<MasterBase> findMasterBaseByLiveIdAndRmno(String rmno,String rRmno,Long liveId,Long rLiveId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj                   ");
			sh.appendSql("	  FROM MasterBase obj        ");
			sh.appendSql("	WHERE obj.hotelGroupId = ?   ");
			sh.appendSql("	    AND obj.hotelId = ?      ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(StringHelper.isNotNull(rmno)){
				sh.appendSql("	    AND obj.rmno = ?     ");
				sh.insertValue(rmno);
			}
			if(StringHelper.isNotNull(rRmno) && !rRmno.equals(rmno)){
				sh.appendSql("	    AND obj.rmno <> ?    ");
				sh.insertValue(rRmno);
			}
			if(liveId != null){
				sh.appendSql("	    AND obj.masterId = ? ");
				sh.insertValue(liveId);
			}
			if(rLiveId != null && !rLiveId.equals(liveId)){
				sh.appendSql("	    AND obj.masterId <> ? ");
				sh.insertValue(rLiveId);
			}
			return find(sh);
		}
		
		@Override
		public List<MasterBase> listMasterBaseStaI(Long hotelGroupId,
				Long hotelId) {
			MasterBase m=new MasterBase();
			m.setHotelGroupId(hotelGroupId);
			m.setHotelId(hotelId);
			m.setSta("I");
			m.setRsvClass("F");
			return list(m);
		}
		@Override
		public List<MasterBase> listMasterBaseStaIForPos(Long hotelGroupId,
				Long hotelId,Date date) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj                  ");
			sh.appendSql("	  FROM MasterBase obj        ");
			sh.appendSql("	WHERE obj.hotelGroupId = ?   ");
			sh.appendSql("	    AND obj.hotelId = ? AND obj.sta='I' AND obj.rsvClass = 'F'  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(date != null){
				sh.appendSql("	    AND obj.arr < ?     ");
				sh.insertValue(date);
			}
			return find(sh);
		}
		@Override
		public List<Long> listSameRoomId(Long hotelGroupId, Long hotelId,
				String rmno) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj.id                  ");
			sh.appendSql("	  FROM MasterBase obj        ");
			sh.appendSql("	WHERE obj.hotelGroupId = ?   ");
			sh.appendSql("	    AND obj.hotelId = ? AND obj.sta='I'     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND obj.rmno = ?     ");
			sh.insertValue(rmno);
			return find(sh);
		}
		@Override
		public List<Long> listroomAccntStaI(Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj.id                  ");
			sh.appendSql("	  FROM MasterBase obj        ");
			sh.appendSql("	WHERE obj.hotelGroupId = ?   ");
			sh.appendSql("	    AND obj.hotelId = ?      ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return find(sh);
		}
		@Override
		public List<DoorcardReadedDto> findCheckInGuest(Long hotelGroupId,
				Long hotelId, String rmno) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT b.vip as vip,a.packages as packages,(a.charge-a.pay) as balance,b.name as name ");
			sh.appendSql("	  FROM master_base AS a ,master_guest AS b ");
			sh.appendSql("	WHERE a.hotel_group_id = ? ");
			sh.appendSql("	    AND a.hotel_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND b.hotel_group_id = ? ");
			sh.appendSql("	    AND b.hotel_id = ?       ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND a.rmno = ?      ");
			sh.insertValue(rmno);
			sh.appendSql("	    AND a.id = b.id     ");
			sh.appendSql("      AND a.rsv_class IN ('F','D') ");
			sh.appendSql("      AND a.id <> a.rsv_id ");
			return findByNativeSQL(sh, DoorcardReadedDto.class);
		}
		
		/**
		 * 根据给定连房ID及包价连房ID，查询连房列表
		 * @param linkId			连房ID
		 * @param pkgLinkId			包价连房ID
		 * @param masterId			同住人ID
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<MasterBase>
		 * @author Cairo
		 * @date 2012-10-26
		 */
		@Override
		public List<MasterBase> findLinkMasterByLinkIdAndPkgLinkId(Long linkId,Long pkgLinkId,Long masterId,Long hotelGroupId,Long hotelId){
			if(linkId == null && pkgLinkId == null){
				return null;
			}
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj FROM MasterBase as obj ");
			sh.appendSql(" WHERE obj.hotelGroupId = ? ");
			sh.appendSql("     AND obj.hotelId = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND obj.rsvClass <> 'G'");
			if(linkId != null){
				sh.appendSql("  AND obj.linkId = ?    ");
				sh.insertValue(linkId);
			}
			if(pkgLinkId != null){
				sh.appendSql("  AND obj.pkgLinkId = ? ");
				sh.insertValue(pkgLinkId);
			}
			if(masterId != null){
				sh.appendSql("  AND obj.masterId = ? ");
				sh.insertValue(masterId);
			}
			return find(sh);
		}
		
		/**
		 * 根据给定登记单id查询登记单记录
		 * @param id		登记单记录ID
		 * @return MasterBase
		 * @author Cairo
		 * @date 2012-12-17
		 */
		@Override
		public MasterBase findMasterById(Long id){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj               ");
			sh.appendSql("	FROM MasterBase as obj ");
			sh.appendSql("	WHERE obj.id = ?         ");
			sh.insertValue(id);
			List<MasterBase> list = find(sh);
			if(list.isEmpty()){
				return null;
			}
			return list.get(0);
		}
		@Override
		public List<InterfaceCmd> findMasterByDate(Long hotelGroupId,
				Long hotelId, Date date) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj.rmno AS rmno,obj.id AS accnt,'F' AS isDone,'' AS argsList               ");
			sh.appendSql("	FROM MasterBase as obj ");
			sh.appendSql(" WHERE obj.hotelGroupId = ? ");
			sh.appendSql("     AND obj.hotelId = ?   AND obj.sta='I' AND obj.rsvClass='F' AND obj.modifyDatetime >= ? and obj.createDatetime<> obj.modifyDatetime ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);	
			sh.insertValue(date);
			return find(sh,InterfaceCmd.class);
		}
		@Override
		public List<MasterBase> findByRomnStaI(String rmno, Long hotelGroupId, Long hotelId, Long filterId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("FROM MasterBase WHERE rmno = ? AND sta = ? AND hotelGroupId = ? AND hotelId = ?");
			sh.insertValue(rmno);
			sh.insertValue(MasterBase.Sta.I);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if(filterId != null){
				sh.appendSql(" AND id <> ? ");
				sh.insertValue(filterId);
			}
			return find(sh);
		}
		@Override
		public String getExterFlag(MasterBase mb, String num) {
			if (mb.getExtraFlag()==null)
			return null;
			int a=Integer.valueOf(num);
			return mb.getExtraFlag().substring(a,a+1);
		}
		
		
		/**
		 * 根据预订单Id查询成员登记单列表
		 * @param masterBaseId 	预订单Id
		 * @param stas 			状态(可选，多个状态间请使用','分隔)
		 * @param condition 	查询条件（姓名，房号，预订人，预订号）
		 * @param inHistory 	是否查历史
		 * @param hotelGroupId 	集团Id
		 * @param hotelId 		酒店Id
		 * @param firstResult	 记录开始序号
		 * @param maxResults 	结果集大小
		 * @return List<MasterLinkDto>
		 * @author Cairo
		 * @serialData 2013-05-07
		 */
		@Override
		public List<MasterLinkDto> findMasterByResrvBaseId(Long masterBaseId,String stas,
				String condition, boolean inHistory, Long hotelGroupId, Long hotelId, int firstResult,int maxResults) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT * FROM(SELECT a.id       id,     ");
			sh.appendSql("    a.rsv_id       AS resrvId,            ");
			sh.appendSql("	  a.rsv_class       rsvClass,           ");
			sh.appendSql("    'C'				type,				");
			sh.appendSql("	  'C'          		flag,               ");
			sh.appendSql("	  b.name            `name`,             ");
			sh.appendSql("	  b.name2		    nameCombine,        ");
			sh.appendSql("	  a.sta             sta,                ");
			sh.appendSql("	  a.ratecode		rateCode,			");
			sh.appendSql("	  a.rmtype          rmType,             ");
			sh.appendSql("	  a.rmnum           rmNum,              ");
			sh.appendSql("	  a.rmno            rmNo,               ");
			sh.appendSql("    a.rmno_son        rmnoSon, ");
			sh.appendSql("	  (a.adult+a.children)    adultNum,     ");
			sh.appendSql("	  a.adult           adult,  			");
			sh.appendSql("	  a.children		children,  			");
			sh.appendSql("	  a.arr             arr,                ");
			sh.appendSql("	  a.dep             dep,                ");
			sh.appendSql("	  DATEDIFF(a.dep,a.arr)    dayNum,      ");
			sh.appendSql("	  a.real_rate       realRate,           ");
			sh.appendSql("	  a.packages        packages,           ");
			sh.appendSql("	  a.specials        specials,           ");
			sh.appendSql("	  a.charge          charge,        ");
			sh.appendSql("	  a.pay             pay,        ");
			sh.appendSql("	  (a.charge - a.pay)    balance,        ");
			sh.appendSql("	  a.credit          credit,             ");
			sh.appendSql("	  a.market          market,             ");
			sh.appendSql("	  a.src          	src,         	    ");
			sh.appendSql("	  a.rsv_no          rsvNo,              ");
			sh.appendSql("	  a.master_id       masterId,           ");
			sh.appendSql("    a.amenities		amenities,          ");
			sh.appendSql("    a.remark		    remark,             ");
			sh.appendSql("	  a.link_id         linkId,             ");
			sh.appendSql("	  a.pkg_link_id     pkgLinkId,          ");
			sh.appendSql("	  c.id				rsvId,	         	");
			sh.appendSql("	  b.profile_id 		profileId,			");
			sh.appendSql("	  b.profile_type	profileType			");
			sh.appendSql(" FROM master_base a ");
			sh.appendSql(" JOIN master_guest AS b ");
			sh.appendSql("   ON a.id = b.id ");
			sh.appendSql("     AND b.hotel_group_id = ? ");
			sh.appendSql("     AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" LEFT JOIN rsv_src AS c	  ");
			sh.appendSql("   ON  a.id = c.accnt       ");
			sh.appendSql("     AND c.occ_flag = ?       ");
			sh.insertValue(RsvSrc.OccFlag.MF);
			sh.appendSql("     AND c.hotel_group_id = ? ");
			sh.appendSql("     AND c.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql(" WHERE a.id = b.id  AND a.rsv_class IN ('F','D')	");
			sh.appendSql("     AND a.id <> a.rsv_id AND a.is_resrv = 'F' ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ", stas.split(CodeBaseConstant.MULTIPLE_SEPARATE));
			}
			sh.appendSql("     AND a.rsv_id = ? ");
			sh.appendSql("	   AND a.id <> ?	");
			sh.insertValue(masterBaseId);
			sh.insertValue(masterBaseId);
			sh.appendSql("	   AND a.hotel_group_id = ? AND a.hotel_id = ?	");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			if (isNotNull(condition)) {
				sh.appendSql("  AND (b.name like ? OR a.rmno = ? OR a.credit_man = ? or a.rsv_no = ? )");
				sh.insertValue(condition + "%");
				sh.insertValue(condition);
				sh.insertValue(condition);
				sh.insertValue(condition);
			}
			if(inHistory){
				sh.appendSql(" UNION SELECT a.id       id,              ");
				sh.appendSql("    a.rsv_id       AS resrvId,            ");
				sh.appendSql("	  a.rsv_class       rsvClass,           ");
				sh.appendSql("	  'H'          		type,               ");
				sh.appendSql("	  'H'          		flag,               ");
				sh.appendSql("	  b.name            `name`,             ");
				sh.appendSql("	  b.name2		    nameCombine,        ");
				sh.appendSql("	  a.sta             sta,                ");
				sh.appendSql("	  a.ratecode		rateCode,			");
				sh.appendSql("	  a.rmtype          rmType,             ");
				sh.appendSql("	  a.rmnum           rmNum,              ");
				sh.appendSql("	  a.rmno            rmNo,               ");
				sh.appendSql("    a.rmno_son        rmnoSon, ");
				sh.appendSql("	  (a.adult+a.children)    adultNum,     ");
				sh.appendSql("	  a.adult           adult,  			");
				sh.appendSql("	  a.children		children,  			");
				sh.appendSql("	  a.arr             arr,                ");
				sh.appendSql("	  a.dep             dep,                ");
				sh.appendSql("	  DATEDIFF(a.dep,a.arr)    dayNum,      ");
				sh.appendSql("	  a.real_rate       realRate,           ");
				sh.appendSql("	  a.packages        packages,           ");
				sh.appendSql("	  a.specials        specials,           ");
				sh.appendSql("	  a.charge          charge,        ");
				sh.appendSql("	  a.pay             pay,        ");
				sh.appendSql("	  (a.charge - a.pay)    balance,        ");
				sh.appendSql("	  a.credit          credit,             ");
				sh.appendSql("	  a.market          market,             ");
				sh.appendSql("	  a.src				src,				");
				sh.appendSql("	  a.rsv_no          rsvNo,              ");
				sh.appendSql("	  a.master_id       masterId,           ");
				sh.appendSql("    a.amenities		amenities,          ");
				sh.appendSql("    a.remark		    remark,             ");
				sh.appendSql("	  a.link_id         linkId,             ");
				sh.appendSql("	  a.pkg_link_id     pkgLinkId,          ");
				sh.appendSql("	  0  				rsvId,	         	");
				sh.appendSql("	  b.profile_id 		profileId,			");
				sh.appendSql("	  b.profile_type	profileType			");
				sh.appendSql(" FROM master_base_history a ");
				sh.appendSql(" JOIN master_guest_history AS b 	");
				sh.appendSql("   ON a.id = b.id ");
				sh.appendSql("     AND b.hotel_group_id = ? ");
				sh.appendSql("     AND b.hotel_id = ? ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				sh.appendSql(" WHERE a.id = b.id  AND a.rsv_class IN ('F','D')	");
				sh.appendSql("     AND a.id <> a.rsv_id AND a.is_resrv = 'F' ");
				if(isNotNull(stas)){
					sh.appendOrSql(" OR a.sta = ? ", stas.split(CodeBaseConstant.MULTIPLE_SEPARATE));
				}
				sh.appendSql("     AND a.rsv_id = ? ");
				sh.appendSql("	   AND a.id <> ?	");
				sh.insertValue(masterBaseId);
				sh.insertValue(masterBaseId);
				sh.appendSql("	   AND a.hotel_group_id = ? AND a.hotel_id = ?	");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelId);
				if (isNotNull(condition)) {
					sh.appendSql(" AND (b.name like ? or a.rmno = ? or a.credit_man = ? or a.rsv_no = ? )");
					sh.insertValue(condition + "%");
					sh.insertValue(condition);
					sh.insertValue(condition);
					sh.insertValue(condition);
				}
			}
			sh.appendSql(" ) AS t order by flag, sta, rmno + 0,rmnoSon + 0 ");
			if (firstResult >= 0) {
				sh.setFirstResult(firstResult);
			}
			if (maxResults > 0) {
				sh.setMaxResults(maxResults);
			}
			return this.findByNativeSQL(sh, MasterLinkDto.class);
		}
		
		/**
		 * 根据给定条件，查询预订单成员记录列表
		 * （已分房未入住，且不能为假房，用于预订单门卡发卡功能）
		 * @param masterBaseId					预订主单ID
		 * @param doorcardResrvTodayOnly		预订只能发本日的卡
		 * @param hotelGroupId					集团ID
		 * @param hotelId						酒店ID
		 * @param firstResult 					记录开始序号
		 * @param maxResults 					结果集大小
		 * @return List<DoorcardMakeDto>
		 * @author Cairo
		 * @date 2013-05-16
		 */
		public List<DoorcardMakeDto> findDoorcardInfoByMasterId(Long masterBaseId,String doorcardResrvTodayOnly,
				Long hotelGroupId,Long hotelId, int firstResult, int maxResults){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT                        ");
			sh.appendSql("	  a.rmno      AS rmno,        ");
			sh.appendSql("	  a.rmno_son  AS rmnoSon,     ");
			sh.appendSql("	  b.name      AS `name`,      ");
			sh.appendSql("	  a.arr       AS arr,         ");
			sh.appendSql("	  a.dep       AS dep,         ");
			sh.appendSql("	  a.id        AS id,          ");
			sh.appendSql("	  a.rsv_id    AS rsvId,       ");
			sh.appendSql("	  a.link_id   AS linkId,      ");
			sh.appendSql("	  a.master_id AS masterId     ");
			sh.appendSql("	FROM master_base AS a,        ");
			sh.appendSql("	  master_guest AS b           ");
			sh.appendSql("	WHERE a.hotel_group_id =?     ");
			sh.appendSql("	    AND a.hotel_id = ?        ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND b.hotel_group_id = ?  ");
			sh.appendSql("	    AND b.hotel_id = ?        ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND a.id = b.id           ");
			sh.appendSql("	    AND a.rsv_id = ?          ");
			sh.appendSql("	    AND a.id <> ?             ");
			sh.insertValue(masterBaseId);
			sh.insertValue(masterBaseId);
			sh.appendSql("	    AND a.rsv_class = 'F'     ");
			sh.appendSql("	    AND a.sta = 'R'           ");
			sh.appendSql("	    AND a.rmno <> ''          ");
			sh.appendSql("	    AND LEFT(a.rmno,1) <> '#' ");
			if("T".equals(doorcardResrvTodayOnly)){
				sh.appendSql(" AND DATE(a.arr) <= ? ");
				sh.insertValue(DateHelper.shortDate(new Date()));
			}
			return findByNativeSQL(sh,DoorcardMakeDto.class);
		}
		
		/**
		 * 根据登记单ID集合查找登记单列表
		 * @param masterBaseIds
		 * @return
		 */
		@Override
		public List<MasterBase> listMasterBaseById(List<Long> masterBaseIds) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj FROM MasterBase obj WHERE 1 = 1 ");
			sh.appendOrSql(" OR obj.id = ? ", masterBaseIds);
			return find(sh);
		}
		
		/**
		 * 根据给定预订单ID及资源标记查询纯预留记录数量
		 * @param masterBaseId			预订单ID
		 * @param occFlag				资源标记(RsvSrc.OccFlag)
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return Integer
		 * @author Cairo
		 * @date 2013-06-20
		 */
		@Override
		public Integer findRsvSrcNumByMasterBaseId(Long masterBaseId,String occFlag,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT COUNT(obj.id)			");
			sh.appendSql("	FROM RsvSrc obj             	");
			sh.appendSql("	WHERE obj.occFlag = ?	   		");
			sh.insertValue(occFlag);
			sh.appendSql("	    AND obj.hotelGroupId = ?	");
			sh.appendSql("	    AND obj.hotelId = ?			");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND obj.accnt = ?           ");
			sh.insertValue(masterBaseId);
			return Integer.parseInt(this.find(sh).get(0)+"");
		}
		
		/**
		 * 根据给定预订单ID及状态查询对应状态成员数量
		 * @param masterBaseId			预订单ID
		 * @param stas					状态列表(可选,没有请传null,多个状态请使用","分隔)(MasterBase.Sta)
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return Integer
		 * @author Cairo
		 * @date 2013-06-20
		 */
		@Override
		public Integer findMemberNumMasterBaseId(Long masterBaseId,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT COUNT(obj.id)             ");
			sh.appendSql("	FROM MasterBase obj	        	");
			sh.appendSql("	WHERE obj.rsvClass = ?	      	");
			sh.insertValue(MasterBase.RsvClass.F);
			sh.appendSql("	    AND obj.hotelGroupId = ?  	");
			sh.appendSql("	    AND obj.hotelId = ?        	");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND (obj.rsvId = ? OR obj.grpAccnt = ?)		");
			sh.insertValue(masterBaseId);
			sh.insertValue(masterBaseId);
			sh.appendSql("	    AND obj.id <> ?            	");
			sh.insertValue(masterBaseId);
			if(isNotNull(stas)){
				sh.appendOrSql(" OR obj.sta = ? ", stas.split(EntityConstant.COMMA));
			}
			return Integer.parseInt(this.find(sh).get(0)+"");
		}
		/**
		 * 根据中央预订单，查询预定主单记录
		 * @param rsvClass 		主单类型（F/G）
		 * @param crsNo			中央预定号
		 * @param hotelGroupId  集团ID
		 * @param hotelId		酒店ID
		 * @return MasterBase
		 * @author Cairo
		 * @date 2014-03-12
		 */
		@Override
		public MasterBase findResrvBaseByCrsNo(String rsvClass,String crsNo,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	FROM MasterBase obj ");
			sh.appendSql("	WHERE obj.id = obj.rsvId ");
			sh.appendSql("	    AND obj.isResrv = 'T'");
			if(isNotNull(rsvClass)){
				sh.appendSql(" AND obj.rsvClass = ?  ");
				sh.insertValue(rsvClass);
			}else{
				sh.appendSql(" AND obj.rsvClass IN ('F','G') ");
			}
			sh.appendSql("	AND obj.crsNo = ? 	     ");
			sh.insertValue(crsNo);
			sh.appendSql("  AND obj.hotelGroupId = ? ");
			sh.insertValue(hotelGroupId);
			if(hotelId != null && !hotelId.equals(0l)){
				sh.appendSql("  AND obj.hotelId = ? ");
				sh.insertValue(hotelId);
			}
			List<MasterBase> masterBases = find(sh);
			if(masterBases != null && !masterBases.isEmpty()){
				return masterBases.get(0);
			}
			return null;
		}
		
		/**
		 * 根据给定预订单号，更新其所有预定成员信息预订单号为新预订单号
		 * @param oldRsvId
		 * @param oldRsvNo
		 * @param newRsvId
		 * @param newRsvNo
		 * @param hotelGroupId
		 * @param hotelId
		 */
		@Override
		public void updateRsvIdAndRsvNoByOldRsvIdAndRsvNo(Long oldRsvId, String oldRsvNo, Long newRsvId, String newRsvNo, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	UPDATE master_base SET rsv_id = ?, rsv_no = ?	");
			sh.insertValue(newRsvId);
			sh.insertValue(newRsvNo);
			sh.appendSql("	WHERE id <>	rsv_id								");
			sh.appendSql("	AND (rsv_class = 'F' OR rsv_class = 'G')		");
			sh.appendSql("	AND rsv_id = ? AND rsv_no = ?					");
			sh.insertValue(oldRsvId);
			sh.insertValue(oldRsvNo);
			sh.appendSql("	AND hotel_group_id = ?	AND hotel_id = ?		");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * 房态图快速入住操作，查询给定房号预抵登记单记录
		 * 如没有或有多条记录，直接返回null
		 * @param rmno				预订号
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<PointRoomObj>
		 * @author cairo
		 * @date 2013-08-03
		 */
		@Override
		public List<PointRoomObj> findPointRoomDtoByRmno(String rmno,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT 'MASTER'    AS flag,     ");
			sh.appendSql("	  a.id,                         ");
			sh.appendSql("    c.id        AS rsvSrcId,      ");
			sh.appendSql("	  a.rsv_class AS rsvClass,      ");
			sh.appendSql("	  a.rsv_id    AS resrvId,       ");
			sh.appendSql("	  a.master_id AS masterId,      ");
			sh.appendSql("	  a.arr,                        ");
			sh.appendSql("	  a.dep,                        ");
			sh.appendSql("	  a.rmtype,                     ");
			sh.appendSql("	  a.rmno,                       ");
			sh.appendSql("	  a.real_rate AS realRate,      ");
			sh.appendSql("	  a.rmnum     AS rmnum,         ");
			sh.appendSql("	  a.adult,                      ");
			sh.appendSql("	  '0'            company,       ");
			sh.appendSql("	  (a.charge - a.pay) AS balance,");
			sh.appendSql("	  a.credit,                     ");
			sh.appendSql("	  a.packages,                   ");
			sh.appendSql("	  a.remark,                     ");
			sh.appendSql("	  a.amenities,                  ");
			sh.appendSql("	  a.specials,                   ");
			sh.appendSql("	  a.rsv_no    AS rsvNo,         ");
			sh.appendSql("	  b.name      AS rname,         ");
			sh.appendSql("	  b.vip,                        ");
			sh.appendSql("	  ''          AS rmSta,         ");
			sh.appendSql("    a.is_fix_rmno AS isFixRmno    ");
			sh.appendSql("	FROM master_base AS a,          ");
			sh.appendSql("	  master_guest AS b,            ");
			sh.appendSql("    rsv_src AS c                  ");
			sh.appendSql("	WHERE a.id = b.id               ");
			sh.appendSql("	    AND a.rsv_class = ?         ");
			sh.insertValue(MasterBase.RsvClass.F);
			sh.appendSql("	    AND a.id <> a.rsv_id        ");
			sh.appendSql("	    AND a.sta = ?               ");
			sh.insertValue(MasterBase.Sta.R);
			sh.appendSql("      AND DATE(a.arr) <= ?        ");
			sh.insertValue(DateHelper.shortDate(new Date()));
			sh.appendSql("	    AND a.hotel_group_id = ?    ");
			sh.appendSql("	    AND a.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND b.hotel_group_id = ?    ");
			sh.appendSql("	    AND b.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND a.rmno = ?              ");
			sh.insertValue(rmno);
			sh.appendSql("	  AND c.accnt = a.id            ");
			sh.appendSql("    AND c.occ_flag = ?            ");
			sh.insertValue(RsvSrc.OccFlag.MF);
			sh.appendSql("    AND c.hotel_group_id = ?      ");
			sh.appendSql("    AND c.hotel_id = ?            ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return findByNativeSQL(sh, PointRoomObj.class);
		}

		@Override
		public List<BigInteger> findPrePareToNoshowId(Date bizDate,
				Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT id								");
			sh.appendSql("	FROM master_base a where hotel_group_id = ? and hotel_id = ? and a.id=a.rsv_id		");
//			sh.appendSql("	and (sta = 'R' OR sta = 'I')							");
			sh.appendSql("      AND ADDDATE(DATE(arr),1) = ?  and  a.crs_no IS NOT NULL AND a.crs_no <>''    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
//			sh.insertValue(bizDate);
			sh.insertValue(bizDate);
			
			return findByNativeSQL(sh);
		}
		
		/**
		 * 根据给定房号、类型、状态及日期信息，查询符合条件的登记单记录
		 * @param rmno			房号
		 * @param rsvClass		类型(多选，多个类型间使用","分隔)
		 * @param sta			状态(多选，多个状态间使用","分隔)
		 * @param arrDate		到日
		 * @param depDate		离日
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 * @return MasterBase
		 * @author cairo
		 * @date 2013-08-21
		 */
		@Override
		public MasterBase findMasterBaseByRmnoAndDate(String rmno,String rsvClass,String sta,
				Date arrDate,Date depDate,Long hotelGroupId,Long hotelId){
			SQLHelper sh = formatMasterBaseSql(hotelGroupId,hotelId);
			sh.appendSql(" AND id <> rsv_id AND is_resrv = 'F' ");
			if(isNotNull(rmno)){
				sh.appendSql(" AND rmno = ? ");
				sh.insertValue(rmno);
			}
			if (isNotNull(rsvClass)) {
				sh.appendOrSql(" OR rsv_class = ? ",rsvClass.split(","));
			}
			if (isNotNull(sta)) {
				sh.appendOrSql(" OR sta = ? ",sta.split(","));
			}
			if(arrDate != null){
				sh.appendSql(" AND DATE(arr) = ? ");
				sh.insertValue(DateHelper.shortDate(arrDate));
			}
			if(depDate != null){
				sh.appendSql(" AND DATE(dep) = ? ");
				sh.insertValue(DateHelper.shortDate(depDate));
			}
			sh.setFirstResult(0);
			sh.setMaxResults(1);
			List<MasterBase> list = findByNativeSQL(sh,MasterBase.class);
			if(list.isEmpty()){
				return null;
			}
			return list.get(0);
		}
		
		private SQLHelper formatMasterBaseSql(Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT 	`hotel_group_id` 	AS hotelGroupId,   ");
			sh.appendSql("	`hotel_id` 			AS hotelId,                ");
			sh.appendSql("	`id`,                                          ");
			sh.appendSql("	`rsv_id` 			AS rsvId,                  ");
			sh.appendSql("	`rsv_man` 			AS rsvMan,                 ");
			sh.appendSql("	`rsv_company` 		AS rsvCompany,             ");
			sh.appendSql("	`group_code` 		AS groupCode,              ");
			sh.appendSql("	`group_manager` 	AS groupManager,           ");
			sh.appendSql("	`rsv_src_id` 		AS rsvSrcId,               ");
			sh.appendSql("	`master_rsvsrc_id` 	AS masterRsvsrcId,         ");
			sh.appendSql("	`rsv_class` 		AS rsvClass,               ");
			sh.appendSql("	`master_id` 		AS masterId,               ");
			sh.appendSql("	`grp_accnt` 		AS grpAccnt,               ");
			sh.appendSql("	`block_id` 			AS blockId,                ");
			sh.appendSql("	`biz_date` 			AS bizDate,                ");
			sh.appendSql("	`sta`,                                         ");
			sh.appendSql("	`rmtype`,                                      ");
			sh.appendSql("	`rmno`,                                        ");
			sh.appendSql("	`rmnum`,                                       ");
			sh.appendSql("	`arr`,                                         ");
			sh.appendSql("	`dep`,                                         ");
			sh.appendSql("	`cutoff_days` 		AS cutoffDays,             ");
			sh.appendSql("	`cutoff_date` 		AS cotoffDate,             ");
			sh.appendSql("	`adult`,                                       ");
			sh.appendSql("	`children`,                                    ");
			sh.appendSql("	`res_sta` 			AS resSta,                 ");
			sh.appendSql("	`res_dep` 			AS resDep,                 ");
			sh.appendSql("	`rack_rate` 		AS rackRate,               ");
			sh.appendSql("	`nego_rate` 		AS negoRate,               ");
			sh.appendSql("	`real_rate` 		AS realRate,               ");
			sh.appendSql("	`dsc_reason` 		AS dscReason,              ");
			sh.appendSql("	`dsc_amount` 		AS dscAmount,              ");
			sh.appendSql("	IFNULL(`dsc_percent`,0) AS dscPercent,         ");
			sh.appendSql("	`exp_sta` 			AS expSta,                 ");
			sh.appendSql("	`tm_sta` 			AS temSta,                 ");
			sh.appendSql("	`rmpost_sta` 		AS rmpostSta,              ");
			sh.appendSql("	`is_rmposted` 		AS isRmposted,             ");
			sh.appendSql("	`tag0`,                                        ");
			sh.appendSql("	`company_id` 		AS companyId,              ");
			sh.appendSql("	`agent_id` 			AS agentId,                ");
			sh.appendSql("	`source_id` 		AS sourceId,               ");
			sh.appendSql("	`member_type` 		AS memberType,             ");
			sh.appendSql("	`member_no` 		AS memberNo,               ");
			sh.appendSql("	`inner_card_id` 	AS innerCardId,            ");
			sh.appendSql("	`salesman`,                                    ");
			sh.appendSql("	`arno`,                                        ");
			sh.appendSql("	`building`,                                    ");
			sh.appendSql("	`src`,                                         ");
			sh.appendSql("	`market`,                                      ");
			sh.appendSql("	`rsv_type` 			AS rsvType,                ");
			sh.appendSql("	`channel`,                                     ");
			sh.appendSql("	`sales_channel` 	AS salesChannel,           ");
			sh.appendSql("	`ratecode`,                                    ");
			sh.appendSql("	`ratecode_category` AS ratecodeCategory,   	   ");
			sh.appendSql("	`cmscode`,                                     ");
			sh.appendSql("	`packages`,                                    ");
			sh.appendSql("	`specials`,                                    ");
			sh.appendSql("	`amenities`,                                   ");
			sh.appendSql("	`is_fix_rate` 		AS isFixRate,              ");
			sh.appendSql("	`is_fix_rmno` 		AS isFixRmno,              ");
			sh.appendSql("	`is_sure` 			AS isSure,                 ");
			sh.appendSql("	`is_permanent` 		AS isPermanent,            ");
			sh.appendSql("	`is_walkin` 		AS isWalkin,               ");
			sh.appendSql("	`is_secret` 		AS isSecret,               ");
			sh.appendSql("	`is_secret_rate` 	AS isSecretRate,           ");
			sh.appendSql("	`posting_flag` 		AS postingFlag,            ");
			sh.appendSql("	`sc_flag` 			AS scFlag,                 ");
			sh.appendSql("	`extra_flag` 		AS extraFlag,              ");
			sh.appendSql("	`extra_bed_num` 	AS extraBebNum,            ");
			sh.appendSql("	`extra_bed_rate` 	AS extraBebRate,           ");
			sh.appendSql("	`crib_num` 			AS cribNum,                ");
			sh.appendSql("	`crib_rate` 		AS cribRate,               ");
			sh.appendSql("	`pay_code` 			AS payCode,                ");
			sh.appendSql("	`limit_amt` 		AS limitAmt,               ");
			sh.appendSql("	`credit_no` 		AS creditNo,               ");
			sh.appendSql("	`credit_man` 		AS creditMan,              ");
			sh.appendSql("	`credit_company` 	AS creditCompany,          ");
			sh.appendSql("	`charge`,                                      ");
			sh.appendSql("	`pay`,                                         ");
			sh.appendSql("	`credit`,                                      ");
			sh.appendSql("	`last_num` 			AS lastNum,                ");
			sh.appendSql("	`last_num_link` 	AS lastNumLink,            ");
			sh.appendSql("	`rmocc_id` 			AS rmoccId,                ");
			sh.appendSql("	`link_id` 			AS linkId,                 ");
			sh.appendSql("	`pkg_link_id` 		AS pkgLinkId,              ");
			sh.appendSql("	`rsv_no` 			AS rsvNo,                  ");
			sh.appendSql("	`crs_no` 			AS crsNo,                  ");
			sh.appendSql("	`where_from` 		AS whereFrom,              ");
			sh.appendSql("	`where_to` 			AS whereTo,                ");
			sh.appendSql("	`purpose`,                                     ");
			sh.appendSql("	`remark`,                                      ");
			sh.appendSql("	`co_msg` 			AS coMsg,                  ");
			sh.appendSql("	`is_send` 			AS isSend,                 ");
			sh.appendSql("	`promotion`,                                   ");
			sh.appendSql("	`create_user` 		AS createUser,             ");
			sh.appendSql("	`create_datetime` 	AS createDatetime,         ");
			sh.appendSql("	`modify_user` 		AS modifyUser,             ");
			sh.appendSql("	`modify_datetime` 	AS modifyDatetime,         ");
			sh.appendSql("	`sta_ebooking` 		AS staEbooking	           ");
			sh.appendSql("	FROM `master_base`                             ");
			sh.appendSql("  WHERE hotel_group_id = ? ");
			sh.appendSql("      AND hotel_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return sh;
		}

		/**
		 * 查询登记单关联的预定成员,联房或团队成员
		 * @param rsvId			预订ID
		 * @param grpAccnt		团队ID
		 * @param linkId		联房ID
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 * @return
		 */
		@Override
		public List<MasterBase> listMasterBaseByResrvOrGrpOrLink(Long rsvId,
				Long grpAccnt, Long linkId, Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj FROM MasterBase obj	");
			sh.appendSql("	WHERE obj.hotelGroupId = ?	");
			sh.insertValue(hotelGroupId);
			sh.appendSql("	AND obj.hotelId = ?	");
			sh.insertValue(hotelId);
			sh.appendSql("	AND (1 = 2	");
			if(rsvId != null && !rsvId.equals(0L)){
				sh.appendSql("	OR obj.rsvId = ?	");
				sh.insertValue(rsvId);
			}
			if(grpAccnt != null && !grpAccnt.equals(0L)){
				sh.appendSql("	OR obj.grpAccnt = ?	");
				sh.insertValue(grpAccnt);
			}
			if(linkId != null && !linkId.equals(0L)){
				sh.appendSql("	OR obj.linkId = ?	");
				sh.insertValue(linkId);
			}
			sh.appendSql("	)	");
			sh.appendSql("	AND obj.sta IN ('R','I','S','O')	");
			return find(sh);
		}
		
		/**
		 * 查询房间在住及本日预抵宾客信息(仅用于房态图tip显示) 
		 * @param rmno				房号
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<RoomInfoDto>
		 * @author Cairo
		 * @date 2013-09-18
		 */
		@Override
		public List<RoomInfoDto> findMasterInfoByRmno(String rmno,Long hotelGroupId,Long hotelId){
			// 查询在住人记录
		     SQLHelper sh = new SQLHelper();
		     sh.appendSql(" SELECT a.real_rate AS realRate,		  	  ");
		     sh.appendSql("		a.is_secret AS secret, 				  ");
		     sh.appendSql("		c1.descript AS idCode,				  ");
		     sh.appendSql("		b.id_no AS idNo,				  	  ");
		     sh.appendSql(" 	IFNULL(d.descript,b.nation) AS nation,");
		     sh.appendSql(" 	IFNULL(c.descript,b.vip) AS vip, 	  ");
		     sh.appendSql("		a.amenities AS amenities,			  ");
		     sh.appendSql(" 	a.credit AS creitAccount, 			  ");
		     sh.appendSql(" 	(a.charge-a.pay) AS blance, 		  ");
		     sh.appendSql("    	a.sta AS sta, 						  ");
		     sh.appendSql("    	a.id AS accntId, 			  ");
		     sh.appendSql("    	a.rmno AS rmno, 				      ");
		     sh.appendSql("    	a.arr AS arr,  						  ");
		     sh.appendSql("		a.dep AS dep, 						  ");
		     sh.appendSql("    	a.rsv_class AS type, 				  ");
		     sh.appendSql("    	b.name AS name, 			  	 	  ");
		     sh.appendSql("    	LEFT(a.remark,50) AS remark,         ");
		     sh.appendSql(" 	IFNULL(z.name,'') AS companyId, 	  ");
		     sh.appendSql(" 	IFNULL(n.name,'') AS agentId, 		  ");
		     sh.appendSql(" 	IFNULL(j.name,'') AS sourceId, 		  ");
		     sh.appendSql("     IFNULL(b1.name,'') AS grpName, ");
		     sh.appendSql("     a.link_id AS linkId                   ");
		     sh.appendSql(" FROM master_base AS  a 				  	  ");
		     sh.appendSql(" LEFT JOIN master_guest AS b 			  ");
		     sh.appendSql("    ON b.id = a.id 						  ");
		     sh.appendSql("      AND b.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND b.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN master_guest AS b1 			  ");
		     sh.appendSql("    ON b1.id = a.grp_accnt 				  ");
		     sh.appendSql("      AND b1.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND b1.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN code_base AS c 			   	  ");
		     sh.appendSql("    ON c.parent_code = 'vip' 			  ");
		     sh.appendSql("      AND c.code = b.vip 				  ");
		     sh.appendSql("      AND c.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND c.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN code_country AS d 			  ");
		     sh.appendSql("    ON d.code = b.nation 				  ");
		     sh.appendSql("      AND d.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND d.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN company_base AS z 			  ");
		     sh.appendSql("    ON z.id = a.company_id 				  ");
		     sh.appendSql("      AND z.hotel_group_id= ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql(" LEFT JOIN company_base AS n 			  ");
		     sh.appendSql("    ON n.id = a.agent_id ");
		     sh.appendSql("      AND n.hotel_group_id= ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql(" LEFT JOIN company_base AS j 			  ");	     
		     sh.appendSql("    ON j.id = a.source_id ");
		     sh.appendSql("      AND j.hotel_group_id= ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql(" LEFT JOIN code_base AS c1				  ");
		     sh.appendSql("    ON c1.code = b.id_code				  ");
		     sh.appendSql("		 AND c1.parent_code = 'idcode' 		  ");
		     sh.appendSql("		 AND c1.hotel_group_id = ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql("		 AND c1.hotel_id = ? 			  	  ");
		     sh.insertValue(hotelId);
		     sh.appendSql(" WHERE a.id <> a.rsv_id   				  ");
		     sh.appendSql("     AND (a.sta = 'I'		    		  ");
		     sh.appendSql("     	OR (a.sta = 'R'					  ");
		     sh.appendSql("     		AND DATE(a.arr) <= ?))		  ");
		     sh.insertValue(DateHelper.shortDate(new Date()));
		     sh.appendSql("     AND a.rsv_class IN ('F','D') 		  ");
		     sh.appendSql("     AND a.rmno = ?  					  ");
		     sh.insertValue(rmno);
		     sh.appendSql("     AND a.hotel_group_id = ? 			  ");
		     sh.appendSql("     AND a.hotel_id =   ? 				  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" GROUP BY a.id ");
		     sh.appendSql(" ORDER BY a.arr ");
		     return findByNativeSQL(sh, RoomInfoDto.class);
		}
		
		/**
		 * 根据给定大房号及子房号在住宾客信息列表
		 * @param parentCode		大房号
		 * @param rmnoSon				子房号
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<RoomInfoDto>
		 * @author Cairo
		 * @date 2013-09-18
		 */
		@Override
		public List<RoomInfoDto> findMasterInfoByParentRmnoAndRmnoSon(String parencCode,String rmnoSon,Long hotelGroupId,Long hotelId){
			// 查询在住人记录
		     SQLHelper sh = new SQLHelper();
		     sh.appendSql(" SELECT a.real_rate AS realRate,		  	  ");
		     sh.appendSql("		a.is_secret AS secret, 				  ");
		     sh.appendSql(" 	IFNULL(d.descript,b.nation) AS nation,");
		     sh.appendSql(" 	IFNULL(c.descript,b.vip) AS vip, 	  ");
		     sh.appendSql("		a.amenities AS amenities,			  ");
		     sh.appendSql(" 	a.credit AS creitAccount, 			  ");
		     sh.appendSql(" 	(a.charge-a.pay) AS blance, 		  ");
		     sh.appendSql("    	a.sta AS sta, 						  ");
		     sh.appendSql("    	a.id AS accntId, 			  ");
		     sh.appendSql("    	a.rmno AS rmno, 				      ");
		     sh.appendSql("    	a.arr AS arr,  						  ");
		     sh.appendSql("		a.dep AS dep, 						  ");
		     sh.appendSql("    	a.rsv_class AS type, 				  ");
		     sh.appendSql("    	b.name AS name, 			  	 	  ");
		     sh.appendSql("    	LEFT(a.remark,50) AS remark,	      ");
		     sh.appendSql(" 	IFNULL(z.name,'') AS companyId, 	  ");
		     sh.appendSql(" 	IFNULL(n.name,'') AS agentId, 		  ");
		     sh.appendSql(" 	IFNULL(j.name,'') AS sourceId, 		  ");
		     sh.appendSql("     IFNULL(b1.name,'') AS grpName, ");
		     sh.appendSql("     a.link_id AS linkId                   ");
		     sh.appendSql(" FROM master_base AS  a 				  	  ");
		     sh.appendSql(" LEFT JOIN master_guest AS b 			  ");
		     sh.appendSql("    ON b.id = a.id 						  ");
		     sh.appendSql("      AND b.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND b.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN master_guest AS b1 			  ");
		     sh.appendSql("    ON b1.id = a.grp_accnt    			  ");
		     sh.appendSql("      AND b.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND b.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN code_base AS c 			   	  ");
		     sh.appendSql("    ON c.parent_code = 'vip' 			  ");
		     sh.appendSql("      AND c.code = b.vip 				  ");
		     sh.appendSql("      AND c.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND c.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN code_country AS d 			  ");
		     sh.appendSql("    ON d.code = b.nation 				  ");
		     sh.appendSql("      AND d.hotel_group_id = ? 			  ");
		     sh.appendSql("      AND d.hotel_id = ?       			  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" LEFT JOIN company_base AS z 			  ");
		     sh.appendSql("    ON z.id = a.company_id 				  ");
		     sh.appendSql("      AND z.hotel_group_id= ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql(" LEFT JOIN company_base AS n 			  ");
		     sh.appendSql("    ON n.id = a.agent_id ");
		     sh.appendSql("      AND n.hotel_group_id= ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql(" LEFT JOIN company_base AS j 			  ");	     
		     sh.appendSql("    ON j.id = a.source_id ");
		     sh.appendSql("      AND j.hotel_group_id= ? 			  ");
		     sh.insertValue(hotelGroupId);
		     sh.appendSql(" WHERE a.rmno IS NOT NULL 				  ");
		     sh.appendSql("     AND a.rmno <> ''       				  ");
		     sh.appendSql("     AND a.id <> a.rsv_id   				  ");
		     sh.appendSql("     AND a.sta IN ('R','I')    			  ");
		     sh.appendSql("     AND a.rsv_class IN ('F','D') 		  ");
		     if(isNotNull(parencCode)){
		    	 sh.appendSql(" AND a.rmno = ?  					  ");
			     sh.insertValue(parencCode);
		     }
		     if(isNotNull(rmnoSon)){
			     sh.appendSql("     AND a.rmno_son = ?                ");
			     sh.insertValue(rmnoSon);
		     }
		     sh.appendSql("     AND a.hotel_group_id = ? 			  ");
		     sh.appendSql("     AND a.hotel_id =   ? 				  ");
		     sh.insertValue(hotelGroupId);
		     sh.insertValue(hotelId);
		     sh.appendSql(" GROUP BY a.id ");
		     sh.appendSql(" ORDER BY a.arr ");
		     return findByNativeSQL(sh, RoomInfoDto.class);
		}
		
		/**
		 * 根据给定房号及LinkId查询连房房号列表
		 * @param rmno			房号
		 * @param linkId		连房ID
		 * @param pkgLinkId		包价连房ID
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 * @return String
		 * @author Cairo
		 * @date 2013-09-18
		 */
		@Override
		public String findLinkRmnoByRmnoAndLinkId(String rmno,Long linkId,Long pkgLinkId,Long hotelGroupId,Long hotelId){
	         SQLHelper sh = new SQLHelper();
	         sh.appendSql(" SELECT a.rmno              ");
	         sh.appendSql(" FROM master_base AS a      ");
	         sh.appendSql(" WHERE a.hotel_group_id = ? ");
	         sh.appendSql("     AND a.hotel_id = ?     ");
	         sh.insertValue(hotelGroupId);
	         sh.insertValue(hotelId);
	         sh.appendSql("     AND a.rsv_class IN ('F','D') ");
	         sh.appendSql("     AND a.rmno <> ?        ");
	         sh.insertValue(rmno);
	         sh.appendSql("     AND a.rmno <> ''       ");
	         sh.appendSql("     AND a.rmno IS NOT NULL ");
	         sh.appendSql("     AND a.link_id = ?      ");
	         sh.insertValue(linkId);
	         if(pkgLinkId != null){
	        	 sh.appendSql(" AND a.pkg_link_id = ?  ");
	        	 sh.insertValue(pkgLinkId);
	         }
	         sh.appendSql(" GROUP BY rmno  ");
	         List<String> ls=findByNativeSQL(sh);
	         String linkRmno="";
		     if(ls!=null&&ls.size()>0){
		         for(int z=0;z<ls.size();z++){
		         	linkRmno=linkRmno+ls.get(z)+",";
		         }
	         }
		     return linkRmno;
		}
		
		/**
		 * 根据给定条件，查询预订单及其成员登记单记录集合
		 * 用于Block Pick模块
		 * @param masterBaseId			预订主单ID
		 * @param hotelGroupId			集团ID
		 * @param hotelId				酒店ID
		 * @return List<MasterLinkDto>
		 * @author Cairo
		 * @date 2013-10-22
		 */
		@Override
		public List<MasterLinkDto> findResrvLinkListByResrvId(Long masterBaseId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			 sh.appendSql(" SELECT                              ");
			  sh.appendSql("	a.id              id,            ");
			  sh.appendSql("    a.rsv_id          AS resrvId,    ");
			  sh.appendSql("	'C'               type,          ");
			  sh.appendSql("	a.rsv_class       rsvClass,      ");
			  sh.appendSql("	'RB'          flag,              ");
			  sh.appendSql("	b.name            `name`,        ");
			  sh.appendSql("	b.name2    nameCombine,   ");
			  sh.appendSql("	b.sex				sex,		 ");
			  sh.appendSql("	a.sta             sta,           ");
			  sh.appendSql("	a.ratecode		rateCode,	     ");
			  sh.appendSql("	a.rmtype          rmType,        ");
			  sh.appendSql("	a.rmnum           rmNum,         ");
			  sh.appendSql("	IF(a.id = a.rsv_id,a.rmno,'预订') AS rmNo,");
			  sh.appendSql("    a.rmno_son        rmnoSon, ");
			  sh.appendSql("	(a.adult+a.children)    adultNum,");
			  sh.appendSql("	a.adult           adult,  	     ");
			  sh.appendSql("	a.children		children,  	     ");
			  sh.appendSql("	a.arr             arr,           ");
			  sh.appendSql("	a.dep             dep,           ");
			  sh.appendSql("	DATEDIFF(a.dep,a.arr)    dayNum, ");
			  sh.appendSql("	a.real_rate       realRate,      ");
			  sh.appendSql("	a.packages        packages,      ");
			  sh.appendSql("    a.charge          charge,        ");
			  sh.appendSql("    a.pay             pay,           ");
			  sh.appendSql("	(a.charge - a.pay)    balance,   ");
			  sh.appendSql("	a.credit          credit,        ");
			  sh.appendSql("	a.market          market,        ");
			  sh.appendSql("	a.rsv_no          rsvNo,         ");
			  sh.appendSql("	a.master_id       masterId,      ");
			  sh.appendSql("    a.amenities		amenities,       ");
			  sh.appendSql("    a.remark		    remark,      ");
			  sh.appendSql("	a.link_id         linkId,        ");
			  sh.appendSql("	a.pkg_link_id     pkgLinkId,     ");
			  sh.appendSql("	0            	    rsvId,       ");
			  sh.appendSql("    b.vip				vip,		 ");
			  sh.appendSql("	b.profile_id		profileId,	 ");
			  sh.appendSql("	b.profile_type	profileType	     ");
			  sh.appendSql(" FROM master_base a,                 ");
			  sh.appendSql("    master_guest b              	 ");
			  sh.appendSql(" WHERE b.id = a.id AND a.rsv_class <> 'D' AND a.rsv_class <> 'H' ");
			  sh.appendSql("    AND a.hotel_group_id = ?         ");
			  sh.appendSql("    AND a.hotel_id = ?               ");
			  sh.insertValue(hotelGroupId);
			  sh.insertValue(hotelId);
			  sh.appendSql(" AND a.rsv_id = ? ");
			  sh.insertValue(masterBaseId);
			  sh.appendSql(" AND a.sta <> 'X' AND a.sta <> 'N' AND a.sta <> 'D' ");
			  sh.appendSql("     AND b.hotel_group_id = ? 	 	 ");
			  sh.appendSql("     AND b.hotel_id = ?           	 ");
			  sh.insertValue(hotelGroupId);
			  sh.insertValue(hotelId);
			  sh.appendSql(" ORDER BY a.id ");
			  return findByNativeSQL(sh, MasterLinkDto.class);
			  
		}
		
		@SuppressWarnings({ "unchecked", "rawtypes" })
		@Override
		public String updateMasterInfoStrByProc(final Long hotelGroupId, final Long hotelId,
				final Long accnt) {
			String sql = "{call up_ihotel_hsk_mstinfo(?,?,?,?)}";	
			
			try{
	            Object object = getJdbcTemplate().execute(sql,new CallableStatementCallback(){
	                public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException 
	                {
	                     cs.setLong(1,hotelGroupId);
	                     cs.setLong(2,hotelId);
	                     cs.setLong(3,accnt);
	                     cs.registerOutParameter(4, java.sql.Types.VARCHAR);
	                     cs.execute();
//	                   return cs.executeQuery().getString(0);
	                     return cs.getString(4);
	                }
	            }); 
	            
	            return object.toString().trim();
			}
			catch(RuntimeException e){
			    return "";
			}
		}
		
		
		/**
		 * 根据给定条件，查询存在有效信用记录的主单记录
		 * 用于无效信用记录清理夜审过程
		 * @param stas				主单状态集合，多个状态中使用','分隔
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<MasterBase>
		 * @author Cairo
		 * @date 2013-11-25
		 */
		public List<MasterBase> findInvalidCreditMasterList(String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj FROM MasterBase AS obj ");
			sh.appendSql(" WHERE obj.hotelGroupId = ?  ");
			sh.appendSql("     AND obj.hotelId = ?  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND obj.rsvClass <> 'D' ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR obj.sta = ? ",stas.split(","));
			}
			sh.appendSql("     AND obj.credit > 0 ");
			return find(sh);
		}
		
		/**
		 * 根据给定房号，查询房号住客详细信息
		 * @param rmno
		 * @param hotelGroupId
		 * @param hotelId
		 * @return String
		 * @author Cairo
		 * @date 2013-11-27
		 */
		@SuppressWarnings({ "unchecked", "rawtypes" })
		@Override
		public String updateMasterInfoByProc(final String rmno,final Long hotelGroupId,final Long hotelId) {
			String sql = "{call up_ihotel_find_master_info(?,?,?,?)}";	
			
			Object object = getJdbcTemplate().execute(sql,new CallableStatementCallback(){
				public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException 
				{
				     cs.setLong(1,hotelGroupId);
				     cs.setLong(2,hotelId);
				     cs.setString(3,rmno);
				     cs.registerOutParameter(4, java.sql.Types.VARCHAR);
				     cs.execute();
				     return cs.getString(4);
				}
			});	
			return object.toString().trim();
		}
		@Override
		public List<MasterBase> findByRmno(Long hotelGroupId, Long hotelId,
				String rmno,Date bizDate) {
			MasterBase mb=new MasterBase();
			mb.setHotelGroupId(hotelGroupId);
			mb.setHotelId(hotelId);
			mb.setRmno(rmno);
			SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
			spellSQL(sh, mb);
			sh.appendSql(" AND obj.dep >= ? ");
	        sh.insertValue(bizDate);
	        sh.appendSql(" AND obj.rsvId <> obj.id AND obj.rsvClass IN ('F','D') AND AND a.isResrv = 'F' ");
			sh.appendSql(" ORDER BY obj.id");
			return find(sh);
		}
		/**
		 * 统计预订单房间占用数量(不包含未分房)
		 * @param accnt
		 * @param hotelGroupId
		 * @param hotelId
		 * @return
		 */
		@Override
		public int findResrvRoomNoByResrvBaseId(Long accnt, Long hotelGroupId, Long hotelId) {
			if(accnt == null || accnt.equals(0L)){
				return 0;
			}
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT SUM(rmnum) AS rmnum				");
			sh.appendSql("	FROM (									");
			sh.appendSql("		SELECT								");
			sh.appendSql("		IFNULL(SUM(rmnum),0) AS rmnum		");
			sh.appendSql("		FROM rsv_src						");
			sh.appendSql("		WHERE (occ_flag = 'RF'			 	");
			sh.appendSql("			 OR occ_flag = 'RG')			");
			sh.appendSql("		AND accnt = ?						");
			sh.appendSql("		AND hotel_group_id = ?				");
			sh.appendSql("		AND hotel_id = ?					");
			sh.appendSql("		UNION ALL							");
			sh.appendSql("		SELECT 								");
			sh.appendSql("		COUNT(DISTINCT master_id) AS rmnum	");
			sh.appendSql("		FROM master_base					");
			sh.appendSql("		WHERE id <> rsv_id					");
			sh.appendSql("		AND rsv_class = 'F'					");
			sh.appendSql("		AND (sta = 'R' OR sta = 'I')		");
			sh.appendSql("		AND rsv_id = ?						");
			sh.appendSql("		AND hotel_group_id = ?				");
			sh.appendSql("		AND hotel_id = ?					");
			sh.appendSql("		) AS t								");
			sh.insertValue(accnt);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(accnt);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return ((BigDecimal) findByNativeSQL(sh).get(0)).intValue();
		}
		
		/**
		 * 统计预定单占用房数、人数
		 * @param accnt
		 * @param hotelGroupId
		 * @param hotelId
		 * @return
		 */
		@Override
		public void updateRmnumAndAudltByResrvBaseId(Long accnt, Long hotelGroupId, Long hotelId){
			Long rmnum = 0L;
			Long adult = 0L;
			SQLHelper sh = new SQLHelper();
			//统计纯预留
			sh.appendSql("	SELECT											");
			sh.appendSql("		COALESCE(SUM(rmnum), 0) AS rmnum,			");
			sh.appendSql("		COALESCE(SUM(rmnum * adult), 0) AS adult	");
			sh.appendSql("	FROM RsvSrc										");
			sh.appendSql("	WHERE (occFlag = ? OR occFlag = ?) 				");
			sh.appendSql("		AND accnt = ?								");
			sh.appendSql("		AND hotelGroupId = ? AND hotelId = ?		");
			sh.insertValue(RsvSrc.OccFlag.RF);
			sh.insertValue(RsvSrc.OccFlag.RG);
			sh.insertValue(accnt);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			rmnum += (Long)find(sh, Map.class).get(0).get("rmnum");
			adult += (Long)find(sh, Map.class).get(0).get("adult");
			sh.clear();
			//统计成员
			sh.appendSql("	SELECT												");
			sh.appendSql("		COALESCE(COUNT(DISTINCT masterId), 0) AS rmnum,	");
			sh.appendSql("		COALESCE(SUM(1), 0) AS adult					");
			sh.appendSql("	FROM MasterBase										");
			sh.appendSql("	WHERE id <> rsvId									");
			List<String> stas = new ArrayList<String>();
			stas.add(MasterBase.Sta.R);
			stas.add(MasterBase.Sta.I);
			stas.add(MasterBase.Sta.S);
			stas.add(MasterBase.Sta.O);
			sh.appendInSql(" AND sta ", stas);
			sh.appendSql("		AND rsvClass = ? AND rsvId = ?					");
			sh.appendSql("		AND hotelGroupId = ? AND hotelId = ?			");
			sh.insertValue(MasterBase.RsvClass.F);
			sh.insertValue(accnt);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			rmnum += (Long)find(sh, Map.class).get(0).get("rmnum");
			adult += (Long)find(sh, Map.class).get(0).get("adult");
			sh.clear();
			//执行修改
			sh.appendSql("	UPDATE MasterBase			");
			sh.appendSql("	SET rmnum = ?, adult = ?	");
			sh.appendSql("	WHERE id = ?				");
			sh.insertValue(rmnum.intValue());
			sh.insertValue(adult.intValue());
			sh.insertValue(accnt);
			bulkUpdate(sh);
		}
		
		/**
		 * 验证给定房号在指定时间段内是否存在预排情况
		 * @param rmno			房号
		 * @param arrDate		开始时间
		 * @param depDate		离开时间
		 * @param masterId		需要过滤的同住ID
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 * @return boolean
		 * @author chenwu
		 * @date 2012-10-16
		 */
		@Override
		public boolean checkResrvRmnoOcc(String rmno,Date arrDate,Date depDate,Long masterId,Long hotelGroupId,Long hotelId){
			arrDate = DateHelper.shortDate(arrDate);
			depDate = DateHelper.shortDate(depDate);
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT COUNT(1)                 ");
			sh.appendSql("	FROM master_base AS a           ");
			sh.appendSql("	WHERE a.hotel_group_id = ?      ");
			sh.appendSql("	    AND a.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("	    AND a.sta = 'R'             ");
			sh.appendSql("	    AND a.rsv_class IN('F','D') ");
			sh.appendSql("	    AND a.id <> a.rsv_id        ");
			sh.appendSql("	    AND ((DATE(a.arr) <= ?     ");
			sh.insertValue(arrDate);
			sh.appendSql("	    AND DATE(a.dep) > ?  	   ");
			sh.insertValue(arrDate);
			sh.appendSql("	    AND DATE(a.dep) < ? )      ");
			sh.insertValue(depDate);
			sh.appendSql("	    OR (DATE(a.arr) >= ?  	   ");
			sh.insertValue(arrDate);
			sh.appendSql("	    AND DATE(a.dep) > ?        ");
			sh.insertValue(arrDate);
			sh.appendSql("	    AND DATE(a.dep) <= ? )     ");
			sh.insertValue(depDate);
			sh.appendSql("	    OR (DATE(a.arr) < ?        ");
			sh.insertValue(depDate);
			sh.appendSql("	    AND DATE(a.dep) > ? ))     ");
			sh.insertValue(depDate);
			sh.appendSql("	    AND a.rmno = ?              ");
			sh.insertValue(rmno);
			if(masterId != null && !masterId.equals(0L)){
				sh.appendSql(" AND a.master_id <> ? ");
				sh.insertValue(masterId);
			}
			return Integer.parseInt(findByNativeSQL(sh).get(0).toString()) > 0;
		}
		/**
		 * 早餐查找宾客
		 * 	
		 */
		@Override
		public List<MasterBase> findBreakFastRmno(String rmno, Date bizDate,
				Long hotelGroupId, Long hotelId) {
			SQLHelper sh = new SQLHelper("SELECT obj FROM MasterBase obj WHERE 1=1 ");
			sh.appendSql(" AND obj.hotelGroupId = ? ");
			sh.insertValue(hotelGroupId);
			sh.appendSql(" AND obj.hotelId = ? ");
			sh.insertValue(hotelId);
			sh.appendSql(" AND obj.rsvClass = ? ");
			sh.insertValue(MasterBase.RsvClass.F);
			if(isNotNull(rmno)){
				sh.appendSql(" AND obj.rmno = ? ");
				sh.insertValue(rmno);
			}
			sh.appendSql(" AND Date(obj.dep) >= ? ");
	        sh.insertValue(bizDate);
	        sh.appendSql(" AND obj.rsvId<> obj.id  ");
	        sh.appendSql(" AND obj.sta in ('I','S','O')  ");
			sh.appendSql(" ORDER BY obj.id");
			return find(sh);
		}
		
		/**
		 * 根据预定号查预订单
		 * @param rsvNo
		 * @param hotelGroupId
		 * @param hotelId
		 * @return
		 */
		@Override
		public MasterBase findMasterBaseByRsvNo(String rsvNo, Long hotelGroupId,
				Long hotelId) {
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT obj					");
			sh.appendSql("	FROM MasterBase obj			");
			sh.appendSql("	WHERE obj.id = obj.rsvId	");
			sh.appendSql("	AND (obj.rsvClass = ?		");
			sh.appendSql("			 OR rsvClass = ?)	");
			sh.appendSql("	AND obj.rsvNo = ?			");
			sh.appendSql("	AND obj.hotelGroupId = ?	");
			sh.appendSql("	AND obj.hotelId = ?			");
			sh.insertValue(MasterBase.RsvClass.F);
			sh.insertValue(MasterBase.RsvClass.G);
			sh.insertValue(rsvNo);
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			List<MasterBase> list = find(sh);
			if(list.isEmpty())
				return null;
			return list.get(0);
		}
		
		/**
		 * 根据给定条件查询当前在住登记单列表
		 * 注意：此方法暂时仅适用于夜审每日房价变更过程，其他位置请慎用
		 * @param rsvClass		主单类型(F：散客/成员;D：钟点房)
		 * @param stas			状态集合(多选，多个状态请使用','分隔)
		 * @param rsvDate		业务日期
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 * @return List<MasterBase>
		 * @author Cairo
		 * @date 2014-01-14
		 */
		@Override
		public List<MasterBase> findCurrentLivingInMasterBases(String rsvClass,String stas,
				Date rsvDate,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT obj FROM MasterBase AS obj ");
			sh.appendSql(" WHERE obj.hotelGroupId = ? ");
			sh.appendSql("     AND obj.hotelId = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND obj.id <> obj.rsvId ");
			if(isNotNull(rsvClass)){
				sh.appendSql(" AND obj.rsvClass = ? ");
				sh.insertValue(rsvClass);
			}
			if(isNotNull(stas)){
				sh.appendOrSql(" OR obj.sta = ? ",stas.split(","));
			}
			if(rsvDate != null){
				sh.appendSql(" AND DATE(obj.arr) <= ? ");
				sh.appendSql(" AND (DATE(obj.dep) > ? ");
				sh.appendSql("   OR(DATE(obj.arr) = DATE(obj.dep) AND DATE(obj.dep) = ?)) ");
				sh.insertValue(rsvDate);
				sh.insertValue(rsvDate);
				sh.insertValue(rsvDate);
			}
			return find(sh);
		}
		
		/**
		 * 将登记单数据同步到同住人
		 * 同步项:市场码、来源码、优惠理由
		 * 后续如有需要继续添加
		 * @param masterBase
		 */
		@Override
		public void updateSycnLiveData(MasterBase masterBase) {
			//由于在程序运算过程中，同住标记不一定准确，此处加入房间号及资源占用ID的过滤判断
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	UPDATE MasterBase		");
			sh.appendSql("	SET market = ?,			");
			sh.appendSql("	src = ?,				");
			sh.appendSql("	dscReason = ?			");
			sh.appendSql("	WHERE rsvClass = ?		");
			sh.appendSql("	AND rmno = ?			");
			sh.appendSql("	AND rmoccId = ?			");
			sh.appendSql("	AND masterId = ?		");
			sh.appendSql("	AND hotelGroupId = ?	");
			sh.appendSql("	AND hotelId = ?			");
			sh.insertValue(masterBase.getMarket());
			sh.insertValue(masterBase.getSrc());
			sh.insertValue(masterBase.getDscReason());
			sh.insertValue(MasterBase.RsvClass.F);
			sh.insertValue(masterBase.getRmno());
			sh.insertValue(masterBase.getRmoccId());
			sh.insertValue(masterBase.getMasterId());
			sh.insertValue(masterBase.getHotelGroupId());
			sh.insertValue(masterBase.getHotelId());
			bulkUpdate(sh);
			sh.clear();
			sh.appendSql("	UPDATE RsvSrc			");
			sh.appendSql("	SET market = ?,			");
			sh.appendSql("	src = ?,				");
			sh.appendSql("	dscReason = ?			");
			sh.appendSql("	WHERE occFlag = ?		");
			sh.appendSql("	AND rmno = ?			");
			sh.appendSql("	AND rsvOccId = ?		");
			sh.appendSql("	AND masterId = ?		");
			sh.appendSql("	AND hotelGroupId = ?	");
			sh.appendSql("	AND hotelId = ?			");
			sh.insertValue(masterBase.getMarket());
			sh.insertValue(masterBase.getSrc());
			sh.insertValue(masterBase.getDscReason());
			sh.insertValue(RsvSrc.OccFlag.MF);
			sh.insertValue(masterBase.getRmno());
			sh.insertValue(masterBase.getRmoccId());
			sh.insertValue(masterBase.getMasterId());
			sh.insertValue(masterBase.getHotelGroupId());
			sh.insertValue(masterBase.getHotelId());
			bulkUpdate(sh);
		}
		
		  /**某些条件下，1张会员卡只能登记一个房间
         * @param masterBase
         * @return 返回空表示正常通过，返回值表示不允许入住，并给出提示
         */
        @Override
        public MasterBase ListOneMemeberOneRoom(MasterBase masterBase) {
            SQLHelper sh = new SQLHelper();
            sh.appendSql("  SELECT obj               ");
            sh.appendSql("  FROM MasterBase as obj ");
            sh.appendSql("  WHERE obj.hotelGroupId = ?  ");
            sh.appendSql("    AND obj.hotelId = ?  ");
            sh.appendSql("    AND obj.sta = 'I'  ");
            sh.appendSql("    AND obj.id <> obj.rsvId AND obj.rsvClass in ('F','D') ");
            sh.appendSql("    AND obj.memberNo = ?  ");
            sh.appendSql("    AND (NOT ( DATE(?) <= DATE(obj.arr)  OR  DATE(?) >= DATE(obj.dep) )  ");
            sh.appendSql("          OR ( DATE(?) = DATE(obj.arr)  AND DATE(obj.arr) = DATE(obj.dep) AND DATE(?) = DATE(obj.dep) )  ");
            sh.appendSql("        ) ");
            sh.appendSql("    AND obj.rmno <> ?  ");
            sh.insertValue(masterBase.getHotelGroupId());
            sh.insertValue(masterBase.getHotelId());
            sh.insertValue(masterBase.getMemberNo());
            sh.insertValue(masterBase.getDep());
            sh.insertValue(masterBase.getArr());
            sh.insertValue(masterBase.getDep());
            sh.insertValue(masterBase.getArr());
            sh.insertValue(masterBase.getRmno());
            List<MasterBase> list = find(sh);
            if(list.isEmpty()){
                return null;
            }
            return list.get(0);
        }
		
		/**
		 * 根据给定集团ID及酒店ID,获取对应需要同步的中央预订单列表
		 * 用于集团端夜审过程 -- 订单同步 
		 * 其他位置请慎用
		 * @param hotelGroupId	集团ID
		 * @param hotelId		酒店ID
		 * @return List<CrsSyncObj>
		 * @author Cairo
		 * @date 2014-03-26
		 */
		@Override
		public List<CRSSyncObj> findCrsResrvSyncList(Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" CALL up_ihotel_find_master_sync_crs(?,?) ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			return findByNativeSQL(sh, CRSSyncObj.class);
		}
		
		/**
		 * 根据手机/电话号码查主单
		 * @param mobile
		 * @param hotelGroupId
		 * @param hotelId
		 * @return
		 */
		@Override
		public List<MasterLinkDto> findMasterByMobile(String mobile, Long hotelGroupId, Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT								");
			sh.appendSql("	a.hotel_group_id	hotelGroupId,	");
			sh.appendSql("	a.hotel_id			hotelId,		");
			sh.appendSql("	a.id				id,				");
			sh.appendSql("	a.rsv_id			resrvId,		");
			sh.appendSql("	'C'					type,			");
			sh.appendSql("	a.rsv_class			rsvClass,		");
			sh.appendSql("	''					flag,			");
			sh.appendSql("	b.name				`name`,			");
			sh.appendSql("	b.name2				nameCombine,	");
			sh.appendSql("	b.sex				sex,			");
			sh.appendSql("	a.sta				sta,			");
			sh.appendSql("	a.ratecode			rateCode,		");
			sh.appendSql("	IF(a.id <> a.rsv_id,a.rmtype,'')	rmType,");
			sh.appendSql("	a.rmnum				rmNum,			");
			sh.appendSql("	a.rmno				rmNo,			");
			sh.appendSql("  a.rmno_son			rmnoSon,		");
			sh.appendSql("	(a.adult+a.children)	adultNum,	");
			sh.appendSql("	a.adult				adult,			");
			sh.appendSql("	a.children			children,		");
			sh.appendSql("	a.arr				arr,			");
			sh.appendSql("	a.dep				dep,			");
			sh.appendSql("	DATEDIFF(a.dep,a.arr)	dayNum,		");
			sh.appendSql("	IF(a.id <> a.rsv_id,a.real_rate,0)	realRate,");
			sh.appendSql("	a.packages			packages,		");
			sh.appendSql("	a.charge			charge,			");
			sh.appendSql("	a.pay				pay,			");
			sh.appendSql("	(a.charge - a.pay)	balance,		");
			sh.appendSql("	a.credit			credit,			");
			sh.appendSql("	a.market			market,			");
			sh.appendSql("	a.rsv_no			rsvNo,			");
			sh.appendSql("	a.master_id			masterId,		");
			sh.appendSql("  a.amenities			amenities,		");
			sh.appendSql("  a.remark		    remark,			");
			sh.appendSql("	a.link_id			linkId,			");
			sh.appendSql("	a.pkg_link_id		pkgLinkId,		");
			sh.appendSql("	0					rsvId,			");
			sh.appendSql("  b.vip				vip,			");
			sh.appendSql("	b.profile_id		profileId,		");
			sh.appendSql("	b.profile_type		profileType,	");
			sh.appendSql("	a.create_user		createUser,		");
			sh.appendSql("	a.create_datetime	createDatetime	");
			sh.appendSql(" FROM master_base a, master_guest b	");
			sh.appendSql(" WHERE b.id = a.id					");
			if(hotelGroupId != null){
				sh.appendSql(" AND a.hotel_group_id = ? ");
				sh.appendSql(" AND b.hotel_group_id = ? ");
				sh.insertValue(hotelGroupId);
				sh.insertValue(hotelGroupId);
			}
			if(hotelId != null){
				sh.appendSql(" AND a.hotel_id = ? ");
				sh.appendSql(" AND b.hotel_id = ? ");
				sh.insertValue(hotelId);
				sh.insertValue(hotelId);
			}
			sh.appendSql(" AND a.rsv_class <> 'H' ");
		    sh.appendSql(" AND (a.sta = 'R' OR a.sta = 'I') ");
		    sh.appendSql(" AND (a.mobile = ? OR b.mobile = ? OR b.phone = ?) ");
		    sh.insertValue(mobile);
		    sh.insertValue(mobile);
		    sh.insertValue(mobile);
		    return findByNativeSQL(sh, MasterLinkDto.class);
		}
		
		/**
		 * 查询本日夜审自动NoShow预订单集合
		 * 注意：此方法暂时仅适用于Taobao接口
		 * @param sourceId 			订房中心ID
		 * @param hotelGroupId		集团ID
		 * @param hotelId 			酒店ID
		 * @return MasterTaobaoDto
		 * @author cairo
		 * @date 2014-08-13
		 */
		@Override
		public List<MasterTaobaoDto> findResrvListNoShowAudit(String sourceId,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT b.id    AS id,       ");
			sh.appendSql("   b.crs_no     AS crsNo,    ");
			sh.appendSql("   b.credit_man AS creditMan ");
			sh.appendSql(" FROM master_audit AS a,     ");
			sh.appendSql("     master_base AS b        ");
			sh.appendSql(" WHERE a.id = b.id           ");
			sh.appendSql("     AND a.hotel_group_id = ?");
			sh.appendSql("     AND a.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ?");
			sh.appendSql("     AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id = a.rsv_id     ");
			sh.appendSql("     AND a.sta = 'R'         ");
			sh.appendSql("     AND b.id = b.rsv_id     ");
			sh.appendSql("     AND b.is_resrv = 'T'    ");
			sh.appendSql("     AND b.sta = 'N'         ");
			sh.appendSql("     AND b.crs_no <> ''      ");
			sh.appendSql("     AND (1=2 OR  ");
			if(isNotNull(sourceId) && !"0".equals(sourceId)){
				sh.appendSql(" b.source_id = ? OR    ");
				sh.insertValue(sourceId);
			}
			sh.appendSql("     EXISTS (SELECT 1 FROM master_sub ");
			sh.appendSql("     WHERE id = a.id AND web_class = 'TAOBAO_FACE')) ");
			return findByNativeSQL(sh, MasterTaobaoDto.class);
		}
		
		/**
		 * 夜审补录whereFrom信息方法
		 * 注意：此方法是用于夜审过程 - 主要表备份
		 * @param cnIdCode			身份证类型代码
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @author Cairo
		 * @date 2014-09-04
		 */
		@Override
		public void updateMasterBaseWhereFromByAudit(String cnIdCode,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" UPDATE master_base AS a,           ");
			sh.appendSql("   hotel AS b                       ");
			sh.appendSql(" SET a.where_to = b.district_code   ");
			sh.appendSql(" WHERE a.hotel_group_id = ?         ");
			sh.appendSql("     AND a.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ?       ");
			sh.appendSql("     AND b.id = ?                   ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.where_to = ''            ");
			bulkUpdateByNativeSQL(sh);
			if(!isNotNull(cnIdCode)){
				return;
			}
			sh.clear();
			sh.appendSql(" UPDATE master_base AS a,           ");
			sh.appendSql("   master_guest AS b                ");
			sh.appendSql(" SET a.where_from = LEFT(b.id_no,6) ");
			sh.appendSql(" WHERE a.hotel_group_id = ?         ");
			sh.appendSql("     AND a.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ?       ");
			sh.appendSql("     AND b.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id = b.id                ");
			sh.appendSql("     AND a.where_from = ''          ");
			sh.appendSql("     AND a.rsv_class IN('F','D')    ");
			sh.appendSql("     AND b.id_code = ?              ");
			sh.insertValue(cnIdCode);
			sh.appendSql("     AND LENGTH(b.id_no) > 6        ");
			bulkUpdateByNativeSQL(sh);
		}
		
		/**
		 * 根据给定主单记录ID，查询主单公安接口信息数据
		 * @param masterId		登记单ID
		 * @return MasterPoliceDto
		 * @author Cairo
		 * @date 2014-09-12
		 */
		@Override
		public MasterPoliceDto findMasterPoliceDtoByMasterId(Long masterId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT a.id,              ");
			sh.appendSql("   a.rsv_class AS rsvClass,");
			sh.appendSql("   a.sta, a.rmno,          ");
			sh.appendSql("   a.arr, a.dep,           ");
			sh.appendSql("   a.is_send   AS isSend,  ");
			sh.appendSql("   b.name, b.sex,          ");
			sh.appendSql("   b.race, b.birth,        ");
			sh.appendSql("   b.id_code   AS idCode,  ");
			sh.appendSql("   b.id_no     AS idNo,    ");
			sh.appendSql("   b.street    AS address, ");
			sh.appendSql("   b.profile_id AS profileId,");
			sh.appendSql("   a.member_no AS memberNo,");
			sh.appendSql("   a.inner_card_id AS innerCardId, ");
			sh.appendSql("   b.last_name AS lastName,	");
			sh.appendSql("   b.first_name AS firstName,	");
			sh.appendSql("   b.nation AS nation,		");
			sh.appendSql("   b.visa_type AS visaType,	");
			sh.appendSql("   b.visa_no AS visaNo,		");
			sh.appendSql("   b.visa_begin AS visaBegin, ");
			sh.appendSql("   b.visa_end AS visaEnd,		");
			sh.appendSql("   b.visa_grant AS visaGrant,	");
			sh.appendSql("   b.enter_port AS enterPort,	");
			sh.appendSql("   b.enter_date AS enterDate, ");
			sh.appendSql("   b.enter_date_end AS enterDateEnd");
			sh.appendSql(" FROM master_base AS a,    ");
			sh.appendSql("   master_guest AS b       ");
			sh.appendSql(" WHERE a.id = ?            ");
			sh.appendSql("     AND b.id = ?          ");
			sh.insertValue(masterId);
			sh.insertValue(masterId);
			List<MasterPoliceDto> list = findByNativeSQL(sh, MasterPoliceDto.class) ;
			if(list.isEmpty()){
				return null;
			}
			return list.get(0);
		}
		
		/**
		 * 根据给定纯预留记录ID及房号，查询主单公安接口信息数据(用于综合排房界面，纯预留直接入住功能)
		 * @param rsvSrcParentId
		 * @param rmnos
		 * @return
		 */
		@Override
		public List<MasterPoliceDto> findMasterPoliceDtoByParentRsvSrcId(Long rsvSrcParentId, String rmnos, Long hotelGroupId, Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT a.id,              ");
			sh.appendSql("   a.rsv_class AS rsvClass,");
			sh.appendSql("   a.sta, a.rmno,          ");
			sh.appendSql("   a.arr, a.dep,           ");
			sh.appendSql("   a.is_send   AS isSend,  ");
			sh.appendSql("   b.name, b.sex,          ");
			sh.appendSql("   b.race, b.birth,        ");
			sh.appendSql("   b.id_code   AS idCode,  ");
			sh.appendSql("   b.id_no     AS idNo,    ");
			sh.appendSql("   b.street    AS address, ");
			sh.appendSql("   b.profile_id AS profileId,");
			sh.appendSql("   a.member_no AS memberNo,");
			sh.appendSql("   a.inner_card_id AS innerCardId, ");
			sh.appendSql("   b.last_name AS lastName,	");
			sh.appendSql("   b.first_name AS firstName,	");
			sh.appendSql("   b.nation AS nation,		");
			sh.appendSql("   b.visa_type AS visaType,	");
			sh.appendSql("   b.visa_no AS visaNo,		");
			sh.appendSql("   b.visa_begin AS visaBegin, ");
			sh.appendSql("   b.visa_end AS visaEnd,		");
			sh.appendSql("   b.visa_grant AS visaGrant,	");
			sh.appendSql("   b.enter_port AS enterPort,	");
			sh.appendSql("   b.enter_date AS enterDate, ");
			sh.appendSql("   b.enter_date_end AS enterDateEnd");
			sh.appendSql(" FROM master_base AS a,    ");
			sh.appendSql("   master_guest AS b,      ");
			sh.appendSql("   rsv_src AS c      		 ");
			sh.appendSql(" WHERE a.id = b.id         ");
			sh.appendSql("     AND c.accnt = a.id    ");
			sh.appendSql("     AND a.rsv_class = 'F' ");
			sh.appendSql("     AND a.id <> a.rsv_id  ");
			sh.appendSql("     AND c.occ_flag = 'MF' ");
			sh.appendSql("     AND a.hotel_group_id = ? ");
			sh.appendSql("     AND a.hotel_id = ?	 ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ? ");
			sh.appendSql("     AND b.hotel_id = ?	 ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND c.hotel_group_id = ? ");
			sh.appendSql("     AND c.hotel_id = ?	 ");
			sh.appendSql("     AND c.parent_id = ?   ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.insertValue(rsvSrcParentId);
			if(isNotNull(rmnos)){
				sh.appendOrSql(" OR c.rmno = ? ", rmnos.split(EntityConstant.COMMA));
			}
			return findByNativeSQL(sh, MasterPoliceDto.class);
		}
		
		/**
		 * 根据给定条件，查询符合条件的登记单列表
		 * 注意：此方法仅适用于WeChat接口
		 * @param cardNos			会员卡列表(多个会员卡号，请使用','分隔)
		 * @param innerCardIds		会员卡内部卡号(多个内部卡号，请使用','分隔)
		 * @param stas				主单状态列表(多个主单状态，请使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<MasterWeChatDto>
		 * @author Cairo
		 * @date 2014-09-15
		 */
		@Override
		public List<MasterWeChatDto> findWeChatListByCardNo(String cardNos,String innerCardIds,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT                               ");
			sh.appendSql("   a.hotel_group_id AS hotelGroupId,  ");
			sh.appendSql("   a.hotel_id       AS hotelId,       ");
			sh.appendSql("   h.descript       AS hotelDescript, ");
			sh.appendSql("   a.id,                              ");
			sh.appendSql("   a.rsv_id         AS rsvId,         ");
			sh.appendSql("   a.master_id      AS masterId,      ");
			sh.appendSql("   a.rsv_class      AS rsvClass,      ");
			sh.appendSql("   a.sta,                             ");
			sh.appendSql("   a.rsv_no         AS rsvNo,         ");
			sh.appendSql("   a.crs_no         AS crsNo,         ");
			sh.appendSql("   a.rmno,                            ");
			sh.appendSql("   IFNULL(e.flag,'') AS rmSta,        ");
			sh.appendSql("   b.name,                            ");
			sh.appendSql("   a.adult,                           ");
			sh.appendSql("   a.ratecode       AS rateCode,      ");
			sh.appendSql("   a.nego_rate      AS negoRate,      ");
			sh.appendSql("   a.real_rate      AS realRate,      ");
			sh.appendSql("   a.arr,                             ");
			sh.appendSql("   a.dep,                             ");
			sh.appendSql("   CONCAT(IFNULL(c.name,'-'),'/',IFNULL(cp1.name,'-'),'/',IFNULL(cp2.name,'-'),'/',IFNULL(cp3.name,'-')) AS grpName,");
			sh.appendSql("   a.member_no      AS cardNo,        ");
			sh.appendSql("   LEFT(a.remark,256) AS remark,      ");
			sh.appendSql("   a.charge,                          ");
			sh.appendSql("   a.pay,                             ");
			sh.appendSql("   a.credit,                          ");
			sh.appendSql("   IFNULL(s.id,0)   AS selfServiceId, ");
			sh.appendSql("   IFNULL(s.sta,'') AS selfServiceSta,");
			sh.appendSql("   IFNULL(s.has_invoice,'')   AS hasInvoice,");
			sh.appendSql("   IFNULL(s.invoice_title,'') AS invoiceTitle,");
			sh.appendSql("   IFNULL(s.remark,'') AS selfServiceRemark ");
			sh.appendSql(" FROM master_base AS a                ");
			sh.appendSql("   JOIN master_guest AS b             ");
			sh.appendSql("     ON a.id = b.id                   ");
			sh.appendSql("       AND b.hotel_group_id = ?       ");
			sh.appendSql("       AND b.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN master_guest AS c        ");
			sh.appendSql("     ON a.grp_accnt = c.id            ");
			sh.appendSql("       AND c.hotel_group_id = ?       ");
			sh.appendSql("       AND c.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN room_sta AS d            ");
			sh.appendSql("     ON a.rmno = d.rmno               ");
			sh.appendSql("       AND d.hotel_group_id = ?       ");
			sh.appendSql("       AND d.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN code_base AS e           ");
			sh.appendSql("     ON e.hotel_group_id = ?          ");
			sh.appendSql("       AND e.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("       AND e.parent_code = 'room_sta_map'   ");
			sh.appendSql("       AND e.code = CONCAT(d.sta_occ,d.sta) ");
			sh.appendSql("   LEFT JOIN company_base AS cp1      ");
			sh.appendSql("     ON a.company_id = cp1.id         ");
			sh.appendSql("       AND cp1.hotel_group_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("   LEFT JOIN company_base AS cp2      ");
			sh.appendSql("     ON a.agent_id = cp2.id           ");
			sh.appendSql("       AND cp2.hotel_group_id = ?     ");
			
			sh.insertValue(hotelGroupId);
			sh.appendSql("   LEFT JOIN company_base AS cp3      ");
			sh.appendSql("     ON a.source_id = cp3.id          ");
			sh.appendSql("       AND cp3.hotel_group_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.appendSql("   LEFT JOIN hotel AS h               ");
			sh.appendSql("     ON h.hotel_group_id = ?          ");
			sh.appendSql("       AND  h.id = ?                  ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("   LEFT JOIN self_service AS s        ");
			sh.appendSql("     ON s.hotel_group_id = ?          ");
			sh.appendSql("       AND s.hotel_id = ?             ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("       AND s.type = 'CHECK_OUT'       ");
			sh.appendSql("       AND s.master_id = a.id         ");
			sh.appendSql(" WHERE a.hotel_group_id = ?           ");
			sh.appendSql("     AND a.hotel_id = ?               ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id <> a.rsv_id             ");
			sh.appendSql("     AND a.is_resrv = 'F'             ");
			sh.appendSql("     AND a.rsv_class = 'F'            ");
			sh.appendSql("     AND a.rsv_id > 0                 ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
			}
//			sh.appendSql("     AND a.crs_no <> ''               ");
			if(isNotNull(innerCardIds)){
				sh.appendOrSql(" OR a.inner_card_id = ? ",innerCardIds.split(","));
			}
			if(isNotNull(cardNos)){
				sh.appendOrSql(" OR a.member_no = ? ", cardNos.split(","));
			}
			return findByNativeSQL(sh, MasterWeChatDto.class);
		}
		
		/**
		 * 根据给定条件，查询对应会员卡本日将到主单数量
		 * 注意：此方法仅适用于WeChat接口
		 * @param cardNos			会员卡列表(多个会员卡号，请使用','分隔)
		 * @param innerCardIds		会员卡内部卡号(多个内部卡号，请使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return Integer
		 * @author Cairo
		 * @date 2014-09-15
		 */
		@Override
		public Integer findWeChatArrNumByCardNo(String cardNos,String innerCardIds,Long hotelGroupId,Long hotelId){
			Date dateTmp = DateUtil.addDays(new Date(), 1);
			dateTmp = DateHelper.shortDate(dateTmp);
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT COUNT(1)          ");
			sh.appendSql(" FROM master_base AS a    ");
			sh.appendSql(" WHERE a.hotel_group_id = ? ");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id = a.rsv_id  ");
			sh.appendSql("     AND a.is_resrv = 'T'  ");
			sh.appendSql("     AND a.rsv_class IN ('F','G') ");
			sh.appendSql("     AND a.rsv_id > 0      ");
			sh.appendSql("     AND a.crs_no <> ''    ");
			if(isNotNull(innerCardIds)){
				sh.appendOrSql(" OR a.inner_card_id = ? ",innerCardIds.split(","));
			}
			if(isNotNull(cardNos)){
				sh.appendOrSql(" OR a.member_no = ? ", cardNos.split(","));
			}
			sh.appendSql("     AND EXISTS(SELECT 1 FROM rsv_src ");
			sh.appendSql("        WHERE hotel_group_id = ? ");
			sh.appendSql("            AND hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("            AND accnt = a.id ");
			sh.appendSql("            AND rmnum > 0    ");
			sh.appendSql("            AND occ_flag = CONCAT('R',a.rsv_class) ");
			sh.appendSql("            AND arr_date < ? )");
			sh.insertValue(dateTmp);
			Integer size = Integer.parseInt(findByNativeSQL(sh).get(0).toString());
			sh.clear();
			sh.appendSql(" SELECT COUNT(1)           ");
			sh.appendSql(" FROM master_base AS a     ");
			sh.appendSql(" WHERE a.hotel_group_id = ? ");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id <> a.rsv_id  ");
			sh.appendSql("     AND a.is_resrv = 'F'  ");
			sh.appendSql("     AND a.rsv_class = 'F' ");
			sh.appendSql("     AND a.rsv_id > 0      ");
			sh.appendSql("     AND a.crs_no <> ''    ");
			sh.appendSql("     AND a.sta = 'R'       ");
			sh.appendSql("     AND a.rmno = ''       ");
			sh.appendSql("     AND a.arr < ?         ");
			sh.insertValue(dateTmp);
			if(isNotNull(innerCardIds)){
				sh.appendOrSql(" OR a.inner_card_id = ? ",innerCardIds.split(","));
			}
			if(isNotNull(cardNos)){
				sh.appendOrSql(" OR a.member_no = ? ", cardNos.split(","));
			}
			size += Integer.parseInt(findByNativeSQL(sh).get(0).toString());
			return size;
		}
		
		/**
		 * 根据给定条件，查询对应会员卡本日将离主单数量
		 * 注意：此方法仅适用于WeChat接口
		 * @param cardNos			会员卡列表(多个会员卡号，请使用','分隔)
		 * @param innerCardIds		会员卡内部卡号(多个内部卡号，请使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return Integer
		 * @author Cairo
		 * @date 2014-09-15
		 */
		@Override
		public Integer findWeChatDepNumByCardNo(String cardNos,String innerCardIds,Long hotelGroupId,Long hotelId){
//			Date dateTmp = DateUtil.addDays(new Date(), 1);
//			dateTmp = DateHelper.shortDate(dateTmp);
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT COUNT(1)           ");
			sh.appendSql(" FROM master_base AS a     ");
			sh.appendSql(" WHERE a.hotel_group_id = ? ");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id <> a.rsv_id  ");
			sh.appendSql("     AND a.is_resrv = 'F'  ");
			sh.appendSql("     AND a.rsv_class = 'F' ");
			sh.appendSql("     AND a.rsv_id > 0      ");
			sh.appendSql("     AND a.crs_no <> ''    ");
			sh.appendSql("     AND a.sta = 'I'       ");
//			sh.appendSql("     AND a.dep < ?         ");
//			sh.insertValue(dateTmp);
			if(isNotNull(innerCardIds)){
				sh.appendOrSql(" OR a.inner_card_id = ? ",innerCardIds.split(","));
			}
			if(isNotNull(cardNos)){
				sh.appendOrSql(" OR a.member_no = ? ", cardNos.split(","));
			}
			sh.appendSql("     AND NOT EXISTS(SELECT 1 FROM self_service ");
			sh.appendSql("       WHERE hotel_group_id = ? ");
			sh.appendSql("           AND hotel_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("           AND type = 'CHECK_OUT' ");
			sh.appendSql("           AND master_id = a.id) ");
			return Integer.parseInt(findByNativeSQL(sh).get(0).toString());
		}
		
		/**
		 * 根据给定酒店预订号，查询预订主单记录
		 * @param rsvNo				酒店预订号
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return MasterBase
		 * @author Cairo
		 * @date 2014-09-18
		 */
		@Override
		public MasterBase findResrvBaseByRsvNo(String rsvNo,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" FROM MasterBase AS obj ");
			sh.appendSql(" WHERE obj.hotelGroupId = ? ");
			sh.appendSql("     AND obj.hotelId = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND obj.rsvNo = ?   ");
			sh.insertValue(rsvNo);
			sh.appendSql("     AND obj.id = obj.rsvId ");
			sh.appendSql("     AND obj.isResrv = 'T' ");
			List<MasterBase> list = find(sh);
			if(list.isEmpty()){
				return null;
			}
			return list.get(0);
		} 
		
		/**
		 * 根据预订主单号，获取成员主单房费总计
		 * @param rsvId				预订id
		 * @param stas				登记单状态(可选,多个状态使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return BigDecimal
		 * @author Cairo
		 * @date 2014-09-19
		 */
		@Override
		public BigDecimal findMemberRateSum(Long rsvId,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			// 成员
			sh.appendSql(" SELECT                          ");
			sh.appendSql("   IFNULL(SUM(IFNULL(c.real_share_rate,a.real_rate)),0) AS rateSum");
			sh.appendSql(" FROM master_base AS a,          ");
			sh.appendSql("   rsv_src AS b,                 ");
			sh.appendSql("   rsv_rate AS c                 ");
			sh.appendSql(" WHERE a.hotel_group_id = ?      ");
			sh.appendSql("     AND a.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.rsv_id <> a.id        ");
			sh.appendSql("     AND a.is_resrv = 'F'        ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
			}
			sh.appendSql("     AND a.rsv_id = ?            ");
			sh.insertValue(rsvId);
			sh.appendSql("     AND b.hotel_group_id = ?    ");
			sh.appendSql("     AND b.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.accnt = a.id          ");
			sh.appendSql("     AND b.occ_flag = 'MF'       ");
			sh.appendSql("     AND c.hotel_group_id = ?    ");
			sh.appendSql("     AND c.hotel_id = ?          ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND c.master_id = a.id      ");
			sh.appendSql("     AND c.rsv_src_id = b.id     ");
			sh.appendSql("     AND c.rsv_date >= b.arr_date");
			sh.appendSql("     AND c.rsv_date < b.dep_date ");
			return BigDecimal.valueOf(Double.parseDouble(findByNativeSQL(sh).get(0).toString()));
		}
		
		/**
		 * 根据给定预订单号，获取预订单当前房费总计
		 * 注意：此方法仅计算预留及成员当前房价而不是全部房价总计
		 * @param rsvId				预订主单ID
		 * @param stas				登记单状态(可选,多个状态使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return BigDecimal
		 * @author Cairo
		 * @date 2014-09-19
		 */
		@Override
		public BigDecimal findResrvCurrentRateSum(Long rsvId,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			// 计算纯预留当前房价总计
			sh.appendSql(" SELECT					 ");
			sh.appendSql("   IFNULL(SUM(a.real_rate * a.rmnum),0) AS rateSum ");
			sh.appendSql(" FROM rsv_src AS a         ");
			sh.appendSql(" WHERE a.hotel_group_id = ?");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.occ_flag IN ('RF','RG')");
			sh.appendSql("     AND a.accnt = ?       ");
			sh.insertValue(rsvId);
			sh.appendSql("     AND a.rmnum > 0       ");
			BigDecimal rateSum = BigDecimal.valueOf(Double.parseDouble(findByNativeSQL(sh).get(0).toString()));
			sh.clear();
			// 计算成员登记单当前房价总计
			sh.appendSql(" SELECT					 ");
			sh.appendSql("   IFNULL(SUM(a.real_rate),0) AS rateSum");
			sh.appendSql(" FROM master_base AS a     ");
			sh.appendSql(" WHERE a.hotel_group_id = ?");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.rsv_id <> a.id  ");
			sh.appendSql("     AND a.is_resrv = 'F'  ");
			sh.appendSql("     AND a.rsv_class = 'F' ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
			}
			sh.appendSql("     AND a.rsv_id = ?      ");
			sh.insertValue(rsvId);
			rateSum = rateSum.add(BigDecimal.valueOf(Double.parseDouble(findByNativeSQL(sh).get(0).toString())));
			return rateSum;
		}
		
		/**
		 * 根据给定预订单号，获取预订单取消NoShow当前房费总计
		 * 注意：此方法仅计算预留及成员当前房价而不是全部房价总计
		 * @param rsvId				预订主单ID
		 * @param stas				登记单状态(可选,多个状态使用','分隔,X/N)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return BigDecimal
		 * @author Cairo
		 * @date 2014-09-19
		 */
		@Override
		public BigDecimal findResrvCurrentCxlNoShowRateSum(Long rsvId,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			// 计算纯预留当前房价总计
			sh.appendSql(" SELECT					 ");
			sh.appendSql("   IFNULL(SUM(a.real_rate * a.rmnum),0) AS rateSum ");
			sh.appendSql(" FROM rsv_src_cxl_noshow AS a ");
			sh.appendSql(" WHERE a.hotel_group_id = ?");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.occ_flag IN ('RF','RG')");
			sh.appendSql("     AND a.accnt = ?       ");
			sh.insertValue(rsvId);
			sh.appendSql("     AND a.rmnum > 0       ");
			sh.appendSql("     AND a.hung_id = (select MAX(id) from master_hung ");
			sh.appendSql("        where hotel_group_id = ? ");
			sh.appendSql("            AND hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("            AND master_id = ? ");
			sh.insertValue(rsvId);
			sh.appendSql("            AND master_type = 'RESRV')");
			BigDecimal rateSum = BigDecimal.valueOf(Double.parseDouble(findByNativeSQL(sh).get(0).toString()));
			sh.clear();
			// 计算成员登记单当前房价总计
			sh.appendSql(" SELECT					 ");
			sh.appendSql("   IFNULL(SUM(a.real_rate),0) AS rateSum");
			sh.appendSql(" FROM master_base AS a     ");
			sh.appendSql(" WHERE a.hotel_group_id = ?");
			sh.appendSql("     AND a.hotel_id = ?    ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.rsv_id <> a.id  ");
			sh.appendSql("     AND a.is_resrv = 'F'  ");
			sh.appendSql("     AND a.rsv_class = 'F' ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
			}
			sh.appendSql("     AND a.rsv_id = ?      ");
			sh.insertValue(rsvId);
			rateSum = rateSum.add(BigDecimal.valueOf(Double.parseDouble(findByNativeSQL(sh).get(0).toString())));
			return rateSum;
		}
		
		/**
		 * 根据给定预订单号，查询预订有效成原来及成员列表
		 * @param resrvId			预订单ID
		 * @param stas				状态集合(可选,多个状态码使用','分隔)
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return List<MasterChannelDto>
		 * @author Cairo
		 * @date 2014-09-23
		 */
		@Override
		public List<MasterChannelDto> findMasterChannelDtoByResrvId(Long resrvId,String stas,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			// 查询有效纯预留
			sh.appendSql(" SELECT a.id, 'R' AS sta,         ");
			sh.appendSql("   a.hotel_group_id AS hotelGroupId,");
			sh.appendSql("   a.hotel_id       AS hotel_id,  ");
			sh.appendSql("   a.rsv_class      AS rsvClass,  ");
			sh.appendSql("   a.rsv_id         AS resrvId,   ");
			sh.appendSql("   a.grp_accnt      AS grpAccnt,  ");
			sh.appendSql("   a.crs_no         AS crsNo,     ");
			sh.appendSql("   a.rsv_no         AS rsvNo,     ");
			sh.appendSql("   b.name           AS `name`,    ");
			sh.appendSql("   c.adult,                       ");
			sh.appendSql("   c.ratecode       AS rateCode,  ");
			sh.appendSql("   c.rmtype,                      ");
			sh.appendSql("   d.descript       AS rmtypeDescript, ");
			sh.appendSql("   c.rmno,                        ");
			sh.appendSql("   c.rmnum,                       ");
			sh.appendSql("   c.real_rate      AS realRate,  ");
			sh.appendSql("   c.rsv_arr_date   AS arr,       ");
			sh.appendSql("   c.rsv_dep_date   AS dep,       ");
			sh.appendSql("   a.charge,                      ");
			sh.appendSql("   a.pay,                         ");
			sh.appendSql("   a.credit                       ");
			sh.appendSql(" FROM master_base AS a,           ");
			sh.appendSql("   master_guest AS b,             ");
			sh.appendSql("   rsv_src AS c,                  ");
			sh.appendSql("   room_type AS d                 ");
			sh.appendSql(" WHERE a.hotel_group_id = ?       ");
			sh.appendSql("     AND a.hotel_id = ?           ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ?     ");
			sh.appendSql("     AND b.hotel_id = ?           ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.id = b.id              ");
			sh.appendSql("     AND c.hotel_group_id = ?     ");
			sh.appendSql("     AND c.hotel_id = ?           ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND c.occ_flag = CONCAT('R',a.rsv_class)");
			sh.appendSql("     AND c.accnt = a.id           ");
			sh.appendSql("     AND c.rmnum > 0              ");
			sh.appendSql("     AND d.hotel_group_id = ?     ");
			sh.appendSql("     AND d.hotel_id = ?           ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND d.code = c.rmtype        ");
			sh.appendSql("     AND a.is_resrv = 'T'         ");
			sh.appendSql("     AND a.id = ?                 ");
			sh.insertValue(resrvId);
			List<MasterChannelDto> list = findByNativeSQL(sh, MasterChannelDto.class);
			sh.clear();
			// 查询有效成员
			sh.appendSql(" SELECT a.id, a.sta,            ");
			sh.appendSql("   a.hotel_group_id AS hotelGroupId,");
			sh.appendSql("   a.hotel_id       AS hotel_id,");
			sh.appendSql("   a.rsv_class      AS rsvClass,");
			sh.appendSql("   a.rsv_id         AS resrvId, ");
			sh.appendSql("   a.grp_accnt      AS grpAccnt,");
			sh.appendSql("   a.crs_no         AS crsNo,   ");
			sh.appendSql("   a.rsv_no         AS rsvNo,   ");
			sh.appendSql("   b.name           AS `name`,  ");
			sh.appendSql("   a.adult,                     ");
			sh.appendSql("   a.ratecode       AS rateCode,");
			sh.appendSql("   a.rmtype,                    ");
			sh.appendSql("   d.descript       AS rmtypeDescript, ");
			sh.appendSql("   a.rmno,                      ");
			sh.appendSql("   a.rmnum,                     ");
			sh.appendSql("   a.real_rate      AS realRate,");
			sh.appendSql("   a.arr,                       ");
			sh.appendSql("   a.dep,                       ");
			sh.appendSql("   a.charge,                    ");
			sh.appendSql("   a.pay,                       ");
			sh.appendSql("   a.credit                     ");
			sh.appendSql(" FROM master_base AS a,         ");
			sh.appendSql("   master_guest AS b,           ");
			sh.appendSql("   room_type AS d               ");
			sh.appendSql(" WHERE a.hotel_group_id = ?     ");
			sh.appendSql("     AND a.hotel_id = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND b.hotel_group_id = ?   ");
			sh.appendSql("     AND b.hotel_id = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND d.hotel_group_id = ?   ");
			sh.appendSql("     AND d.hotel_id = ?         ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND d.code = a.rmtype      ");
			sh.appendSql("     AND a.id = b.id            ");
			sh.appendSql("     AND a.is_resrv = 'F'       ");
			sh.appendSql("     AND a.rsv_class = 'F'      ");
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(","));
			}
			sh.appendSql("     AND a.id <> ?              ");
			sh.appendSql("     AND a.rsv_id = ?           ");
			sh.insertValue(resrvId);
			sh.insertValue(resrvId);
			list.addAll(findByNativeSQL(sh, MasterChannelDto.class));
			return list;
		}
		
		
		
		/**
		 * 根据给定条件，查询同住人MasterBase集合
		 * 适用于手机接口
		 * @param hotelGroupId
		 * @param hotelId
		 * @param baseId
		 * @param masterId
		 * @param rmno
		 * @return List<T>
		 * @author Cairo
		 * @date 2014-11-17
		 */
		@Override
		public <T> List<T> listMasterLiveWithoutSelf(Long hotelGroupId, Long hotelId, Long baseId, Long masterId, String rmno) {
		    SQLHelper sh = new SQLHelper();
		    sh.appendSql(" SELECT obj FROM MasterBase AS obj ");
		    sh.appendSql(" WHERE obj.hotelGroupId = ? ");
		    sh.appendSql("     AND obj.hotelId = ? ");
		    sh.insertValue(hotelGroupId);
		    sh.insertValue(hotelId);
		    sh.appendSql("     AND obj.id <> obj.rsvId ");
		    sh.appendSql("     AND obj.isResrv = 'F' ");
		    sh.appendSql("     AND obj.masterId = ? ");
		    sh.insertValue(masterId);
		    sh.appendSql("     AND obj.rmno = ? ");
		    sh.insertValue(rmno);
		    sh.appendSql("     AND obj.id <> ? ");
		    sh.insertValue(baseId);
		    return find(sh);
		}
		
		/**
		 * 根据给定条件，查询同住人MasterBase集合
		 * 适用于手机接口
		 * @param hotelGroupId
		 * @param hotelId
		 * @param baseId
		 * @param masterId
		 * @param rmno
		 * @return List<T>
		 * @author Cairo
		 * @date 2014-11-17
		 */
		@Override
		public <T> List<T> listMasterLinkWithoutSelf(Long hotelGroupId, Long hotelId, Long baseId, Long linkId, String rmno) {
		    SQLHelper sh = new SQLHelper();
		    sh.appendSql(" SELECT obj FROM MasterBase AS obj ");
		    sh.appendSql(" WHERE obj.hotelGroupId = ? ");
		    sh.appendSql("     AND obj.hotelId = ? ");
		    sh.insertValue(hotelGroupId);
		    sh.insertValue(hotelId);
		    sh.appendSql("     AND obj.linkId = ? ");
		    sh.insertValue(linkId);
		    sh.appendSql("     AND obj.id <> ? ");
		    sh.insertValue(baseId);
		    sh.appendSql("     AND obj.masterId <> ? ");
		    sh.insertValue(baseId);
		    return find(sh);
		}
		
		@SuppressWarnings("rawtypes")
	    @Override
	    public Container<Map> listReserve(Long hotelGroupId, Long hotelId, SQLHelper sh, Integer currentPage, Integer pageSize) {
	        Container<Map> container = new Container<Map>();
	        sh.setNesting(true);
	        container.setTotalRows(countByNativeSQL(sh));
	        if (pageSize > 0) {
	            sh.setFirstResult(pageSize * (currentPage - 1));
	            sh.setMaxResults(pageSize);
	            container.setMaxResults(pageSize);
	            container.setFirstResult(currentPage);
	            container.setResults(findByNativeSQL(sh, Map.class));
	            if (container.getResults().isEmpty() && container.getTotalRows() > 0) {
	                sh.setFirstResult(0);
	                container.setFirstResult(1);
	                container.setResults(findByNativeSQL(sh, Map.class));
	            }
	        } else {
	            container.setResults(findByNativeSQL(sh, Map.class));
	        }
	        return container;
	    }
		
		/**
	     * 统计主单联房数（请注意：此方法不通过消息拦截，无法使用UserManager的部分属性）
	     * @param masterId
	     * @param stas
	     * @param showResrv
	     */
		@Override
		public int countMasterLink(Long masterId, String stas, boolean showResrv){
			MasterBase masterBase = findMasterBaseById(masterId);
			if(masterBase == null){
				return 0;
			}
			if(masterBase.getGrpAccnt() != null && masterBase.getGrpAccnt() != 0L){
				return 0;
			}
			if(masterBase.getLinkId() == null || masterBase.getLinkId() == 0L){
				return 0;
			}
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT COUNT(1)			");
			sh.appendSql("	FROM master_base		");
			sh.appendSql("	WHERE link_id = ?		");
			sh.insertValue(masterBase.getLinkId());
			sh.appendSql("	AND master_id <> ?		");
			sh.insertValue(masterBase.getMasterId());
			sh.appendSql("	AND id <> ?				");
			sh.insertValue(masterId);
			sh.appendSql("	AND hotel_group_id = ?	");
			sh.insertValue(masterBase.getHotelGroupId());
			sh.appendSql("	AND hotel_id = ?		");
			sh.insertValue(masterBase.getHotelId());
			if(isNotNull(stas)){
				  sh.appendOrSql(" OR sta = ? ", stas.split(","));
			}
			if(!showResrv){
				sh.appendSql(" AND id <> rsv_id ");
				sh.appendSql(" AND rsv_class IN('F', 'D') ");
			}
			return Integer.parseInt(this.findByNativeSQL(sh).get(0) + "");
		}
		
		/**
		 * 根据给定条件，查询指定实体对应属性最后一此修改原值
		 * @param entityId			实体Id	
		 * @param entityName		实体名称(eg:MASTER_BASE)
		 * @param columnName		属性/列名称(eg:ratecode)
		 * @param hotelGroupId		集团Id
		 * @param hotelId			酒店Id
		 * @return String
		 * @author Cairo
		 * @date 2014-11-28
		 */
		@Override
		public String findLastEntityLogInfoByCode(Long entityId,String entityName,String columnName,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" SELECT a.old_value FROM log_info AS a ");
			sh.appendSql(" WHERE a.hotel_group_id = ? ");
			sh.appendSql("     AND a.hotel_id = ?     ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND a.entity_id = ?    ");
			sh.insertValue(entityId);
			sh.appendSql("     AND a.entity_name = ?  ");
			sh.insertValue(entityName);
			sh.appendSql("     AND a.column_name = ?  ");
			sh.insertValue(columnName);
			sh.appendSql(" ORDER BY id DESC           ");
			sh.setFirstResult(0);
			sh.setMaxResults(1);
			List<String> list = findByNativeSQL(sh);
			if(list.isEmpty()){
				return "";
			}
			return list.get(0);
		}
		
		/**
		 * 统计预定主单房数
		 * @param masterId
		 * @param hotelGroupId
		 * @param hotelId
		 * @return 
		 */
		@Override
		public int countResrvRmnum(Long masterId, Long hotelGroupId, Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql("	SELECT SUM(rmnum) FROM(				");
			sh.appendSql("		SELECT rmnum					");
			sh.appendSql("		FROM rsv_src					");
			sh.appendSql("		WHERE occ_flag IN('RF','RG')	");
			sh.appendSql("		AND accnt = ?					");
			sh.insertValue(masterId);
			sh.appendSql("		AND hotel_group_id = ?			");
			sh.insertValue(hotelGroupId);
			sh.appendSql("		AND hotel_id = ? 				");
			sh.insertValue(hotelId);
			sh.appendSql("		UNION ALL 						");
			sh.appendSql("		SELECT 1 AS rmnum				");
			sh.appendSql("		FROM master_base				");
			sh.appendSql("		WHERE is_resrv = 'F'			");
			sh.appendSql("		AND id <> rsv_id				");
			sh.appendSql("		AND rsv_class = 'F'				");
			sh.appendSql("		AND sta IN ('R','I','S','O')	");
			sh.appendSql("		AND id <> ?						");
			sh.insertValue(masterId);
			sh.appendSql("		AND rsv_id = ?					");
			sh.insertValue(masterId);
			sh.appendSql("		AND hotel_group_id = ?			");
			sh.insertValue(hotelGroupId);
			sh.appendSql("		AND hotel_id = ? 				");
			sh.appendSql("		GROUP BY master_id				");
			sh.insertValue(hotelId);
			sh.appendSql("	) AS t								");
			return Integer.parseInt(findByNativeSQL(sh).get(0).toString());
		}
		
		/**
		 * 自动NoShow候补预订单记录
		 * @param type				NoShow类型（1：按天，0：全部）
		 * @param bizDate			营业日期
		 * @param hotelGroupId		集团ID
		 * @param hotelId			酒店ID
		 * @return void
		 * @author Cairo
		 * @date 2012-06-06
		 */
		@Override
		public void updateWaitListNoShow(String type,Date bizDate,Long hotelGroupId,Long hotelId){
			SQLHelper sh = new SQLHelper();
			sh.appendSql(" UPDATE master_base a          ");
			sh.appendSql("     SET a.res_sta = 'W',      ");
			sh.appendSql("         a.sta = 'N',          ");
			sh.appendSql("         a.biz_date = ?,       ");
			sh.insertValue(bizDate);
			sh.appendSql("         a.modify_datetime = ? ");
			sh.insertValue(new Date());
			sh.appendSql(" WHERE a.sta = 'W'             ");
			sh.appendSql("     AND a.rsv_class IN ('F','G') ");
			if("1".equals(type)){
				sh.appendSql(" AND DATE(a.arr) < ? ");	// 排除明日抵离数据
				sh.insertValue(bizDate);
				sh.appendSql(" AND DATE(a.dep) <= ?   ");
				sh.insertValue(bizDate);
			}else{	
				sh.appendSql(" AND ADDDATE(DATE(a.arr),1) <= ? ");
				sh.insertValue(bizDate);
			}
			sh.appendSql("     AND a.id = a.rsv_id ");
			sh.appendSql("     AND a.hotel_group_id = ?  ");
			sh.appendSql("     AND a.hotel_id = ?        ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("     AND NOT EXISTS( SELECT 1 FROM rsv_src_wait_list b  ");	// 排除存在有效预定的
			sh.appendSql("     		WHERE b.occ_flag IN ('RF','RG') ");
			sh.appendSql("       		AND b.hotel_group_id = ? AND b.hotel_id = ? ");
			sh.insertValue(hotelGroupId);
			sh.insertValue(hotelId);
			sh.appendSql("       		AND b.arr_date >= ? AND b.accnt = a.id) ");
			sh.insertValue(bizDate);
		    sh.appendSql("     AND id <> a.id AND rsv_id = a.id AND is_resrv = 'T'  ");
			this.bulkUpdateByNativeSQL(sh);
		}
	
	/**
	 * 根据给定条件查询简单中央预订列表
	 * 注意：此方法用于pad自助接口
	 * @param rsvClass		订单类型(可选，F/G)
	 * @param stas			状态列表(可选，多个状态使用','分隔)
	 * @param crsNo			中央预订号
	 * @param hotelGroupId	集团Id
	 * @param hotelId		酒店id
	 * @return List<CrsResrvSimpleDto>
	 * @author Cairo
	 * @date 2015-03-27
	 */
	@Override
	public List<CrsResrvSimpleDto> findMasterPadDtoByCrsNo(String rsvClass,String stas,String crsNo,Long hotelGroupId,Long hotelId){
		SQLHelper sh = new SQLHelper();
		// 组装成员
		sh.appendSql(" SELECT a.id,a.rsv_id AS resrvId,");
		sh.appendSql("   a.rsv_class AS rsvClass,     ");
		sh.appendSql("   a.sta            AS sta,     ");
		sh.appendSql("   a.crs_no         AS crsNo,   ");
		sh.appendSql("   a.rsv_no         AS rsvNo,   ");
		sh.appendSql("   a.arr,a.dep,                 ");
		sh.appendSql("   a.ratecode,a.rmtype,         ");
		sh.appendSql("   1 AS rmnum, a.rmno,          ");
		sh.appendSql("   a.master_id      AS masterId,");
		sh.appendSql("   a.real_rate      AS realRate,");
		sh.appendSql("   a.hotel_group_id AS hotelGroupId,");
		sh.appendSql("   a.hotel_id       AS hotelId  ");
		sh.appendSql(" FROM master_base AS a          ");
		sh.appendSql(" WHERE a.hotel_group_id = ?     ");
		sh.appendSql("     AND a.hotel_id = ?         ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql("     AND a.is_resrv = 'F'       ");
		sh.appendSql("     AND a.rsv_class = 'F'      ");
		sh.appendSql("     AND a.crs_no = ? 		  ");
		sh.insertValue(crsNo);
		if(isNotNull(stas)){
			sh.appendOrSql(" OR a.sta = ? ", stas.split(","));
		}
		List<CrsResrvSimpleDto> list = findByNativeSQL(sh, CrsResrvSimpleDto.class);
		sh.clear();
		sh.appendSql(" SELECT a.id,a.rsv_id AS resrvId,");
		sh.appendSql("   a.rsv_class      AS rsvClass, ");
		sh.appendSql("   a.sta            AS sta,      ");
		sh.appendSql("   a.crs_no         AS crsNo,    ");
		sh.appendSql("   a.rsv_no         AS rsvNo,    ");
		sh.appendSql("   b.rsv_arr_date   AS arr,      ");
		sh.appendSql("   b.rsv_dep_date   AS dep,      ");
		sh.appendSql("   b.ratecode       AS rateCode, ");
		sh.appendSql("   b.rmtype         AS rmtype,   ");
		sh.appendSql("   b.rmnum          AS rmnum,    ");
		sh.appendSql("   ''               AS rmno,     ");
		sh.appendSql("   a.master_id      AS masterId, ");
		sh.appendSql("   b.real_rate      AS realRate, ");
		sh.appendSql("   a.hotel_group_id AS hotelGroupId,");
		sh.appendSql("   a.hotel_id       AS hotelId   ");
		sh.appendSql(" FROM master_base AS a,          ");
		sh.appendSql("   rsv_src AS b                  ");
		sh.appendSql(" WHERE a.hotel_group_id = ?      ");
		sh.appendSql("     AND a.hotel_id = ?          ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql("     AND a.is_resrv = 'T'        ");
		sh.appendSql("     AND a.crs_no = ? 		  ");
		sh.insertValue(crsNo);
		if(isNotNull(rsvClass)){
			sh.appendSql(" AND a.rsv_class = ? ");
			sh.insertValue(rsvClass);
		}
		sh.appendSql("     AND a.id = b.accnt          ");
		sh.appendSql("     AND b.occ_flag IN('RF','RG')");
		sh.appendSql("     AND b.hotel_group_id = ?    ");
		sh.appendSql("     AND b.hotel_id = ?          ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql("     AND b.rmnum > 0             ");
		list.addAll(findByNativeSQL(sh, CrsResrvSimpleDto.class));
		return list;
	}
	
	public void vlidateLiveMaster(Long masterId, Long hotelGroupId, Long hotelId){
		SQLHelper sh = new SQLHelper();
		sh.appendSql("	SELECT															");
		sh.appendSql("	GROUP_CONCAT(a.id) AS accnts,									");
		sh.appendSql("	FIND_IN_SET(a.masterId, GROUP_CONCAT(a.id)) AS hasLiveKey		");
		sh.appendSql("	FROM MasterBase a												");
		sh.appendSql("	WHERE a.masterId = ?											");
		sh.appendSql("		AND a.hotelGroupId = ?										");
		sh.appendSql("		AND a.hotelId = ?											");
		sh.appendSql("	GROUP BY a.rmno													");
		sh.insertValue(masterId);
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		List<Map> list = find(sh, Map.class);
		if(list != null && !list.isEmpty()){
			List<String> ctList = new ArrayList<String>();
			Long newMasterId = null;
			for(int i = 0; i < list.size(); i++){
				String accnts = (String) list.get(i).get("accnts");
				if((Integer)list.get(i).get("hasLiveKey") > 0){
					ctList.add(accnts);
					continue;
				}
				if(accnts != null && !accnts.isEmpty()){
					newMasterId = Long.parseLong(accnts.split(EntityConstant.COMMA)[0]);
					sh.clear();
					sh.appendSql("	UPDATE MasterBase a 				");
					sh.appendSql("	SET a.masterId = ?					");
					sh.appendSql("	WHERE a.id IN (" + accnts + ")		");
					sh.insertValue(newMasterId);
					bulkUpdate(sh);
					sh.clear();
					sh.appendSql("	UPDATE RsvSrc a 					");
					sh.appendSql("	SET a.masterId = ?					");
					sh.appendSql("	WHERE a.occFlag = ?					");
					sh.appendSql("		AND a.accnt IN (" + accnts + ")	");
					sh.appendSql("		AND a.hotelGroupId = ?			");
					sh.appendSql("		AND a.hotelId = ?				");
					sh.insertValue(newMasterId);
					sh.insertValue(RsvSrc.OccFlag.MF);
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					bulkUpdate(sh);
					vlidateLiveMaster1(accnts, newMasterId, hotelGroupId, hotelId);
				}
			}
			if(!ctList.isEmpty()){
				for(String accnts : ctList){
					vlidateLiveMaster1(accnts, masterId, hotelGroupId, hotelId);
				}
			}
		}
	}
	
	private void vlidateLiveMaster1(String allAccnts, Long masterId, Long hotelGroupId, Long hotelId){
		allAccnts += EntityConstant.COMMA;
		SQLHelper sh = new SQLHelper();
		sh.appendSql("	SELECT															");
		sh.appendSql("	GROUP_CONCAT(a.accnt) AS accnts,								");
		sh.appendSql("	FIND_IN_SET(a.masterId, GROUP_CONCAT(a.accnt)) AS hasLiveKey	");
		sh.appendSql("	FROM RsvSrc a													");
		sh.appendSql("	WHERE a.masterId = ?											");
		sh.appendSql("		AND a.hotelGroupId = ?										");
		sh.appendSql("		AND a.hotelId = ?											");
		sh.appendSql("	GROUP BY a.rsvOccId												");
		sh.insertValue(masterId);
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		List<Map> list = find(sh, Map.class);
		if(list != null && !list.isEmpty()){
			Long newMasterId = null;
			for(int i = 0; i < list.size(); i++){
				String accnts = (String) list.get(i).get("accnts");
				if(accnts != null && !accnts.isEmpty()){
					String[] array = accnts.split(EntityConstant.COMMA);
					for(int j = 0; j < array.length; j++){
						allAccnts = allAccnts.replace(array[j] + EntityConstant.COMMA, "");
					}
					newMasterId = Long.parseLong(array[0]);
					int keyI = (Integer)list.get(i).get("hasLiveKey");
					if(keyI > 0){
						newMasterId = Long.parseLong(array[--keyI]);
						continue;
					}
					sh.clear();
					sh.appendSql("	UPDATE MasterBase a 				");
					sh.appendSql("	SET a.masterId = ?					");
					sh.appendSql("	WHERE a.id IN (" + accnts + ")		");
					sh.insertValue(newMasterId);
					bulkUpdate(sh);
					sh.clear();
					sh.appendSql("	UPDATE RsvSrc a 					");
					sh.appendSql("	SET a.masterId = ?					");
					sh.appendSql("	WHERE a.occFlag = ?					");
					sh.appendSql("		AND a.accnt IN (" + accnts + ")	");
					sh.appendSql("		AND a.hotelGroupId = ?			");
					sh.appendSql("		AND a.hotelId = ?				");
					sh.insertValue(newMasterId);
					sh.insertValue(RsvSrc.OccFlag.MF);
					sh.insertValue(hotelGroupId);
					sh.insertValue(hotelId);
					bulkUpdate(sh);
				}
			}
			if(allAccnts.length() > 0){
				allAccnts = allAccnts.substring(0, allAccnts.length() - 1);
				if(isNotNull(allAccnts)){
					sh.clear();
					sh.appendSql("	UPDATE MasterBase a 				");
					sh.appendSql("	SET a.masterId = ?					");
					sh.appendSql("	WHERE a.id IN (" + allAccnts + ")	");
					sh.insertValue(newMasterId);
					bulkUpdate(sh);
				}
			}
		}
	}
	
	/**
	 * 根据宾客手机或证件号码后缀，查询登记单记录集合
	 * 注意：此方法暂使用与高晶钟 - 杭州悦因接口
	 * @param mobile			宾客手机号码或证件号码后缀
	 * @param hotelGroupId		集团id
	 * @param hotelId			酒店Id
	 * @return List<YYMasterGuestDto>
	 * @author Cairo
	 * @date 2015-05-13
	 */
	@Override
	public List<YYMasterGuestDto> findMasterInfoByMobileOrIdno(String mobile,Long hotelGroupId,Long hotelId){
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT a.id,b.name,a.rmtype as roomType,a.rmno AS roomno, ");
		sh.appendSql("     c.floor,c.building,b.mobile,a.sta ");
		sh.appendSql(" FROM master_base AS a ");
		sh.appendSql(" JOIN master_guest AS b ON a.id = b.id ");
		sh.appendSql("     AND b.hotel_group_id = ? AND b.hotel_id = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql(" LEFT JOIN room_no AS c ON a.rmno = c.code  ");
		sh.appendSql("     AND c.hotel_group_id = ? AND c.hotel_id = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql(" WHERE a.hotel_group_id = ? AND a.hotel_id = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql("     AND a.id <> a.rsv_id AND a.is_resrv = 'F' ");
		sh.appendSql("     AND a.rsv_class IN ('F','D') ");
		if(isNotNull(mobile)){
			if(mobile.length() > 6){
				sh.appendSql(" AND b.mobile = ? ");
				sh.insertValue(mobile);
			}else{
				sh.appendSql(" AND b.id_no like '%"+mobile+"' ");
			}
		}else{
			return null;
		}
		sh.appendSql(" ORDER BY a.rsv_class,a.arr ");
		sh.setFirstResult(0);
		sh.setMaxResults(10);
		return findByNativeSQL(sh, YYMasterGuestDto.class);
	}
	
	/**
	 * 根据给定条件，查询登记单简单信息集合
	 * 注意：此方法暂仅用于Caich前台接口
	 * @param masterId		登记单Id
	 * @param rmno			房号
	 * @param stas			状态
	 * @param filterIds		过滤主单Id
	 * @param hotelGroupId	集团Id
	 * @param hotelId		酒店Id
	 * @return List<MasterInterfaceSimpleDto>
	 * @author Cairo
	 * @date 2015-05-18
	 */
	@Override
	public List<MasterInterfaceSimpleDto> findMasterByRmno(Long masterId,String rmno,String stas,
			String filterIds,Long hotelGroupId,Long hotelId){
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT a.id,                   ");
		sh.appendSql("   a.master_id  AS masterId,    ");
		sh.appendSql("   a.rmno, a.arr, a.dep, a.sta, ");
		sh.appendSql("   a.grp_accnt  AS grpAccnt,    ");
		sh.appendSql("   b.name,b.birth,              ");
		sh.appendSql("   b.first_name AS firstName,   ");
		sh.appendSql("   b.last_name  AS lastName,    ");
		sh.appendSql("   b.name2, b.name3, b.sex,     ");
		sh.appendSql("   b.language, b.race, b.nation,");
		sh.appendSql("   b.country, b.state, b.vip,   ");
		sh.appendSql("   b.phone, b.mobile, b.email,  ");
		sh.appendSql("   b.id_code    AS idCode,      ");
		sh.appendSql("   b.id_no      AS idNo,        ");
		sh.appendSql("   b.visa_type  AS visaType,    ");
		sh.appendSql("   b.visa_no    AS visaNo,      ");
		sh.appendSql("   b.visa_begin AS visaBegin,   ");
		sh.appendSql("   b.visa_end   AS visaEnd,     ");
		sh.appendSql("   b.enter_port AS enterPort,   ");
		sh.appendSql("   b.enter_date AS enterEnd     ");
		sh.appendSql(" FROM master_base AS a,         ");
		sh.appendSql("   master_guest AS b            ");
		sh.appendSql(" WHERE a.id = b.id              ");
		sh.appendSql("     AND a.hotel_group_id = ?   ");
		sh.appendSql("     AND a.hotel_id = ?         ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		if(masterId != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(masterId);
		}else{
			sh.appendSql("     AND a.id <> a.rsv_id       ");
			sh.appendSql("     AND a.is_resrv = 'F'       ");
			sh.appendSql("     AND a.rsv_class IN('F','D')");
			if(isNotNull(rmno)){
				sh.appendSql(" AND a.rmno = ? ");
				sh.insertValue(rmno);
			}
			if(isNotNull(stas)){
				sh.appendOrSql(" OR a.sta = ? ",stas.split(","));	
			}
			if(isNotNull(filterIds)){
				String[] ids = filterIds.split(",");
				for(String id : ids){
					sh.appendSql(" AND a.id <> ? ");
					sh.insertValue(id);
				}
			}
		}
		sh.appendSql("     AND b.hotel_group_id = ?   ");
		sh.appendSql("     AND b.hotel_id = ?         ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		return findByNativeSQL(sh, MasterInterfaceSimpleDto.class);
	}
	
	/**
  	 * 根据给定参数，获取通用Crs订单同步集合
  	 * @param crsNoPrefix		中央预订号前缀
  	 * @param hotelGroupId		集团Id
  	 * @param hotelId			酒店Id
  	 * @return List<CrsResrvSync>
  	 * @author Cairo
  	 * @date 2015-05-12
  	 */
  	@Override
  	public List<CrsResrvSync> findCrsResrvSyncListByProc(String crsNoPrefix,
  			Long hotelGroupId,Long hotelId){
  		SQLHelper sh = new SQLHelper();
  		sh.appendSql(" CALL up_ihotel_pms_crs_resrv_sync(?,?,?) ");
  		sh.insertValue(hotelGroupId);
  		sh.insertValue(hotelId);
  		sh.insertValue(crsNoPrefix);
  		return findByNativeSQL(sh, CrsResrvSync.class);
  	}
	@Override
	public List<POSInterfaceFoDto> getPosFoDto(long hotelGroupId, long hotelId,String key, String rsvClass) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT t1.id accnt,t1.rmno rmno,t2.name name,t2.name2 name2,DATE_FORMAT(t1.arr,'%m/%d') AS arr,DATE_FORMAT(t1.dep,'%m/%d') AS dep,(t1.charge-t1.pay) as amount,t1.sta sta,t1.posting_flag as postingFlag FROM master_base t1,master_guest t2 WHERE t1.hotel_group_id=t2.hotel_group_id and t1.hotel_id=t2.hotel_id AND t1.id=t2.id and t1.hotel_group_id=? AND t1.hotel_id=? AND t1.sta IN ('I','R','S') AND t1.rsv_class IN "+rsvClass+" AND (t1.id='"+key+"' OR t1.rmno='"+key+"' OR t2.mobile LIKE '%"+key+"%' OR t2.name LIKE '%"+key+"%') ORDER BY t1.sta");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		return findByNativeSQL(sh, POSInterfaceFoDto.class);
	}
	
	/**
  	 * 根据给定条件，查询简单宾客信息
  	 * 注意：此方法适用与绿云标准PMS接口
  	 * @param subFilterSql	过滤sql
  	 * @param hotelGroupId	集团Id
  	 * @param hotelId		酒店Id
  	 * @return List<MasterGuestSimpleDto>
  	 * @author Cairo
  	 * @date 2015-04-20
  	 */
  	@Override
  	public List<MasterGuestSimpleDto> findMasterGuestSimpleList(String subFilterSql,Long hotelGroupId,Long hotelId){
  		SQLHelper sh = new SQLHelper();
  		sh.appendSql(" SELECT a.id AS accnt,b.name,b.sex ");
  		sh.appendSql(" FROM master_base AS a, ");
  		sh.appendSql("     master_guest AS b  ");
  		sh.appendSql(" WHERE a.hotel_group_id = ? ");
  		sh.appendSql("     AND a.hotel_id = ? ");
  		sh.insertValue(hotelGroupId);
  		sh.insertValue(hotelId);
  		sh.appendSql("     AND b.hotel_group_id = ? ");
  		sh.appendSql("     AND b.hotel_id = ? ");
  		sh.insertValue(hotelGroupId);
  		sh.insertValue(hotelId);
  		sh.appendSql("     AND a.id = b.id    ");
  		if(isNotNull(subFilterSql)){
  			sh.appendSql(subFilterSql);
  		}
  		return findByNativeSQL(sh, MasterGuestSimpleDto.class);
  	}
	@Override
	public <T> List<T> listMasterInHotel(Long hotelGroupId, Long hotelId,CRSQueryDto crsQueryDto, Class<T> clazz) {
		SQLHelper sh = new SQLHelper();
        sh.appendSql(" SELECT                               ");
        sh.appendSql("   a.hotel_group_id AS hotelGroupId,  ");
        sh.appendSql("   a.hotel_id       AS hotelId,       ");
        sh.appendSql("   h.descript       AS hotelDescript, ");
        sh.appendSql("   a.id,                              ");
        sh.appendSql("   a.rsv_id         AS rsvId,         ");
        sh.appendSql("   a.master_id      AS masterId,      ");
        sh.appendSql("   a.rsv_class      AS rsvClass,      ");
        sh.appendSql("   a.sta,                             ");
        sh.appendSql("   a.rsv_no         AS rsvNo,         ");
        sh.appendSql("   a.crs_no         AS crsNo,         ");
        sh.appendSql("   a.rmno,                            ");
        sh.appendSql("   IFNULL(e.flag,'') AS rmSta,        ");
        sh.appendSql("   b.name,                            ");
        sh.appendSql("   a.adult,                           ");
        sh.appendSql("   a.ratecode       AS rateCode,      ");
        sh.appendSql("   a.nego_rate      AS negoRate,      ");
        sh.appendSql("   a.real_rate      AS realRate,      ");
        sh.appendSql("   a.arr,                             ");
        sh.appendSql("   a.dep,                             ");
        sh.appendSql("   CONCAT(IFNULL(c.name,'-'),'/',IFNULL(cp1.name,'-'),'/',IFNULL(cp2.name,'-'),'/',IFNULL(cp3.name,'-')) AS grpName,");
        sh.appendSql("   a.member_no      AS cardNo,        ");
        sh.appendSql("   LEFT(a.remark,256) AS remark,      ");
        sh.appendSql("   a.charge,                          ");
        sh.appendSql("   a.pay,                             ");
        sh.appendSql("   a.credit,                          ");
        sh.appendSql("   IFNULL(s.id,0)   AS selfServiceId, ");
        sh.appendSql("   IFNULL(s.sta,'') AS selfServiceSta,");
        sh.appendSql("   IFNULL(s.has_invoice,'')   AS hasInvoice,");
        sh.appendSql("   IFNULL(s.invoice_title,'') AS invoiceTitle,");
        sh.appendSql("   IFNULL(s.remark,'') AS selfServiceRemark ");
        sh.appendSql(" FROM master_base AS a                ");
        sh.appendSql("   JOIN master_guest AS b             ");
        sh.appendSql("     ON a.id = b.id                   ");
        sh.appendSql("       AND b.hotel_group_id = ?       ");
        sh.appendSql("       AND b.hotel_id = ?             ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("   LEFT JOIN master_guest AS c        ");
        sh.appendSql("     ON a.grp_accnt = c.id            ");
        sh.appendSql("       AND c.hotel_group_id = ?       ");
        sh.appendSql("       AND c.hotel_id = ?             ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("   LEFT JOIN room_sta AS d            ");
        sh.appendSql("     ON a.rmno = d.rmno               ");
        sh.appendSql("       AND d.hotel_group_id = ?       ");
        sh.appendSql("       AND d.hotel_id = ?             ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("   LEFT JOIN code_base AS e           ");
        sh.appendSql("     ON e.hotel_group_id = ?          ");
        sh.appendSql("       AND e.hotel_id = ?             ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("       AND e.parent_code = 'room_sta_map'   ");
        sh.appendSql("       AND e.code = CONCAT(d.sta_occ,d.sta) ");
        sh.appendSql("   LEFT JOIN company_base AS cp1      ");
        sh.appendSql("     ON a.company_id = cp1.id         ");
        sh.appendSql("       AND cp1.hotel_group_id = ?     ");
        sh.insertValue(hotelGroupId);
        sh.appendSql("   LEFT JOIN company_base AS cp2      ");
        sh.appendSql("     ON a.agent_id = cp2.id           ");
        sh.appendSql("       AND cp2.hotel_group_id = ?     ");
        
        sh.insertValue(hotelGroupId);
        sh.appendSql("   LEFT JOIN company_base AS cp3      ");
        sh.appendSql("     ON a.source_id = cp3.id          ");
        sh.appendSql("       AND cp3.hotel_group_id = ?     ");
        sh.insertValue(hotelGroupId);
        sh.appendSql("   LEFT JOIN hotel AS h               ");
        sh.appendSql("     ON h.hotel_group_id = ?          ");
        sh.appendSql("       AND  h.id = ?                  ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("   LEFT JOIN self_service AS s        ");
        sh.appendSql("     ON s.hotel_group_id = ?          ");
        sh.appendSql("       AND s.hotel_id = ?             ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("       AND s.type = 'CHECK_OUT'       ");
        sh.appendSql("       AND s.master_id = a.id         ");
        sh.appendSql(" WHERE a.hotel_group_id = ?           ");
        sh.appendSql("     AND a.hotel_id = ?               ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        sh.appendSql("     AND a.id <> a.rsv_id             ");
        sh.appendSql("     AND a.is_resrv = 'F'             ");
        sh.appendSql("     AND a.rsv_class = 'F'            ");
        
        if(isNotNull(crsQueryDto.getSta())){
            sh.appendOrSql(" OR a.sta = ? ",crsQueryDto.getSta().split(","));
        }
        
        if(isNotNull(crsQueryDto.getInnerCardIds())){
            sh.appendOrSql(" OR a.inner_card_id = ? ",crsQueryDto.getInnerCardIds().split(","));
        }
        
        if(isNotNull(crsQueryDto.getCardNo())){
            sh.appendOrSql(" OR a.member_no = ? ", crsQueryDto.getCardNo().split(","));
        }
        
        if(isNotNull(crsQueryDto.getMobile())){
            sh.appendSql(" and b.mobile = ? ");
            sh.insertValue(crsQueryDto.getMobile());
        }
        return findByNativeSQL(sh, clazz);
	}
	
	@Override
	public List<MasterLinkDto> listMasterWithAllotment(Long hotelGroupId,
			Long hotelId, Long companyId) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT 								");
		sh.appendSql("	a.arrDate AS arr,					");
		sh.appendSql("	a.depDate AS dep,					");
		sh.appendSql("	a.rmtype AS rmType,					");
		sh.appendSql("	SUM(a.rmnum) AS rmNum				");
		sh.appendSql("	FROM RsvSrc a, MasterBase b			");
		sh.appendSql("		WHERE b.hotelGroupId = ?			");
		sh.insertValue(hotelGroupId);
		sh.appendSql("		AND b.hotelId = ?				");
		sh.insertValue(hotelId);
		sh.appendSql("		AND a.accnt = b.id				");
		sh.appendSql("	 AND a.hotelGroupId = ? 			");
		sh.insertValue(hotelGroupId);
		sh.appendSql("		AND a.hotelId = ?				");
		sh.insertValue(hotelId);
		sh.appendSql("		AND (b.sta = 'I' 				");
		sh.appendSql("		OR b.sta = 'R')					");
		sh.appendSql("		AND (b.companyId = ?			");
		sh.insertValue(companyId);
		sh.appendSql("		OR b.sourceId = ?				");
		sh.insertValue(companyId);
		sh.appendSql("		OR b.agentId = ?)				");
		sh.insertValue(companyId);
		sh.appendSql("	GROUP BY a.arrDate,a.depDate,a.rmtype		");
		sh.appendSql("	ORDER BY a.arrDate					");
		return find(sh, MasterLinkDto.class);
	}
	
    @Override
    public List<WebRmtypeAvailSync> listRoomAvail(Long hotelGroupId, Long hotelId, CRSQueryDto crsQueryDto) {
        
        com.greencloud.util.SQLHelper sh = new com.greencloud.util.SQLHelper();
        sh.appendSql("SELECT a.hotel_group_id hotelGroupId, ");
        sh.appendSql("       a.hotel_id hotelId, ");
        sh.appendSql("       b.code hotelGroupCode, ");
        sh.appendSql("       c.code hotelCode, ");
        sh.appendSql("       d.date occDate, ");
        sh.appendSql("       a.rmclass, ");
        sh.appendSql("       a.code rmtype, ");
        sh.appendSql("       a.quantity rmtypeNum, ");
        sh.appendSql("       a.over_quan limitNum, ");
        sh.appendSql("       0 oooNum, ");
        sh.appendSql("       0 osNum, ");
        sh.appendSql("       0 villaNum, ");
        sh.appendSql("       0 sureBookNum, ");
        sh.appendSql("       0 unsureBookNum, ");
        sh.appendSql("       0 haltNum ,");
        sh.appendSql("       0 limitNum ");
        sh.appendSql("FROM hotel_group b,hotel c,calendar d,room_type a ");
        sh.appendSql("WHERE a.hotel_group_id = b.id AND a.hotel_id = c.id ");
        sh.appendSql("AND a.hotel_group_id = ? AND a.hotel_id = ? ");
        sh.insertValue(crsQueryDto.getHotelGroupId());
        sh.insertValue(crsQueryDto.getHotelId());
        if(isNotNull(crsQueryDto.getRmtype())) {
            sh.appendOrSql("  OR a.code = ? ",crsQueryDto.getRmtype().split(CodeBaseConstant.MULTIPLE_SEPARATE));
        }
        
        Date dateBegin = null;
        Date dateEnd = null;
        
        try {
            dateBegin = DateUtil.parseDateNoTime(crsQueryDto.getArr(), DateUtil.webFormat);
        } catch (ParseException e1) {
            throw new BizException("开始日期格式不能解析,必须是["+DateUtil.webFormat+"]格式", BizExceptionConstant.INVALID_PARAM);
        }
        try {
            dateEnd = DateUtil.parseDateNoTime(crsQueryDto.getDep(), DateUtil.webFormat);
        } catch (ParseException e) {
            throw new BizException("结束日期格式不能解析,必须是["+DateUtil.webFormat+"]格式", BizExceptionConstant.INVALID_PARAM);
        }
        
        sh.appendSql(" and d.date >= ? and d.date <= ? ");
        sh.insertValue(dateBegin);
        sh.insertValue(dateEnd);
        
        List<WebRmtypeAvailSync> list1 = findByNativeSQL(sh, WebRmtypeAvailSync.class);
        
        
        sh = new com.greencloud.util.SQLHelper();
        sh.appendSql("SELECT c.code hotelGroupCode, ");
        sh.appendSql("       b.code hotelCode, ");
        sh.appendSql("       a.hotel_group_id hotelGroupId, ");
        sh.appendSql("       a.hotel_id hotelId, ");
        sh.appendSql("       a.occ_date occDate, ");
        sh.appendSql("       a.rmclass, ");
        sh.appendSql("       a.rmtype, ");
        sh.appendSql("       a.rmtype_num rmtypeNum, ");
        sh.appendSql("       a.limit_num limitNum, ");
        sh.appendSql("       a.ooo_num oooNum, ");
        sh.appendSql("       a.os_num osNum, ");
        sh.appendSql("       a.villa_num villaNum, ");
        sh.appendSql("       a.sure_book_num sureBookNum, ");
        sh.appendSql("       a.unsure_book_num unsureBookNum, ");
        sh.appendSql("       a.halt_num haltNum ");
        sh.appendSql("FROM rsv_rmtype_total a,hotel b,hotel_group c ");
        sh.appendSql("WHERE a.hotel_group_id = c.id AND a.hotel_id = b.id ");
        sh.appendSql("and a.hotel_group_id = ? and a.hotel_id = ? ");
        sh.insertValue(hotelGroupId);
        sh.insertValue(hotelId);
        
        try {
            dateBegin = DateUtil.parseDateNoTime(crsQueryDto.getArr(), DateUtil.webFormat);
        } catch (ParseException e1) {
            throw new BizException("开始日期格式不能解析,必须是["+DateUtil.webFormat+"]格式", BizExceptionConstant.INVALID_PARAM);
        }
        try {
            dateEnd = DateUtil.parseDateNoTime(crsQueryDto.getDep(), DateUtil.webFormat);
        } catch (ParseException e) {
            throw new BizException("结束日期格式不能解析,必须是["+DateUtil.webFormat+"]格式", BizExceptionConstant.INVALID_PARAM);
        }
        
        sh.appendSql(" and a.occ_date >= ? ");
        sh.insertValue(dateBegin);
    
        sh.appendSql(" and a.occ_date <= ? ");
        sh.insertValue(dateEnd);
        
        if(isNotNull(crsQueryDto.getRmtype())) {
            sh.appendOrSql("  OR a.rmtype = ? ",crsQueryDto.getRmtype().split(CodeBaseConstant.MULTIPLE_SEPARATE));
        }
        
        List<WebRmtypeAvailSync> list2 = findByNativeSQL(sh, WebRmtypeAvailSync.class);
        
        for(WebRmtypeAvailSync web1 : list1){
            for(WebRmtypeAvailSync web2 : list2){
                if(web1.getHotelGroupId().equals(web2.getHotelGroupId()) && web1.getHotelId().equals(web2.getHotelId()) && web1.getOccDate().equals(web2.getOccDate()) && web1.getRmtype().equals(web2.getRmtype())){
                    try {
                        BeanUtils.copyProperties(web1, web2);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        
        return list1;
        
    }
    
    /**
     * 根据给定条件，查询预订单集合
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		预订单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return List<CrsResrvDto>
     * @author Cairo
     * @date 2015-11-16
     */
    @Override
    public List<CrsResrvDto> findResrvByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId){
    	SQLHelper sh = new SQLHelper();
    	sh.appendSql(" SELECT a.hotel_group_id AS hotelGroupId, ");
    	sh.appendSql("   a.hotel_id       AS hotelId,  ");
    	sh.appendSql("   h.descript       AS hotelDescript, ");
    	sh.appendSql("   h.city_code      AS cityCode, ");
    	sh.appendSql("   h.city           AS cityDescript, ");
    	sh.appendSql("   a.id,                         ");
    	sh.appendSql("   a.crs_no         AS crsNo,    ");
    	sh.appendSql("   a.rsv_no         AS rsvNo,    ");
    	sh.appendSql("   cc.occ_flag      AS occFlag,  ");
    	sh.appendSql("   'C'              AS flag,     ");
    	sh.appendSql("   cc.real_rate     AS realRate, ");
    	sh.appendSql("   cc.rmtype        AS rmtype,   ");
    	sh.appendSql("   rr.descript      AS rmtypeDescript,");
    	sh.appendSql("   cc.rmno          AS rmNo,     ");
    	sh.appendSql("   SUBSTRING(a.extra_flag,27,1) AS paySta,");
    	sh.appendSql("   cc.rsv_arr_date  AS arr,      ");
    	sh.appendSql("   cc.rsv_dep_date  AS dep,      ");
    	sh.appendSql("   'R'              AS sta,      ");
    	sh.appendSql("   a.charge,                     ");
    	sh.appendSql("   a.pay,                        ");
    	sh.appendSql("   a.credit,                     ");
    	sh.appendSql("   cc.rmnum AS rmNum,a.member_no AS memberNo, ");
    	sh.appendSql("   cc.id AS rsvSrcId, ");
    	sh.appendSql("   SUM(IFNULL(rra.real_share_rate,cc.real_rate)) * cc.rmnum  AS rateSum, ");
    	sh.appendSql("   a.rsv_man AS rsvMan,a.mobile AS rsvMobile,b.name,b.mobile,b.sex ");
    	sh.appendSql("   FROM master_base AS a         ");
    	sh.appendSql("     JOIN master_guest AS b      ");
    	sh.appendSql("       ON b.hotel_group_id = ?   ");
    	sh.appendSql("       AND b.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND b.id = a.id           ");
    	sh.appendSql("     LEFT JOIN master_sub AS c   ");
    	sh.appendSql("       ON c.hotel_group_id = ?   ");
    	sh.appendSql("       AND c.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND c.id = a.id           ");
    	sh.appendSql("     JOIN rsv_src AS cc          ");
    	sh.appendSql("       ON cc.hotel_group_id = ?  ");
    	sh.appendSql("         AND cc.hotel_id = ?     ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("         AND cc.accnt = a.id     ");
    	sh.appendSql("         AND cc.occ_flag IN ('RF','RG')");
    	sh.appendSql("         AND cc.rmnum > 0        ");
    	sh.appendSql("         AND cc.block_mark = 'F' ");
    	sh.appendSql("     LEFT JOIN rsv_rate AS rra   ");
    	sh.appendSql("       ON rra.hotel_group_id = ? ");
    	sh.appendSql("         AND rra.hotel_id = ?    ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("         AND rra.master_id = a.id");
    	sh.appendSql("         AND rra.rsv_src_id = cc.id");
    	sh.appendSql("         AND rra.rsv_date >= cc.arr_date");
    	sh.appendSql("         AND rra.rsv_date < cc.dep_date");
    	sh.appendSql("     JOIN room_type AS rr        ");
    	sh.appendSql("       ON rr.hotel_group_id = ?  ");
    	sh.appendSql("         AND rr.hotel_id = ?     ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("         AND rr.code = cc.rmtype ");
    	sh.appendSql("     JOIN hotel AS h             ");
    	sh.appendSql("       ON h.hotel_group_id = ?   ");
    	sh.appendSql("       AND h.id = ?              ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("   WHERE a.hotel_group_id = ?    ");
    	sh.appendSql("   AND a.hotel_id = ?            ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	try {
			if (isNotNull(crsQueryDto.getArr())) {
				sh.appendSql(" AND DATE(cc.rsv_arr_date) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getArr().trim(), DateUtil.webFormat));
			}
			if (isNotNull(crsQueryDto.getDep())) {
				sh.appendSql(" AND DATE(cc.rsv_dep_date) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getDep().trim(), DateUtil.webFormat));
			}
		}catch (ParseException e) {
			e.printStackTrace();  
		}
		if(crsQueryDto.getMasterId() != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(crsQueryDto.getMasterId());
		}
    	if(isNotNull(crsQueryDto.getCardNo())){
    		sh.appendSql(" AND a.member_no = ? ");
    		sh.insertValue(crsQueryDto.getCardNo());
    	}
    	if(isNotNull(crsQueryDto.getCrsNo())){
    		sh.appendSql(" AND a.crs_no = ? ");
    		sh.insertValue(crsQueryDto.getCrsNo());
    	}
    	if(isNotNull(crsQueryDto.getRsvNo())){
    		sh.appendSql(" AND a.rsv_no = ? ");
    		sh.insertValue(crsQueryDto.getRsvNo());
    	}
    	if(isNotNull(crsQueryDto.getMobile())){
    		sh.appendSql(" AND (a.mobile = ? OR b.mobile = ? ) ");
    		sh.insertValue(crsQueryDto.getMobile());
    		sh.insertValue(crsQueryDto.getMobile());
    	}
    	if(crsQueryDto.getRsvManId() != null){
			sh.appendSql(" AND a.rsv_man_id = ? ");
			sh.insertValue(crsQueryDto.getRsvManId());
		}
    	if(isNotNull(crsQueryDto.getOtaChannel())){
            sh.appendSql(" AND c.ota_channel = ? ");
            sh.insertValue(crsQueryDto.getOtaChannel());
        }
        if(isNotNull(crsQueryDto.getOtaRsvNo())){
            sh.appendSql(" AND c.ota_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtaRsvNo());
        }
        if(isNotNull(crsQueryDto.getOtherRsvNo())){
            sh.appendSql(" AND c.other_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtherRsvNo());
        }
    	if(isNotNull(crsQueryDto.getAppid())){
    		sh.appendSql(" AND c.appid = ? ");
    		sh.insertValue(crsQueryDto.getAppid());
    	}
    	if(isNotNull(crsQueryDto.getOpenid())){
    		sh.appendSql(" AND c.openid = ? ");
    		sh.insertValue(crsQueryDto.getOpenid());
    	}
    	if(isNotNull(crsQueryDto.getUnionid())){
    		sh.appendSql(" AND c.unionid = ? ");
    		sh.insertValue(crsQueryDto.getUnionid());
    	}
    	sh.appendSql("   AND a.rsv_class IN ('F','G') ");
    	sh.appendSql("   AND a.is_resrv = 'T' ");
    	sh.appendSql("   AND a.id = a.rsv_id  ");
//    	if(isNotNull(crsQueryDto.getSta())){
//    		if(crsQueryDto.getSta().indexOf("I") == -1){
//    			crsQueryDto.setSta(crsQueryDto.getSta()+",I");
//    		}
//    		sh.appendOrSql(" OR a.sta = ? ",crsQueryDto.getSta().split(","));
//    	}
    	sh.appendSql(" GROUP BY cc.id ");
    	return findByNativeSQL(sh, CrsResrvDto.class);
    }
    
    /**
     * 根据给定条件，查询预订单集合记录总数
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		预订单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return Integer
     * @author Cairo
     * @date 2015-11-16
     */
    @Override
    public Integer countResrvSizeByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId){
    	SQLHelper sh = new SQLHelper();
    	sh.appendSql(" SELECT COUNT(1)                 ");
    	sh.appendSql("   FROM master_base AS a         ");
    	sh.appendSql("     JOIN master_guest AS b      ");
    	sh.appendSql("       ON b.hotel_group_id = ?   ");
    	sh.appendSql("       AND b.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND b.id = a.id           ");
    	sh.appendSql("     LEFT JOIN master_sub AS c   ");
    	sh.appendSql("       ON c.hotel_group_id = ?   ");
    	sh.appendSql("       AND c.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND c.id = a.id           ");
    	sh.appendSql("     JOIN rsv_src AS cc          ");
    	sh.appendSql("       ON cc.hotel_group_id = ?  ");
    	sh.appendSql("         AND cc.hotel_id = ?     ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("         AND cc.accnt = a.id     ");
    	sh.appendSql("         AND cc.occ_flag IN ('RF','RG')");
    	sh.appendSql("         AND cc.rmnum > 0        ");
    	sh.appendSql("         AND cc.block_mark = 'F' ");
    	sh.appendSql("   WHERE a.hotel_group_id = ?    ");
    	sh.appendSql("   AND a.hotel_id = ?            ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	try {
			if (isNotNull(crsQueryDto.getArr())) {
				sh.appendSql(" AND DATE(cc.rsv_arr_date) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getArr().trim(), DateUtil.webFormat));
			}
			if (isNotNull(crsQueryDto.getDep())) {
				sh.appendSql(" AND DATE(cc.rsv_dep_date) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getDep().trim(), DateUtil.webFormat));
			}
		}catch (ParseException e) {
			e.printStackTrace();  
		}
		if(crsQueryDto.getMasterId() != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(crsQueryDto.getMasterId());
		}
    	if(isNotNull(crsQueryDto.getCardNo())){
    		sh.appendSql(" AND a.member_no = ? ");
    		sh.insertValue(crsQueryDto.getCardNo());
    	}
    	if(isNotNull(crsQueryDto.getCrsNo())){
    		sh.appendSql(" AND a.crs_no = ? ");
    		sh.insertValue(crsQueryDto.getCrsNo());
    	}
    	if(isNotNull(crsQueryDto.getRsvNo())){
    		sh.appendSql(" AND a.rsv_no = ? ");
    		sh.insertValue(crsQueryDto.getRsvNo());
    	}
    	if(isNotNull(crsQueryDto.getMobile())){
    		sh.appendSql(" AND (a.mobile = ? OR b.mobile = ? ) ");
    		sh.insertValue(crsQueryDto.getMobile());
    		sh.insertValue(crsQueryDto.getMobile());
    	}
    	if(crsQueryDto.getRsvManId() != null){
			sh.appendSql(" AND a.rsv_man_id = ? ");
			sh.insertValue(crsQueryDto.getRsvManId());
		}
    	if(isNotNull(crsQueryDto.getOtaChannel())){
            sh.appendSql(" AND c.ota_channel = ? ");
            sh.insertValue(crsQueryDto.getOtaChannel());
        }
        if(isNotNull(crsQueryDto.getOtaRsvNo())){
            sh.appendSql(" AND c.ota_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtaRsvNo());
        }
        if(isNotNull(crsQueryDto.getOtherRsvNo())){
            sh.appendSql(" AND c.other_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtherRsvNo());
        }
    	if(isNotNull(crsQueryDto.getAppid())){
    		sh.appendSql(" AND c.appid = ? ");
    		sh.insertValue(crsQueryDto.getAppid());
    	}
    	if(isNotNull(crsQueryDto.getOpenid())){
    		sh.appendSql(" AND c.openid = ? ");
    		sh.insertValue(crsQueryDto.getOpenid());
    	}
    	if(isNotNull(crsQueryDto.getUnionid())){
    		sh.appendSql(" AND c.unionid = ? ");
    		sh.insertValue(crsQueryDto.getUnionid());
    	}
    	sh.appendSql("   AND a.rsv_class IN ('F','G') ");
    	sh.appendSql("   AND a.is_resrv = 'T' ");
    	sh.appendSql("   AND a.id = a.rsv_id  ");
//    	if(isNotNull(crsQueryDto.getSta())){
//    		sh.appendOrSql(" OR a.sta = ? ",crsQueryDto.getSta().split(","));
//    	}
    	return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
    }
    
    /**
     * 根据给定条件，查询登记单集合
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		登记单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return List<CrsResrvDto>
     * @author Cairo
     * @date 2015-11-16
     */
    @Override
    public List<CrsResrvDto> findMasterByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId){
    	SQLHelper sh = new SQLHelper();
    	sh.appendSql(" SELECT a.hotel_group_id AS hotelGroupId, ");
    	sh.appendSql("   a.hotel_id       AS hotelId,  ");
    	sh.appendSql("   h.descript       AS hotelDescript, ");
    	sh.appendSql("   h.city_code      AS cityCode, ");
    	sh.appendSql("   h.city           AS cityDescript, ");
    	sh.appendSql("   a.id,                         ");
    	sh.appendSql("   a.crs_no         AS crsNo,    ");
    	sh.appendSql("   a.rsv_no         AS rsvNo,    ");
    	sh.appendSql("   'MF'             AS occFlag,  ");
    	sh.appendSql("   'C'              AS flag,     ");
    	sh.appendSql("   a.real_rate      AS realRate, ");
    	sh.appendSql("   a.rmtype         AS rmtype,   ");
    	sh.appendSql("   rr.descript      AS rmtypeDescript,");
    	sh.appendSql("   a.rmno           AS rmNo,     ");
    	sh.appendSql("   SUBSTRING(a.extra_flag,27,1) AS paySta,");
    	sh.appendSql("   a.arr            AS arr,      ");
    	sh.appendSql("   a.dep            AS dep,      ");
    	sh.appendSql("   a.sta            AS sta,      ");
    	sh.appendSql("   a.charge,                     ");
    	sh.appendSql("   a.pay,                        ");
    	sh.appendSql("   a.credit,                     ");
    	sh.appendSql("   1 AS rmNum,a.member_no AS memberNo, ");
    	sh.appendSql("   IFNULL(cc.id,0) AS rsvSrcId, ");
    	sh.appendSql("   IFNULL(SUM(IFNULL(rra.real_share_rate,a.real_rate)),0)  AS rateSum, ");
    	sh.appendSql("   a.rsv_man AS rsvMan,a.mobile AS rsvMobile,b.name,b.mobile,b.sex, ");
    	sh.appendSql("   IFNULL(s.id,0)   AS selfServiceId, ");
		sh.appendSql("   IFNULL(s.sta,'') AS selfServiceSta,");
		sh.appendSql("   IFNULL(s.has_invoice,'')   AS hasInvoice,");
		sh.appendSql("   IFNULL(s.invoice_title,'') AS invoiceTitle,");
		sh.appendSql("   IFNULL(s.remark,'') AS selfServiceRemark ");
    	sh.appendSql("   FROM master_base AS a         ");
    	sh.appendSql("     JOIN master_guest AS b      ");
    	sh.appendSql("       ON b.hotel_group_id = ?   ");
    	sh.appendSql("       AND b.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND b.id = a.id           ");
    	sh.appendSql("     LEFT JOIN master_sub AS c   ");
    	sh.appendSql("       ON c.hotel_group_id = ?   ");
    	sh.appendSql("       AND c.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("       AND c.id = a.id           ");
    	sh.appendSql("     LEFT JOIN rsv_src AS cc     ");
    	sh.appendSql("       ON cc.hotel_group_id = ?  ");
    	sh.appendSql("         AND cc.hotel_id = ?     ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("         AND cc.accnt = a.id     ");
    	sh.appendSql("         AND cc.occ_flag = 'MF'  ");
    	sh.appendSql("     LEFT JOIN rsv_rate AS rra   ");
    	sh.appendSql("       ON rra.hotel_group_id = ? ");
    	sh.appendSql("         AND rra.hotel_id = ?    ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("         AND rra.master_id = a.id");
    	sh.appendSql("         AND rra.rsv_src_id = cc.id");
    	sh.appendSql("         AND rra.rsv_date >= cc.arr_date");
    	sh.appendSql("         AND rra.rsv_date < cc.dep_date");
    	sh.appendSql("     JOIN room_type AS rr        ");
    	sh.appendSql("       ON rr.hotel_group_id = ?  ");
    	sh.appendSql("         AND rr.hotel_id = ?     ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("         AND rr.code = a.rmtype  ");
    	sh.appendSql("     JOIN hotel AS h             ");
    	sh.appendSql("       ON h.hotel_group_id = ?   ");
    	sh.appendSql("       AND h.id = ?              ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	sh.appendSql("   LEFT JOIN self_service AS s        ");
		sh.appendSql("     ON s.hotel_group_id = ?          ");
		sh.appendSql("       AND s.hotel_id = ?             ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.appendSql("       AND s.type = 'CHECK_OUT'       ");
		sh.appendSql("       AND s.master_id = a.id         ");
    	sh.appendSql("   WHERE a.hotel_group_id = ?    ");
    	sh.appendSql("   AND a.hotel_id = ?            ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	try {
			if (isNotNull(crsQueryDto.getArr())) {
				sh.appendSql(" AND DATE(a.arr) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getArr().trim(), DateUtil.webFormat));
			}
			if (isNotNull(crsQueryDto.getDep())) {
				sh.appendSql(" AND DATE(a.dep) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getDep().trim(), DateUtil.webFormat));
			}
		}catch (ParseException e) {
			e.printStackTrace();  
		}
		if(crsQueryDto.getMasterId() != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(crsQueryDto.getMasterId());
		}
    	if(isNotNull(crsQueryDto.getCardNo())){
    		sh.appendSql(" AND a.member_no = ? ");
    		sh.insertValue(crsQueryDto.getCardNo());
    	}
    	if(isNotNull(crsQueryDto.getCrsNo())){
    		sh.appendSql(" AND a.crs_no = ? ");
    		sh.insertValue(crsQueryDto.getCrsNo());
    	}
    	if(isNotNull(crsQueryDto.getRsvNo())){
    		sh.appendSql(" AND a.rsv_no = ? ");
    		sh.insertValue(crsQueryDto.getRsvNo());
    	}
    	if(isNotNull(crsQueryDto.getMobile())){
    		sh.appendSql(" AND b.mobile = ? ");
    		sh.insertValue(crsQueryDto.getMobile());
    	}
    	if(crsQueryDto.getRsvManId() != null){
			sh.appendSql(" AND a.rsv_man_id = ? ");
			sh.insertValue(crsQueryDto.getRsvManId());
		}
    	if(isNotNull(crsQueryDto.getOtaChannel())){
            sh.appendSql(" AND c.ota_channel = ? ");
            sh.insertValue(crsQueryDto.getOtaChannel());
        }
        if(isNotNull(crsQueryDto.getOtaRsvNo())){
            sh.appendSql(" AND c.ota_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtaRsvNo());
        }
        if(isNotNull(crsQueryDto.getOtherRsvNo())){
            sh.appendSql(" AND c.other_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtherRsvNo());
        }
    	if(isNotNull(crsQueryDto.getAppid())){
    		sh.appendSql(" AND c.appid = ? ");
    		sh.insertValue(crsQueryDto.getAppid());
    	}
    	if(isNotNull(crsQueryDto.getOpenid())){
    		sh.appendSql(" AND c.openid = ? ");
    		sh.insertValue(crsQueryDto.getOpenid());
    	}
    	if(isNotNull(crsQueryDto.getUnionid())){
    		sh.appendSql(" AND c.unionid = ? ");
    		sh.insertValue(crsQueryDto.getUnionid());
    	}
    	sh.appendSql("   AND a.rsv_class IN ('F','D') ");
    	sh.appendSql("   AND a.is_resrv = 'F' ");
    	sh.appendSql("   AND a.id <> a.rsv_id  ");
    	if(isNotNull(crsQueryDto.getSta())){
    		sh.appendOrSql(" OR a.sta = ? ",crsQueryDto.getSta().split(","));
    	}
    	sh.appendSql(" GROUP BY a.id ");
    	return findByNativeSQL(sh, CrsResrvDto.class);
    }
    
    /**
     * 根据给定条件，查询登记单集合记录总数
     * 注意：此方法暂用于微信接口
     * @param crsQueryDto		预订单查询条件
     * @param hotelGroupId		集团Id
     * @param hotelId			酒店Id
     * @return Integer
     * @author Cairo
     * @date 2015-11-16
     */
    @Override
    public Integer countMasterSizeByCrsQueryDto(CRSQueryDto crsQueryDto,Long hotelGroupId,Long hotelId){
    	SQLHelper sh = new SQLHelper();
    	sh.appendSql(" SELECT COUNT(1)                 ");
    	sh.appendSql("   FROM master_base AS a         ");
    	sh.appendSql("     JOIN master_guest AS b      ");
    	sh.appendSql("       ON b.hotel_group_id = ?   ");
    	sh.appendSql("       AND b.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND b.id = a.id           ");
    	sh.appendSql("     LEFT JOIN master_sub AS c   ");
    	sh.appendSql("       ON c.hotel_group_id = ?   ");
    	sh.appendSql("       AND c.hotel_id = ?        ");
    	sh.insertValue(hotelGroupId);                  
    	sh.insertValue(hotelId);                       
    	sh.appendSql("       AND c.id = a.id           ");
    	sh.appendSql("   WHERE a.hotel_group_id = ?    ");
    	sh.appendSql("   AND a.hotel_id = ?            ");
    	sh.insertValue(hotelGroupId);
    	sh.insertValue(hotelId);
    	try {
			if (isNotNull(crsQueryDto.getArr())) {
				sh.appendSql(" AND DATE(a.arr) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getArr().trim(), DateUtil.webFormat));
			}
			if (isNotNull(crsQueryDto.getDep())) {
				sh.appendSql(" AND DATE(a.dep) = ? ");
				sh.insertValue(DateUtil.parseDateNoTime(crsQueryDto.getDep().trim(), DateUtil.webFormat));
			}
		}catch (ParseException e) {
			e.printStackTrace();  
		}
		if(crsQueryDto.getMasterId() != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(crsQueryDto.getMasterId());
		}
    	if(isNotNull(crsQueryDto.getCardNo())){
    		sh.appendSql(" AND a.member_no = ? ");
    		sh.insertValue(crsQueryDto.getCardNo());
    	}
    	if(isNotNull(crsQueryDto.getCrsNo())){
    		sh.appendSql(" AND a.crs_no = ? ");
    		sh.insertValue(crsQueryDto.getCrsNo());
    	}
    	if(isNotNull(crsQueryDto.getRsvNo())){
    		sh.appendSql(" AND a.rsv_no = ? ");
    		sh.insertValue(crsQueryDto.getRsvNo());
    	}
    	if(isNotNull(crsQueryDto.getMobile())){
    		sh.appendSql(" AND b.mobile = ? ");
    		sh.insertValue(crsQueryDto.getMobile());
    	}
    	if(crsQueryDto.getRsvManId() != null){
			sh.appendSql(" AND a.rsv_man_id = ? ");
			sh.insertValue(crsQueryDto.getRsvManId());
		}
    	if(isNotNull(crsQueryDto.getOtaChannel())){
            sh.appendSql(" AND c.ota_channel = ? ");
            sh.insertValue(crsQueryDto.getOtaChannel());
        }
        if(isNotNull(crsQueryDto.getOtaRsvNo())){
            sh.appendSql(" AND c.ota_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtaRsvNo());
        }
        if(isNotNull(crsQueryDto.getOtherRsvNo())){
            sh.appendSql(" AND c.other_rsv_no = ? ");
            sh.insertValue(crsQueryDto.getOtherRsvNo());
        }
    	if(isNotNull(crsQueryDto.getAppid())){
    		sh.appendSql(" AND c.appid = ? ");
    		sh.insertValue(crsQueryDto.getAppid());
    	}
    	if(isNotNull(crsQueryDto.getOpenid())){
    		sh.appendSql(" AND c.openid = ? ");
    		sh.insertValue(crsQueryDto.getOpenid());
    	}
    	if(isNotNull(crsQueryDto.getUnionid())){
    		sh.appendSql(" AND c.unionid = ? ");
    		sh.insertValue(crsQueryDto.getUnionid());
    	}
    	sh.appendSql("   AND a.rsv_class IN ('F','D') ");
    	sh.appendSql("   AND a.is_resrv = 'F' ");
    	sh.appendSql("   AND a.id <> a.rsv_id  ");
    	if(isNotNull(crsQueryDto.getSta())){
    		sh.appendOrSql(" OR a.sta = ? ",crsQueryDto.getSta().split(","));
    	}
    	return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
    }
    
    /**
	 * 根据给定条件，查询预订单及其成员登记单记录集合
	 * 用于Block Pick模块
	 * @param masterBaseId			预订主单ID
	 * @param hotelGroupId			集团ID
	 * @param hotelId				酒店ID
	 * @return List<MasterLinkDto>
	 * @author Cairo
	 * @date 2013-10-22
	 */
	@Override
	public List<MasterLinkDto> findResrvLinkListByMasterBaseId(MasterBase masterBase){
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT                              ");
		sh.appendSql("	a.id              id,            ");
		sh.appendSql("    a.rsv_id          AS resrvId,    ");
		sh.appendSql("	'C'               type,          ");
		sh.appendSql("	a.rsv_class       rsvClass,      ");
		sh.appendSql("	'RB'          flag,              ");
		sh.appendSql("	b.name            `name`,        ");
		sh.appendSql("	b.name2    nameCombine,   ");
		sh.appendSql("	b.sex				sex,		 ");
		sh.appendSql("	a.sta             sta,           ");
		sh.appendSql("	a.ratecode		rateCode,	     ");
		sh.appendSql("	a.rmtype          rmType,        ");
		sh.appendSql("	a.rmnum           rmNum,         ");
		sh.appendSql("	IF(a.id = a.rsv_id,a.rmno,'预订') AS rmNo,");
		sh.appendSql("    a.rmno_son        rmnoSon, ");
		sh.appendSql("	(a.adult+a.children)    adultNum,");
		sh.appendSql("	a.adult           adult,  	     ");
		sh.appendSql("	a.children		children,  	     ");
		sh.appendSql("	a.arr             arr,           ");
		sh.appendSql("	a.dep             dep,           ");
		sh.appendSql("	DATEDIFF(a.dep,a.arr)    dayNum, ");
		sh.appendSql("	a.real_rate       realRate,      ");
		sh.appendSql("	a.packages        packages,      ");
		sh.appendSql("    a.charge          charge,        ");
		sh.appendSql("    a.pay             pay,           ");
		sh.appendSql("	(a.charge - a.pay)    balance,   ");
		sh.appendSql("	a.credit          credit,        ");
		sh.appendSql("	a.market          market,        ");
		sh.appendSql("	a.rsv_no          rsvNo,         ");
		sh.appendSql("	a.master_id       masterId,      ");
		sh.appendSql("    a.amenities		amenities,       ");
		sh.appendSql("    a.remark		    remark,      ");
		sh.appendSql("	a.link_id         linkId,        ");
		sh.appendSql("	a.pkg_link_id     pkgLinkId,     ");
		sh.appendSql("	0            	    rsvId,       ");
		sh.appendSql("    b.vip				vip,		 ");
		sh.appendSql("	b.profile_id		profileId,	 ");
		sh.appendSql("	b.profile_type	profileType	     ");
		sh.appendSql(" FROM master_base a,                 ");
		sh.appendSql("    master_guest b              	 ");
		sh.appendSql(" WHERE b.id = a.id AND a.rsv_class <> 'D' AND a.rsv_class <> 'H' ");
		sh.appendSql("    AND a.hotel_group_id = ?         ");
		sh.appendSql("    AND a.hotel_id = ?               ");
		sh.insertValue(masterBase.getHotelGroupId());
		sh.insertValue(masterBase.getHotelId());
		sh.appendSql(" AND a.id = ? ");
		sh.insertValue(masterBase.getId());
		sh.appendSql(" AND a.owner_id = ? ");
		sh.insertValue(masterBase.getOwnerId());
		sh.appendSql("     AND b.hotel_group_id = ? 	 	 ");
		sh.appendSql("     AND b.hotel_id = ?           	 ");
		sh.insertValue(masterBase.getHotelGroupId());
		sh.insertValue(masterBase.getHotelId());
		sh.appendSql(" ORDER BY a.id ");
		return findByNativeSQL(sh, MasterLinkDto.class);
	}
	
	
	/**
     * 给定条件，分页查询
     * 暂时用于业主网站接口
     * @param masterBase
     * @param firstResult
     * @param maxResults
     * @return
     * @throws DataAccessException
     * @author lsl
     * @date 2015-12-16
     */
	@Override
	public List<MasterLinkOwnerSiteDot> findMasterLinkOwnerSiteDot(MasterLinkDto masterBase, int firstResult, int maxResults) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT                                 ");
		sh.appendSql("	a.id              id,                 ");
		sh.appendSql("    a.rsv_id          AS resrvId,       ");
		sh.appendSql("	'C'               type,               ");
		sh.appendSql("	a.rsv_class       rsvClass,           ");
		sh.appendSql("	'RB'          flag,                   ");
		sh.appendSql("	b.name            `name`,             ");
		sh.appendSql("	b.name2    nameCombine,               ");
		sh.appendSql("	b.sex				sex,		      ");
		sh.appendSql("	a.sta             sta,                ");
		sh.appendSql("	a.ratecode		rateCode,	          ");
		sh.appendSql("	a.rmtype          rmType,             ");
		sh.appendSql("	a.rmnum           rmNum,              ");
		sh.appendSql("	IF(a.id = a.rsv_id,a.rmno,'预订') AS rmNo,");
		sh.appendSql("    a.rmno_son        rmnoSon,          ");
		sh.appendSql("	(a.adult+a.children)    adultNum,     ");
		sh.appendSql("	a.adult           adult,  	          ");
		sh.appendSql("	a.children		children,  	          ");
		sh.appendSql("	a.arr             arr,                ");
		sh.appendSql("	a.dep             dep,                ");
		sh.appendSql("	DATEDIFF(a.dep,a.arr)    dayNum,      ");
		sh.appendSql("	a.real_rate       realRate,           ");
		sh.appendSql("	a.packages        packages,           ");
		sh.appendSql("    a.charge          charge,           ");
		sh.appendSql("    a.pay             pay,              ");
		sh.appendSql("	(a.charge - a.pay)    balance,        ");
		sh.appendSql("	a.credit          credit,             ");
		sh.appendSql("	a.market          market,             ");
		sh.appendSql("	a.rsv_no          rsvNo,              ");
		sh.appendSql("	a.master_id       masterId,           ");
		sh.appendSql("    a.amenities		amenities,        ");
		sh.appendSql("    a.remark		    remark,           ");
		sh.appendSql("	a.link_id         linkId,             ");
		sh.appendSql("	a.pkg_link_id     pkgLinkId,          ");
		sh.appendSql("	0            	    rsvId,            ");
		sh.appendSql("    b.vip				vip,	      	 ");
		sh.appendSql("	b.profile_id		profileId,	      ");
		sh.appendSql("	b.profile_type	profileType	,         ");
		sh.appendSql("	r.descript       rmtypeDescript,      ");
		sh.appendSql("	h.descript	   hotelDescript	     ");
		sh.appendSql(" FROM master_base a                    ");
		sh.appendSql(" left join master_guest b on a.id = b.id ");
		sh.appendSql(" left join room_type r on a.rmtype = r.code  ");
		sh.appendSql(" AND a.hotel_group_id = r.hotel_group_id ");
		sh.appendSql(" AND a.hotel_id=r.hotel_id           ");
		sh.appendSql(" left join hotel h on a.hotel_id=h.id ");
		sh.appendSql(" AND a.hotel_group_id = h.hotel_group_id ");
		sh.appendSql(" where 1=1                              ");
		sh.appendSql(" AND a.rsv_class <> 'D' AND a.rsv_class <> 'H' ");
		if(masterBase.getHotelGroupId() != null){
			sh.appendSql("    AND a.hotel_group_id = ?          ");
			sh.insertValue(masterBase.getHotelGroupId());
		}
		if(masterBase.getHotelId() != null){
			sh.appendSql("    AND a.hotel_id = ?                ");
			sh.insertValue(masterBase.getHotelId());
		}
		sh.appendSql(" AND a.owner_id = ? ");
		sh.insertValue(masterBase.getOwnerId());
		if(masterBase.getId() != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(masterBase.getId());
		}
		if (masterBase.getArr() !=null) {
			sh.appendSql(" AND DATE(a.arr) >= ? ");
			sh.insertValue(masterBase.getArr());
		}
		if (masterBase.getDep()!=null) {
			sh.appendSql(" AND DATE(a.dep) <= ? ");
			sh.insertValue(masterBase.getDep());
		}
		if(isNotNull(masterBase.getSta())){
			sh.appendSql(" AND a.sta = ? ");
			sh.insertValue(masterBase.getSta());
		}
		if(isNotNull(masterBase.getName())){
			sh.appendSql(" and b.name like '%"+masterBase.getName()+"%'");
		}
		
		sh.appendSql(" ORDER BY a.id desc ");
		sh.setFirstResult(firstResult);
		sh.setMaxResults(maxResults);
		return findByNativeSQL(sh, MasterLinkOwnerSiteDot.class);
	}
	/**
     * 给定条件，分页查询
     * 暂时用于业主网站接口
     * @param masterBase
     * @param firstResult
     * @param maxResults
     * @return
     * @throws DataAccessException
     * @author lsl
     * @date 2015-12-16
     */
	@Override
	public Integer countMasterLinkOwnerSiteDot(MasterLinkDto masterBase) {
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" SELECT     count(1)                           ");
		sh.appendSql(" FROM master_base a                            ");
		sh.appendSql(" left join master_guest b on a.id = b.id       ");
		sh.appendSql(" left join room_type r on a.rmtype = r.code    ");
		sh.appendSql(" AND a.hotel_group_id = r.hotel_group_id       ");
		sh.appendSql(" AND a.hotel_id=r.hotel_id                     ");
		sh.appendSql(" left join hotel h on a.hotel_id=h.id          ");
		sh.appendSql(" AND a.hotel_group_id = h.hotel_group_id       ");
		sh.appendSql(" where 1=1                                     ");
		sh.appendSql(" AND a.rsv_class <> 'D' AND a.rsv_class <> 'H' ");
		if(masterBase.getHotelGroupId() != null){
			sh.appendSql("    AND a.hotel_group_id = ?          ");
			sh.insertValue(masterBase.getHotelGroupId());
		}
		if(masterBase.getHotelId() != null){
			sh.appendSql("    AND a.hotel_id = ?                ");
			sh.insertValue(masterBase.getHotelId());
		}
		sh.appendSql(" AND a.owner_id = ? ");
		sh.insertValue(masterBase.getOwnerId());
		if(masterBase.getId() != null){
			sh.appendSql(" AND a.id = ? ");
			sh.insertValue(masterBase.getId());
		}
		if (masterBase.getArr() !=null) {
			sh.appendSql(" AND DATE(a.arr) >= ? ");
			sh.insertValue(masterBase.getArr());
		}
		if (masterBase.getDep()!=null) {
			sh.appendSql(" AND DATE(a.dep) <= ? ");
			sh.insertValue(masterBase.getDep());
		}
		if(isNotNull(masterBase.getSta())){
			sh.appendSql(" AND a.sta = ? ");
			sh.insertValue(masterBase.getSta());
		}
		if(isNotNull(masterBase.getName())){
			sh.appendSql(" and b.name like '%"+masterBase.getName()+"%'");
		}
		sh.appendSql(" ORDER BY a.id desc ");
		return Integer.parseInt(this.findByNativeSQL(sh).get(0)+"");
	}
}