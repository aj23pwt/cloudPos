package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.text.SimpleDateFormat;
import java.util.List;

import com.greencloud.entity.PosAccess;
import com.greencloud.entity.User;
import com.greencloud.util.UserManager;
import com.greencloud.dao.IPosAccessDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosAccess into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public class PosAccessDaoImpl extends BaseDaoImpl implements IPosAccessDao{

  /**
   *save posAccess object  method
   *@param posAccess PosAccess 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosAccess posAccess) throws DataAccessException {
       super.save(posAccess);
  }
  
  /**
   *update posAccess method
   *@param posAccess PosAccess
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosAccess posAccess) throws DataAccessException{
     super.update(posAccess);
  }
  
   /**
   *save or update posAccess object method
   *@param posAccess PosAccess
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosAccess posAccess) throws DataAccessException{
     super.saveOrUpdate(posAccess);
  }
  
   /**
   *query posAccess collection method
   *@param posAccess PosAccess send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosAccess> list(PosAccess posAccess,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosAccess obj WHERE 1=1 ");
  	 spellSQL(sh,posAccess);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posAccess PosAccess send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosAccess> list(PosAccess posAccess)throws DataAccessException{
	  SimpleDateFormat formate = new SimpleDateFormat("yyyy-MM-dd");
	  String datetime = formate.format(UserManager.getBizDate());
	  String sql = "select a.plu_code code,(a.number-a.number1) num from pos_access a "
	  		+ " where a.hotel_group_id = '"+UserManager.getHotelGroupId()+"' and a.hotel_id = '"+UserManager.getHotelId()+"' and "
	  				+ " a.biz_date = '"+datetime+"' and a.is_halt = 'F' order by a.id,plu_code desc";
	  SQLHelper sh = new SQLHelper(sql);
  	  return findByNativeSQL(sh);
  }
  
  /**
   *count obj amount
   *@param posAccess PosAccess query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosAccess posAccess)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosAccess obj WHERE 1=1 ");
    spellSQL(sh,posAccess);
    return count(sh);
  }
  
   /**
   *query a posAccess by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosAccess load(Long id)throws DataAccessException
  {
    return load(PosAccess.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posAccess query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  private void spellSQL(SQLHelper sh,PosAccess posAccess)
  {
    if(posAccess != null){
    	if(posAccess.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posAccess.getId());
         }
         if(posAccess.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posAccess.getHotelGroupId());
         }
         if(posAccess.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posAccess.getHotelId());
         }
       if(posAccess.getBizDate()!= null){
           sh.appendSql(" AND obj.bizDate = ? ");
           sh.insertValue(posAccess.getBizDate());
        }
        if(isNotNull(posAccess.getPluCode())){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posAccess.getPluCode().trim());
        }
        if(isNotNull(posAccess.getPluUnit())){
           sh.appendSql(" AND obj.pluUnit = ? ");
           sh.insertValue(posAccess.getPluUnit().trim());
        }
       if(posAccess.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posAccess.getNumber());
        }
       if(posAccess.getNumber1()!= null){
           sh.appendSql(" AND obj.number1 = ? ");
           sh.insertValue(posAccess.getNumber1());
        }
       if(posAccess.getNumber2()!= null){
           sh.appendSql(" AND obj.number2 = ? ");
           sh.insertValue(posAccess.getNumber2());
        }
        if(isNotNull(posAccess.getPayout())){
           sh.appendSql(" AND obj.payout = ? ");
           sh.insertValue(posAccess.getPayout().trim());
        }
        if(isNotNull(posAccess.getIsHalt())){
           sh.appendSql(" AND obj.isHalt = ? ");
           sh.insertValue(posAccess.getIsHalt().trim());
        }
       if(posAccess.getListOrder()!= null){
           sh.appendSql(" AND obj.listOrder = ? ");
           sh.insertValue(posAccess.getListOrder());
        }
        if(isNotNull(posAccess.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posAccess.getCodeType().trim());
        }
        if(isNotNull(posAccess.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posAccess.getGroupCode().trim());
        }
        if(isNotNull(posAccess.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posAccess.getIsGroup().trim());
        }
        if(isNotNull(posAccess.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posAccess.getCreateUser().trim());
         }
        if(posAccess.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posAccess.getCreateDatetime());
         }
         if(isNotNull(posAccess.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posAccess.getModifyUser().trim());
         }
        if(posAccess.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posAccess.getModifyDatetime());
         }
    }
  }

@Override
public List<PosAccess> listPosAccessForOrder(PosAccess posAccess)throws DataAccessException {
	SQLHelper sh = new SQLHelper("SELECT obj FROM PosAccess obj WHERE 1=1 ");
 	 spellSQL(sh,posAccess);
 	 sh.appendSql(" ORDER BY obj.id");
 	 return find(sh);
}

}