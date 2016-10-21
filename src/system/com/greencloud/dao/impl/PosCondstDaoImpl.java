package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosCondst;
import com.greencloud.dao.IPosCondstDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosCondst into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosCondstDaoImpl extends BaseDaoImpl implements IPosCondstDao{

  /**
   *save posCondst object  method
   *@param posCondst PosCondst 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosCondst posCondst) throws DataAccessException {
       super.save(posCondst);
  }
  
  /**
   *update posCondst method
   *@param posCondst PosCondst
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosCondst posCondst) throws DataAccessException{
     super.update(posCondst);
  }
  
   /**
   *save or update posCondst object method
   *@param posCondst PosCondst
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosCondst posCondst) throws DataAccessException{
     super.saveOrUpdate(posCondst);
  }
  
   /**
   *query posCondst collection method
   *@param posCondst PosCondst send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCondst> list(PosCondst posCondst,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosCondst obj WHERE 1=1 ");
  	 spellSQL(sh,posCondst);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posCondst PosCondst send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosCondst> list(PosCondst posCondst)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosCondst obj WHERE 1=1 ");
  	 spellSQL(sh,posCondst);
  	 sh.appendSql(" ORDER BY obj.id");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posCondst PosCondst query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosCondst posCondst)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosCondst obj WHERE 1=1 ");
    spellSQL(sh,posCondst);
    return count(sh);
  }
  
   /**
   *query a posCondst by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCondst load(Long id)throws DataAccessException
  {
    return load(PosCondst.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posCondst query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosCondst posCondst)
  {
    if(posCondst != null){
    	if(posCondst.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posCondst.getId());
         }
         if(posCondst.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posCondst.getHotelGroupId());
         }
         if(posCondst.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posCondst.getHotelId());
         }
        if(isNotNull(posCondst.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posCondst.getCode().trim());
        }
        if(isNotNull(posCondst.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posCondst.getDescript().trim());
        }
        if(isNotNull(posCondst.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posCondst.getDescriptEn().trim());
        }
        if(isNotNull(posCondst.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posCondst.getPccode().trim());
        }
        if(isNotNull(posCondst.getSortCode())){
           sh.appendSql(" AND obj.sortCode = ? ");
           sh.insertValue(posCondst.getSortCode().trim());
        }
        if(isNotNull(posCondst.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posCondst.getIsHalt().trim());
        }
       if(posCondst.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posCondst.getListOrder());
        }
        if(isNotNull(posCondst.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posCondst.getCodeType().trim());
        }
        if(isNotNull(posCondst.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posCondst.getGroupCode().trim());
        }
        if(isNotNull(posCondst.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posCondst.getIsGroup().trim());
        }
        if(isNotNull(posCondst.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posCondst.getCreateUser().trim());
         }
        if(posCondst.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posCondst.getCreateDatetime());
         }
         if(isNotNull(posCondst.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posCondst.getModifyUser().trim());
         }
        if(posCondst.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posCondst.getModifyDatetime());
         }
    }
  }

@Override
public List<PosCondst> findPosCondst(Long hotelGroupId, Long hotelId,Date modifyDatetime) {
	SQLHelper sh = new SQLHelper("SELECT obj FROM PosCondst obj WHERE 1=1 ");
	sh.appendSql(" AND obj.hotelGroupId=? ");
	sh.insertValue(hotelGroupId);
	sh.appendSql(" AND obj.hotelId =?  ");
	sh.insertValue(hotelId);
	if (modifyDatetime != null) {
		sh.appendSql(" AND obj.modifyDatetime>? ");
		sh.insertValue(modifyDatetime);
	}
	return find(sh);
}
}