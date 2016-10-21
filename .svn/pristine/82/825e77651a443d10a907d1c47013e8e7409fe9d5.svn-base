package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosPrice;
import com.greencloud.dao.IPosPriceDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPrice into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosPriceDaoImpl extends BaseDaoImpl implements IPosPriceDao{

  /**
   *save posPrice object  method
   *@param posPrice PosPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosPrice posPrice) throws DataAccessException {
       super.save(posPrice);
  }
  
  /**
   *update posPrice method
   *@param posPrice PosPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosPrice posPrice) throws DataAccessException{
     super.update(posPrice);
  }
  
   /**
   *save or update posPrice object method
   *@param posPrice PosPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosPrice posPrice) throws DataAccessException{
     super.saveOrUpdate(posPrice);
  }
  
   /**
   *query posPrice collection method
   *@param posPrice PosPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPrice> list(PosPrice posPrice,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPrice obj WHERE 1=1 ");
  	 spellSQL(sh,posPrice);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPrice PosPrice send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosPrice> list(PosPrice posPrice)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPrice obj WHERE 1=1 ");
  	 spellSQL(sh,posPrice);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPrice PosPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosPrice posPrice)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPrice obj WHERE 1=1 ");
    spellSQL(sh,posPrice);
    return count(sh);
  }
  
   /**
   *query a posPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPrice load(Long id)throws DataAccessException
  {
    return load(PosPrice.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPrice query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosPrice posPrice)
  {
    if(posPrice != null){
    	if(posPrice.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPrice.getId());
         }
         if(posPrice.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPrice.getHotelGroupId());
         }
         if(posPrice.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPrice.getHotelId());
         }
        if(posPrice.getPluCode()!= null){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posPrice.getPluCode());
        }
        if(isNotNull(posPrice.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posPrice.getPccode().trim());
        }
       if(posPrice.getInumber()!= null){
           sh.appendSql(" AND obj.inumber = ? ");
           sh.insertValue(posPrice.getInumber());
        }
        if(isNotNull(posPrice.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posPrice.getUnit().trim());
        }
       if(posPrice.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posPrice.getPrice());
        }
       if(posPrice.getCost()!= null){
           sh.appendSql(" AND obj.cost = ? ");
           sh.insertValue(posPrice.getCost());
        }
       if(posPrice.getCostF()!= null){
           sh.appendSql(" AND obj.costF = ? ");
           sh.insertValue(posPrice.getCostF());
        }
        if(isNotNull(posPrice.getBaseunit())){
           sh.appendSql(" AND obj.baseunit = ? ");
           sh.insertValue(posPrice.getBaseunit().trim());
        }
       if(posPrice.getBasenumb()!= null){
           sh.appendSql(" AND obj.basenumb = ? ");
           sh.insertValue(posPrice.getBasenumb());
        }
        if(isNotNull(posPrice.getFlag())){
           sh.appendSql(" AND obj.flag = ? ");
           sh.insertValue(posPrice.getFlag().trim());
        }
        if(isNotNull(posPrice.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posPrice.getIsHalt().trim());
        }
       if(posPrice.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posPrice.getListOrder());
        }
        if(isNotNull(posPrice.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posPrice.getCodeType().trim());
        }
        if(isNotNull(posPrice.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posPrice.getGroupCode().trim());
        }
        if(isNotNull(posPrice.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posPrice.getIsGroup().trim());
        }
        if(isNotNull(posPrice.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posPrice.getCreateUser().trim());
         }
        if(posPrice.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posPrice.getCreateDatetime());
         }
         if(isNotNull(posPrice.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posPrice.getModifyUser().trim());
         }
        if(posPrice.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posPrice.getModifyDatetime());
         }
    }
  }
}