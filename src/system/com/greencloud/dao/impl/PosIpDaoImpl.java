package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosIp;
import com.greencloud.dao.IPosIpDao;

import org.apache.cxf.ws.rm.v200702.SequenceAcknowledgement.Final;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

   /**
   * operate PosIp into db
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public class PosIpDaoImpl extends BaseDaoImpl implements IPosIpDao{

  /**
   *save posIp object  method
   *@param posIp PosIp 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void save(PosIp posIp) throws DataAccessException {
       super.save(posIp);
  }
  
  /**
   *update posIp method
   *@param posIp PosIp
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void update(PosIp posIp) throws DataAccessException{
     super.update(posIp);
  }
  
   /**
   *save or update posIp object method
   *@param posIp PosIp
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void saveOrUpdate(PosIp posIp) throws DataAccessException{
     super.saveOrUpdate(posIp);
  }
  
   /**
   *query posIp collection method
   *@param posIp PosIp send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-17  10:21
   */
  public List<PosIp> list(PosIp posIp,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosIp obj WHERE 1=1 ");
  	 spellSQL(sh,posIp);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posIp PosIp send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public List<PosIp> list(PosIp posIp)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosIp obj WHERE 1=1 ");
  	 spellSQL(sh,posIp);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posIp PosIp query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-17 10:21
   */
  public int count(PosIp posIp)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosIp obj WHERE 1=1 ");
    spellSQL(sh,posIp);
    return count(sh);
  }
  
   /**
   *query a posIp by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-17 10:21
   */
  public PosIp load(Long id)throws DataAccessException
  {
    return load(PosIp.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posIp query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-17 10:21
   */
  private void spellSQL(SQLHelper sh,PosIp posIp)
  {
    if(posIp != null){
    	if(posIp.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posIp.getHotelGroupId());
         }
         if(posIp.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posIp.getHotelId());
         }
        if(isNotNull(posIp.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posIp.getCode().trim());
        }
        if(isNotNull(posIp.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posIp.getDescript().trim());
        }
        if(isNotNull(posIp.getServerIp())){
           sh.appendSql(" AND obj.serverIp = ? ");
           sh.insertValue(posIp.getServerIp().trim());
        }
        if(isNotNull(posIp.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posIp.getCreateUser().trim());
         }
        if(posIp.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posIp.getCreateDatetime());
         }
         if(isNotNull(posIp.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posIp.getModifyUser().trim());
         }
        if(posIp.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posIp.getModifyDatetime());
         }
    }
  }

	@Override
	public List<PosIp> findPosIp(Long hotelGroupId, Long hotelId,Date modifyDatetime) {
		SQLHelper sh = new SQLHelper("SELECT obj FROM PosIp obj WHERE 1=1 ");
		sh.appendSql(" AND obj.hotelGroupId=? ");
		sh.insertValue(hotelGroupId);
		sh.appendSql(" AND obj.hotelId =?  ");
		sh.insertValue(hotelId);
		if (modifyDatetime != null) {
			sh.appendSql(" AND obj.modifyDatetime>? ");
			sh.insertValue(modifyDatetime);
		}
		return find(sh);
	}
	
	@Override
	public void updateNewHotelInit(final Long hotelGroupId,final Long hotelId,final String type) {	
		String sql = "{Call up_pos_new_hotel_init(?,?,?) }";	
		@SuppressWarnings({ "unchecked", "rawtypes" })
		Object object = getJdbcTemplate().execute(sql,new CallableStatementCallback(){	
			public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException 
			{
			     cs.setLong(1,hotelGroupId);
			     cs.setLong(2,hotelId);
			     cs.setString(3,type);
			     cs.execute();
			     
			     return null;
			}
		});	
	}
}