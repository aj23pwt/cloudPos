package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.List;

import com.greencloud.entity.PosAccess;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosAccess into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosAccessDao extends IBaseDao
{
  /**
   *save posAccess object  method
   *@param posAccess PosAccess 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosAccess posAccess) throws DataAccessException;
 
   /**
   *update posAccess method
   *@param posAccess PosAccess
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosAccess posAccess) throws DataAccessException;
 
   /**
   *save or update posAccess object method
   *@param posAccess PosAccess
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosAccess posAccess) throws DataAccessException;
  
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
  public List<PosAccess> list(PosAccess posAccess,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posAccess PosAccess send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosAccess> list(PosAccess posAccess)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAccess PosAccess query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosAccess posAccess)throws DataAccessException;
  
   /**
   *query a posAccess by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosAccess load(Long id)throws DataAccessException;
  
  public List<PosAccess> listPosAccessForOrder(PosAccess posAccess)throws DataAccessException;

}