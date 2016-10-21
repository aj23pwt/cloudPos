package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPrice;
import org.springframework.dao.DataAccessException;
public interface IPosPriceService extends IBaseService
{
   /**
   *save posPrice object  method
   *@param posPrice PosPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosPrice(PosPrice posPrice) throws DataAccessException;
  
   /**
   *update posPrice method
   *@param posPrice PosPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosPrice(PosPrice posPrice) throws DataAccessException;
  
   /**
   *save or update posPrice object method
   *@param posPrice PosPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosPrice(PosPrice posPrice) throws DataAccessException;

  /**
   *query a container obj
   *@param posPrice PosPrice query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosPrice> findPosPrice(PosPrice posPrice,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPrice collection method
   *@param posPrice PosPrice send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPrice> listPosPrice(PosPrice posPrice)throws DataAccessException;
 
   /**
   *query posPrice collection method
   *@param posPrice PosPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPrice> listPosPrice(PosPrice posPrice,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPrice PosPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosPrice(PosPrice posPrice)throws DataAccessException;
   
   /**
   *query a posPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPrice findPosPriceById(Long id)throws DataAccessException;
}