package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosPccodeShift;
import com.greencloud.dao.IPosPccodeShiftDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPccodeShift into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public class PosPccodeShiftDaoImpl extends BaseDaoImpl implements IPosPccodeShiftDao{

  /**
   *save posPccodeShift object  method
   *@param posPccodeShift PosPccodeShift 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccodeShift posPccodeShift) throws DataAccessException {
       super.save(posPccodeShift);
  }
  
  /**
   *update posPccodeShift method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccodeShift posPccodeShift) throws DataAccessException{
     super.update(posPccodeShift);
  }
  
   /**
   *save or update posPccodeShift object method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccodeShift posPccodeShift) throws DataAccessException{
     super.saveOrUpdate(posPccodeShift);
  }
  
   /**
   *query posPccodeShift collection method
   *@param posPccodeShift PosPccodeShift send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeShift> list(PosPccodeShift posPccodeShift,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeShift obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeShift);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPccodeShift PosPccodeShift send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccodeShift> list(PosPccodeShift posPccodeShift)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeShift obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeShift);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPccodeShift PosPccodeShift query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccodeShift posPccodeShift)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPccodeShift obj WHERE 1=1 ");
    spellSQL(sh,posPccodeShift);
    return count(sh);
  }
  
   /**
   *query a posPccodeShift by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeShift load(Long id)throws DataAccessException
  {
    return load(PosPccodeShift.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPccodeShift query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  private void spellSQL(SQLHelper sh,PosPccodeShift posPccodeShift)
  {
    if(posPccodeShift != null){
    	if(posPccodeShift.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPccodeShift.getId());
         }
         if(posPccodeShift.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPccodeShift.getHotelGroupId());
         }
         if(posPccodeShift.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPccodeShift.getHotelId());
         }
        if(isNotNull(posPccodeShift.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posPccodeShift.getCode().trim());
        }
        if(isNotNull(posPccodeShift.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posPccodeShift.getPccode().trim());
        }
        if(isNotNull(posPccodeShift.getShift())){
           sh.appendSql(" AND obj.shift = ? ");
           sh.insertValue(posPccodeShift.getShift().trim());
        }
        if(isNotNull(posPccodeShift.getTaCode())){
            sh.appendSql(" AND obj.taCode = ? ");
            sh.insertValue(posPccodeShift.getTaCode().trim());
         }
        if(isNotNull(posPccodeShift.getBeginTime())){
           sh.appendSql(" AND obj.beginTime = ? ");
           sh.insertValue(posPccodeShift.getBeginTime().trim());
        }
        if(isNotNull(posPccodeShift.getEndTime())){
           sh.appendSql(" AND obj.endTime = ? ");
           sh.insertValue(posPccodeShift.getEndTime().trim());
        }
        if(isNotNull(posPccodeShift.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posPccodeShift.getIsGroup().trim());
        }
        if(isNotNull(posPccodeShift.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posPccodeShift.getGroupCode().trim());
        }
        if(isNotNull(posPccodeShift.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posPccodeShift.getCodeType().trim());
        }
        if(isNotNull(posPccodeShift.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posPccodeShift.getCreateUser().trim());
         }
        if(posPccodeShift.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posPccodeShift.getCreateDatetime());
         }
         if(isNotNull(posPccodeShift.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posPccodeShift.getModifyUser().trim());
         }
        if(posPccodeShift.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posPccodeShift.getModifyDatetime());
         }
    }
  }
}