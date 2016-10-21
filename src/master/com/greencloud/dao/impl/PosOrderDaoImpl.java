package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosOrder;
import com.greencloud.dao.IPosOrderDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosOrder into db
   *@author 
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public class PosOrderDaoImpl extends BaseDaoImpl implements IPosOrderDao{

  /**
   *save posOrder object  method
   *@param posOrder PosOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public void save(PosOrder posOrder) throws DataAccessException {
       super.save(posOrder);
  }
  
  /**
   *update posOrder method
   *@param posOrder PosOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public void update(PosOrder posOrder) throws DataAccessException{
     super.update(posOrder);
  }
  
   /**
   *save or update posOrder object method
   *@param posOrder PosOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public void saveOrUpdate(PosOrder posOrder) throws DataAccessException{
     super.saveOrUpdate(posOrder);
  }
  
   /**
   *query posOrder collection method
   *@param posOrder PosOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-27  09:43
   */
  public List<PosOrder> list(PosOrder posOrder,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosOrder obj WHERE 1=1 ");
  	 spellSQL(sh,posOrder);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posOrder PosOrder send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public List<PosOrder> list(PosOrder posOrder)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosOrder obj WHERE 1=1 ");
  	 spellSQL(sh,posOrder);
  	 sh.appendSql(" ORDER BY obj.id");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posOrder PosOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-27 09:43
   */
  public int count(PosOrder posOrder)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosOrder obj WHERE 1=1 ");
    spellSQL(sh,posOrder);
    return count(sh);
  }
  
   /**
   *query a posOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-27 09:43
   */
  public PosOrder load(Long id)throws DataAccessException
  {
    return load(PosOrder.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posOrder query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-04-27 09:43
   */
  private void spellSQL(SQLHelper sh,PosOrder posOrder)
  {
    if(posOrder != null){
    	if(posOrder.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posOrder.getId());
         }
         if(posOrder.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posOrder.getHotelGroupId());
         }
         if(posOrder.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posOrder.getHotelId());
         }
        if(isNotNull(posOrder.getPcid())){
           sh.appendSql(" AND obj.pcid = ? ");
           sh.insertValue(posOrder.getPcid().trim());
        }
        if(isNotNull(posOrder.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posOrder.getAccnt().trim());
        }
       if(posOrder.getInumber()!= null){
           sh.appendSql(" AND obj.inumber = ? ");
           sh.insertValue(posOrder.getInumber());
        }
       if(posOrder.getTnumber()!= null){
           sh.appendSql(" AND obj.tnumber = ? ");
           sh.insertValue(posOrder.getTnumber());
        }
       if(posOrder.getAnumber()!= null){
           sh.appendSql(" AND obj.anumber = ? ");
           sh.insertValue(posOrder.getAnumber());
        }
       if(posOrder.getMnumber()!= null){
           sh.appendSql(" AND obj.mnumber = ? ");
           sh.insertValue(posOrder.getMnumber());
        }
        if(isNotNull(posOrder.getType())){
           sh.appendSql(" AND obj.type = ? ");
           sh.insertValue(posOrder.getType().trim());
        }
        if(isNotNull(posOrder.getOrderno())){
           sh.appendSql(" AND obj.orderno = ? ");
           sh.insertValue(posOrder.getOrderno().trim());
        }
       if(isNotNull(posOrder.getCondCode())){
           sh.appendSql(" AND obj.condCode = ? ");
           sh.insertValue(posOrder.getCondCode());
        }
        if(isNotNull(posOrder.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posOrder.getDescript().trim());
        }
        if(isNotNull(posOrder.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posOrder.getDescriptEn().trim());
        }
        if(isNotNull(posOrder.getNoteCode())){
           sh.appendSql(" AND obj.noteCode = ? ");
           sh.insertValue(posOrder.getNoteCode().trim());
        }
        if(isNotNull(posOrder.getSortCode())){
           sh.appendSql(" AND obj.sortCode = ? ");
           sh.insertValue(posOrder.getSortCode().trim());
        }
        if(isNotNull(posOrder.getPluCode())){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posOrder.getPluCode().trim());
        }
       if(posOrder.getPinumber()!= null){
           sh.appendSql(" AND obj.pinumber = ? ");
           sh.insertValue(posOrder.getPinumber());
        }
        if(isNotNull(posOrder.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posOrder.getUnit().trim());
        }
       if(posOrder.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posOrder.getPrice());
        }
       if(posOrder.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posOrder.getNumber());
        }
       if(posOrder.getAmount()!= null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posOrder.getAmount());
        }
        if(isNotNull(posOrder.getSta())){
           sh.appendSql(" AND obj.sta = ? ");
           sh.insertValue(posOrder.getSta().trim());
        }
        if(isNotNull(posOrder.getFlag())){
           sh.appendSql(" AND obj.flag = ? ");
           sh.insertValue(posOrder.getFlag().trim());
        }
        if(isNotNull(posOrder.getFlag1())){
           sh.appendSql(" AND obj.flag1 = ? ");
           sh.insertValue(posOrder.getFlag1().trim());
        }
        if(isNotNull(posOrder.getEmpid())){
           sh.appendSql(" AND obj.empid = ? ");
           sh.insertValue(posOrder.getEmpid().trim());
        }
       if(posOrder.getLogdate()!= null){
           sh.appendSql(" AND obj.logdate = ? ");
           sh.insertValue(posOrder.getLogdate());
        }
        if(isNotNull(posOrder.getSaleid())){
           sh.appendSql(" AND obj.saleid = ? ");
           sh.insertValue(posOrder.getSaleid().trim());
        }
        if(isNotNull(posOrder.getTableno())){
           sh.appendSql(" AND obj.tableno = ? ");
           sh.insertValue(posOrder.getTableno().trim());
        }
        if(isNotNull(posOrder.getSiteno())){
           sh.appendSql(" AND obj.siteno = ? ");
           sh.insertValue(posOrder.getSiteno().trim());
        }
        if(isNotNull(posOrder.getCook())){
           sh.appendSql(" AND obj.cook = ? ");
           sh.insertValue(posOrder.getCook().trim());
        }
        if(isNotNull(posOrder.getRemark())){
           sh.appendSql(" AND obj.remark = ? ");
           sh.insertValue(posOrder.getRemark().trim());
        }
        if(isNotNull(posOrder.getPrinter())){
           sh.appendSql(" AND obj.printer = ? ");
           sh.insertValue(posOrder.getPrinter().trim());
        }
        if(isNotNull(posOrder.getEmpid1())){
           sh.appendSql(" AND obj.empid1 = ? ");
           sh.insertValue(posOrder.getEmpid1().trim());
        }
        if(isNotNull(posOrder.getEmpid2())){
           sh.appendSql(" AND obj.empid2 = ? ");
           sh.insertValue(posOrder.getEmpid2().trim());
        }
        if(isNotNull(posOrder.getEmpid3())){
           sh.appendSql(" AND obj.empid3 = ? ");
           sh.insertValue(posOrder.getEmpid3().trim());
        }
        if(isNotNull(posOrder.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posOrder.getCreateUser().trim());
         }
        if(posOrder.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posOrder.getCreateDatetime());
         }
         if(isNotNull(posOrder.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posOrder.getModifyUser().trim());
         }
        if(posOrder.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posOrder.getModifyDatetime());
         }
    }
  }
}