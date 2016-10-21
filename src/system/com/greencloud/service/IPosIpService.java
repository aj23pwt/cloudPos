package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosIp;

import org.springframework.dao.DataAccessException;
public interface IPosIpService extends IBaseService
{
   /**
   *save posIp object  method
   *@param posIp PosIp 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void savePosIp(PosIp posIp) throws DataAccessException;
  
   /**
   *update posIp method
   *@param posIp PosIp
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void updatePosIp(PosIp posIp) throws DataAccessException;
  
   /**
   *save or update posIp object method
   *@param posIp PosIp
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-17 10:21
   */
  public void saveOrUpdatePosIp(PosIp posIp) throws DataAccessException;

  /**
   *query a container obj
   *@param posIp PosIp query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-17 10:21
   */
  public Container<PosIp> findPosIp(PosIp posIp,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posIp collection method
   *@param posIp PosIp send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-17  10:21
   */
  public List<PosIp> listPosIp(PosIp posIp)throws DataAccessException;
 
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
  public List<PosIp> listPosIp(PosIp posIp,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posIp PosIp query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-17 10:21
   */
  public int countPosIp(PosIp posIp)throws DataAccessException;
   
   /**
   *query a posIp by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-17 10:21
   */
  public PosIp findPosIpById(Long id)throws DataAccessException;
  
  public List<PosIp> findPosIp(Long hotelGroupId,Long hotelId,Date modifyDatetime) ;
  
  public List<PosIp> getPosIpByCode(Long hotelGroupId,Long hotelId,String code) ;
  
  public void updateNewHotelInit(long hotelGroupId,long hotelId,String type)throws DataAccessException;
}