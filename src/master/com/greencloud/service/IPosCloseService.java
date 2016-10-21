package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosClose;
import org.springframework.dao.DataAccessException;
public interface IPosCloseService extends IBaseService
{
   /**
   *save posClose object  method
   *@param posClose PosClose 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void savePosClose(PosClose posClose) throws DataAccessException;
  
   /**
   *update posClose method
   *@param posClose PosClose
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void updatePosClose(PosClose posClose) throws DataAccessException;
  
   /**
   *save or update posClose object method
   *@param posClose PosClose
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void saveOrUpdatePosClose(PosClose posClose) throws DataAccessException;

  /**
   *query a container obj
   *@param posClose PosClose query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-10 11:48
   */
  public Container<PosClose> findPosClose(PosClose posClose,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posClose collection method
   *@param posClose PosClose send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10  11:48
   */
  public List<PosClose> listPosClose(PosClose posClose)throws DataAccessException;
 
   /**
   *query posClose collection method
   *@param posClose PosClose send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10  11:48
   */
  public List<PosClose> listPosClose(PosClose posClose,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posClose PosClose query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-10 11:48
   */
  public int countPosClose(PosClose posClose)throws DataAccessException;
   
   /**
   *query a posClose by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-10 11:48
   */
  public PosClose findPosCloseById(Long id)throws DataAccessException;
}