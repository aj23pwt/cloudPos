package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosSortAll;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosSortAll into db
   *@author 
   *@version 1.0
   *@date 2015-03-20 16:10
   */
public interface IPosSortAllDao extends IBaseDao
{

  /**
   *save posSortAll object  method
   *@param posSortAll PosSortAll 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void save(PosSortAll posSortAll) throws DataAccessException;

   /**
   *update posSortAll method
   *@param posSortAll PosSortAll
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void update(PosSortAll posSortAll) throws DataAccessException;
 
   /**
   *save or update posSortAll object method
   *@param posSortAll PosSortAll
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void saveOrUpdate(PosSortAll posSortAll) throws DataAccessException;
  
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
  public List<PosSortAll> list(PosSortAll posSortAll,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posSortAll PosSortAll send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public List<PosSortAll> list(PosSortAll posSortAll)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posSortAll PosSortAll query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-20 16:10
   */
  public int count(PosSortAll posSortAll)throws DataAccessException;
  
   /**
   *query a posSortAll by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-20 16:10
   */
  public PosSortAll load(Long id)throws DataAccessException;
  
  
  public List<PosSortAll> findPosSortAll(Long hotelGroupId, Long hotelId, Date modifyDatetime);
  
  public List<PosSortAll> listPosSortAllByPcode(Long hotelGroupId, Long hotelId, String pcCode)throws DataAccessException;

  public List<PosSortAll> getPosSortAllList(Long hotelGroupId, Long hotelId);
  
}