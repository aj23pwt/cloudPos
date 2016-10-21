package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.entity.PosPrinter;
import com.greencloud.entity.PosPserver;

import org.springframework.dao.DataAccessException;
public interface IPosPrinterService extends IBaseService
{
   /**
   *save posPrinter object  method
   *@param posPrinter PosPrinter 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-03 18:58
   */
  public void savePosPrinter(PosPrinter posPrinter) throws DataAccessException;
  
   /**
   *update posPrinter method
   *@param posPrinter PosPrinter
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-03 18:58
   */
  public void updatePosPrinter(PosPrinter posPrinter) throws DataAccessException;
  
   /**
   *save or update posPrinter object method
   *@param posPrinter PosPrinter
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-03 18:58
   */
  public void saveOrUpdatePosPrinter(PosPrinter posPrinter) throws DataAccessException;

  /**
   *query a container obj
   *@param posPrinter PosPrinter query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-03 18:58
   */
  public Container<PosPrinter> findPosPrinter(PosPrinter posPrinter,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPrinter collection method
   *@param posPrinter PosPrinter send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-03  18:58
   */
  public List<PosPrinter> listPosPrinter(PosPrinter posPrinter)throws DataAccessException;
 
   /**
   *query posPrinter collection method
   *@param posPrinter PosPrinter send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-03  18:58
   */
  public List<PosPrinter> listPosPrinter(PosPrinter posPrinter,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPrinter PosPrinter query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-03 18:58
   */
  public int countPosPrinter(PosPrinter posPrinter)throws DataAccessException;
   
   /**
   *query a posPrinter by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-03 18:58
   */
  public PosPrinter findPosPrinterById(Long id)throws DataAccessException;
  
  /**
   *save PosPserver object  method
   *@param PosPserver posPserver 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-26 11:26
   */
public void savePosPserver(PosPserver posPserver) throws DataAccessException;
  /**
   *update PosPserver object  method
   *@param PosPserver posPserver 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-26 11:26
   */
public void updatePosPserver(PosPserver posPserver) throws DataAccessException;

/**
 *save PosPserver object  method
 *@param PosPserver posPserver 
 *@throws DataAccessException 
 *@author  
 *@version 1.0
 *@date 2015-11-26 11:26
 */
public void saveOrUpdatePosPserver(PosPserver posPserver) throws DataAccessException;

   /**
   *query collection method  
   *@param PosPserver posPserve send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-26 11:26
   */
public List<PosPserver> listPosPserver(PosPserver posPserve)throws DataAccessException;

}