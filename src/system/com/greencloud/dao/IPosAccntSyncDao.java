package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosAccntSync;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosAccntSync into db
   *@author 
   *@version 1.0
   *@date 2015-07-04 22:31
   */
public interface IPosAccntSyncDao extends IBaseDao
{

  /**
   *save posAccntSync object  method
   *@param posAccntSync PosAccntSync 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void save(PosAccntSync posAccntSync) throws DataAccessException;

   /**
   *update posAccntSync method
   *@param posAccntSync PosAccntSync
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void update(PosAccntSync posAccntSync) throws DataAccessException;
 
   /**
   *save or update posAccntSync object method
   *@param posAccntSync PosAccntSync
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void saveOrUpdate(PosAccntSync posAccntSync) throws DataAccessException;
  
   /**
   *query posAccntSync collection method
   *@param posAccntSync PosAccntSync send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04  22:31
   */
  public List<PosAccntSync> list(PosAccntSync posAccntSync,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posAccntSync PosAccntSync send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public List<PosAccntSync> list(PosAccntSync posAccntSync)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAccntSync PosAccntSync query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-04 22:31
   */
  public int count(PosAccntSync posAccntSync)throws DataAccessException;
  
   /**
   *query a posAccntSync by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-04 22:31
   */
  public PosAccntSync load(Long id)throws DataAccessException;
  /**
  *query a posAccntSync by id 
  *@param id 
  *@throws DataAccessException 
  *@author 
  *@date 2015-07-04 22:31
  */
 public void updateByInsterSql(long hotelGroupId,long hotelId, String accnt) throws DataAccessException;
  
}