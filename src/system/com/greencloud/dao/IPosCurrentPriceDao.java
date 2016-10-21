package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosCurrentPrice;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosCurrentPrice into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosCurrentPriceDao extends IBaseDao
{

  /**
   *save posCurrentPrice object  method
   *@param posCurrentPrice PosCurrentPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosCurrentPrice posCurrentPrice) throws DataAccessException;
 
   /**
   *update posCurrentPrice method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosCurrentPrice posCurrentPrice) throws DataAccessException;
 
   /**
   *save or update posCurrentPrice object method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosCurrentPrice posCurrentPrice) throws DataAccessException;
  
   /**
   *query posCurrentPrice collection method
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCurrentPrice> list(PosCurrentPrice posCurrentPrice,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosCurrentPrice> list(PosCurrentPrice posCurrentPrice)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posCurrentPrice PosCurrentPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosCurrentPrice posCurrentPrice)throws DataAccessException;
  
   /**
   *query a posCurrentPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCurrentPrice load(Long id)throws DataAccessException;
  
}