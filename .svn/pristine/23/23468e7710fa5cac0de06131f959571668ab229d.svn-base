package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosSysReason;
import com.greencloud.dao.IPosSysReasonDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosSysReason into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosSysReasonDaoImpl extends BaseDaoImpl implements IPosSysReasonDao{

  /**
   *save posSysReason object  method
   *@param posSysReason PosSysReason 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosSysReason posSysReason) throws DataAccessException {
       super.save(posSysReason);
  }
  
  /**
   *update posSysReason method
   *@param posSysReason PosSysReason
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosSysReason posSysReason) throws DataAccessException{
     super.update(posSysReason);
  }
  
   /**
   *save or update posSysReason object method
   *@param posSysReason PosSysReason
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosSysReason posSysReason) throws DataAccessException{
     super.saveOrUpdate(posSysReason);
  }
  
   /**
   *query posSysReason collection method
   *@param posSysReason PosSysReason send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosSysReason> list(PosSysReason posSysReason,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosSysReason obj WHERE 1=1 ");
  	 spellSQL(sh,posSysReason);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posSysReason PosSysReason send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosSysReason> list(PosSysReason posSysReason)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosSysReason obj WHERE 1=1 ");
  	 spellSQL(sh,posSysReason);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posSysReason PosSysReason query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosSysReason posSysReason)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosSysReason obj WHERE 1=1 ");
    spellSQL(sh,posSysReason);
    return count(sh);
  }
  
   /**
   *query a posSysReason by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosSysReason load(Long id)throws DataAccessException
  {
    return load(PosSysReason.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posSysReason query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosSysReason posSysReason)
  {
    if(posSysReason != null){
    	if(posSysReason.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posSysReason.getId());
         }
         if(posSysReason.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posSysReason.getHotelGroupId());
         }
         if(posSysReason.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posSysReason.getHotelId());
         }
        if(isNotNull(posSysReason.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posSysReason.getCode().trim());
        }
        if(isNotNull(posSysReason.getDscType())){
           sh.appendSql(" AND obj.dscType = ? ");
           sh.insertValue(posSysReason.getDscType().trim());
        }
        if(isNotNull(posSysReason.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posSysReason.getDescript().trim());
        }
        if(isNotNull(posSysReason.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posSysReason.getDescriptEn().trim());
        }
       if(posSysReason.getP01()!= null){
           sh.appendSql(" AND obj.p01 = ? ");
           sh.insertValue(posSysReason.getP01());
        }
       if(posSysReason.getP02()!= null){
           sh.appendSql(" AND obj.p02 = ? ");
           sh.insertValue(posSysReason.getP02());
        }
       if(posSysReason.getP03()!= null){
           sh.appendSql(" AND obj.p03 = ? ");
           sh.insertValue(posSysReason.getP03());
        }
       if(posSysReason.getP04()!= null){
           sh.appendSql(" AND obj.p04 = ? ");
           sh.insertValue(posSysReason.getP04());
        }
       if(posSysReason.getP90()!= null){
           sh.appendSql(" AND obj.p90 = ? ");
           sh.insertValue(posSysReason.getP90());
        }
        if(isNotNull(posSysReason.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posSysReason.getIsHalt().trim());
        }
       if(posSysReason.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posSysReason.getListOrder());
        }
        if(isNotNull(posSysReason.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posSysReason.getCodeType().trim());
        }
        if(isNotNull(posSysReason.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posSysReason.getGroupCode().trim());
        }
        if(isNotNull(posSysReason.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posSysReason.getIsGroup().trim());
        }
        if(isNotNull(posSysReason.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posSysReason.getCreateUser().trim());
         }
        if(posSysReason.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posSysReason.getCreateDatetime());
         }
         if(isNotNull(posSysReason.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posSysReason.getModifyUser().trim());
         }
        if(posSysReason.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posSysReason.getModifyDatetime());
         }
    }
  }
}