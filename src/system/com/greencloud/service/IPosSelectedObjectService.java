package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.entity.PosSelectedObject;

import org.springframework.dao.DataAccessException;
public interface IPosSelectedObjectService extends IBaseService
{
   /**
   *save posSelectedObject object  method
   *@param posSelectedObject PosSelectedObject 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void savePosSelectedObject(PosSelectedObject posSelectedObject) throws DataAccessException;
  
   /**
   *update posSelectedObject method
   *@param posSelectedObject PosSelectedObject
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void updatePosSelectedObject(PosSelectedObject posSelectedObject) throws DataAccessException;
  
   /**
   *save or update posSelectedObject object method
   *@param posSelectedObject PosSelectedObject
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void saveOrUpdatePosSelectedObject(PosSelectedObject posSelectedObject) throws DataAccessException;

  /**
   *query a container obj
   *@param posSelectedObject PosSelectedObject query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-09-11 15:34
   */
  public Container<PosSelectedObject> findPosSelectedObject(PosSelectedObject posSelectedObject,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posSelectedObject collection method
   *@param posSelectedObject PosSelectedObject send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11  15:34
   */
  public List<PosSelectedObject> listPosSelectedObject(PosSelectedObject posSelectedObject)throws DataAccessException;
 
   /**
   *query posSelectedObject collection method
   *@param posSelectedObject PosSelectedObject send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11  15:34
   */
  public List<PosSelectedObject> listPosSelectedObject(PosSelectedObject posSelectedObject,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posSelectedObject PosSelectedObject query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-11 15:34
   */
  public int countPosSelectedObject(PosSelectedObject posSelectedObject)throws DataAccessException;
   
   /**
   *query a posSelectedObject by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-11 15:34
   */
  public PosSelectedObject findPosSelectedObjectById(Long id)throws DataAccessException;
  public void savePosSelectedObject(long hotelGroupId,long hotelId,String stationCode,String stationDes,String userCode,String accnt,String pcrec,String mode);
  public void deletePosSelectedObject(long hotelId, long hotelGroupId, String stationCode);
  public List<PosSelectedObject> getPosSelectedObjectByAccnt(long hotelGroupId,long hotelId,String accnt,String pcrec,String stationCode);
}