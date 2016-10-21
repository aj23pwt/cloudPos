package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.entity.PosPrnscope;

import org.springframework.dao.DataAccessException;
public interface IPosPrnscopeService extends IBaseService
{
   /**
   *save posPrnscope object  method
   *@param posPrnscope PosPrnscope 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void savePosPrnscope(PosPrnscope posPrnscope) throws DataAccessException;
  
   /**
   *update posPrnscope method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void updatePosPrnscope(PosPrnscope posPrnscope) throws DataAccessException;
  
   /**
   *save or update posPrnscope object method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void saveOrUpdatePosPrnscope(PosPrnscope posPrnscope) throws DataAccessException;

  /**
   *query a container obj
   *@param posPrnscope PosPrnscope query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 19:51
   */
  public Container<PosPrnscope> findPosPrnscope(PosPrnscope posPrnscope,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPrnscope collection method
   *@param posPrnscope PosPrnscope send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  19:51
   */
  public List<PosPrnscope> listPosPrnscope(PosPrnscope posPrnscope)throws DataAccessException;
 
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
  public List<PosPrnscope> listPosPrnscope(PosPrnscope posPrnscope,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPrnscope PosPrnscope query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 19:51
   */
  public int countPosPrnscope(PosPrnscope posPrnscope)throws DataAccessException;
   
   /**
   *query a posPrnscope by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 19:51
   */
  public PosPrnscope findPosPrnscopeById(Long id)throws DataAccessException;
  public void delete(PosPrnscope posPrnscope) throws DataAccessException;

  public String checkSortIs(Long hotelGroupId, Long hotelId, String scode);

  public void modifySortPrnscope(Long hotelGroupId, Long hotelId, String scode,String strPrint); 
}