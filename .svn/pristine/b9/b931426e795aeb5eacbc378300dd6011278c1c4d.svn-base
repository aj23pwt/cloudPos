package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosDrinksDepositOrder;
import com.greencloud.dao.IPosDrinksDepositOrderDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosDrinksDepositOrder into db
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public class PosDrinksDepositOrderDaoImpl extends BaseDaoImpl implements IPosDrinksDepositOrderDao{

  /**
   *save posDrinksDepositOrder object  method
   *@param posDrinksDepositOrder PosDrinksDepositOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void save(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException {
       super.save(posDrinksDepositOrder);
  }
  
  /**
   *update posDrinksDepositOrder method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void update(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException{
     super.update(posDrinksDepositOrder);
  }
  
   /**
   *save or update posDrinksDepositOrder object method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdate(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException{
     super.saveOrUpdate(posDrinksDepositOrder);
  }
  
   /**
   *query posDrinksDepositOrder collection method
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksDepositOrder> list(PosDrinksDepositOrder posDrinksDepositOrder,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosDrinksDepositOrder obj WHERE 1=1 ");
  	 spellSQL(sh,posDrinksDepositOrder);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public List<PosDrinksDepositOrder> list(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosDrinksDepositOrder obj WHERE 1=1 ");
  	 spellSQL(sh,posDrinksDepositOrder);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posDrinksDepositOrder PosDrinksDepositOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int count(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosDrinksDepositOrder obj WHERE 1=1 ");
    spellSQL(sh,posDrinksDepositOrder);
    return count(sh);
  }
  
   /**
   *query a posDrinksDepositOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksDepositOrder load(Long id)throws DataAccessException
  {
    return load(PosDrinksDepositOrder.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posDrinksDepositOrder query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 15:46
   */
  private void spellSQL(SQLHelper sh,PosDrinksDepositOrder posDrinksDepositOrder)
  {
    if(posDrinksDepositOrder != null){
    	if(posDrinksDepositOrder.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posDrinksDepositOrder.getId());
         }
         if(posDrinksDepositOrder.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posDrinksDepositOrder.getHotelGroupId());
         }
         if(posDrinksDepositOrder.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posDrinksDepositOrder.getHotelId());
         }
        if(isNotNull(posDrinksDepositOrder.getOwner())){
           sh.appendSql(" AND obj.owner = ? ");
           sh.insertValue(posDrinksDepositOrder.getOwner().trim());
        }
        if(isNotNull(posDrinksDepositOrder.getPhone())){
           sh.appendSql(" AND obj.phone = ? ");
           sh.insertValue(posDrinksDepositOrder.getPhone().trim());
        }
        if(isNotNull(posDrinksDepositOrder.getRemark())){
           sh.appendSql(" AND obj.remark = ? ");
           sh.insertValue(posDrinksDepositOrder.getRemark().trim());
        }
        if(isNotNull(posDrinksDepositOrder.getState())){
           sh.appendSql(" AND obj.state = ? ");
           sh.insertValue(posDrinksDepositOrder.getState().trim());
        }
        if(isNotNull(posDrinksDepositOrder.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posDrinksDepositOrder.getCreateUser().trim());
         }
        if(posDrinksDepositOrder.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posDrinksDepositOrder.getCreateDatetime());
         }
         if(isNotNull(posDrinksDepositOrder.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posDrinksDepositOrder.getModifyUser().trim());
         }
        if(posDrinksDepositOrder.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posDrinksDepositOrder.getModifyDatetime());
         }
    }
  }
}