package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPay;
import org.springframework.dao.DataAccessException;
public interface IPosPayService extends IBaseService
{
   /**
   *save posPay object  method
   *@param posPay PosPay 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void savePosPay(PosPay posPay) throws DataAccessException;
  
   /**
   *update posPay method
   *@param posPay PosPay
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void updatePosPay(PosPay posPay) throws DataAccessException;
  
   /**
   *save or update posPay object method
   *@param posPay PosPay
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void saveOrUpdatePosPay(PosPay posPay) throws DataAccessException;

  /**
   *query a container obj
   *@param posPay PosPay query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-04-01 13:44
   */
  public Container<PosPay> findPosPay(PosPay posPay,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPay collection method
   *@param posPay PosPay send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosPay> listPosPay(PosPay posPay)throws DataAccessException;
 
   /**
   *query posPay collection method
   *@param posPay PosPay send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosPay> listPosPay(PosPay posPay,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPay PosPay query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-01 13:44
   */
  public int countPosPay(PosPay posPay)throws DataAccessException;
   
   /**
   *query a posPay by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-01 13:44
   */
  public PosPay findPosPayById(Long id)throws DataAccessException;
  
  public List<PosPay> getPosPayList(String sql) throws DataAccessException;
}