package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosModeName;
import org.springframework.dao.DataAccessException;
public interface IPosModeNameService extends IBaseService
{
   /**
   *save posModeName object  method
   *@param posModeName PosModeName 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosModeName(PosModeName posModeName) throws DataAccessException;
  
   /**
   *update posModeName method
   *@param posModeName PosModeName
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosModeName(PosModeName posModeName) throws DataAccessException;
  
   /**
   *save or update posModeName object method
   *@param posModeName PosModeName
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosModeName(PosModeName posModeName) throws DataAccessException;

  /**
   *query a container obj
   *@param posModeName PosModeName query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosModeName> findPosModeName(PosModeName posModeName,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posModeName collection method
   *@param posModeName PosModeName send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeName> listPosModeName(PosModeName posModeName)throws DataAccessException;
 
   /**
   *query posModeName collection method
   *@param posModeName PosModeName send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeName> listPosModeName(PosModeName posModeName,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posModeName PosModeName query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosModeName(PosModeName posModeName)throws DataAccessException;
   
   /**
   *query a posModeName by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeName findPosModeNameById(Long id)throws DataAccessException;
}