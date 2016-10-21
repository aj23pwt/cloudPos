package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.entity.PosAccess;

import org.springframework.dao.DataAccessException;
public interface IPosAccessService extends IBaseService
{
   /**
   *save posAccess object  method
   *@param posAccess PosAccess 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosAccess(PosAccess posAccess) throws DataAccessException;
   /**
   *update posAccess method
   *@param posAccess PosAccess
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosAccess(PosAccess posAccess) throws DataAccessException;
  
   /**
   *save or update posAccess object method
   *@param posAccess PosAccess
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosAccess(PosAccess posAccess) throws DataAccessException;

  /**
   *query a container obj
   *@param posAccess PosAccess query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosAccess> findPosAccess(PosAccess posAccess,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posAccess collection method
   *@param posAccess PosAccess send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosAccess> listPosAccess(PosAccess posAccess)throws DataAccessException;
 
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
  public List<PosAccess> listPosAccess(PosAccess posAccess,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAccess PosAccess query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosAccess(PosAccess posAccess)throws DataAccessException;
   
   /**
   *query a posAccess by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosAccess findPosAccessById(Long id)throws DataAccessException;
  
  public List<PosAccess> listPosAccessForOrder(PosAccess posAccess)throws DataAccessException;
}