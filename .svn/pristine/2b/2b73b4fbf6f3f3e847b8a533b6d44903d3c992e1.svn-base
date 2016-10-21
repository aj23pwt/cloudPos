package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosMasterHistory;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosMasterHistory into db
   *@author 
   *@version 1.0
   *@date 2016-01-04 11:29
   */
public interface IPosMasterHistoryDao extends IBaseDao
{

  /**
   *save posMasterHistory object  method
   *@param posMasterHistory PosMasterHistory 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public void save(PosMasterHistory posMasterHistory) throws DataAccessException;

   /**
   *update posMasterHistory method
   *@param posMasterHistory PosMasterHistory
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public void update(PosMasterHistory posMasterHistory) throws DataAccessException;
 
   /**
   *save or update posMasterHistory object method
   *@param posMasterHistory PosMasterHistory
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public void saveOrUpdate(PosMasterHistory posMasterHistory) throws DataAccessException;
  
   /**
   *query posMasterHistory collection method
   *@param posMasterHistory PosMasterHistory send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04  11:29
   */
  public List<PosMasterHistory> list(PosMasterHistory posMasterHistory,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posMasterHistory PosMasterHistory send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public List<PosMasterHistory> list(PosMasterHistory posMasterHistory)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posMasterHistory PosMasterHistory query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-04 11:29
   */
  public int count(PosMasterHistory posMasterHistory)throws DataAccessException;
  
   /**
   *query a posMasterHistory by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-04 11:29
   */
  public PosMasterHistory load(Long id)throws DataAccessException;
  
}