package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPccodeAuditFlag;
import org.springframework.dao.DataAccessException;
public interface IPosPccodeAuditFlagService extends IBaseService
{
   /**
   *save posPccodeAuditFlag object  method
   *@param posPccodeAuditFlag PosPccodeAuditFlag 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-03-30 10:39
   */
  public void savePosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag) throws DataAccessException;
  
   /**
   *update posPccodeAuditFlag method
   *@param posPccodeAuditFlag PosPccodeAuditFlag
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-03-30 10:39
   */
  public void updatePosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag) throws DataAccessException;
  
   /**
   *save or update posPccodeAuditFlag object method
   *@param posPccodeAuditFlag PosPccodeAuditFlag
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-03-30 10:39
   */
  public void saveOrUpdatePosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag) throws DataAccessException;

  /**
   *query a container obj
   *@param posPccodeAuditFlag PosPccodeAuditFlag query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-03-30 10:39
   */
  public Container<PosPccodeAuditFlag> findPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPccodeAuditFlag collection method
   *@param posPccodeAuditFlag PosPccodeAuditFlag send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-03-30  10:39
   */
  public List<PosPccodeAuditFlag> listPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag)throws DataAccessException;
 
   /**
   *query posPccodeAuditFlag collection method
   *@param posPccodeAuditFlag PosPccodeAuditFlag send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-03-30  10:39
   */
  public List<PosPccodeAuditFlag> listPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeAuditFlag PosPccodeAuditFlag query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-03-30 10:39
   */
  public int countPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag)throws DataAccessException;
   
   /**
   *query a posPccodeAuditFlag by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-03-30 10:39
   */
  public PosPccodeAuditFlag findPosPccodeAuditFlagById(Long id)throws DataAccessException;
}