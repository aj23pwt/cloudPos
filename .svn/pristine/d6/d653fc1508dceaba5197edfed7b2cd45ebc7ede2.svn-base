package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosCurrentPrice;
import org.springframework.dao.DataAccessException;
public interface IPosCurrentPriceService extends IBaseService
{
   /**
   *save posCurrentPrice object  method
   *@param posCurrentPrice PosCurrentPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosCurrentPrice(PosCurrentPrice posCurrentPrice) throws DataAccessException;
  
   /**
   *update posCurrentPrice method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosCurrentPrice(PosCurrentPrice posCurrentPrice) throws DataAccessException;
  
   /**
   *save or update posCurrentPrice object method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosCurrentPrice(PosCurrentPrice posCurrentPrice) throws DataAccessException;

  /**
   *query a container obj
   *@param posCurrentPrice PosCurrentPrice query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosCurrentPrice> findPosCurrentPrice(PosCurrentPrice posCurrentPrice,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posCurrentPrice collection method
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCurrentPrice> listPosCurrentPrice(PosCurrentPrice posCurrentPrice)throws DataAccessException;
 
   /**
   *query posCurrentPrice collection method
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCurrentPrice> listPosCurrentPrice(PosCurrentPrice posCurrentPrice,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posCurrentPrice PosCurrentPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosCurrentPrice(PosCurrentPrice posCurrentPrice)throws DataAccessException;
   
   /**
   *query a posCurrentPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCurrentPrice findPosCurrentPriceById(Long id)throws DataAccessException;
}