package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.List;

import com.greencloud.entity.OperationInfo;
import com.greencloud.entity.PosRes;
import com.greencloud.util.ModelUtil;
import com.greencloud.dao.IPosResDao;
import com.greencloud.dto.PosTableMapDto;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

   /**
   * operate PosRes into db
   *@author 
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public class PosResDaoImpl extends BaseDaoImpl implements IPosResDao{

  /**
   *save posRes object  method
   *@param posRes PosRes 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public void save(PosRes posRes) throws DataAccessException {
		this.getHibernateTemplate().save(posRes);
  }
  
  /**
   *update posRes method
   *@param posRes PosRes
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public void update(PosRes posRes) throws DataAccessException{
     super.update(posRes);
  }
  
   /**
   *save or update posRes object method
   *@param posRes PosRes
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public void saveOrUpdate(PosRes posRes) throws DataAccessException{
     super.saveOrUpdate(posRes);
  }
  
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
  public List<PosRes> list(PosRes posRes,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosRes obj WHERE 1=1 ");
  	 spellSQL(sh,posRes);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posRes PosRes send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-30 17:30
   */
  public List<PosRes> list(PosRes posRes)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosRes obj WHERE 1=1 ");
  	 spellSQL(sh,posRes);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posRes PosRes query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-30 17:30
   */
  public int count(PosRes posRes)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosRes obj WHERE 1=1 ");
    spellSQL(sh,posRes);
    return count(sh);
  }
  
   /**
   *query a posRes by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-30 17:30
   */
  public PosRes load(Long id)throws DataAccessException
  {
    return load(PosRes.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posRes query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-30 17:30
   */
  private void spellSQL(SQLHelper sh,PosRes posRes)
  {
    if(posRes != null){
    	if(posRes.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posRes.getId());
         }
         if(posRes.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posRes.getHotelGroupId());
         }
         if(posRes.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posRes.getHotelId());
         }
        if(isNotNull(posRes.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posRes.getAccnt().trim());
        }
        if(isNotNull(posRes.getType1())){
           sh.appendSql(" AND obj.type1 = ? ");
           sh.insertValue(posRes.getType1().trim());
        }
        if(isNotNull(posRes.getType2())){
           sh.appendSql(" AND obj.type2 = ? ");
           sh.insertValue(posRes.getType2().trim());
        }
        if(isNotNull(posRes.getType3())){
           sh.appendSql(" AND obj.type3 = ? ");
           sh.insertValue(posRes.getType3().trim());
        }
        if(isNotNull(posRes.getType4())){
           sh.appendSql(" AND obj.type4 = ? ");
           sh.insertValue(posRes.getType4().trim());
        }
        if(isNotNull(posRes.getType5())){
           sh.appendSql(" AND obj.type5 = ? ");
           sh.insertValue(posRes.getType5().trim());
        }
       if(posRes.getResDate()!= null){
           sh.appendSql(" AND obj.resDate = ? ");
           sh.insertValue(posRes.getResDate());
        }
        if(isNotNull(posRes.getResName())){
           sh.appendSql(" AND obj.resName = ? ");
           sh.insertValue(posRes.getResName().trim());
        }
        if(isNotNull(posRes.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posRes.getPccode().trim());
        }
        if(isNotNull(posRes.getMode())){
           sh.appendSql(" AND obj.mode = ? ");
           sh.insertValue(posRes.getMode().trim());
        }
        if(isNotNull(posRes.getShift())){
           sh.appendSql(" AND obj.shift = ? ");
           sh.insertValue(posRes.getShift().trim());
        }
        if(isNotNull(posRes.getEmpid())){
           sh.appendSql(" AND obj.empid = ? ");
           sh.insertValue(posRes.getEmpid().trim());
        }
        if(isNotNull(posRes.getSta())){
           sh.appendSql(" AND obj.sta = ? ");
           sh.insertValue(posRes.getSta().trim());
        }
        if(isNotNull(posRes.getOsta())){
           sh.appendSql(" AND obj.osta = ? ");
           sh.insertValue(posRes.getOsta().trim());
        }
        if(posRes.getBizDate()!= null){
            sh.appendSql(" AND obj.bizDate = ? ");
            sh.insertValue(posRes.getResDate());
         }
        if(isNotNull(posRes.getTableType())){
           sh.appendSql(" AND obj.tableType = ? ");
           sh.insertValue(posRes.getTableType().trim());
        }
        if(isNotNull(posRes.getTableno())){
           sh.appendSql(" AND obj.tableno = ? ");
           sh.insertValue(posRes.getTableno().trim());
        }
        if(isNotNull(posRes.getExttableno())){
           sh.appendSql(" AND obj.exttableno = ? ");
           sh.insertValue(posRes.getExttableno().trim());
        }
       if(posRes.getNumb()!= null){
           sh.appendSql(" AND obj.numb = ? ");
           sh.insertValue(posRes.getNumb());
        }
       if(posRes.getGsts()!= null){
           sh.appendSql(" AND obj.gsts = ? ");
           sh.insertValue(posRes.getGsts());
        }
       if(posRes.getChildren()!= null){
           sh.appendSql(" AND obj.children = ? ");
           sh.insertValue(posRes.getChildren());
        }
        if(isNotNull(posRes.getMarket())){
           sh.appendSql(" AND obj.market = ? ");
           sh.insertValue(posRes.getMarket().trim());
        }
        if(isNotNull(posRes.getSource())){
           sh.appendSql(" AND obj.source = ? ");
           sh.insertValue(posRes.getSource().trim());
        }
        if(isNotNull(posRes.getHaccnt())){
           sh.appendSql(" AND obj.haccnt = ? ");
           sh.insertValue(posRes.getHaccnt().trim());
        }
        if(isNotNull(posRes.getName())){
           sh.appendSql(" AND obj.name = ? ");
           sh.insertValue(posRes.getName().trim());
        }
        if(isNotNull(posRes.getCusno())){
           sh.appendSql(" AND obj.cusno = ? ");
           sh.insertValue(posRes.getCusno().trim());
        }
        if(isNotNull(posRes.getCusinfo())){
           sh.appendSql(" AND obj.cusinfo = ? ");
           sh.insertValue(posRes.getCusinfo().trim());
        }
        if(isNotNull(posRes.getCardno())){
           sh.appendSql(" AND obj.cardno = ? ");
           sh.insertValue(posRes.getCardno().trim());
        }
        if(isNotNull(posRes.getCardinfo())){
           sh.appendSql(" AND obj.cardinfo = ? ");
           sh.insertValue(posRes.getCardinfo().trim());
        }
        if(isNotNull(posRes.getSaleid())){
           sh.appendSql(" AND obj.saleid = ? ");
           sh.insertValue(posRes.getSaleid().trim());
        }
        if(isNotNull(posRes.getSaleinfo())){
           sh.appendSql(" AND obj.saleinfo = ? ");
           sh.insertValue(posRes.getSaleinfo().trim());
        }
        if(isNotNull(posRes.getPhone())){
           sh.appendSql(" AND obj.phone = ? ");
           sh.insertValue(posRes.getPhone().trim());
        }
        if(isNotNull(posRes.getEmail())){
           sh.appendSql(" AND obj.email = ? ");
           sh.insertValue(posRes.getEmail().trim());
        }
        if(isNotNull(posRes.getBeginTime())){
           sh.appendSql(" AND obj.beginTime = ? ");
           sh.insertValue(posRes.getBeginTime().trim());
        }
        if(isNotNull(posRes.getEndTime())){
           sh.appendSql(" AND obj.endTime = ? ");
           sh.insertValue(posRes.getEndTime().trim());
        }
        if(isNotNull(posRes.getArrtime())){
           sh.appendSql(" AND obj.arrtime = ? ");
           sh.insertValue(posRes.getArrtime().trim());
        }
        if(posRes.getAmount()!=null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posRes.getAmount());
        }
        if(isNotNull(posRes.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posRes.getType().trim());
        }
        if(isNotNull(posRes.getPaytype())){
           sh.appendSql(" AND obj.paytype = ? ");
           sh.insertValue(posRes.getPaytype().trim());
        }
        if(posRes.getPay()!= null){
            sh.appendSql(" AND obj.pay = ? ");
            sh.insertValue(posRes.getPay());
         }
        if(posRes.getCharge()!= null){
            sh.appendSql(" AND obj.charge = ? ");
            sh.insertValue(posRes.getCharge());
         }
        if(isNotNull(posRes.getToaccnt())){
           sh.appendSql(" AND obj.toaccnt = ? ");
           sh.insertValue(posRes.getToaccnt().trim());
        }
        if(isNotNull(posRes.getAccntinfo())){
           sh.appendSql(" AND obj.accntinfo = ? ");
           sh.insertValue(posRes.getAccntinfo().trim());
        }
        if(isNotNull(posRes.getCmscode())){
           sh.appendSql(" AND obj.cmscode = ? ");
           sh.insertValue(posRes.getCmscode().trim());
        }
        if(isNotNull(posRes.getInfo())){
           sh.appendSql(" AND obj.info = ? ");
           sh.insertValue(posRes.getInfo().trim());
        }
        if(isNotNull(posRes.getLove())){
           sh.appendSql(" AND obj.love = ? ");
           sh.insertValue(posRes.getLove().trim());
        }
        if(isNotNull(posRes.getQrCode())){
           sh.appendSql(" AND obj.qrCode = ? ");
           sh.insertValue(posRes.getQrCode().trim());
        }
        if(isNotNull(posRes.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posRes.getCreateUser().trim());
         }
        if(posRes.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posRes.getCreateDatetime());
         }
         if(isNotNull(posRes.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posRes.getModifyUser().trim());
         }
        if(posRes.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posRes.getModifyDatetime());
         }
    }
  }

@Override
public List<PosRes> getResList(String sql) throws DataAccessException {
	SQLHelper sh = new SQLHelper(sql);
	return findByNativeSQL(sh, PosRes.class);
}

/**
 * 根据给定条件，获取指定sysExtraId序列
 * @param code			sysExtraId.code
 * @param hotelGroupId	集团ID
 * @param hotelId		酒店ID
 * @return String 
 * @author pwt
 * @date 2015-04-01
 */
@SuppressWarnings({ "unchecked", "rawtypes" })
@Override
public String findSysExtraIdByProc(final String code,final Long hotelGroupId,final Long hotelId){
	String sql = "{CALL up_pos_produce_extra_id(?,?,?,?)}";	
	Object object = getJdbcTemplate().execute(sql,new CallableStatementCallback(){
		public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException 
		{
		     cs.setLong(1,hotelGroupId);
		     cs.setLong(2,hotelId);
		     cs.setString(3,code);
		     cs.registerOutParameter(4,java.sql.Types.VARCHAR);
		     cs.execute();
		     return cs.getString(4);
		}
	});	
	return object.toString().trim();
	
}

@Override
public <T> List<T> getTableMap(String hotelGroupId, String hotelId,
		String date, String shift, String pccode, String status,String type, String flag) {
	SQLHelper sh = new SQLHelper();
	sh.appendSql(" Call up_pos_table_map(?,?,?,?,?,?,?,?) ");
	sh.insertValue(Long.parseLong(hotelGroupId));
	sh.insertValue(Long.parseLong(hotelId));
	sh.insertValue(date);
	sh.insertValue(shift);
	sh.insertValue(pccode);
	sh.insertValue(status);
	sh.insertValue(type);
	sh.insertValue(flag);
	return findByNativeSQL(sh);
}

@Override
public <T> List<T> getPosVipQuery(Long hotelGroupId, Long hotelId, String searchText) {
	// TODO Auto-generated method stub
	SQLHelper sh = new SQLHelper();
	sh.appendSql(" Call up_ihotel_pos_vip_query(?,?,?) ");
	sh.insertValue(hotelGroupId);
	sh.insertValue(hotelId);
	sh.insertValue(searchText);
	return findByNativeSQL(sh);
}

@Override
public List<PosTableMapDto> getTableMapDto(String hotelGroupId, String hotelId,
		String date, String shift, String pccode, String status, String type,
		String flag) {
	SQLHelper sh = new SQLHelper();
	sh.appendSql(" Call up_pos_table_map_interface(?,?,?,?,?,?,?,?) ");
	sh.insertValue(Long.parseLong(hotelGroupId));
	sh.insertValue(Long.parseLong(hotelId));
	sh.insertValue(date);
	sh.insertValue(shift);
	sh.insertValue(pccode);
	sh.insertValue(status);
	sh.insertValue(type);
	sh.insertValue(flag);
	return findByNativeSQL(sh,PosTableMapDto.class);
}


}