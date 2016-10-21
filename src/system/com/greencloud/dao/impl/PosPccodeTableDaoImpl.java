package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosPccodeTable;
import com.greencloud.dao.IPosPccodeTableDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPccodeTable into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public class PosPccodeTableDaoImpl extends BaseDaoImpl implements IPosPccodeTableDao{

  /**
   *save posPccodeTable object  method
   *@param posPccodeTable PosPccodeTable 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccodeTable posPccodeTable) throws DataAccessException {
       super.save(posPccodeTable);
  }
  
  /**
   *update posPccodeTable method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccodeTable posPccodeTable) throws DataAccessException{
     super.update(posPccodeTable);
  }
  
   /**
   *save or update posPccodeTable object method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccodeTable posPccodeTable) throws DataAccessException{
     super.saveOrUpdate(posPccodeTable);
  }
  
   /**
   *query posPccodeTable collection method
   *@param posPccodeTable PosPccodeTable send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeTable> list(PosPccodeTable posPccodeTable,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeTable obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeTable);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPccodeTable PosPccodeTable send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccodeTable> list(PosPccodeTable posPccodeTable)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPccodeTable obj WHERE 1=1 ");
  	 spellSQL(sh,posPccodeTable);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPccodeTable PosPccodeTable query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccodeTable posPccodeTable)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPccodeTable obj WHERE 1=1 ");
    spellSQL(sh,posPccodeTable);
    return count(sh);
  }
  
   /**
   *query a posPccodeTable by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeTable load(Long id)throws DataAccessException
  {
    return load(PosPccodeTable.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPccodeTable query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  private void spellSQL(SQLHelper sh,PosPccodeTable posPccodeTable)
  {
    if(posPccodeTable != null){
    	if(posPccodeTable.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPccodeTable.getId());
         }
         if(posPccodeTable.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPccodeTable.getHotelGroupId());
         }
         if(posPccodeTable.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPccodeTable.getHotelId());
         }
        if(isNotNull(posPccodeTable.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posPccodeTable.getCode().trim());
        }
        if(isNotNull(posPccodeTable.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posPccodeTable.getType().trim());
        }
        if(isNotNull(posPccodeTable.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posPccodeTable.getPccode().trim());
        }
        if(isNotNull(posPccodeTable.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posPccodeTable.getDescript().trim());
        }
        if(isNotNull(posPccodeTable.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posPccodeTable.getDescriptEn().trim());
        }
        if(isNotNull(posPccodeTable.getSta())){
           sh.appendSql(" AND obj.sta = ? ");
           sh.insertValue(posPccodeTable.getSta().trim());
        }
        if(isNotNull(posPccodeTable.getMode())){
           sh.appendSql(" AND obj.mode = ? ");
           sh.insertValue(posPccodeTable.getMode().trim());
        }
       if(posPccodeTable.getAmount()!= null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posPccodeTable.getAmount());
        }
       if(posPccodeTable.getMinId()!= null){
           sh.appendSql(" AND obj.minId = ? ");
           sh.insertValue(posPccodeTable.getMinId());
        }
        if(isNotNull(posPccodeTable.getArea())){
           sh.appendSql(" AND obj.area = ? ");
           sh.insertValue(posPccodeTable.getArea().trim());
        }
        if(isNotNull(posPccodeTable.getRegcode())){
           sh.appendSql(" AND obj.regcode = ? ");
           sh.insertValue(posPccodeTable.getRegcode().trim());
        }
       if(posPccodeTable.getX()!= null){
           sh.appendSql(" AND obj.x = ? ");
           sh.insertValue(posPccodeTable.getX());
        }
       if(posPccodeTable.getY()!= null){
           sh.appendSql(" AND obj.y = ? ");
           sh.insertValue(posPccodeTable.getY());
        }
       if(posPccodeTable.getWidth()!= null){
           sh.appendSql(" AND obj.width = ? ");
           sh.insertValue(posPccodeTable.getWidth());
        }
       if(posPccodeTable.getHeight()!= null){
           sh.appendSql(" AND obj.height = ? ");
           sh.insertValue(posPccodeTable.getHeight());
        }
        if(isNotNull(posPccodeTable.getTag())){
           sh.appendSql(" AND obj.tag = ? ");
           sh.insertValue(posPccodeTable.getTag().trim());
        }
        if(isNotNull(posPccodeTable.getMapcode())){
           sh.appendSql(" AND obj.mapcode = ? ");
           sh.insertValue(posPccodeTable.getMapcode().trim());
        }
        if(isNotNull(posPccodeTable.getModi())){
           sh.appendSql(" AND obj.modi = ? ");
           sh.insertValue(posPccodeTable.getModi().trim());
        }
        if(isNotNull(posPccodeTable.getReason())){
           sh.appendSql(" AND obj.reason = ? ");
           sh.insertValue(posPccodeTable.getReason().trim());
        }
        if(isNotNull(posPccodeTable.getPlacecode())){
           sh.appendSql(" AND obj.placecode = ? ");
           sh.insertValue(posPccodeTable.getPlacecode().trim());
        }
        if(isNotNull(posPccodeTable.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posPccodeTable.getIsGroup().trim());
        }
        if(isNotNull(posPccodeTable.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posPccodeTable.getGroupCode().trim());
        }
        if(isNotNull(posPccodeTable.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posPccodeTable.getCodeType().trim());
        }
        if(isNotNull(posPccodeTable.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posPccodeTable.getIsHalt().trim());
        }
       if(posPccodeTable.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posPccodeTable.getListOrder());
        }
       if(isNotNull(posPccodeTable.getCreateUser())){
           sh.appendSql(" AND obj.createUser = ? ");
           sh.insertValue(posPccodeTable.getCreateUser().trim());
        }
       if(posPccodeTable.getCreateDatetime()!= null){
           sh.appendSql(" AND obj.createDatetime = ? ");
           sh.insertValue(posPccodeTable.getCreateDatetime());
        }
        if(isNotNull(posPccodeTable.getModifyUser())){
           sh.appendSql(" AND obj.modifyUser = ? ");
           sh.insertValue(posPccodeTable.getModifyUser().trim());
        }
       if(posPccodeTable.getModifyDatetime()!= null){
           sh.appendSql(" AND obj.modifyDatetime = ? ");
           sh.insertValue(posPccodeTable.getModifyDatetime());
        }
    }
  }
}