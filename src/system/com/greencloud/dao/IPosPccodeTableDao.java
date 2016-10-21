package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPccodeTable;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPccodeTable into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
public interface IPosPccodeTableDao extends IBaseDao
{

  /**
   *save posPccodeTable object  method
   *@param posPccodeTable PosPccodeTable 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccodeTable posPccodeTable) throws DataAccessException;

   /**
   *update posPccodeTable method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccodeTable posPccodeTable) throws DataAccessException;
 
   /**
   *save or update posPccodeTable object method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccodeTable posPccodeTable) throws DataAccessException;
  
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
  public List<PosPccodeTable> list(PosPccodeTable posPccodeTable,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPccodeTable PosPccodeTable send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccodeTable> list(PosPccodeTable posPccodeTable)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeTable PosPccodeTable query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccodeTable posPccodeTable)throws DataAccessException;
  
   /**
   *query a posPccodeTable by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeTable load(Long id)throws DataAccessException;
  
}