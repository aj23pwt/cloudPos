package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosDrinksDepositOrder;
import org.springframework.dao.DataAccessException;
public interface IPosDrinksDepositOrderService extends IBaseService
{
   /**
   *save posDrinksDepositOrder object  method
   *@param posDrinksDepositOrder PosDrinksDepositOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void savePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException;
  
   /**
   *update posDrinksDepositOrder method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void updatePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException;
  
   /**
   *save or update posDrinksDepositOrder object method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdatePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException;

  /**
   *query a container obj
   *@param posDrinksDepositOrder PosDrinksDepositOrder query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 15:46
   */
  public Container<PosDrinksDepositOrder> findPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posDrinksDepositOrder collection method
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksDepositOrder> listPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException;
 
   /**
   *query posDrinksDepositOrder collection method
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksDepositOrder> listPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posDrinksDepositOrder PosDrinksDepositOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int countPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException;
   
   /**
   *query a posDrinksDepositOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksDepositOrder findPosDrinksDepositOrderById(Long id)throws DataAccessException;
}