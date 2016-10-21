package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.List;

import com.greencloud.entity.PosPrnscope;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosPrnscope into db
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
public interface IPosPrnscopeDao extends IBaseDao
{

  /**
   *save posPrnscope object  method
   *@param posPrnscope PosPrnscope 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void save(PosPrnscope posPrnscope) throws DataAccessException;

   /**
   *update posPrnscope method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void update(PosPrnscope posPrnscope) throws DataAccessException;
 
   /**
   *save or update posPrnscope object method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void saveOrUpdate(PosPrnscope posPrnscope) throws DataAccessException;
  
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
  public List<PosPrnscope> list(PosPrnscope posPrnscope,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPrnscope PosPrnscope send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public List<PosPrnscope> list(PosPrnscope posPrnscope)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPrnscope PosPrnscope query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 19:51
   */
  public int count(PosPrnscope posPrnscope)throws DataAccessException;
  
   /**
   *query a posPrnscope by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 19:51
   */
  public PosPrnscope load(Long id)throws DataAccessException;
  public void delete(PosPrnscope posPrnscope) throws DataAccessException;

  public void modifySortPrnscope(Long hotelGroupId, Long hotelId, String scode,String strPrint);
  
}