package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosResOrder;
import org.springframework.dao.DataAccessException;
public interface IPosResOrderService extends IBaseService
{
   /**
   *save posResOrder object  method
   *@param posResOrder PosResOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void savePosResOrder(PosResOrder posResOrder) throws DataAccessException;
  
   /**
   *update posResOrder method
   *@param posResOrder PosResOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void updatePosResOrder(PosResOrder posResOrder) throws DataAccessException;
  
   /**
   *save or update posResOrder object method
   *@param posResOrder PosResOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void saveOrUpdatePosResOrder(PosResOrder posResOrder) throws DataAccessException;

  /**
   *query a container obj
   *@param posResOrder PosResOrder query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-04-01 13:44
   */
  public Container<PosResOrder> findPosResOrder(PosResOrder posResOrder,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posResOrder collection method
   *@param posResOrder PosResOrder send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosResOrder> listPosResOrder(PosResOrder posResOrder)throws DataAccessException;
 
   /**
   *query posResOrder collection method
   *@param posResOrder PosResOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosResOrder> listPosResOrder(PosResOrder posResOrder,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posResOrder PosResOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-01 13:44
   */
  public int countPosResOrder(PosResOrder posResOrder)throws DataAccessException;
   
   /**
   *query a posResOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-01 13:44
   */
  public PosResOrder findPosResOrderById(Long id)throws DataAccessException;
}