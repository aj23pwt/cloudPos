package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.List;

import com.greencloud.dto.PosTableDto;
import com.greencloud.entity.PosStation;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosStation into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
public interface IPosStationDao extends IBaseDao
{

  /**
   *save posStation object  method
   *@param posStation PosStation 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosStation posStation) throws DataAccessException;

   /**
   *update posStation method
   *@param posStation PosStation
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosStation posStation) throws DataAccessException;
 
   /**
   *save or update posStation object method
   *@param posStation PosStation
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosStation posStation) throws DataAccessException;
  
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
  public List<PosStation> list(PosStation posStation,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStation PosStation send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosStation> list(PosStation posStation)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStation PosStation query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosStation posStation)throws DataAccessException;
  
   /**
   *query a posStation by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosStation load(Long id)throws DataAccessException;
  
  
  
  public List<PosTableDto> getPosTable();
}