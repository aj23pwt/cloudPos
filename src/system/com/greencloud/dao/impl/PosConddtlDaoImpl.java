package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosConddtl;
import com.greencloud.dao.IPosConddtlDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosConddtl into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosConddtlDaoImpl extends BaseDaoImpl implements IPosConddtlDao{

  /**
   *save posConddtl object  method
   *@param posConddtl PosConddtl 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosConddtl posConddtl) throws DataAccessException {
       super.save(posConddtl);
  }
  
  /**
   *update posConddtl method
   *@param posConddtl PosConddtl
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosConddtl posConddtl) throws DataAccessException{
     super.update(posConddtl);
  }
  
   /**
   *save or update posConddtl object method
   *@param posConddtl PosConddtl
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosConddtl posConddtl) throws DataAccessException{
     super.saveOrUpdate(posConddtl);
  }
  
   /**
   *query posConddtl collection method
   *@param posConddtl PosConddtl send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosConddtl> list(PosConddtl posConddtl,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosConddtl obj WHERE 1=1 ");
  	 spellSQL(sh,posConddtl);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posConddtl PosConddtl send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosConddtl> list(PosConddtl posConddtl)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosConddtl obj WHERE 1=1 ");
  	 spellSQL(sh,posConddtl);
  	 sh.appendSql(" ORDER BY obj.id");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posConddtl PosConddtl query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosConddtl posConddtl)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosConddtl obj WHERE 1=1 ");
    spellSQL(sh,posConddtl);
    return count(sh);
  }
  
   /**
   *query a posConddtl by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosConddtl load(Long id)throws DataAccessException
  {
    return load(PosConddtl.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posConddtl query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosConddtl posConddtl)
  {
    if(posConddtl != null){
    	if(posConddtl.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posConddtl.getId());
         }
         if(posConddtl.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posConddtl.getHotelGroupId());
         }
         if(posConddtl.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posConddtl.getHotelId());
         }
        if(isNotNull(posConddtl.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posConddtl.getCode().trim());
        }
        if(isNotNull(posConddtl.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posConddtl.getDescript().trim());
        }
        if(isNotNull(posConddtl.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posConddtl.getDescriptEn().trim());
        }
        if(isNotNull(posConddtl.getHelpcode())){
           sh.appendSql(" AND obj.helpcode = ? ");
           sh.insertValue(posConddtl.getHelpcode().trim());
        }
        if(isNotNull(posConddtl.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posConddtl.getUnit().trim());
        }
       if(posConddtl.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posConddtl.getPrice());
        }
        if(isNotNull(posConddtl.getEmpflag())){
           sh.appendSql(" AND obj.empflag = ? ");
           sh.insertValue(posConddtl.getEmpflag().trim());
        }
        if(isNotNull(posConddtl.getBarflag())){
           sh.appendSql(" AND obj.barflag = ? ");
           sh.insertValue(posConddtl.getBarflag().trim());
        }
        if(isNotNull(posConddtl.getCondstCode())){
           sh.appendSql(" AND obj.condstCode = ? ");
           sh.insertValue(posConddtl.getCondstCode().trim());
        }
        if(isNotNull(posConddtl.getEmpid())){
           sh.appendSql(" AND obj.empid = ? ");
           sh.insertValue(posConddtl.getEmpid().trim());
        }
       if(posConddtl.getDate()!= null){
           sh.appendSql(" AND obj.date = ? ");
           sh.insertValue(posConddtl.getDate());
        }
       if(posConddtl.getLogid()!= null){
           sh.appendSql(" AND obj.logid = ? ");
           sh.insertValue(posConddtl.getLogid());
        }
        if(isNotNull(posConddtl.getWpcode())){
           sh.appendSql(" AND obj.wpcode = ? ");
           sh.insertValue(posConddtl.getWpcode().trim());
        }
       if(posConddtl.getNumbmode()!= null){
           sh.appendSql(" AND obj.numbmode = ? ");
           sh.insertValue(posConddtl.getNumbmode());
        }
       if(posConddtl.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posConddtl.getNumber());
        }
       if(posConddtl.getRatemode()!= null){
           sh.appendSql(" AND obj.ratemode = ? ");
           sh.insertValue(posConddtl.getRatemode());
        }
       if(posConddtl.getDscmode()!= null){
           sh.appendSql(" AND obj.dscmode = ? ");
           sh.insertValue(posConddtl.getDscmode());
        }
       if(posConddtl.getDscrate()!= null){
           sh.appendSql(" AND obj.dscrate = ? ");
           sh.insertValue(posConddtl.getDscrate());
        }
        if(isNotNull(posConddtl.getPaycode())){
           sh.appendSql(" AND obj.paycode = ? ");
           sh.insertValue(posConddtl.getPaycode().trim());
        }
        if(isNotNull(posConddtl.getBillprint())){
           sh.appendSql(" AND obj.billprint = ? ");
           sh.insertValue(posConddtl.getBillprint().trim());
        }
        if(isNotNull(posConddtl.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posConddtl.getIsHalt().trim());
        }
        if(isNotNull(posConddtl.getKitchenmsg())){
           sh.appendSql(" AND obj.kitchenmsg = ? ");
           sh.insertValue(posConddtl.getKitchenmsg().trim());
        }
       if(posConddtl.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posConddtl.getListOrder());
        }
        if(isNotNull(posConddtl.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posConddtl.getCodeType().trim());
        }
        if(isNotNull(posConddtl.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posConddtl.getGroupCode().trim());
        }
        if(isNotNull(posConddtl.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posConddtl.getIsGroup().trim());
        }
        if(isNotNull(posConddtl.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posConddtl.getCreateUser().trim());
         }
        if(posConddtl.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posConddtl.getCreateDatetime());
         }
         if(isNotNull(posConddtl.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posConddtl.getModifyUser().trim());
         }
        if(posConddtl.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posConddtl.getModifyDatetime());
         }
    }
  }

@Override
public List<PosConddtl> findPosConddtl(Long hotelGroupId, Long hotelId,Date modifyDatetime) {
	SQLHelper sh = new SQLHelper("SELECT obj FROM PosConddtl obj WHERE 1=1 ");
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