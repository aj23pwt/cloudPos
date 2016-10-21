package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosHotelTransfer;
import com.greencloud.dao.IPosHotelTransferDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosHotelTransfer into db
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public class PosHotelTransferDaoImpl extends BaseDaoImpl implements IPosHotelTransferDao{

  /**
   *save posHotelTransfer object  method
   *@param posHotelTransfer PosHotelTransfer 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void save(PosHotelTransfer posHotelTransfer) throws DataAccessException {
       super.save(posHotelTransfer);
  }
  
  /**
   *update posHotelTransfer method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void update(PosHotelTransfer posHotelTransfer) throws DataAccessException{
     super.update(posHotelTransfer);
  }
  
   /**
   *save or update posHotelTransfer object method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void saveOrUpdate(PosHotelTransfer posHotelTransfer) throws DataAccessException{
     super.saveOrUpdate(posHotelTransfer);
  }
  
   /**
   *query posHotelTransfer collection method
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13  10:23
   */
  public List<PosHotelTransfer> list(PosHotelTransfer posHotelTransfer,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosHotelTransfer obj WHERE 1=1 ");
  	 spellSQL(sh,posHotelTransfer);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public List<PosHotelTransfer> list(PosHotelTransfer posHotelTransfer)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosHotelTransfer obj WHERE 1=1 ");
  	 spellSQL(sh,posHotelTransfer);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posHotelTransfer PosHotelTransfer query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-06-13 10:23
   */
  public int count(PosHotelTransfer posHotelTransfer)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosHotelTransfer obj WHERE 1=1 ");
    spellSQL(sh,posHotelTransfer);
    return count(sh);
  }
  
   /**
   *query a posHotelTransfer by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-06-13 10:23
   */
  public PosHotelTransfer load(Long id)throws DataAccessException
  {
    return load(PosHotelTransfer.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posHotelTransfer query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-06-13 10:23
   */
  private void spellSQL(SQLHelper sh,PosHotelTransfer posHotelTransfer)
  {
    if(posHotelTransfer != null){
    	if(posHotelTransfer.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posHotelTransfer.getId());
         }
         if(posHotelTransfer.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posHotelTransfer.getHotelGroupId());
         }
         if(posHotelTransfer.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posHotelTransfer.getHotelId());
         }
        if(posHotelTransfer.getTransferHotelGroupId()!= null){
           sh.appendSql(" AND obj.transferHotelGroupId = ? ");
           sh.insertValue(posHotelTransfer.getTransferHotelGroupId());
        }
        if(posHotelTransfer.getTransferHotelId()!= null){
           sh.appendSql(" AND obj.transferHotelId = ? ");
           sh.insertValue(posHotelTransfer.getTransferHotelId());
        }
        if(isNotNull(posHotelTransfer.getTransferHotelCode())){
            sh.appendSql(" AND obj.transferHotelCode = ? ");
            sh.insertValue(posHotelTransfer.getTransferHotelCode().trim());
         }
        if(isNotNull(posHotelTransfer.getTransferHotelDescript())){
            sh.appendSql(" AND obj.transferHotelDescript = ? ");
            sh.insertValue(posHotelTransfer.getTransferHotelDescript().trim());
         }
        if(isNotNull(posHotelTransfer.getTransactionPmsCode())){
           sh.appendSql(" AND obj.transactionPmsCode = ? ");
           sh.insertValue(posHotelTransfer.getTransactionPmsCode().trim());
        }
        if(isNotNull(posHotelTransfer.getTransactionPmsDescript())){
           sh.appendSql(" AND obj.transactionPmsDescript = ? ");
           sh.insertValue(posHotelTransfer.getTransactionPmsDescript().trim());
        }
        if(isNotNull(posHotelTransfer.getTransferServerIp())){
           sh.appendSql(" AND obj.transferServerIp = ? ");
           sh.insertValue(posHotelTransfer.getTransferServerIp().trim());
        }
        if(isNotNull(posHotelTransfer.getTransactionArCode())){
           sh.appendSql(" AND obj.transactionArCode = ? ");
           sh.insertValue(posHotelTransfer.getTransactionArCode().trim());
        }
        if(isNotNull(posHotelTransfer.getTransactionArDescript())){
           sh.appendSql(" AND obj.transactionArDescript = ? ");
           sh.insertValue(posHotelTransfer.getTransactionArDescript().trim());
        }
        if(isNotNull(posHotelTransfer.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posHotelTransfer.getCreateUser().trim());
         }
        if(posHotelTransfer.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posHotelTransfer.getCreateDatetime());
         }
         if(isNotNull(posHotelTransfer.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posHotelTransfer.getModifyUser().trim());
         }
        if(posHotelTransfer.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posHotelTransfer.getModifyDatetime());
         }
    }
  }
}