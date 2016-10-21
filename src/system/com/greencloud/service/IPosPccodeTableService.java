package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPccodeTable;
import org.springframework.dao.DataAccessException;
public interface IPosPccodeTableService extends IBaseService
{
   /**
   *save posPccodeTable object  method
   *@param posPccodeTable PosPccodeTable 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccodeTable(PosPccodeTable posPccodeTable) throws DataAccessException;
  
   /**
   *update posPccodeTable method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccodeTable(PosPccodeTable posPccodeTable) throws DataAccessException;
  
   /**
   *save or update posPccodeTable object method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccodeTable(PosPccodeTable posPccodeTable) throws DataAccessException;

  /**
   *query a container obj
   *@param posPccodeTable PosPccodeTable query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccodeTable> findPosPccodeTable(PosPccodeTable posPccodeTable,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPccodeTable collection method
   *@param posPccodeTable PosPccodeTable send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeTable> listPosPccodeTable(PosPccodeTable posPccodeTable)throws DataAccessException;
 
   /**
   *query posPccodeTable collection method
   *@param posPccodeTable PosPccodeTable send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeTable> listPosPccodeTable(PosPccodeTable posPccodeTable,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeTable PosPccodeTable query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccodeTable(PosPccodeTable posPccodeTable)throws DataAccessException;
   
   /**
   *query a posPccodeTable by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeTable findPosPccodeTableById(Long id)throws DataAccessException;
}