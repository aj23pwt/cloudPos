package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosDrinksConsume;
import com.greencloud.dao.IPosDrinksConsumeDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosDrinksConsume into db
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public class PosDrinksConsumeDaoImpl extends BaseDaoImpl implements IPosDrinksConsumeDao{

  /**
   *save posDrinksConsume object  method
   *@param posDrinksConsume PosDrinksConsume 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void save(PosDrinksConsume posDrinksConsume) throws DataAccessException {
       super.save(posDrinksConsume);
  }
  
  /**
   *update posDrinksConsume method
   *@param posDrinksConsume PosDrinksConsume
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void update(PosDrinksConsume posDrinksConsume) throws DataAccessException{
     super.update(posDrinksConsume);
  }
  
   /**
   *save or update posDrinksConsume object method
   *@param posDrinksConsume PosDrinksConsume
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdate(PosDrinksConsume posDrinksConsume) throws DataAccessException{
     super.saveOrUpdate(posDrinksConsume);
  }
  
   /**
   *query posDrinksConsume collection method
   *@param posDrinksConsume PosDrinksConsume send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksConsume> list(PosDrinksConsume posDrinksConsume,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosDrinksConsume obj WHERE 1=1 ");
  	 spellSQL(sh,posDrinksConsume);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posDrinksConsume PosDrinksConsume send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public List<PosDrinksConsume> list(PosDrinksConsume posDrinksConsume)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosDrinksConsume obj WHERE 1=1 ");
  	 spellSQL(sh,posDrinksConsume);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posDrinksConsume PosDrinksConsume query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int count(PosDrinksConsume posDrinksConsume)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosDrinksConsume obj WHERE 1=1 ");
    spellSQL(sh,posDrinksConsume);
    return count(sh);
  }
  
   /**
   *query a posDrinksConsume by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksConsume load(Long id)throws DataAccessException
  {
    return load(PosDrinksConsume.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posDrinksConsume query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 15:46
   */
  private void spellSQL(SQLHelper sh,PosDrinksConsume posDrinksConsume)
  {
    if(posDrinksConsume != null){
    	if(posDrinksConsume.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posDrinksConsume.getId());
         }
         if(posDrinksConsume.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posDrinksConsume.getHotelGroupId());
         }
         if(posDrinksConsume.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posDrinksConsume.getHotelId());
         }
        if(posDrinksConsume.getAccnt()!= null){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posDrinksConsume.getAccnt());
        }
        if(isNotNull(posDrinksConsume.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posDrinksConsume.getDescript().trim());
        }
        if(isNotNull(posDrinksConsume.getVolume())){
        	sh.appendSql(" AND obj.descript = ? ");
        	sh.insertValue(posDrinksConsume.getVolume().trim());
        }
       if(posDrinksConsume.getConsumeNumber()!= null){
           sh.appendSql(" AND obj.consumeNumber = ? ");
           sh.insertValue(posDrinksConsume.getConsumeNumber());
        }
       if(isNotNull(posDrinksConsume.getCreateUser())){
           sh.appendSql(" AND obj.createUser = ? ");
           sh.insertValue(posDrinksConsume.getCreateUser().trim());
        }
       if(posDrinksConsume.getCreateDatetime()!= null){
           sh.appendSql(" AND obj.createDatetime = ? ");
           sh.insertValue(posDrinksConsume.getCreateDatetime());
        }
        if(isNotNull(posDrinksConsume.getModifyUser())){
           sh.appendSql(" AND obj.modifyUser = ? ");
           sh.insertValue(posDrinksConsume.getModifyUser().trim());
        }
       if(posDrinksConsume.getModifyDatetime()!= null){
           sh.appendSql(" AND obj.modifyDatetime = ? ");
           sh.insertValue(posDrinksConsume.getModifyDatetime());
        }
    }
  }
}