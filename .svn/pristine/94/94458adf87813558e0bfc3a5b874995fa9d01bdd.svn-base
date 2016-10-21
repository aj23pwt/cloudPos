package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosAccntSync;
import org.springframework.dao.DataAccessException;
public interface IPosAccntSyncService extends IBaseService
{
   /**
   *save posAccntSync object  method
   *@param posAccntSync PosAccntSync 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void savePosAccntSync(PosAccntSync posAccntSync) throws DataAccessException;
  
   /**
   *update posAccntSync method
   *@param posAccntSync PosAccntSync
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void updatePosAccntSync(PosAccntSync posAccntSync) throws DataAccessException;
  
   /**
   *save or update posAccntSync object method
   *@param posAccntSync PosAccntSync
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void saveOrUpdatePosAccntSync(PosAccntSync posAccntSync) throws DataAccessException;

  /**
   *query a container obj
   *@param posAccntSync PosAccntSync query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-04 22:31
   */
  public Container<PosAccntSync> findPosAccntSync(PosAccntSync posAccntSync,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posAccntSync collection method
   *@param posAccntSync PosAccntSync send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04  22:31
   */
  public List<PosAccntSync> listPosAccntSync(PosAccntSync posAccntSync)throws DataAccessException;
 
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
  public List<PosAccntSync> listPosAccntSync(PosAccntSync posAccntSync,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAccntSync PosAccntSync query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-04 22:31
   */
  public int countPosAccntSync(PosAccntSync posAccntSync)throws DataAccessException;
   
   /**
   *query a posAccntSync by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-04 22:31
   */
  public PosAccntSync findPosAccntSyncById(Long id)throws DataAccessException;
}