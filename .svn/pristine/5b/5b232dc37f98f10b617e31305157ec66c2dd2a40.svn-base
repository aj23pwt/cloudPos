package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosResOrder;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosResOrder into db
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
public interface IPosResOrderDao extends IBaseDao
{

  /**
   *save posResOrder object  method
   *@param posResOrder PosResOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void save(PosResOrder posResOrder) throws DataAccessException;

   /**
   *update posResOrder method
   *@param posResOrder PosResOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void update(PosResOrder posResOrder) throws DataAccessException;
 
   /**
   *save or update posResOrder object method
   *@param posResOrder PosResOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void saveOrUpdate(PosResOrder posResOrder) throws DataAccessException;
  
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
  public List<PosResOrder> list(PosResOrder posResOrder,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posResOrder PosResOrder send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public List<PosResOrder> list(PosResOrder posResOrder)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posResOrder PosResOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-01 13:44
   */
  public int count(PosResOrder posResOrder)throws DataAccessException;
  
   /**
   *query a posResOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-01 13:44
   */
  public PosResOrder load(Long id)throws DataAccessException;
  
}