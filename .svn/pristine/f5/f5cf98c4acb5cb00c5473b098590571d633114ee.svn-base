package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosOrder;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosOrder into db
   *@author 
   *@version 1.0
   *@date 2015-04-27 09:43
   */
public interface IPosOrderDao extends IBaseDao
{

  /**
   *save posOrder object  method
   *@param posOrder PosOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public void save(PosOrder posOrder) throws DataAccessException;

   /**
   *update posOrder method
   *@param posOrder PosOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public void update(PosOrder posOrder) throws DataAccessException;
 
   /**
   *save or update posOrder object method
   *@param posOrder PosOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public void saveOrUpdate(PosOrder posOrder) throws DataAccessException;
  
   /**
   *query posOrder collection method
   *@param posOrder PosOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-27  09:43
   */
  public List<PosOrder> list(PosOrder posOrder,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posOrder PosOrder send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-04-27 09:43
   */
  public List<PosOrder> list(PosOrder posOrder)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posOrder PosOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-27 09:43
   */
  public int count(PosOrder posOrder)throws DataAccessException;
  
   /**
   *query a posOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-27 09:43
   */
  public PosOrder load(Long id)throws DataAccessException;
  
}