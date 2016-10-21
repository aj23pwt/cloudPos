package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosPluStd;
import com.greencloud.dao.IPosPluStdDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPluStd into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosPluStdDaoImpl extends BaseDaoImpl implements IPosPluStdDao{

  /**
   *save posPluStd object  method
   *@param posPluStd PosPluStd 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosPluStd posPluStd) throws DataAccessException {
       super.save(posPluStd);
  }
  
  /**
   *update posPluStd method
   *@param posPluStd PosPluStd
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosPluStd posPluStd) throws DataAccessException{
     super.update(posPluStd);
  }
  
   /**
   *save or update posPluStd object method
   *@param posPluStd PosPluStd
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosPluStd posPluStd) throws DataAccessException{
     super.saveOrUpdate(posPluStd);
  }
  
   /**
   *query posPluStd collection method
   *@param posPluStd PosPluStd send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPluStd> list(PosPluStd posPluStd,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPluStd obj WHERE 1=1 ");
  	 spellSQL(sh,posPluStd);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPluStd PosPluStd send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosPluStd> list(PosPluStd posPluStd)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPluStd obj WHERE 1=1 ");
  	 spellSQL(sh,posPluStd);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPluStd PosPluStd query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosPluStd posPluStd)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPluStd obj WHERE 1=1 ");
    spellSQL(sh,posPluStd);
    return count(sh);
  }
  
   /**
   *query a posPluStd by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPluStd load(Long id)throws DataAccessException
  {
    return load(PosPluStd.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPluStd query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosPluStd posPluStd)
  {
    if(posPluStd != null){
    	if(posPluStd.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPluStd.getId());
         }
         if(posPluStd.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPluStd.getHotelGroupId());
         }
         if(posPluStd.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPluStd.getHotelId());
         }
         if(isNotNull(posPluStd.getCode())){
             sh.appendSql(" AND obj.code = ? ");
             sh.insertValue(posPluStd.getCode().trim());
          }
         if(isNotNull(posPluStd.getDescript())){
             sh.appendSql(" AND obj.descript = ? ");
             sh.insertValue(posPluStd.getDescript().trim());
          }
          if(isNotNull(posPluStd.getDescriptEn())){
             sh.appendSql(" AND obj.descriptEn = ? ");
             sh.insertValue(posPluStd.getDescriptEn().trim());
          }
          if(isNotNull(posPluStd.getNoteCode())){
              sh.appendSql(" AND obj.noteCode = ? ");
              sh.insertValue(posPluStd.getNoteCode().trim());
           }
        if(isNotNull(posPluStd.getSortCode())){
           sh.appendSql(" AND obj.sortCode = ? ");
           sh.insertValue(posPluStd.getSortCode().trim());
        }
        if(isNotNull(posPluStd.getSortDescript())){
            sh.appendSql(" AND obj.sortDescript = ? ");
            sh.insertValue(posPluStd.getSortDescript().trim());
         }
        if(isNotNull(posPluStd.getPluCode())){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posPluStd.getPluCode().trim());
        }
        if(isNotNull(posPluStd.getPluDescript())){
            sh.appendSql(" AND obj.pluDescript = ? ");
            sh.insertValue(posPluStd.getPluDescript().trim());
         }
        if(isNotNull(posPluStd.getFlag())){
            sh.appendSql(" AND obj.flag = ? ");
            sh.insertValue(posPluStd.getFlag().trim());
         }
       if(posPluStd.getPinumber()!= null){
           sh.appendSql(" AND obj.pinumber = ? ");
           sh.insertValue(posPluStd.getPinumber());
        }
        if(isNotNull(posPluStd.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posPluStd.getUnit().trim());
        }
       if(posPluStd.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posPluStd.getNumber());
        }
       if(posPluStd.getPrice0()!= null){
           sh.appendSql(" AND obj.price0 = ? ");
           sh.insertValue(posPluStd.getPrice0());
        }
       if(posPluStd.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posPluStd.getPrice());
        }
        if(isNotNull(posPluStd.getTag())){
           sh.appendSql(" AND obj.tag = ? ");
           sh.insertValue(posPluStd.getTag().trim());
        }
        if(isNotNull(posPluStd.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posPluStd.getIsHalt().trim());
        }
       if(posPluStd.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posPluStd.getListOrder());
        }
        if(isNotNull(posPluStd.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posPluStd.getCodeType().trim());
        }
        if(isNotNull(posPluStd.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posPluStd.getGroupCode().trim());
        }
        if(isNotNull(posPluStd.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posPluStd.getIsGroup().trim());
        }
        if(isNotNull(posPluStd.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posPluStd.getCreateUser().trim());
         }
        if(posPluStd.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posPluStd.getCreateDatetime());
         }
         if(isNotNull(posPluStd.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posPluStd.getModifyUser().trim());
         }
        if(posPluStd.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posPluStd.getModifyDatetime());
         }
    }
  }
}