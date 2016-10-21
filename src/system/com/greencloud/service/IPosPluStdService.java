package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPluStd;
import org.springframework.dao.DataAccessException;
public interface IPosPluStdService extends IBaseService
{
   /**
   *save posPluStd object  method
   *@param posPluStd PosPluStd 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosPluStd(PosPluStd posPluStd) throws DataAccessException;
  
   /**
   *update posPluStd method
   *@param posPluStd PosPluStd
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosPluStd(PosPluStd posPluStd) throws DataAccessException;
  
   /**
   *save or update posPluStd object method
   *@param posPluStd PosPluStd
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosPluStd(PosPluStd posPluStd) throws DataAccessException;

  /**
   *query a container obj
   *@param posPluStd PosPluStd query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosPluStd> findPosPluStd(PosPluStd posPluStd,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPluStd collection method
   *@param posPluStd PosPluStd send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPluStd> listPosPluStd(PosPluStd posPluStd)throws DataAccessException;
 
   /**
   *query posPluStd collection method
   *@param posPluStd PosPluStd send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPluStd> listPosPluStd(PosPluStd posPluStd,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPluStd PosPluStd query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosPluStd(PosPluStd posPluStd)throws DataAccessException;
   
   /**
   *query a posPluStd by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPluStd findPosPluStdById(Long id)throws DataAccessException;
}