package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPluPrinter;
import org.springframework.dao.DataAccessException;
public interface IPosPluPrinterService extends IBaseService
{
   /**
   *save posPluPrinter object  method
   *@param posPluPrinter PosPluPrinter 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-21 10:55
   */
  public void savePosPluPrinter(PosPluPrinter posPluPrinter) throws DataAccessException;
  
   /**
   *update posPluPrinter method
   *@param posPluPrinter PosPluPrinter
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-21 10:55
   */
  public void updatePosPluPrinter(PosPluPrinter posPluPrinter) throws DataAccessException;
  
   /**
   *save or update posPluPrinter object method
   *@param posPluPrinter PosPluPrinter
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-21 10:55
   */
  public void saveOrUpdatePosPluPrinter(PosPluPrinter posPluPrinter) throws DataAccessException;

  /**
   *query a container obj
   *@param posPluPrinter PosPluPrinter query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-21 10:55
   */
  public Container<PosPluPrinter> findPosPluPrinter(PosPluPrinter posPluPrinter,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPluPrinter collection method
   *@param posPluPrinter PosPluPrinter send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-21  10:55
   */
  public List<PosPluPrinter> listPosPluPrinter(PosPluPrinter posPluPrinter)throws DataAccessException;
 
   /**
   *query posPluPrinter collection method
   *@param posPluPrinter PosPluPrinter send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-21  10:55
   */
  public List<PosPluPrinter> listPosPluPrinter(PosPluPrinter posPluPrinter,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPluPrinter PosPluPrinter query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-21 10:55
   */
  public int countPosPluPrinter(PosPluPrinter posPluPrinter)throws DataAccessException;
   
   /**
   *query a posPluPrinter by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-21 10:55
   */
  public PosPluPrinter findPosPluPrinterById(Long id)throws DataAccessException;
}