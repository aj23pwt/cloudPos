package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosStoreBar;
import org.springframework.dao.DataAccessException;
public interface IPosStoreBarService extends IBaseService
{
   /**
   *save posStoreBar object  method
   *@param posStoreBar PosStoreBar 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 10:15
   */
  public void savePosStoreBar(PosStoreBar posStoreBar) throws DataAccessException;
  
   /**
   *update posStoreBar method
   *@param posStoreBar PosStoreBar
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 10:15
   */
  public void updatePosStoreBar(PosStoreBar posStoreBar) throws DataAccessException;
  
   /**
   *save or update posStoreBar object method
   *@param posStoreBar PosStoreBar
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 10:15
   */
  public void saveOrUpdatePosStoreBar(PosStoreBar posStoreBar) throws DataAccessException;

  /**
   *query a container obj
   *@param posStoreBar PosStoreBar query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 10:15
   */
  public Container<PosStoreBar> findPosStoreBar(PosStoreBar posStoreBar,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStoreBar collection method
   *@param posStoreBar PosStoreBar send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  10:15
   */
  public List<PosStoreBar> listPosStoreBar(PosStoreBar posStoreBar)throws DataAccessException;
 
   /**
   *query posStoreBar collection method
   *@param posStoreBar PosStoreBar send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  10:15
   */
  public List<PosStoreBar> listPosStoreBar(PosStoreBar posStoreBar,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreBar PosStoreBar query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 10:15
   */
  public int countPosStoreBar(PosStoreBar posStoreBar)throws DataAccessException;
   
   /**
   *query a posStoreBar by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 10:15
   */
  public PosStoreBar findPosStoreBarById(Long id)throws DataAccessException;
  
  public List<Object> updateAndGetPosStoreInventory(Long hotelGroupId,Long hotelId);
}