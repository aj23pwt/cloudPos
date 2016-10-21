package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.ArrayList;
import java.util.List;

import com.greencloud.entity.PosStoreMaster;

import org.springframework.dao.DataAccessException;
public interface IPosStoreMasterService extends IBaseService
{
   /**
   *save posStoreMaster object  method
   *@param posStoreMaster PosStoreMaster 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void savePosStoreMaster(PosStoreMaster posStoreMaster) throws DataAccessException;
  
   /**
   *update posStoreMaster method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void updatePosStoreMaster(PosStoreMaster posStoreMaster) throws DataAccessException;
  
   /**
   *save or update posStoreMaster object method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdatePosStoreMaster(PosStoreMaster posStoreMaster) throws DataAccessException;

  /**
   *query a container obj
   *@param posStoreMaster PosStoreMaster query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 13:45
   */
  public Container<PosStoreMaster> findPosStoreMaster(PosStoreMaster posStoreMaster,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStoreMaster collection method
   *@param posStoreMaster PosStoreMaster send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreMaster> listPosStoreMaster(PosStoreMaster posStoreMaster)throws DataAccessException;
 
   /**
   *query posStoreMaster collection method
   *@param posStoreMaster PosStoreMaster send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreMaster> listPosStoreMaster(PosStoreMaster posStoreMaster,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreMaster PosStoreMaster query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int countPosStoreMaster(PosStoreMaster posStoreMaster)throws DataAccessException;
   
   /**
   *query a posStoreMaster by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreMaster findPosStoreMasterById(Long id)throws DataAccessException;
  
  public void savePosStoreMasterAndDetails(PosStoreMaster posStoreMaster, ArrayList<Object> posStoreDetailList, Long hotelGroupId, Long hotelId);
  public void updatePosStoreMasterAndDetails(PosStoreMaster posStoreMaster, ArrayList<Object> posStoreDetailList);
  public void deletePosStoreMasterAndDetails(PosStoreMaster posStoreMaster, ArrayList<Object> posStoreDetailList);
}