package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosSortAll;
import org.springframework.dao.DataAccessException;
public interface IPosSortAllService extends IBaseService
{
   /**
   *save posSortAll object  method
   *@param posSortAll PosSortAll 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void savePosSortAll(PosSortAll posSortAll) throws DataAccessException;
  
   /**
   *update posSortAll method
   *@param posSortAll PosSortAll
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void updatePosSortAll(PosSortAll posSortAll) throws DataAccessException;
  
   /**
   *save or update posSortAll object method
   *@param posSortAll PosSortAll
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void saveOrUpdatePosSortAll(PosSortAll posSortAll) throws DataAccessException;

  /**
   *query a container obj
   *@param posSortAll PosSortAll query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-20 16:10
   */
  public Container<PosSortAll> findPosSortAll(PosSortAll posSortAll,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posSortAll collection method
   *@param posSortAll PosSortAll send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20  16:10
   */
  public List<PosSortAll> listPosSortAll(PosSortAll posSortAll)throws DataAccessException;
 
   /**
   *query posSortAll collection method
   *@param posSortAll PosSortAll send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20  16:10
   */
  public List<PosSortAll> listPosSortAll(PosSortAll posSortAll,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posSortAll PosSortAll query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-20 16:10
   */
  public int countPosSortAll(PosSortAll posSortAll)throws DataAccessException;
   
   /**
   *query a posSortAll by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-20 16:10
   */
  public PosSortAll findPosSortAllById(Long id)throws DataAccessException;
  
  public List<PosSortAll> getPosSortAll(Long hotelGroupId,Long hotelId);
  
  public List<PosSortAll> findPosSortAll(Long hotelGroupId, Long hotelId, Date modifyDatetime);
  
  public List<PosSortAll> listPosSortAllByPcode(Long hotelGroupId, Long hotelId, String pcCode)throws DataAccessException;
}