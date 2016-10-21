package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosDrinksDepositOrder;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosDrinksDepositOrder into db
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
public interface IPosDrinksDepositOrderDao extends IBaseDao
{

  /**
   *save posDrinksDepositOrder object  method
   *@param posDrinksDepositOrder PosDrinksDepositOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void save(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException;

   /**
   *update posDrinksDepositOrder method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void update(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException;
 
   /**
   *save or update posDrinksDepositOrder object method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdate(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException;
  
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
  public List<PosDrinksDepositOrder> list(PosDrinksDepositOrder posDrinksDepositOrder,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public List<PosDrinksDepositOrder> list(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posDrinksDepositOrder PosDrinksDepositOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int count(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException;
  
   /**
   *query a posDrinksDepositOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksDepositOrder load(Long id)throws DataAccessException;
  
}