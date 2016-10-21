package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosIp;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosIp into db
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
public interface IPosIpDao extends IBaseDao
{

  /**
   *save posIp object  method
   *@param posIp PosIp 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void save(PosIp posIp) throws DataAccessException;

   /**
   *update posIp method
   *@param posIp PosIp
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void update(PosIp posIp) throws DataAccessException;
 
   /**
   *save or update posIp object method
   *@param posIp PosIp
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void saveOrUpdate(PosIp posIp) throws DataAccessException;
  
   /**
   *query posIp collection method
   *@param posIp PosIp send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-17  10:21
   */
  public List<PosIp> list(PosIp posIp,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posIp PosIp send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public List<PosIp> list(PosIp posIp)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posIp PosIp query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-17 10:21
   */
  public int count(PosIp posIp)throws DataAccessException;
  
   /**
   *query a posIp by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-17 10:21
   */
  public PosIp load(Long id)throws DataAccessException;
  
  public List<PosIp> findPosIp(Long hotelGroupId,Long hotelId,Date modifyDatetime) ;
  
  public void updateNewHotelInit(final Long hotelGroupId,final Long hotelId,final String type) throws DataAccessException;
}