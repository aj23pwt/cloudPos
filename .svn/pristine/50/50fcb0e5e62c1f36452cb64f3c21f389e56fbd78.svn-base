package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosDrinksConsume;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosDrinksConsume into db
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
public interface IPosDrinksConsumeDao extends IBaseDao
{

  /**
   *save posDrinksConsume object  method
   *@param posDrinksConsume PosDrinksConsume 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void save(PosDrinksConsume posDrinksConsume) throws DataAccessException;

   /**
   *update posDrinksConsume method
   *@param posDrinksConsume PosDrinksConsume
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void update(PosDrinksConsume posDrinksConsume) throws DataAccessException;
 
   /**
   *save or update posDrinksConsume object method
   *@param posDrinksConsume PosDrinksConsume
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdate(PosDrinksConsume posDrinksConsume) throws DataAccessException;
  
   /**
   *query posDrinksConsume collection method
   *@param posDrinksConsume PosDrinksConsume send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksConsume> list(PosDrinksConsume posDrinksConsume,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posDrinksConsume PosDrinksConsume send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public List<PosDrinksConsume> list(PosDrinksConsume posDrinksConsume)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posDrinksConsume PosDrinksConsume query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int count(PosDrinksConsume posDrinksConsume)throws DataAccessException;
  
   /**
   *query a posDrinksConsume by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksConsume load(Long id)throws DataAccessException;
  
}