package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosStoreMaster;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosStoreMaster into db
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
public interface IPosStoreMasterDao extends IBaseDao
{

  /**
   *save posStoreMaster object  method
   *@param posStoreMaster PosStoreMaster 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void save(PosStoreMaster posStoreMaster) throws DataAccessException;

   /**
   *update posStoreMaster method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void update(PosStoreMaster posStoreMaster) throws DataAccessException;
 
   /**
   *save or update posStoreMaster object method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdate(PosStoreMaster posStoreMaster) throws DataAccessException;
  
   /**
   *query posStoreMaster collection method
   *@param posStoreMaster PosStoreMaster send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreMaster> list(PosStoreMaster posStoreMaster,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStoreMaster PosStoreMaster send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public List<PosStoreMaster> list(PosStoreMaster posStoreMaster)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreMaster PosStoreMaster query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int count(PosStoreMaster posStoreMaster)throws DataAccessException;
  
   /**
   *query a posStoreMaster by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreMaster load(Long id)throws DataAccessException;
  
}