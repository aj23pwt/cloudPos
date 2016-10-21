package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosPrnscope;
import com.greencloud.util.UserManager;
import com.greencloud.dao.IPosPrnscopeDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosPrnscope into db
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public class PosPrnscopeDaoImpl extends BaseDaoImpl implements IPosPrnscopeDao{

  /**
   *save posPrnscope object  method
   *@param posPrnscope PosPrnscope 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void save(PosPrnscope posPrnscope) throws DataAccessException {
       super.save(posPrnscope);
  }
  
  /**
   *update posPrnscope method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void update(PosPrnscope posPrnscope) throws DataAccessException{
     super.update(posPrnscope);
  }
  
   /**
   *save or update posPrnscope object method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void saveOrUpdate(PosPrnscope posPrnscope) throws DataAccessException{
     super.saveOrUpdate(posPrnscope);
  }
  
   /**
   *query posPrnscope collection method
   *@param posPrnscope PosPrnscope send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  19:51
   */
  public List<PosPrnscope> list(PosPrnscope posPrnscope,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPrnscope obj WHERE 1=1 ");
  	 spellSQL(sh,posPrnscope);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posPrnscope PosPrnscope send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public List<PosPrnscope> list(PosPrnscope posPrnscope)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosPrnscope obj WHERE 1=1 ");
  	 spellSQL(sh,posPrnscope);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posPrnscope PosPrnscope query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 19:51
   */
  public int count(PosPrnscope posPrnscope)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosPrnscope obj WHERE 1=1 ");
    spellSQL(sh,posPrnscope);
    return count(sh);
  }
  
   /**
   *query a posPrnscope by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 19:51
   */
  public PosPrnscope load(Long id)throws DataAccessException
  {
    return load(PosPrnscope.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posPrnscope query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 19:51
   */
  private void spellSQL(SQLHelper sh,PosPrnscope posPrnscope)
  {
    if(posPrnscope != null){
    	if(posPrnscope.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posPrnscope.getId());
         }
         if(posPrnscope.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posPrnscope.getHotelGroupId());
         }
         if(posPrnscope.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posPrnscope.getHotelId());
         }
        if(isNotNull(posPrnscope.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posPrnscope.getPccode().trim());
        }
        if(isNotNull(posPrnscope.getPlusort())){
           sh.appendSql(" AND obj.plusort = ? ");
           sh.insertValue(posPrnscope.getPlusort().trim());
        }
        if(isNotNull(posPrnscope.getPlucode())){
           sh.appendSql(" AND obj.plucode = ? ");
           sh.insertValue(posPrnscope.getPlucode().trim());
        }
        if(isNotNull(posPrnscope.getPrinters())){
           sh.appendSql(" AND obj.printers = ? ");
           sh.insertValue(posPrnscope.getPrinters().trim());
        }
        if(isNotNull(posPrnscope.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posPrnscope.getCreateUser().trim());
         }
        if(posPrnscope.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posPrnscope.getCreateDatetime());
         }
         if(isNotNull(posPrnscope.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posPrnscope.getModifyUser().trim());
         }
        if(posPrnscope.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posPrnscope.getModifyDatetime());
         }
    }
  }

@Override
	public void modifySortPrnscope(Long hotelGroupId, Long hotelId, String scode,String strPrint) {
//		String sql = "update pos_prnscope set printers = '"+strPrint+"' where hotel_group_id= '"+hotelGroupId+"' and hotel_id= '"+hotelId+"'"
//				+ " and plusort = '"+scode+"' and plucode = ''";
//		SQLHelper sh = new SQLHelper(sql);
		SQLHelper sh = new SQLHelper();
		sh.appendSql("  update pos_prnscope set printers=? ,  ");
		sh.insertValue(strPrint);
		sh.appendSql("    modify_datetime = now(),  ");
		sh.appendSql("   modify_user = '"+UserManager.getUserCode()+"'  ");
		
		sh.appendSql("   where   hotel_group_id = ?    ");
		sh.insertValue(hotelGroupId);
		sh.appendSql("  and    hotel_id = ?    ");
		sh.insertValue(hotelId);
		sh.appendSql("  and    plusort = ?    ");
		sh.insertValue(scode);
		sh.appendSql("  and    plucode = ''   ");
        bulkUpdateByNativeSQL(sh);
	}

@Override
public void delete(PosPrnscope posPrnscope) throws DataAccessException {
	super.delete(posPrnscope);	
}
}