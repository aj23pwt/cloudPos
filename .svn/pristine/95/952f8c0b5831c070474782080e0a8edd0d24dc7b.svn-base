package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPay;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPay into db
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
public interface IPosPayDao extends IBaseDao
{

  /**
   *save posPay object  method
   *@param posPay PosPay 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void save(PosPay posPay) throws DataAccessException;

   /**
   *update posPay method
   *@param posPay PosPay
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void update(PosPay posPay) throws DataAccessException;
 
   /**
   *save or update posPay object method
   *@param posPay PosPay
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void saveOrUpdate(PosPay posPay) throws DataAccessException;
  
   /**
   *query posPay collection method
   *@param posPay PosPay send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosPay> list(PosPay posPay,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPay PosPay send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public List<PosPay> list(PosPay posPay)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPay PosPay query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-01 13:44
   */
  public int count(PosPay posPay)throws DataAccessException;
  
   /**
   *query a posPay by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-01 13:44
   */
  public PosPay load(Long id)throws DataAccessException;
  public List<PosPay> getPosPayList(String  sql)throws DataAccessException;
}