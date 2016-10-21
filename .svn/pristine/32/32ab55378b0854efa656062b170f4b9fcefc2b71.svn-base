package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.List;

import com.greencloud.entity.PosSelectedObject;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosSelectedObject into db
   *@author 
   *@version 1.0
   *@date 2016-09-11 15:34
   */
public interface IPosSelectedObjectDao extends IBaseDao
{

  /**
   *save posSelectedObject object  method
   *@param posSelectedObject PosSelectedObject 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void save(PosSelectedObject posSelectedObject) throws DataAccessException;

   /**
   *update posSelectedObject method
   *@param posSelectedObject PosSelectedObject
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void update(PosSelectedObject posSelectedObject) throws DataAccessException;
 
   /**
   *save or update posSelectedObject object method
   *@param posSelectedObject PosSelectedObject
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void saveOrUpdate(PosSelectedObject posSelectedObject) throws DataAccessException;
  
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
  public List<PosSelectedObject> list(PosSelectedObject posSelectedObject,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posSelectedObject PosSelectedObject send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public List<PosSelectedObject> list(PosSelectedObject posSelectedObject)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posSelectedObject PosSelectedObject query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-11 15:34
   */
  public int count(PosSelectedObject posSelectedObject)throws DataAccessException;
  
   /**
   *query a posSelectedObject by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-11 15:34
   */
  public PosSelectedObject load(Long id)throws DataAccessException;
  
  public void deletePosSelectedObject(Long hotelId, Long hotelGroupId, String stationCode);
  
  public List<PosSelectedObject> getPosSelectedObjectByAccnt(Long hotelGroupId,Long hotelId,String accnt,String pcrec,String stationCode);
}