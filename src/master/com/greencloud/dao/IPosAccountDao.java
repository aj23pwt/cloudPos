package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.List;

import com.greencloud.dto.KaiYuanPosDetailDto;
import com.greencloud.dto.KaiYuanPosPayDto;
import com.greencloud.entity.PosAccount;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosAccount into db
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
public interface IPosAccountDao extends IBaseDao
{

  /**
   *save posAccount object  method
   *@param posAccount PosAccount 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void save(PosAccount posAccount) throws DataAccessException;

   /**
   *update posAccount method
   *@param posAccount PosAccount
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void update(PosAccount posAccount) throws DataAccessException;
 
   /**
   *save or update posAccount object method
   *@param posAccount PosAccount
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void saveOrUpdate(PosAccount posAccount) throws DataAccessException;
  
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
  public List<PosAccount> list(PosAccount posAccount,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posAccount PosAccount send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public List<PosAccount> list(PosAccount posAccount)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAccount PosAccount query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:24
   */
  public int count(PosAccount posAccount)throws DataAccessException;
  
   /**
   *query a posAccount by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:24
   */
  public PosAccount load(Long id)throws DataAccessException;
  
  public  List<KaiYuanPosPayDto> getPosPayByaccntS(long hotelGroupId,long hotelId,String billNo);
  
}