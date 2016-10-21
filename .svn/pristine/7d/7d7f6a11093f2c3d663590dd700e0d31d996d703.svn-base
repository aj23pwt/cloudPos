package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStoreMaster;
import com.greencloud.dao.IPosStoreMasterDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStoreMaster into db
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public class PosStoreMasterDaoImpl extends BaseDaoImpl implements IPosStoreMasterDao{

  /**
   *save posStoreMaster object  method
   *@param posStoreMaster PosStoreMaster 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void save(PosStoreMaster posStoreMaster) throws DataAccessException {
       super.save(posStoreMaster);
  }
  
  /**
   *update posStoreMaster method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void update(PosStoreMaster posStoreMaster) throws DataAccessException{
     super.update(posStoreMaster);
  }
  
   /**
   *save or update posStoreMaster object method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdate(PosStoreMaster posStoreMaster) throws DataAccessException{
     super.saveOrUpdate(posStoreMaster);
  }
  
   /**
   *query posStoreMaster collection method
   *@param posStoreMaster PosStoreMaster send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreMaster> list(PosStoreMaster posStoreMaster,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreMaster obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreMaster);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStoreMaster PosStoreMaster send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public List<PosStoreMaster> list(PosStoreMaster posStoreMaster)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreMaster obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreMaster);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStoreMaster PosStoreMaster query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int count(PosStoreMaster posStoreMaster)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStoreMaster obj WHERE 1=1 ");
    spellSQL(sh,posStoreMaster);
    return count(sh);
  }
  
   /**
   *query a posStoreMaster by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreMaster load(Long id)throws DataAccessException
  {
    return load(PosStoreMaster.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStoreMaster query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 13:45
   */
  private void spellSQL(SQLHelper sh,PosStoreMaster posStoreMaster)
  {
    if(posStoreMaster != null){
        if(isNotNull(posStoreMaster.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posStoreMaster.getAccnt().trim());
        }
        if(isNotNull(posStoreMaster.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posStoreMaster.getType().trim());
        }
        if(isNotNull(posStoreMaster.getSourceCode())){
           sh.appendSql(" AND obj.sourceCode = ? ");
           sh.insertValue(posStoreMaster.getSourceCode().trim());
        }
        if(isNotNull(posStoreMaster.getTargetCode())){
           sh.appendSql(" AND obj.targetCode = ? ");
           sh.insertValue(posStoreMaster.getTargetCode().trim());
        }
       if(posStoreMaster.getDate()!= null){
           sh.appendSql(" AND obj.date = ? ");
           sh.insertValue(posStoreMaster.getDate());
        }
        if(isNotNull(posStoreMaster.getInvoice())){
           sh.appendSql(" AND obj.invoice = ? ");
           sh.insertValue(posStoreMaster.getInvoice().trim());
        }
        if(isNotNull(posStoreMaster.getUserCode())){
           sh.appendSql(" AND obj.userCode = ? ");
           sh.insertValue(posStoreMaster.getUserCode().trim());
        }
        if(isNotNull(posStoreMaster.getRemark())){
           sh.appendSql(" AND obj.remark = ? ");
           sh.insertValue(posStoreMaster.getRemark().trim());
        }
        if(posStoreMaster.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStoreMaster.getId());
         }
         if(posStoreMaster.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStoreMaster.getHotelGroupId());
         }
         if(posStoreMaster.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStoreMaster.getHotelId());
         }
         if(isNotNull(posStoreMaster.getCreateUser())){
             sh.appendSql(" AND obj.createUser = ? ");
             sh.insertValue(posStoreMaster.getCreateUser().trim());
          }
         if(posStoreMaster.getCreateDatetime()!= null){
             sh.appendSql(" AND obj.createDatetime = ? ");
             sh.insertValue(posStoreMaster.getCreateDatetime());
          }
          if(isNotNull(posStoreMaster.getModifyUser())){
             sh.appendSql(" AND obj.modifyUser = ? ");
             sh.insertValue(posStoreMaster.getModifyUser().trim());
          }
         if(posStoreMaster.getModifyDatetime()!= null){
             sh.appendSql(" AND obj.modifyDatetime = ? ");
             sh.insertValue(posStoreMaster.getModifyDatetime());
          }
    }
  }
}