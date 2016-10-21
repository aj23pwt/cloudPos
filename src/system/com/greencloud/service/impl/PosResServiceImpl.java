package com.greencloud.service.impl;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.dao.DataAccessException;

import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import com.aua.util.Container;
import com.aua.util.SQLHelper;
import com.aua.util.StringHelper;
import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.dao.IPosAccntSyncDao;
import com.greencloud.dao.IPosIpDao;
import com.greencloud.dao.IPosMasterDao;
import com.greencloud.dao.IPosPccodeDao;
import com.greencloud.dao.IPosPluAllDao;
import com.greencloud.dao.IPosPluStdDao;
import com.greencloud.dao.IPosResDao;
import com.greencloud.dao.IPosResOrderDao;
import com.greencloud.dao.IPosStationDao;
import com.greencloud.dto.EdmSendDto;
import com.greencloud.dto.PosResDto;
import com.greencloud.dto.PosResOrderDto;
import com.greencloud.dto.PosTableMapDto;
import com.greencloud.entity.MasterBase;
import com.greencloud.entity.PosAccntSync;
import com.greencloud.entity.PosIp;
import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosPccode;
import com.greencloud.entity.PosPluAll;
import com.greencloud.entity.PosPluStd;
import com.greencloud.entity.PosRes;
import com.greencloud.entity.PosResOrder;
import com.greencloud.entity.PosStation;
import com.greencloud.entity.SysOption;
import com.greencloud.exception.BizException;
import com.greencloud.facade.IEdmFacadeService;
import com.greencloud.hessian.HessianProxyFactory;
import com.greencloud.hessian.HessianProxyFactoryBean;
import com.greencloud.service.IHotelService;
import com.greencloud.service.IPosResService;
import com.greencloud.service.IPosSubService;
import com.greencloud.service.ISysOptionService;
import com.greencloud.util.DateUtil;
import com.greencloud.util.StringUtil;
import com.greencloud.util.UserManager;
/**
 * @author gc-pwt
 *
 */
public class PosResServiceImpl extends BaseServiceImpl implements IPosResService
{
   //dao 
   private IPosResDao posResDao;
   private IPosStationDao posStationDao;
   private IPosSubService posSubService;
   private IPosResOrderDao posResOrderDao;
   private IPosPluStdDao posPluStdDao;
   private IPosPluAllDao  posPluAllDao;
   private ISysOptionService sysOptionService;
   private IPosMasterDao posMasterDao;
   private IPosAccntSyncDao posAccntSyncDao;
   private IPosIpDao posIpDao;
   private IHotelService hotelService;
   private IPosPccodeDao posPccodeDao;
   
   
public void setPosPccodeDao(IPosPccodeDao posPccodeDao) {
	this.posPccodeDao = posPccodeDao;
}
public void setHotelService(IHotelService hotelService) {
	this.hotelService = hotelService;
}
public void setPosIpDao(IPosIpDao posIpDao) {
	this.posIpDao = posIpDao;
}
public void setPosAccntSyncDao(IPosAccntSyncDao posAccntSyncDao) {
	this.posAccntSyncDao = posAccntSyncDao;
}
public void setPosMasterDao(IPosMasterDao posMasterDao) {
	this.posMasterDao = posMasterDao;
}
public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
		}
public void setPosResOrderDao(IPosResOrderDao posResOrderDao)
{
	this.posResOrderDao = posResOrderDao;
}
public void setPosPluStdDao(IPosPluStdDao posPluStdDao)
{
	this.posPluStdDao = posPluStdDao;
}
public void setPosPluAllDao(IPosPluAllDao posPluAllDao)
{
	this.posPluAllDao = posPluAllDao;
}
public void setPosSubService(IPosSubService posSubService) {
		this.posSubService = posSubService;
	}
   public void setPosStationDao(IPosStationDao posStationDao) {
	this.posStationDao = posStationDao;
}

/**
   *save posRes object  method
   *@param posRes PosRes 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public void savePosRes(PosRes posRes) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosRes method");
		}
         posResDao.save(posRes);
     	if(log.isDebugEnabled()){
			log.debug("end savePosRes method");
		}
  }//end save method
  
   /**
   *update posRes method
   *@param posRes PosRes
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public void updatePosRes(PosRes posRes) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosRes method");
		}
        posResDao.update(posRes);
        if(log.isDebugEnabled()){
			log.debug("end updatePosRes method");
		}
  }//end update method
  
   /**
   *save or update posRes object method
   *@param posRes PosRes
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public void saveOrUpdatePosRes(PosRes posRes) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosRes method");
		}
		
        posResDao.saveOrUpdate(posRes);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosRes method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posRes PosRes query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-30 17:30
   */
  public Container<PosRes> findPosRes(PosRes posRes,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosRes method");
		}
        Container<PosRes> container = new Container<PosRes>();
        List<PosRes> list = posResDao.list(posRes, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posResDao.count(posRes));
        if(log.isDebugEnabled()){
			log.debug("end findPosRes method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posRes PosRes query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-30 17:30
   */
  public int countPosRes(PosRes posRes)throws DataAccessException{
    return posResDao.count(posRes);
  }//end count method
  
   /**
   *query a posRes by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-30 17:30
   */
  public PosRes findPosResById(Long id)throws DataAccessException{
    PosRes  posRes = posResDao.load(id);
    return posRes;
  }//end findPosResById method
  
    /**
   *query posRes collection method
   *@param posRes PosRes send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-30  17:30
   */
  public List<PosRes> listPosRes(PosRes  posRes)
		throws DataAccessException {
	  List<PosRes> list = posResDao.list(posRes);
      return list;
  }//end list method
  
   /**
   *query posRes collection method
   *@param posRes PosRes send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-30  17:30
   */
  public List<PosRes> listPosRes(PosRes posRes,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosRes> list = posResDao.list(posRes, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posResDao 
   * @author weihuawon
   * @date 2015年M3月d30�?17:30
   */
  public void setPosResDao(IPosResDao posResDao){ 
     this.posResDao = posResDao;
  }//end setPosResDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posResDao;
  }//end getDao method

@Override
public List<PosRes> getResList(String sql) throws DataAccessException {
	// TODO Auto-generated method stub
	return posResDao.getResList(sql);
}

/**
 * * 获取新的预订号
	 * @param code 			业务指针类型(RSVNO:酒店预定号；CRSNO:中央预订号)
	 * @param type			预订类型前缀（可选参数，传入空串或null将获取酒店预订号）
	 * @param bizDate		营业日期
	 * @param hotelGroupId	集团ID
	 * @param hotelId		酒店ID
	 * @return String
 */
@Override
public String updateNewPosRsvNo(String code,String type,Date bizDate,Long hotelGroupId,Long hotelId){
	
	    // 默认模式 yyMMdd+XXXX
		// 计算预订号
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String timestamp = sdf.format(bizDate);
		String posCur = posResDao.findSysExtraIdByProc(code, hotelGroupId, hotelId);
		if(posCur.length() > 16){
			throw new BizException("sysExtraId数据配置错误,code=["+code+"]hotelGroupId=["+hotelGroupId+"]hotelId=["+hotelId+"]\n"+posCur,
					BizExceptionConstant.INVALID_PARAM,BizException.BIZ_TYPE.TYPE_1);
		}
		int tempInt = 4 - posCur.length();
		// 前补位
		for (int i = 0; i < tempInt; i++) {
			posCur = "0" + posCur;
		}
		if(StringHelper.isNotNull(type)){
			return type + timestamp + posCur;
		}
		return timestamp + posCur;
}
private Boolean saveResCheckresource(PosRes posres){
	Boolean flag = true ;
	if(StringUtil.isNotEmpty(posres.getTableno()) || StringUtil.isNotEmpty(posres.getExttableno())){
//		PosRes checkRes= new PosRes();
//		checkRes.setHotelGroupId(posres.getHotelGroupId());
//		checkRes.setHotelId(posres.getHotelId());
//		checkRes.setBizDate(DateUtil.parseDateNewFormat(DateUtil.format(posres.getBizDate(), DateUtil.newFormatShort)));
//		//checkRes.setBizDate(posres.getBizDate());
//		checkRes.setShift(posres.getShift());
//		checkRes.setPccode(posres.getPccode());
		
		String sql = " select sta,tableno,exttableno  from pos_res where 1=1 and hotel_group_id= "+posres.getHotelGroupId()+" and hotel_id = " +posres.getHotelId() + 
				     " and biz_date = '"+DateUtil.format(posres.getBizDate(), DateUtil.newFormatShort)+"' and pccode = '"+posres.getPccode()+"' and shift = '"+ posres.getShift()+"' and (sta= 'R' or sta = 'G') " ;
//		checkRes.setSta("R");
//		List<PosRes> list1 = posResDao.list(checkRes);
//		checkRes.setSta("G");
//		List<PosRes> list2 = posResDao.list(checkRes);
		List<PosRes> checkResList = new ArrayList<PosRes>();
//		if(list1!=null && list1.size()>0){
//			checkResList.addAll(list1);
//		}
//		if(list2!=null && list2.size()>0){
//			checkResList.addAll(list2);
//		} 
		checkResList = getResList(sql) ;
		if(checkResList!=null && checkResList.size()>0){
			//
			StringBuilder sbBuilder = new StringBuilder();
			for(int i=0;i<checkResList.size();i++){
				PosRes newRes = checkResList.get(i) ;
				if(newRes.getSta().equalsIgnoreCase("R") || newRes.getSta().equalsIgnoreCase("G")){
					if(StringUtil.isNotEmpty(newRes.getTableno())){
						sbBuilder.append(","+newRes.getTableno()+",");
					}
					if(StringUtil.isNotEmpty(newRes.getExttableno())){
						sbBuilder.append(","+newRes.getExttableno()+",");
					}
				}
			}
			if(StringUtil.isNotEmpty(sbBuilder.toString())){
				//主桌
				if(sbBuilder.toString().indexOf(","+posres.getTableno()+",")>=0){
					flag = false ;
					throw new BizException("存在重复的预订资源,保存未成功,请修改！",BizExceptionConstant.INVALID_PARAM);
				}
				//辅桌
				if(StringUtil.isNotEmpty(posres.getExttableno())){
					String[] extTablenos = posres.getExttableno().split(",");
					for(int j=0;j<extTablenos.length;j++){
						if(StringUtil.isNotEmpty(extTablenos[j]) && sbBuilder.toString().indexOf(","+extTablenos[j]+",")>=0){
							flag = false ;
							throw new BizException("存在重复的预订资源,保存未成功,请修改！",BizExceptionConstant.INVALID_PARAM);
						}
					}
				}
			}
		}
	}
	
	return flag;
	
}
@Override
public String saveRes(PosRes posres) {
	// TODO Auto-generated method stub
	if(saveResCheckresource(posres)){
		 SysOption sysOption =  sysOptionService.findSysOptionByCatalogItem("system", "pos_biz_date", posres.getHotelGroupId(), posres.getHotelId());
		   String accnt = "R"+this.updateNewPosRsvNo("POSRSV", "", DateUtil.parseDateWevFormat(sysOption.getSetValue()), posres.getHotelGroupId(), posres.getHotelId());
			posres.setAccnt(accnt);
			posres.setResDate(DateUtil.parseDateWevFormat(sysOption.getSetValue()));
			posResDao.save(posres);
		return accnt+"#"+posres.getId();
	}else{
		throw new BizException("存在重复的预订资源,保存未成功,请修改！",BizExceptionConstant.INVALID_PARAM);
	}	  
}

@Override
public <T> List<T> getTableMap( String hotelGroupId, String hotelId,String date,String shift,String pccode,String status,String type,String flag){
	// TODO Auto-generated method stub
	if(pccode != null && pccode.equals("all")){
		PosStation posStation = new PosStation();
		posStation.setHotelGroupId(Long.parseLong(hotelGroupId));
		posStation.setHotelId(Long.parseLong(hotelId));
		posStation.setCode(UserManager.getWorkStationCode());
		List<PosStation> list = posStationDao.list(posStation);
		if(list!=null && list.size()>0){
			PosStation posStationGet =  list.get(0);
			if(posStationGet.getPccodes() != null && !posStationGet.getPccodes().equals("")){
				pccode=posStationGet.getPccodes();
			}else{
				pccode="";
			}
		}else{
			pccode="";
		}
	}
	return posResDao.getTableMap(hotelGroupId, hotelId, date, shift, pccode, status, type,flag);
}

@Override
public <T> List<T> getPosVipQuery(Long hotelGroupId, Long hotelId,  String searchText) {
	// TODO Auto-generated method stub
	return posResDao.getPosVipQuery(hotelGroupId,hotelId,searchText);
}

@Override
public PosRes getPosRes(PosRes posRes) throws DataAccessException {
	// TODO Auto-generated method stub
	List<PosRes> list = posResDao.list(posRes);
	PosRes newPosRes = posRes ;
	if(list!=null && list.size()>0){
		 newPosRes =  list.get(0);
	}
	return newPosRes;
}

@Override
public List<PosTableMapDto> getTableMapDto(String hotelGroupId, String hotelId,
		String date, String shift, String pccode, String status, String type,
		String flag) {
	// TODO Auto-generated method stub
	return posResDao.getTableMapDto(hotelGroupId, hotelId, date, shift, pccode, status, type, flag);
}

@Override
public String saveWxRes(PosResDto posResDto) {
	// TODO Auto-generated method stub
	//取得accnt
	String accnt = "error" ;
	  try {
	    SysOption sysOption =  sysOptionService.findSysOptionByCatalogItem("system", "pos_biz_date", java.lang.Long.parseLong(posResDto.getHotelGroupId()), java.lang.Long.parseLong(posResDto.getHotelId())); 
	    accnt = "R"+this.updateNewPosRsvNo("POSRSV", "", DateUtil.parseDateWevFormat(sysOption.getSetValue()), java.lang.Long.parseLong(posResDto.getHotelGroupId()), java.lang.Long.parseLong(posResDto.getHotelId()));
	    PosRes posRes = new PosRes();
	    posRes.setAccnt(accnt);
	    posRes.setHotelGroupId(java.lang.Long.parseLong(posResDto.getHotelGroupId()));
	    posRes.setHotelId(java.lang.Long.parseLong(posResDto.getHotelId()));
	    posRes.setResName(posResDto.getResName());
	    posRes.setResDate(DateUtil.parseDateNoTime(posResDto.getResDate(),DateUtil.newFormatShort));
	    posRes.setPccode(posResDto.getPccode());
	    posRes.setMode("");
	    posRes.setShift(posResDto.getShift());
	    posRes.setSta("R");
	    posRes.setBizDate(DateUtil.parseDateNoTime(posResDto.getBizDate(),DateUtil.newFormatShort));
	    posRes.setTableType(posResDto.getTableType());
	    posRes.setTableno(posResDto.getTableno());
	    posRes.setGsts(Integer.parseInt(posResDto.getGsts()));
	    posRes.setPhone(posResDto.getPhone());
	    posRes.setArrtime(posResDto.getArrtime());
	    posRes.setCardno(posResDto.getCardno());
	    posRes.setCardinfo(posResDto.getCardinfo());
	    posRes.setSource(posResDto.getSource());
	    if(posResDto.getAppid()!=null && !posResDto.getAppid().equals("")){
	    	posRes.setType4(posResDto.getAppid());
	    }
	    if(posResDto.getOpenid()!=null && !posResDto.getOpenid().equals("")){
	    	posRes.setType5(posResDto.getOpenid());
	    }
	    if(posResDto.getInfo()!=null && !posResDto.getInfo().equals("")){
	        posRes.setInfo("微信预订:"+posResDto.getInfo());
	    }
	    posResDao.save(posRes);
	    //预订菜式
	    if(posResDto.getPosResOrderDto()!= null &&  posResDto.getPosResOrderDto().size()>0){
	    	this.saveWxResOrder(accnt, posResDto,"add");
	    }
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return accnt;
}

@Override
public void saveWxResOrder(String accnt, PosResDto posResDto,String type) {
	 if("update".equalsIgnoreCase(type)){
		 StringBuilder sql = new StringBuilder();
		 sql.append(" UPDATE  pos_res_order SET sta = 'X',modify_datetime=NOW() WHERE hotel_group_id =  " );
		 sql.append(posResDto.getHotelGroupId());
		 sql.append("  AND hotel_id = ");
		 sql.append(posResDto.getHotelId());
		 sql.append("  AND accnt = '"); 
		 sql.append(posResDto.getAccnt()+"'");
		 posSubService.updateDataBySql(sql.toString());
	}
	ArrayList<Object> resOrderList = new ArrayList<Object>();
	List<PosResOrderDto> orderDto = posResDto.getPosResOrderDto();
	for (Iterator<PosResOrderDto> i = orderDto.iterator(); i.hasNext();) {
		PosResOrderDto obj = i.next();
		PosResOrder posResOrder = new PosResOrder();
		posResOrder.setHotelGroupId(java.lang.Long.parseLong(posResDto.getHotelGroupId()));
		posResOrder.setHotelId(java.lang.Long.parseLong(posResDto.getHotelId()));
		posResOrder.setPcid("1");
		posResOrder.setAccnt(accnt);
		posResOrder.setNoteCode(obj.getNoteCode());
		posResOrder.setSortCode(obj.getSortCode()); 
		posResOrder.setPluCode(obj.getPluCode()); 
		posResOrder.setDescript(obj.getDescript()); 
		posResOrder.setDescriptEn(obj.getDescript()); 
		posResOrder.setSta("I");
		posResOrder.setFlag(obj.getFlag()); 
		posResOrder.setFlag1("0000000000");
		posResOrder.setNumber(new BigDecimal(obj.getNumber()));
		posResOrder.setInumber(0); 
		posResOrder.setTnumber(resOrderList.size()+1);
		posResOrder.setUnit(obj.getUnit()); 
		posResOrder.setPrice(new BigDecimal(obj.getPrice())); 
		resOrderList.add(posResOrder);
	}
	posSubService.saveCodeCollection(resOrderList);
}
@Override
public String updateWxRes(PosResDto posResDto) {
	// TODO Auto-generated method stub
	String msg = "订单更新成功";
		  try {
		    PosRes posRes = new PosRes();
		    posRes.setAccnt(posResDto.getAccnt());
		    posRes.setHotelGroupId(java.lang.Long.parseLong(posResDto.getHotelGroupId()));
		    posRes.setHotelId(java.lang.Long.parseLong(posResDto.getHotelId()));
		    List<PosRes> posResList = posResDao.list(posRes);
		    if(posResList !=null && posResList.size()== 1 ){
		    	posRes = posResList.get(0);
		    	    posRes.setResName(StringUtil.isNotEmpty(posResDto.getResName())?posResDto.getResName():posRes.getResName());
				    posRes.setResDate(StringUtil.isNotEmpty(posResDto.getResDate())?DateUtil.parseDateNoTime(posResDto.getResDate(),DateUtil.newFormatShort):posRes.getResDate());
				    posRes.setPccode(StringUtil.isNotEmpty(posResDto.getPccode())?posResDto.getPccode():posRes.getPccode());
				    posRes.setShift(StringUtil.isNotEmpty(posResDto.getShift())?posResDto.getShift():posRes.getShift());
				    posRes.setBizDate(StringUtil.isNotEmpty(posResDto.getBizDate())?DateUtil.parseDateNoTime(posResDto.getBizDate(),DateUtil.newFormatShort):posRes.getBizDate());
				    posRes.setTableType(StringUtil.isNotEmpty(posResDto.getTableType())?posResDto.getTableType():posRes.getTableType());
				    posRes.setTableno(StringUtil.isNotEmpty(posResDto.getTableno())?posResDto.getTableno():posRes.getTableno());
				    posRes.setGsts(StringUtil.isNotEmpty(posResDto.getGsts())?Integer.parseInt(posResDto.getGsts()):posRes.getGsts());
				    posRes.setPhone(StringUtil.isNotEmpty(posResDto.getPhone())?posResDto.getPhone():posRes.getPhone());
				    posRes.setArrtime(StringUtil.isNotEmpty(posResDto.getArrtime())?posResDto.getArrtime():posRes.getArrtime());
				    posRes.setCardno(StringUtil.isNotEmpty(posResDto.getCardno())?posResDto.getCardno():posRes.getCardno());
				    posRes.setCardinfo(StringUtil.isNotEmpty(posResDto.getCardinfo())?posResDto.getCardinfo():posRes.getCardinfo());
				    posRes.setSource(StringUtil.isNotEmpty(posResDto.getSource())?posResDto.getSource():posRes.getSource());
				    posRes.setInfo(StringUtil.isNotEmpty(posResDto.getInfo())?posResDto.getInfo():posRes.getInfo());
				    posResDao.saveOrUpdate(posRes);
				    //预订菜式
				    if(posResDto.getPosResOrderDto()!= null && posResDto.getPosResOrderDto().size()>0){
				    	this.saveWxResOrder(posResDto.getAccnt(), posResDto,"update");
				    }
		    }
		} catch (Exception e) {
			msg = "订单号:"+posResDto.getAccnt()+",更新失败";
			e.printStackTrace();
		}
		return msg;
}
@Override
public List<PosResOrder> saveOrUpdateResOrder(PosResOrder posResOrder)
{
	int j = 0;
	List<PosResOrder> list = new ArrayList<PosResOrder>();
	PosResOrder posResOrderNew = new PosResOrder();
	posResOrderNew.setHotelGroupId(posResOrder.getHotelGroupId());
	posResOrderNew.setHotelId(posResOrder.getHotelId());
	posResOrderNew.setAccnt(posResOrder.getAccnt());
	posResOrderNew.setSta("I");
	list = posResOrderDao.list(posResOrderNew);
	if(list!=null && list.size()>0){
		j = list.size()+1;
		posResOrder.setTnumber(j);
	}
	//保存点单
	posResOrderDao.saveOrUpdate(posResOrder);
	if(posResOrder.getFlag() != null && !posResOrder.getFlag().equals("") && posResOrder.getFlag().length()>0){
		String taocaiFlag = posResOrder.getFlag().substring(0, 1);
		if(taocaiFlag != null && taocaiFlag.equals("1")){
			//套餐
			PosPluStd  posPluStd = new PosPluStd();
			posPluStd.setHotelGroupId(posResOrder.getHotelGroupId());
			posPluStd.setHotelId(posResOrder.getHotelId());
			posPluStd.setCode(posResOrder.getPluCode());
			posPluStd.setIsHalt("F");
			List<PosPluStd> subList = posPluStdDao.list(posPluStd);
			if(subList != null && subList.size()>0){
				for(Iterator<PosPluStd> i=subList.iterator();i.hasNext();){
					PosPluStd posPluStdGet = i.next();
					PosPluAll posPluAllSub = this.getPosPluAllByCode(posResOrder.getHotelGroupId(), posResOrder.getHotelId(), posPluStdGet.getPluCode());
					if(posPluAllSub != null){
						PosResOrder posOrderSub = new PosResOrder();
						posOrderSub.setHotelGroupId(posResOrder.getHotelGroupId());
						posOrderSub.setHotelId( posResOrder.getHotelId());
						posOrderSub.setPcid(posResOrder.getPcid());
						posOrderSub.setAccnt(posResOrder.getAccnt());
						posOrderSub.setInumber(posResOrder.getTnumber());
						posOrderSub.setTnumber(j+1);
						posOrderSub.setAnumber(1);
						posOrderSub.setMnumber(0);
						posOrderSub.setType("1");
						posOrderSub.setOrderno("0");
						posOrderSub.setCondCode("");
						posOrderSub.setDescript("**"+posPluAllSub.getDescript());
						posOrderSub.setDescriptEn("**"+posPluAllSub.getDescriptEn());
						posOrderSub.setNoteCode(posPluStdGet.getNoteCode());
						posOrderSub.setSortCode(posPluAllSub.getSortCode());
						posOrderSub.setPluCode(posPluAllSub.getCode());
						posOrderSub.setCondCode(posPluAllSub.getTocode());
						posOrderSub.setUnit(posPluStdGet.getUnit());
						posOrderSub.setNumber(posPluStdGet.getNumber());
						posOrderSub.setPrice(posPluStdGet.getPrice());
						posOrderSub.setAmount(posPluStdGet.getNumber().multiply(posPluStdGet.getPrice0()));
						posOrderSub.setSta("I");
						posOrderSub.setFlag(posPluStdGet.getFlag());
						posOrderSub.setFlag1("0000000000");
						posOrderSub.setEmpid(posResOrder.getEmpid());
						posOrderSub.setLogdate(new Date());
						posOrderSub.setSaleid(posResOrder.getSaleid());
						posOrderSub.setTableno(posResOrder.getTableno());
						posOrderSub.setSiteno("");
						posOrderSub.setCook("");
						posOrderSub.setRemark("");
						posOrderSub.setPrinter("");
						posOrderSub.setEmpid1(posResOrder.getEmpid());
						posOrderSub.setEmpid2("");
						posOrderSub.setEmpid3("");
						posResOrderDao.save(posOrderSub);
						j+=1;
					}
				}
			}
		}
	}
	list = posResOrderDao.list(posResOrderNew);
	return list;
}

private PosPluAll getPosPluAllByCode(long hotelGroupId, long hotelId, String code){
	PosPluAll posPluAll = new PosPluAll();
	posPluAll.setHotelGroupId(hotelGroupId);
	posPluAll.setHotelId(hotelId);
	posPluAll.setCode(code);
	List<PosPluAll> list = posPluAllDao.list(posPluAll);
	if(list != null && list.size()>0){
		return list.get(0);
	}else{
		return null;
	}
}
@Override
public void updateMasterChooseRes(PosRes posRes, PosMaster posMaster) {
	//先修改预订单的状态为I
	if(!posRes.getSta().equalsIgnoreCase("I")){
	  List<PosRes>   resList =  posResDao.list(posRes);
	  if(resList!=null && resList.size()>0){
		  PosRes  res = resList.get(0);
		  res.setSta("I");
		  posResDao.update(res);
	  }
	}
	//修改posMaster的预订号
	List<PosMaster> masterList = posMasterDao.list(posMaster);
	if(masterList!=null && masterList.size()>0){
		PosMaster master = masterList.get(0);
		master.setResno(posRes.getAccnt());
		posMasterDao.update(master);
	}
	//插入同步信息表 订单需要同步
	PosAccntSync ls = new PosAccntSync();
	ls.setHotelGroupId(posRes.getHotelGroupId());
	ls.setHotelId(posRes.getHotelId());
	ls.setAccnt(posMaster.getAccnt());
	ls.setResAccnt(posRes.getAccnt());
	ls.setEntityName("com.greencloud.entity.PosMaster");
	ls.setType("UPDATE");
	ls.setIsHalt("F");
	ls.setIsSync("F");
	ls.setCreateUser(UserManager.getUserCode());
	ls.setModifyUser(UserManager.getUserCode());								
	posAccntSyncDao.save(ls);	
}
@SuppressWarnings("unchecked")
public <T> T findInterfaceWithIp(String ip,Class<T> class1) {
	 String className = class1.getName();
        if (className.lastIndexOf(".") > -1) {
            className = className.substring(className.lastIndexOf(".") + 1);
        }

        // FICommonFacadeService
        if (className.startsWith("FI")) {
            className = Character.toLowerCase(className.charAt(0)) + className.substring(2);
        } else {
            className = Character.toLowerCase(className.charAt(1)) + className.substring(2);
        }

        if (ip != null) {
            if (ip.indexOf("http://") == -1) {
                ip = "http://" + ip;
            }
            String url = ip + "/";
            url = url + className;
            
            
            HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
            
            HessianProxyFactory hpf = new HessianProxyFactory();
            hpf.setOverloadEnabled(true);
            
            factory.setProxyFactory(hpf);
            factory.setServiceUrl(url);
            factory.setServiceInterface(class1);
            factory.afterPropertiesSet();
            return (T)factory.getObject();
        }
        
        return null;
    
//    throw new BizException("参数错误.",BizExceptionConstant.INVALID_PARAM);
}
private String getRemoteIpByCode(long hotelGroupId, long hotelId,String code){
	PosIp posIp = new PosIp();
	posIp.setHotelGroupId(hotelGroupId);
	posIp.setHotelId(hotelId);
	posIp.setCode(code);
	List<PosIp> list = posIpDao.list(posIp);
	if(list != null && list.size()>0){
		PosIp posIpGet = list.get(0);
		return posIpGet.getServerIp();
	}else{
		return "";
	}
}
@Override
public List<EdmSendDto> sendRsvSms2(String templetCode, List<String> rsvIds,
		List<String> names, Long hotelGroupId, Long hotelId) {
	// TODO Auto-generated method stub
	 List<EdmSendDto> edmSendDtos = new ArrayList<EdmSendDto>();
	    for (int i = 0;i<rsvIds.size() ; i++){
	        Long rsvId = -111L;
	        try {
	            rsvId = Long.valueOf(rsvIds.get(i).toString());
	         } catch (Exception e) {
	             return null;
	         }
	        EdmSendDto edmDto = new EdmSendDto();	       
	        PosRes res = new PosRes();
	        res.setHotelGroupId(hotelGroupId);
	        res.setHotelId(hotelId);
	        res.setId(rsvId);
	        List<PosRes> rsvSrcList = posResDao.list(res);
	        PosPccode posPccode = new PosPccode();
	        posPccode.setHotelGroupId(hotelGroupId);
	        posPccode.setHotelId(hotelId);
	        posPccode.setCode(rsvSrcList.get(0).getPccode());
	        List<PosPccode> pccodeList = posPccodeDao.list(posPccode);
	        MasterBase masterBase = new MasterBase();
	        //构造基础信息数据,因分库版没有PosRes类,只能先这么处理
	        masterBase.setRsvMan(names.get(i));
	        masterBase.setMobile(rsvSrcList.get(0).getPhone());
	        masterBase.setRsvNo(rsvSrcList.get(0).getAccnt());
	        masterBase.setRsvId(rsvSrcList.get(0).getId());
	        masterBase.setBizDate(rsvSrcList.get(0).getBizDate());
	        switch (rsvSrcList.get(0).getShift()) {
			case "1":
				masterBase.setRemark(pccodeList.get(0).getDescript()+"早餐");
				break;
			case "2":
				masterBase.setRemark(pccodeList.get(0).getDescript()+"中餐");
				break;
			case "3":
				masterBase.setRemark(pccodeList.get(0).getDescript()+"晚餐");
				break;
			default:
				masterBase.setRemark(pccodeList.get(0).getDescript()+"用餐");
				break;
			}
	       
	        java.util.Map<String, Object> objectMap = new java.util.HashMap<String, Object>();
	        
	        // objectMap.put("PosRes", rsvSrcList);
	        objectMap.put("MasterBase", masterBase);
	        objectMap.put("Hotel", hotelService.findHotelById(hotelId));
	        
	        //edmTempletService.builderByTemplet(hotelGroupId, hotelId, templetCode, isAuto, objectMap);
	        //远程调用
	        String pmsIp = getRemoteIpByCode(hotelGroupId,0,"GROUP");
			if(pmsIp != null && !pmsIp.equals("")){
				IEdmFacadeService service  = this.findInterfaceWithIp(pmsIp, IEdmFacadeService.class);
				    edmDto = service.builderByTemplet(hotelGroupId, hotelId, templetCode, false, objectMap);
			        edmDto.name = names.get(i);
			        edmSendDtos.add(edmDto);
			}else{
				 throw new BizException("远程服务地址配置有误，请检查！",BizExceptionConstant.INVALID_PARAM);
			}
	    }
	    return edmSendDtos;
}
@Override
public void updateAndPostSmsBatchDto(List<Map> maps, String templetCode, Long hotelGroupId, Long hotelId) {
	// TODO Auto-generated method stub
	 String pmsIp = getRemoteIpByCode(hotelGroupId,0,"GROUP");
	 if(pmsIp != null && !pmsIp.equals("")){
			IEdmFacadeService service  = this.findInterfaceWithIp(pmsIp, IEdmFacadeService.class);
			service.postSmsBatchDto(maps, templetCode);
			if (maps != null){
	            for(int i = 0; i< maps.size() ; i ++){
	                Long linkId = Long.parseLong(maps.get(i).get("linkId").toString());
	                String mobile = maps.get(i).get("receive").toString();
	                String con = maps.get(i).get("content").toString();
	                if (StringUtil.isNotEmpty(con)){
	                	  PosRes res = new PosRes();
	          	        res.setHotelGroupId(hotelGroupId);
	          	        res.setHotelId(hotelId);
	          	        res.setId(linkId);
	          	        List<PosRes> rsvSrcList = posResDao.list(res);
	          	        if(rsvSrcList!=null && rsvSrcList.size()>0){
	          	        	PosRes resN = rsvSrcList.get(0);
	          	        	resN.setCmscode("T");
	          	        	resN.setQrCode(mobile+"/"+con);
	          	        	posResDao.update(resN);
	          	        }
	                }
	            }
	        }
		}else{
			 throw new BizException("远程服务地址配置有误，请检查！",BizExceptionConstant.INVALID_PARAM);
		}
}
}//end class PosResServiceIm