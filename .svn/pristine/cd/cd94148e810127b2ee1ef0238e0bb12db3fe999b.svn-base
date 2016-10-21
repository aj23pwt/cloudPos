package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosModeName;
import com.greencloud.dao.IPosModeNameDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosModeName into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosModeNameDaoImpl extends BaseDaoImpl implements IPosModeNameDao{

  /**
   *save posModeName object  method
   *@param posModeName PosModeName 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosModeName posModeName) throws DataAccessException {
       super.save(posModeName);
  }
  
  /**
   *update posModeName method
   *@param posModeName PosModeName
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosModeName posModeName) throws DataAccessException{
     super.update(posModeName);
  }
  
   /**
   *save or update posModeName object method
   *@param posModeName PosModeName
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosModeName posModeName) throws DataAccessException{
     super.saveOrUpdate(posModeName);
  }
  
   /**
   *query posModeName collection method
   *@param posModeName PosModeName send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeName> list(PosModeName posModeName,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosModeName obj WHERE 1=1 ");
  	 spellSQL(sh,posModeName);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posModeName PosModeName send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosModeName> list(PosModeName posModeName)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosModeName obj WHERE 1=1 ");
  	 spellSQL(sh,posModeName);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posModeName PosModeName query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosModeName posModeName)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosModeName obj WHERE 1=1 ");
    spellSQL(sh,posModeName);
    return count(sh);
  }
  
   /**
   *query a posModeName by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeName load(Long id)throws DataAccessException
  {
    return load(PosModeName.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posModeName query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosModeName posModeName)
  {
    if(posModeName != null){
    	if(posModeName.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posModeName.getId());
         }
         if(posModeName.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posModeName.getHotelGroupId());
         }
         if(posModeName.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posModeName.getHotelId());
         }
        if(isNotNull(posModeName.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posModeName.getCode().trim());
        }
        if(isNotNull(posModeName.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posModeName.getType().trim());
        }
        if(isNotNull(posModeName.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posModeName.getDescript().trim());
        }
        if(isNotNull(posModeName.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posModeName.getDescriptEn().trim());
        }
        if(isNotNull(posModeName.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posModeName.getIsHalt().trim());
        }
       if(posModeName.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posModeName.getListOrder());
        }
        if(isNotNull(posModeName.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posModeName.getCodeType().trim());
        }
        if(isNotNull(posModeName.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posModeName.getGroupCode().trim());
        }
        if(isNotNull(posModeName.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posModeName.getIsGroup().trim());
        }
        if(isNotNull(posModeName.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posModeName.getCreateUser().trim());
         }
        if(posModeName.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posModeName.getCreateDatetime());
         }
         if(isNotNull(posModeName.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posModeName.getModifyUser().trim());
         }
        if(posModeName.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posModeName.getModifyDatetime());
         }
    }
  }
}