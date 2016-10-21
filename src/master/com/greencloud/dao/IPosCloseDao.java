package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosClose;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosClose into db
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
public interface IPosCloseDao extends IBaseDao
{

  /**
   *save posClose object  method
   *@param posClose PosClose 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void save(PosClose posClose) throws DataAccessException;

   /**
   *update posClose method
   *@param posClose PosClose
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void update(PosClose posClose) throws DataAccessException;
 
   /**
   *save or update posClose object method
   *@param posClose PosClose
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void saveOrUpdate(PosClose posClose) throws DataAccessException;
  
   /**
   *query posClose collection method
   *@param posClose PosClose send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10  11:48
   */
  public List<PosClose> list(PosClose posClose,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posClose PosClose send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public List<PosClose> list(PosClose posClose)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posClose PosClose query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-10 11:48
   */
  public int count(PosClose posClose)throws DataAccessException;
  
   /**
   *query a posClose by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-10 11:48
   */
  public PosClose load(Long id)throws DataAccessException;
  
}