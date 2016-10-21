package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosWebInterfaceLog;
import org.springframework.dao.DataAccessException;
public interface IPosWebInterfaceLogService extends IBaseService
{
   /**
   *save posWebInterfaceLog object  method
   *@param posWebInterfaceLog PosWebInterfaceLog 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void savePosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException;
  
   /**
   *update posWebInterfaceLog method
   *@param posWebInterfaceLog PosWebInterfaceLog
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void updatePosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException;
  
   /**
   *save or update posWebInterfaceLog object method
   *@param posWebInterfaceLog PosWebInterfaceLog
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void saveOrUpdatePosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException;

  /**
   *query a container obj
   *@param posWebInterfaceLog PosWebInterfaceLog query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-08 18:38
   */
  public Container<PosWebInterfaceLog> findPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posWebInterfaceLog collection method
   *@param posWebInterfaceLog PosWebInterfaceLog send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08  18:38
   */
  public List<PosWebInterfaceLog> listPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog)throws DataAccessException;
 
   /**
   *query posWebInterfaceLog collection method
   *@param posWebInterfaceLog PosWebInterfaceLog send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08  18:38
   */
  public List<PosWebInterfaceLog> listPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posWebInterfaceLog PosWebInterfaceLog query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-08 18:38
   */
  public int countPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog)throws DataAccessException;
   
   /**
   *query a posWebInterfaceLog by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-08 18:38
   */
  public PosWebInterfaceLog findPosWebInterfaceLogById(Long id)throws DataAccessException;
}