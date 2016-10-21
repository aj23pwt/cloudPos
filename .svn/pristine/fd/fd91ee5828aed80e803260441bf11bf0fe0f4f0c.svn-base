package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.dto.PosTableDto;
import com.greencloud.entity.PosStation;

import org.springframework.dao.DataAccessException;
public interface IPosStationService extends IBaseService
{
   /**
   *save posStation object  method
   *@param posStation PosStation 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosStation(PosStation posStation) throws DataAccessException;
  
   /**
   *update posStation method
   *@param posStation PosStation
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosStation(PosStation posStation) throws DataAccessException;
  
   /**
   *save or update posStation object method
   *@param posStation PosStation
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosStation(PosStation posStation) throws DataAccessException;

  /**
   *query a container obj
   *@param posStation PosStation query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosStation> findPosStation(PosStation posStation,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStation collection method
   *@param posStation PosStation send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosStation> listPosStation(PosStation posStation)throws DataAccessException;
 
   /**
   *query posStation collection method
   *@param posStation PosStation send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosStation> listPosStation(PosStation posStation,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStation PosStation query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosStation(PosStation posStation)throws DataAccessException;
   
   /**
   *query a posStation by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosStation findPosStationById(Long id)throws DataAccessException;
  
  public List<PosTableDto> getPosTable();
}