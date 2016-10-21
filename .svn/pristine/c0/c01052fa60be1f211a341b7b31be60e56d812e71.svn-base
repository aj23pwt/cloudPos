package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPrinter;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPrinter into db
   *@author 
   *@version 1.0
   *@date 2015-11-17 17:24
   */
public interface IPosPrinterDao extends IBaseDao
{

  /**
   *save posPrinter object  method
   *@param posPrinter PosPrinter 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-17 17:24
   */
  public void save(PosPrinter posPrinter) throws DataAccessException;

   /**
   *update posPrinter method
   *@param posPrinter PosPrinter
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-17 17:24
   */
  public void update(PosPrinter posPrinter) throws DataAccessException;
 
   /**
   *save or update posPrinter object method
   *@param posPrinter PosPrinter
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-17 17:24
   */
  public void saveOrUpdate(PosPrinter posPrinter) throws DataAccessException;
  
   /**
   *query posPrinter collection method
   *@param posPrinter PosPrinter send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-17  17:24
   */
  public List<PosPrinter> list(PosPrinter posPrinter,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPrinter PosPrinter send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-17 17:24
   */
  public List<PosPrinter> list(PosPrinter posPrinter)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPrinter PosPrinter query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-17 17:24
   */
  public int count(PosPrinter posPrinter)throws DataAccessException;
  
   /**
   *query a posPrinter by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-17 17:24
   */
  public PosPrinter load(Long id)throws DataAccessException;
  
}