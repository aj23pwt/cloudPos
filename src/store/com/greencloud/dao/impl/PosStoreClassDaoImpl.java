package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStoreClass;
import com.greencloud.dao.IPosStoreClassDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStoreClass into db
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public class PosStoreClassDaoImpl extends BaseDaoImpl implements IPosStoreClassDao{

  /**
   *save posStoreClass object  method
   *@param posStoreClass PosStoreClass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void save(PosStoreClass posStoreClass) throws DataAccessException {
       super.save(posStoreClass);
  }
  
  /**
   *update posStoreClass method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void update(PosStoreClass posStoreClass) throws DataAccessException{
     super.update(posStoreClass);
  }
  
   /**
   *save or update posStoreClass object method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdate(PosStoreClass posStoreClass) throws DataAccessException{
     super.saveOrUpdate(posStoreClass);
  }
  
   /**
   *query posStoreClass collection method
   *@param posStoreClass PosStoreClass send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreClass> list(PosStoreClass posStoreClass,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreClass obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreClass);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStoreClass PosStoreClass send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public List<PosStoreClass> list(PosStoreClass posStoreClass)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreClass obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreClass);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStoreClass PosStoreClass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int count(PosStoreClass posStoreClass)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStoreClass obj WHERE 1=1 ");
    spellSQL(sh,posStoreClass);
    return count(sh);
  }
  
   /**
   *query a posStoreClass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreClass load(Long id)throws DataAccessException
  {
    return load(PosStoreClass.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStoreClass query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 13:38
   */
  private void spellSQL(SQLHelper sh,PosStoreClass posStoreClass)
  {
    if(posStoreClass != null){
    	if(posStoreClass.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStoreClass.getId());
         }
         if(posStoreClass.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStoreClass.getHotelGroupId());
         }
         if(posStoreClass.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStoreClass.getHotelId());
         }
        if(isNotNull(posStoreClass.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posStoreClass.getCode().trim());
        }
        if(isNotNull(posStoreClass.getName())){
           sh.appendSql(" AND obj.name = ? ");
           sh.insertValue(posStoreClass.getName().trim());
        }
        if(isNotNull(posStoreClass.getEngName())){
           sh.appendSql(" AND obj.engName = ? ");
           sh.insertValue(posStoreClass.getEngName().trim());
        }
        if(isNotNull(posStoreClass.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posStoreClass.getIsGroup().trim());
        }
        if(isNotNull(posStoreClass.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posStoreClass.getGroupCode().trim());
        }
        if(isNotNull(posStoreClass.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posStoreClass.getCodeType().trim());
        }
        if(isNotNull(posStoreClass.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posStoreClass.getCreateUser().trim());
         }
        if(posStoreClass.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posStoreClass.getCreateDatetime());
         }
         if(isNotNull(posStoreClass.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posStoreClass.getModifyUser().trim());
         }
        if(posStoreClass.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posStoreClass.getModifyDatetime());
         }
    }
  }
}