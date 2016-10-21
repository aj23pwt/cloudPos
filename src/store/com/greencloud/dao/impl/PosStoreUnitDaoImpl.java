package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStoreUnit;
import com.greencloud.dao.IPosStoreUnitDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStoreUnit into db
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public class PosStoreUnitDaoImpl extends BaseDaoImpl implements IPosStoreUnitDao{

  /**
   *save posStoreUnit object  method
   *@param posStoreUnit PosStoreUnit 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void save(PosStoreUnit posStoreUnit) throws DataAccessException {
       super.save(posStoreUnit);
  }
  
  /**
   *update posStoreUnit method
   *@param posStoreUnit PosStoreUnit
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void update(PosStoreUnit posStoreUnit) throws DataAccessException{
     super.update(posStoreUnit);
  }
  
   /**
   *save or update posStoreUnit object method
   *@param posStoreUnit PosStoreUnit
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void saveOrUpdate(PosStoreUnit posStoreUnit) throws DataAccessException{
     super.saveOrUpdate(posStoreUnit);
  }
  
   /**
   *query posStoreUnit collection method
   *@param posStoreUnit PosStoreUnit send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18  15:49
   */
  public List<PosStoreUnit> list(PosStoreUnit posStoreUnit,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreUnit obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreUnit);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStoreUnit PosStoreUnit send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public List<PosStoreUnit> list(PosStoreUnit posStoreUnit)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreUnit obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreUnit);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStoreUnit PosStoreUnit query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-18 15:49
   */
  public int count(PosStoreUnit posStoreUnit)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStoreUnit obj WHERE 1=1 ");
    spellSQL(sh,posStoreUnit);
    return count(sh);
  }
  
   /**
   *query a posStoreUnit by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-18 15:49
   */
  public PosStoreUnit load(Long id)throws DataAccessException
  {
    return load(PosStoreUnit.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStoreUnit query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-18 15:49
   */
  private void spellSQL(SQLHelper sh,PosStoreUnit posStoreUnit)
  {
    if(posStoreUnit != null){
        if(isNotNull(posStoreUnit.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posStoreUnit.getCode().trim());
        }
        if(isNotNull(posStoreUnit.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posStoreUnit.getDescript().trim());
        }
        if(isNotNull(posStoreUnit.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posStoreUnit.getDescriptEn().trim());
        }
        
        if(posStoreUnit.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStoreUnit.getId());
         }
         if(posStoreUnit.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStoreUnit.getHotelGroupId());
         }
         if(posStoreUnit.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStoreUnit.getHotelId());
         }
         if(isNotNull(posStoreUnit.getCreateUser())){
             sh.appendSql(" AND obj.createUser = ? ");
             sh.insertValue(posStoreUnit.getCreateUser().trim());
          }
         if(posStoreUnit.getCreateDatetime()!= null){
             sh.appendSql(" AND obj.createDatetime = ? ");
             sh.insertValue(posStoreUnit.getCreateDatetime());
          }
          if(isNotNull(posStoreUnit.getModifyUser())){
             sh.appendSql(" AND obj.modifyUser = ? ");
             sh.insertValue(posStoreUnit.getModifyUser().trim());
          }
         if(posStoreUnit.getModifyDatetime()!= null){
             sh.appendSql(" AND obj.modifyDatetime = ? ");
             sh.insertValue(posStoreUnit.getModifyDatetime());
          }
    }
  }
}