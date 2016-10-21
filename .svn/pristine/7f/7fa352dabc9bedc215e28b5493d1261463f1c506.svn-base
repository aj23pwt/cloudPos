package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosModeDef;
import com.greencloud.dao.IPosModeDefDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosModeDef into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosModeDefDaoImpl extends BaseDaoImpl implements IPosModeDefDao{

  /**
   *save posModeDef object  method
   *@param posModeDef PosModeDef 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosModeDef posModeDef) throws DataAccessException {
       super.save(posModeDef);
  }
  
  /**
   *update posModeDef method
   *@param posModeDef PosModeDef
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosModeDef posModeDef) throws DataAccessException{
     super.update(posModeDef);
  }
  
   /**
   *save or update posModeDef object method
   *@param posModeDef PosModeDef
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosModeDef posModeDef) throws DataAccessException{
     super.saveOrUpdate(posModeDef);
  }
  
   /**
   *query posModeDef collection method
   *@param posModeDef PosModeDef send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeDef> list(PosModeDef posModeDef,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosModeDef obj WHERE 1=1 ");
  	 spellSQL(sh,posModeDef);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posModeDef PosModeDef send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosModeDef> list(PosModeDef posModeDef)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosModeDef obj WHERE 1=1 ");
  	 spellSQL(sh,posModeDef);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posModeDef PosModeDef query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosModeDef posModeDef)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosModeDef obj WHERE 1=1 ");
    spellSQL(sh,posModeDef);
    return count(sh);
  }
  
   /**
   *query a posModeDef by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeDef load(Long id)throws DataAccessException
  {
    return load(PosModeDef.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posModeDef query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosModeDef posModeDef)
  {
    if(posModeDef != null){
    	if(posModeDef.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posModeDef.getId());
         }
         if(posModeDef.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posModeDef.getHotelGroupId());
         }
         if(posModeDef.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posModeDef.getHotelId());
         }
        if(isNotNull(posModeDef.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posModeDef.getCode().trim());
        }
        if(isNotNull(posModeDef.getDescript())){
            sh.appendSql(" AND obj.descript = ? ");
            sh.insertValue(posModeDef.getDescript().trim());
         }
        if(isNotNull(posModeDef.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posModeDef.getPccode().trim());
        }
        if(isNotNull(posModeDef.getPccodeDescript())){
            sh.appendSql(" AND obj.pccodeDescript = ? ");
            sh.insertValue(posModeDef.getPccodeDescript().trim());
         }
        if(isNotNull(posModeDef.getSortCode())){
           sh.appendSql(" AND obj.sortCode = ? ");
           sh.insertValue(posModeDef.getSortCode().trim());
        }
        if(isNotNull(posModeDef.getSortDescript())){
            sh.appendSql(" AND obj.sortDescript = ? ");
            sh.insertValue(posModeDef.getSortDescript().trim());
         }
        if(isNotNull(posModeDef.getPluCode())){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posModeDef.getPluCode().trim());
        }
        if(isNotNull(posModeDef.getPluDescript())){
            sh.appendSql(" AND obj.pluDescript = ? ");
            sh.insertValue(posModeDef.getPluDescript().trim());
         }
        if(isNotNull(posModeDef.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posModeDef.getType().trim());
        }
        if(isNotNull(posModeDef.getClass1())){
            sh.appendSql(" AND obj.class1 = ? ");
            sh.insertValue(posModeDef.getClass1().trim());
         }
         if(isNotNull(posModeDef.getClass2())){
            sh.appendSql(" AND obj.class2 = ? ");
            sh.insertValue(posModeDef.getClass2().trim());
         }
       if(posModeDef.getRate()!= null){
           sh.appendSql(" AND obj.rate = ? ");
           sh.insertValue(posModeDef.getRate());
        }
        if(isNotNull(posModeDef.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posModeDef.getIsHalt().trim());
        }
       if(posModeDef.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posModeDef.getListOrder());
        }
        if(isNotNull(posModeDef.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posModeDef.getCodeType().trim());
        }
        if(isNotNull(posModeDef.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posModeDef.getGroupCode().trim());
        }
        if(isNotNull(posModeDef.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posModeDef.getIsGroup().trim());
        }
        if(isNotNull(posModeDef.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posModeDef.getCreateUser().trim());
         }
        if(posModeDef.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posModeDef.getCreateDatetime());
         }
         if(isNotNull(posModeDef.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posModeDef.getModifyUser().trim());
         }
        if(posModeDef.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posModeDef.getModifyDatetime());
         }
    }
  }
}