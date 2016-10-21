package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosPccodeNoteType;
import com.greencloud.dao.IPosPccodeNoteTypeDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPccodeNoteType into db
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public class PosPccodeNoteTypeDaoImpl extends BaseDaoImpl implements IPosPccodeNoteTypeDao{

  /**
   *save posPccodeNoteType object  method
   *@param posPccodeNoteType PosPccodeNoteType 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void save(PosPccodeNoteType posPccodeNoteType) throws DataAccessException {
       super.save(posPccodeNoteType);
  }
  
  /**
   *update posPccodeNoteType method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void update(PosPccodeNoteType posPccodeNoteType) throws DataAccessException{
     super.update(posPccodeNoteType);
  }
  
   /**
   *save or update posPccodeNoteType object method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void saveOrUpdate(PosPccodeNoteType posPccodeNoteType) throws DataAccessException{
     super.saveOrUpdate(posPccodeNoteType);
  }
  
   /**
   *query posPccodeNoteType collection method
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29  10:51
   */
  public List<PosPccodeNoteType> list(PosPccodeNoteType posPccodeNoteType,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeNoteType obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeNoteType);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public List<PosPccodeNoteType> list(PosPccodeNoteType posPccodeNoteType)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeNoteType obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeNoteType);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPccodeNoteType PosPccodeNoteType query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-29 10:51
   */
  public int count(PosPccodeNoteType posPccodeNoteType)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPccodeNoteType obj WHERE 1=1 ");
    spellSQL(sh,posPccodeNoteType);
    return count(sh);
  }
  
   /**
   *query a posPccodeNoteType by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-29 10:51
   */
  public PosPccodeNoteType load(Long id)throws DataAccessException
  {
    return load(PosPccodeNoteType.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPccodeNoteType query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-09-29 10:51
   */
  private void spellSQL(SQLHelper sh,PosPccodeNoteType posPccodeNoteType)
  {
    if(posPccodeNoteType != null){
    	if(posPccodeNoteType.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPccodeNoteType.getId());
         }
         if(posPccodeNoteType.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPccodeNoteType.getHotelGroupId());
         }
         if(posPccodeNoteType.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPccodeNoteType.getHotelId());
         }
        if(isNotNull(posPccodeNoteType.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posPccodeNoteType.getPccode().trim());
        }
        if(isNotNull(posPccodeNoteType.getMasterType())){
           sh.appendSql(" AND obj.masterType = ? ");
           sh.insertValue(posPccodeNoteType.getMasterType().trim());
        }
        if(isNotNull(posPccodeNoteType.getNoteCode())){
           sh.appendSql(" AND obj.noteCode = ? ");
           sh.insertValue(posPccodeNoteType.getNoteCode().trim());
        }
        if(isNotNull(posPccodeNoteType.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posPccodeNoteType.getIsHalt().trim());
        }
       if(posPccodeNoteType.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posPccodeNoteType.getListOrder());
        }
        if(isNotNull(posPccodeNoteType.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posPccodeNoteType.getIsGroup().trim());
        }
        if(isNotNull(posPccodeNoteType.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posPccodeNoteType.getGroupCode().trim());
        }
        if(isNotNull(posPccodeNoteType.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posPccodeNoteType.getCodeType().trim());
        }
        if(isNotNull(posPccodeNoteType.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posPccodeNoteType.getCreateUser().trim());
         }
        if(posPccodeNoteType.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posPccodeNoteType.getCreateDatetime());
         }
         if(isNotNull(posPccodeNoteType.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posPccodeNoteType.getModifyUser().trim());
         }
        if(posPccodeNoteType.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posPccodeNoteType.getModifyDatetime());
         }
    }
  }
}