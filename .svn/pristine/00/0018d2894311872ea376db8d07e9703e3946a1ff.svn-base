package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosCurrentPrice;
import com.greencloud.dao.IPosCurrentPriceDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosCurrentPrice into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosCurrentPriceDaoImpl extends BaseDaoImpl implements IPosCurrentPriceDao{

  /**
   *save posCurrentPrice object  method
   *@param posCurrentPrice PosCurrentPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosCurrentPrice posCurrentPrice) throws DataAccessException {
       super.save(posCurrentPrice);
  }
  
  /**
   *update posCurrentPrice method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosCurrentPrice posCurrentPrice) throws DataAccessException{
     super.update(posCurrentPrice);
  }
  
   /**
   *save or update posCurrentPrice object method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosCurrentPrice posCurrentPrice) throws DataAccessException{
     super.saveOrUpdate(posCurrentPrice);
  }
  
   /**
   *query posCurrentPrice collection method
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCurrentPrice> list(PosCurrentPrice posCurrentPrice,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosCurrentPrice obj WHERE 1=1 ");
  	 spellSQL(sh,posCurrentPrice);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosCurrentPrice> list(PosCurrentPrice posCurrentPrice)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosCurrentPrice obj WHERE 1=1 ");
  	 spellSQL(sh,posCurrentPrice);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posCurrentPrice PosCurrentPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosCurrentPrice posCurrentPrice)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosCurrentPrice obj WHERE 1=1 ");
    spellSQL(sh,posCurrentPrice);
    return count(sh);
  }
  
   /**
   *query a posCurrentPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCurrentPrice load(Long id)throws DataAccessException
  {
    return load(PosCurrentPrice.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posCurrentPrice query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosCurrentPrice posCurrentPrice)
  {
    if(posCurrentPrice != null){
    	if(posCurrentPrice.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posCurrentPrice.getId());
         }
         if(posCurrentPrice.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posCurrentPrice.getHotelGroupId());
         }
         if(posCurrentPrice.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posCurrentPrice.getHotelId());
         }
       if(posCurrentPrice.getBizDate()!= null){
           sh.appendSql(" AND obj.bizDate = ? ");
           sh.insertValue(posCurrentPrice.getBizDate());
        }
        if(isNotNull(posCurrentPrice.getPluCode())){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posCurrentPrice.getPluCode().trim());
        }
        if(isNotNull(posCurrentPrice.getPluUnit())){
           sh.appendSql(" AND obj.pluUnit = ? ");
           sh.insertValue(posCurrentPrice.getPluUnit().trim());
        }
       if(posCurrentPrice.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posCurrentPrice.getPrice());
        }
       if(posCurrentPrice.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posCurrentPrice.getNumber());
        }
        if(isNotNull(posCurrentPrice.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posCurrentPrice.getIsHalt().trim());
        }
       if(posCurrentPrice.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posCurrentPrice.getListOrder());
        }
        if(isNotNull(posCurrentPrice.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posCurrentPrice.getCodeType().trim());
        }
        if(isNotNull(posCurrentPrice.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posCurrentPrice.getGroupCode().trim());
        }
        if(isNotNull(posCurrentPrice.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posCurrentPrice.getIsGroup().trim());
        }
        if(isNotNull(posCurrentPrice.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posCurrentPrice.getCreateUser().trim());
         }
        if(posCurrentPrice.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posCurrentPrice.getCreateDatetime());
         }
         if(isNotNull(posCurrentPrice.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posCurrentPrice.getModifyUser().trim());
         }
        if(posCurrentPrice.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posCurrentPrice.getModifyDatetime());
         }
    }
  }
}