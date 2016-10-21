package com.greencloud.dao.impl;

import static com.aua.util.StringHelper.isNotNull;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.aua.dao.impl.BaseDaoImpl;
import com.aua.util.SQLHelper;
import com.greencloud.dao.IPosPserverDao;
import com.greencloud.entity.PosPserver;

public class PosPserverDaoImpl extends BaseDaoImpl implements IPosPserverDao {
	  /**
	   *save PosPserver object  method
	   *@param PosPserver posPserver 
	   *@throws DataAccessException 
	   *@author  
	   *@version 1.0
	   *@date 2015-11-26 11:26
	   */
	public void save(PosPserver posPserver) throws DataAccessException
	{
		super.save(posPserver);
	}
	  /**
	   *update PosPserver object  method
	   *@param PosPserver posPserver 
	   *@throws DataAccessException 
	   *@author  
	   *@version 1.0
	   *@date 2015-11-26 11:26
	   */
	public void update(PosPserver posPserver) throws DataAccessException
	{
		super.update(posPserver);
	}
	
	   /**
	   *query saveOrUpdate method  
	   *@param PosPserver posPserve send query vo 
	   *@throws DataAccessException
	   *@author 
	   *@version 1.0
	   *@date 2015-11-26 11:26
	   */	
	public void saveOrUpdate(PosPserver posPserver) throws DataAccessException
	{
		super.saveOrUpdate(posPserver);
	}
	
	   /**
	   *query collection method  
	   *@param PosPserver posPserve send query vo 
	   *@throws DataAccessException
	   *@author 
	   *@version 1.0
	   *@date 2015-11-26 11:26
	   */
	public List<PosPserver> list(PosPserver posPserver)throws DataAccessException
	{
		SQLHelper sh = new SQLHelper("SELECT obj FROM PosPserver obj WHERE 1=1 ");
		spellSQL(sh,posPserver);
		sh.appendSql(" ORDER BY obj.code");
		return find(sh);
	}
	
	private void spellSQL(SQLHelper sh, PosPserver posPserver) {
		   if(posPserver != null){
		    	if(posPserver.getId()!= null){
		            sh.appendSql(" AND obj.id = ? ");
		            sh.insertValue(posPserver.getId());
		         }
		         if(posPserver.getHotelGroupId()!= null){
		            sh.appendSql(" AND obj.hotelGroupId = ? ");
		            sh.insertValue(posPserver.getHotelGroupId());
		         }
		         if(posPserver.getHotelId()!= null){
		            sh.appendSql(" AND obj.hotelId = ? ");
		            sh.insertValue(posPserver.getHotelId());
		         }
		        if(isNotNull(posPserver.getCode())){
		           sh.appendSql(" AND obj.code = ? ");
		           sh.insertValue(posPserver.getCode().trim());
		        }
		        if(isNotNull(posPserver.getDescript())){
		           sh.appendSql(" AND obj.descript = ? ");
		           sh.insertValue(posPserver.getDescript().trim());
		        }
		        if(isNotNull(posPserver.getDescriptEn())){
		           sh.appendSql(" AND obj.descriptEn = ? ");
		           sh.insertValue(posPserver.getDescriptEn().trim());
		        }
		        if(posPserver.getPrintFreshen() != null){
		           sh.appendSql(" AND obj.print_freshen = ? ");
		           sh.insertValue(posPserver.getPrintFreshen());
		        }
		        if(posPserver.getStaFreshen() != null){
		           sh.appendSql(" AND obj.sta_freshen = ? ");
		           sh.insertValue(posPserver.getStaFreshen());
		        }
		        if(isNotNull(posPserver.getStation())){
		           sh.appendSql(" AND obj.station = ? ");
		           sh.insertValue(posPserver.getStation().trim());
		        }
		        if(isNotNull(posPserver.getCreateUser())){
		            sh.appendSql(" AND obj.createUser = ? ");
		            sh.insertValue(posPserver.getCreateUser().trim());
		         }
		        if(posPserver.getCreateDatetime()!= null){
		            sh.appendSql(" AND obj.createDatetime = ? ");
		            sh.insertValue(posPserver.getCreateDatetime());
		         }
		         if(isNotNull(posPserver.getModifyUser())){
		            sh.appendSql(" AND obj.modifyUser = ? ");
		            sh.insertValue(posPserver.getModifyUser().trim());
		         }
		        if(posPserver.getModifyDatetime()!= null){
		            sh.appendSql(" AND obj.modifyDatetime = ? ");
		            sh.insertValue(posPserver.getModifyDatetime());
		         }
		    }
	}
}
