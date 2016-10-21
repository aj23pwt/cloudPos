package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosModeDef;
import org.springframework.dao.DataAccessException;
public interface IPosModeDefService extends IBaseService
{
   /**
   *save posModeDef object  method
   *@param posModeDef PosModeDef 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosModeDef(PosModeDef posModeDef) throws DataAccessException;
  
   /**
   *update posModeDef method
   *@param posModeDef PosModeDef
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosModeDef(PosModeDef posModeDef) throws DataAccessException;
  
   /**
   *save or update posModeDef object method
   *@param posModeDef PosModeDef
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosModeDef(PosModeDef posModeDef) throws DataAccessException;

  /**
   *query a container obj
   *@param posModeDef PosModeDef query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosModeDef> findPosModeDef(PosModeDef posModeDef,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posModeDef collection method
   *@param posModeDef PosModeDef send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeDef> listPosModeDef(PosModeDef posModeDef)throws DataAccessException;
 
   /**
   *query posModeDef collection method
   *@param posModeDef PosModeDef send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeDef> listPosModeDef(PosModeDef posModeDef,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posModeDef PosModeDef query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosModeDef(PosModeDef posModeDef)throws DataAccessException;
   
   /**
   *query a posModeDef by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeDef findPosModeDefById(Long id)throws DataAccessException;
}