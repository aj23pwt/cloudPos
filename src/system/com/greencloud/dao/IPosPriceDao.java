package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPrice;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPrice into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosPriceDao extends IBaseDao
{

  /**
   *save posPrice object  method
   *@param posPrice PosPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosPrice posPrice) throws DataAccessException;

   /**
   *update posPrice method
   *@param posPrice PosPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosPrice posPrice) throws DataAccessException;
 
   /**
   *save or update posPrice object method
   *@param posPrice PosPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosPrice posPrice) throws DataAccessException;
  
   /**
   *query posPrice collection method
   *@param posPrice PosPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPrice> list(PosPrice posPrice,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPrice PosPrice send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosPrice> list(PosPrice posPrice)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPrice PosPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosPrice posPrice)throws DataAccessException;
  
   /**
   *query a posPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPrice load(Long id)throws DataAccessException;
  
}