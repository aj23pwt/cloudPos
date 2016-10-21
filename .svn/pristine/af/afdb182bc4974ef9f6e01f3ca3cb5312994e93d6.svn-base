package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosWebInterfaceLog;
import com.greencloud.dao.IPosWebInterfaceLogDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosWebInterfaceLog into db
   *@author 
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public class PosWebInterfaceLogDaoImpl extends BaseDaoImpl implements IPosWebInterfaceLogDao{

  /**
   *save posWebInterfaceLog object  method
   *@param posWebInterfaceLog PosWebInterfaceLog 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void save(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException {
       super.save(posWebInterfaceLog);
  }
  
  /**
   *update posWebInterfaceLog method
   *@param posWebInterfaceLog PosWebInterfaceLog
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void update(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException{
     super.update(posWebInterfaceLog);
  }
  
   /**
   *save or update posWebInterfaceLog object method
   *@param posWebInterfaceLog PosWebInterfaceLog
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void saveOrUpdate(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException{
     super.saveOrUpdate(posWebInterfaceLog);
  }
  
   /**
   *query posWebInterfaceLog collection method
   *@param posWebInterfaceLog PosWebInterfaceLog send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08  18:38
   */
  public List<PosWebInterfaceLog> list(PosWebInterfaceLog posWebInterfaceLog,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosWebInterfaceLog obj WHERE 1=1 ");
  	 spellSQL(sh,posWebInterfaceLog);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posWebInterfaceLog PosWebInterfaceLog send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public List<PosWebInterfaceLog> list(PosWebInterfaceLog posWebInterfaceLog)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosWebInterfaceLog obj WHERE 1=1 ");
  	 spellSQL(sh,posWebInterfaceLog);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posWebInterfaceLog PosWebInterfaceLog query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-08 18:38
   */
  public int count(PosWebInterfaceLog posWebInterfaceLog)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosWebInterfaceLog obj WHERE 1=1 ");
    spellSQL(sh,posWebInterfaceLog);
    return count(sh);
  }
  
   /**
   *query a posWebInterfaceLog by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-08 18:38
   */
  public PosWebInterfaceLog load(Long id)throws DataAccessException
  {
    return load(PosWebInterfaceLog.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posWebInterfaceLog query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-08 18:38
   */
  private void spellSQL(SQLHelper sh,PosWebInterfaceLog posWebInterfaceLog)
  {
    if(posWebInterfaceLog != null){
        	if(posWebInterfaceLog.getId()!= null){
               sh.appendSql(" AND obj.id = ? ");
               sh.insertValue(posWebInterfaceLog.getId());
            }
            if(posWebInterfaceLog.getHotelGroupId()!= null){
               sh.appendSql(" AND obj.hotelGroupId = ? ");
               sh.insertValue(posWebInterfaceLog.getHotelGroupId());
            }
            if(posWebInterfaceLog.getHotelId()!= null){
               sh.appendSql(" AND obj.hotelId = ? ");
               sh.insertValue(posWebInterfaceLog.getHotelId());
            }
            if(isNotNull(posWebInterfaceLog.getHotelGroupCode())){
               sh.appendSql(" AND obj.hotelGroupCode = ? ");
               sh.insertValue(posWebInterfaceLog.getHotelGroupCode().trim());
            }
            if(isNotNull(posWebInterfaceLog.getHotelCode())){
               sh.appendSql(" AND obj.hotelCode = ? ");
               sh.insertValue(posWebInterfaceLog.getHotelCode().trim());
            }
            if(isNotNull(posWebInterfaceLog.getLogType())){
                sh.appendSql(" AND obj.logType = ? ");
                sh.insertValue(posWebInterfaceLog.getLogType().trim());
            }
            if(isNotNull(posWebInterfaceLog.getModel())){
                sh.appendSql(" AND obj.model = ? ");
                sh.insertValue(posWebInterfaceLog.getModel().trim());
            }
            if(isNotNull(posWebInterfaceLog.getMessageType())){
                sh.appendSql(" AND obj.messageType = ? ");
                sh.insertValue(posWebInterfaceLog.getMessageType().trim());
            }
            if(isNotNull(posWebInterfaceLog.getMessageNo())){
                sh.appendSql(" AND obj.messageNo = ? ");
                sh.insertValue(posWebInterfaceLog.getMessageNo().trim());
            }
            if(isNotNull(posWebInterfaceLog.getStatus())){
                sh.appendSql(" AND obj.status = ? ");
                sh.insertValue(posWebInterfaceLog.getStatus().trim());
            }
            if(isNotNull(posWebInterfaceLog.getPosRsvNo())){
                sh.appendSql(" AND obj.posRsvNo = ? ");
                sh.insertValue(posWebInterfaceLog.getPosRsvNo().trim());
            }
            if(isNotNull(posWebInterfaceLog.getOtherNo())){
                sh.appendSql(" AND obj.otherNo = ? ");
                sh.insertValue(posWebInterfaceLog.getOtherNo().trim());
            }
            if(isNotNull(posWebInterfaceLog.getResource())){
                sh.appendSql(" AND obj.resource = ? ");
                sh.insertValue(posWebInterfaceLog.getResource().trim());
            }
            if(isNotNull(posWebInterfaceLog.getOpenid())){
                sh.appendSql(" AND obj.openid = ? ");
                sh.insertValue(posWebInterfaceLog.getOpenid().trim());
            }
            if(isNotNull(posWebInterfaceLog.getAppid())){
                sh.appendSql(" AND obj.appid = ? ");
                sh.insertValue(posWebInterfaceLog.getAppid().trim());
            }
            if(isNotNull(posWebInterfaceLog.getRequestXml())){
                sh.appendSql(" AND obj.requestXml = ? ");
                sh.insertValue(posWebInterfaceLog.getRequestXml().trim());
            }
            if(isNotNull(posWebInterfaceLog.getResultXml())){
                sh.appendSql(" AND obj.resultXml = ? ");
                sh.insertValue(posWebInterfaceLog.getResultXml().trim());
            }
            if(isNotNull(posWebInterfaceLog.getRemark())){
                sh.appendSql(" AND obj.remark = ? ");
                sh.insertValue(posWebInterfaceLog.getRemark().trim());
            }
            if(posWebInterfaceLog.getBizDate()!= null){
                sh.appendSql(" AND obj.bizDate = ? ");
                sh.insertValue(posWebInterfaceLog.getBizDate());
            }
            if(isNotNull(posWebInterfaceLog.getFlag())){
                sh.appendSql(" AND obj.flag = ? ");
                sh.insertValue(posWebInterfaceLog.getFlag().trim());
            }
    }
  }
}