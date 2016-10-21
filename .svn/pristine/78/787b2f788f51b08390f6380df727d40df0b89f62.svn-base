package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosTableSync;
import com.greencloud.dao.IPosTableSyncDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosTableSync into db
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public class PosTableSyncDaoImpl extends BaseDaoImpl implements IPosTableSyncDao{

  /**
   *save posTableSync object  method
   *@param posTableSync PosTableSync 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void save(PosTableSync posTableSync) throws DataAccessException {
       super.save(posTableSync);
  }
  
  /**
   *update posTableSync method
   *@param posTableSync PosTableSync
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void update(PosTableSync posTableSync) throws DataAccessException{
     super.update(posTableSync);
  }
  
   /**
   *save or update posTableSync object method
   *@param posTableSync PosTableSync
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void saveOrUpdate(PosTableSync posTableSync) throws DataAccessException{
     super.saveOrUpdate(posTableSync);
  }
  
   /**
   *query posTableSync collection method
   *@param posTableSync PosTableSync send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06  15:32
   */
  public List<PosTableSync> list(PosTableSync posTableSync,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosTableSync obj WHERE 1=1 ");
  	 spellSQL(sh,posTableSync);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posTableSync PosTableSync send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public List<PosTableSync> list(PosTableSync posTableSync)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosTableSync obj WHERE 1=1 ");
  	 spellSQL(sh,posTableSync);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posTableSync PosTableSync query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-09-06 15:32
   */
  public int count(PosTableSync posTableSync)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosTableSync obj WHERE 1=1 ");
    spellSQL(sh,posTableSync);
    return count(sh);
  }
  
   /**
   *query a posTableSync by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-09-06 15:32
   */
  public PosTableSync load(Long id)throws DataAccessException
  {
    return load(PosTableSync.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posTableSync query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-09-06 15:32
   */
  private void spellSQL(SQLHelper sh,PosTableSync posTableSync)
  {
    if(posTableSync != null){
    	if(posTableSync.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posTableSync.getId());
         }
         if(posTableSync.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posTableSync.getHotelGroupId());
         }
         if(posTableSync.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posTableSync.getHotelId());
         }
        if(isNotNull(posTableSync.getEntityName())){
           sh.appendSql(" AND obj.entityName = ? ");
           sh.insertValue(posTableSync.getEntityName().trim());
        }
        if(isNotNull(posTableSync.getDataFrom())){
           sh.appendSql(" AND obj.dataFrom = ? ");
           sh.insertValue(posTableSync.getDataFrom().trim());
        }
        if(isNotNull(posTableSync.getDataTo())){
           sh.appendSql(" AND obj.dataTo = ? ");
           sh.insertValue(posTableSync.getDataTo().trim());
        }
        if(isNotNull(posTableSync.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posTableSync.getType().trim());
        }
        if(isNotNull(posTableSync.getIsSync())){
           sh.appendSql(" AND obj.isSync = ? ");
           sh.insertValue(posTableSync.getIsSync().trim());
        }
        if(isNotNull(posTableSync.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posTableSync.getIsHalt().trim());
        }
        if(isNotNull(posTableSync.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posTableSync.getCreateUser().trim());
         }
        if(posTableSync.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posTableSync.getCreateDatetime());
         }
         if(isNotNull(posTableSync.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posTableSync.getModifyUser().trim());
         }
        if(posTableSync.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posTableSync.getModifyDatetime());
         }
    }
  }
}