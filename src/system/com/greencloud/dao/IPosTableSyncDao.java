package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosTableSync;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosTableSync into db
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
public interface IPosTableSyncDao extends IBaseDao
{

  /**
   *save posTableSync object  method
   *@param posTableSync PosTableSync 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void save(PosTableSync posTableSync) throws DataAccessException;

   /**
   *update posTableSync method
   *@param posTableSync PosTableSync
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void update(PosTableSync posTableSync) throws DataAccessException;
 
   /**
   *save or update posTableSync object method
   *@param posTableSync PosTableSync
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void saveOrUpdate(PosTableSync posTableSync) throws DataAccessException;
  
   /**
   *query posTableSync collection method
   *@param posTableSync PosTableSync send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06  15:32
   */
  public List<PosTableSync> list(PosTableSync posTableSync,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posTableSync PosTableSync send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public List<PosTableSync> list(PosTableSync posTableSync)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posTableSync PosTableSync query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-09-06 15:32
   */
  public int count(PosTableSync posTableSync)throws DataAccessException;
  
   /**
   *query a posTableSync by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-09-06 15:32
   */
  public PosTableSync load(Long id)throws DataAccessException;
  
}