package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosAccount;
import org.springframework.dao.DataAccessException;
public interface IPosAccountService extends IBaseService
{
   /**
   *save posAccount object  method
   *@param posAccount PosAccount 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void savePosAccount(PosAccount posAccount) throws DataAccessException;
  
   /**
   *update posAccount method
   *@param posAccount PosAccount
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void updatePosAccount(PosAccount posAccount) throws DataAccessException;
  
   /**
   *save or update posAccount object method
   *@param posAccount PosAccount
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void saveOrUpdatePosAccount(PosAccount posAccount) throws DataAccessException;

  /**
   *query a container obj
   *@param posAccount PosAccount query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-05-03 14:24
   */
  public Container<PosAccount> findPosAccount(PosAccount posAccount,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posAccount collection method
   *@param posAccount PosAccount send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:24
   */
  public List<PosAccount> listPosAccount(PosAccount posAccount)throws DataAccessException;
 
   /**
   *query posAccount collection method
   *@param posAccount PosAccount send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:24
   */
  public List<PosAccount> listPosAccount(PosAccount posAccount,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAccount PosAccount query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:24
   */
  public int countPosAccount(PosAccount posAccount)throws DataAccessException;
   
   /**
   *query a posAccount by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:24
   */
  public PosAccount findPosAccountById(Long id)throws DataAccessException;
  public List<PosAccount> getPosAccountPayView(Long hotelGroupId,Long HotelId,String bizDate,String accnts);
  
}