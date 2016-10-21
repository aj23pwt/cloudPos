package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPccode;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPccode into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
public interface IPosPccodeDao extends IBaseDao
{

  /**
   *save posPccode object  method
   *@param posPccode PosPccode 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccode posPccode) throws DataAccessException;

   /**
   *update posPccode method
   *@param posPccode PosPccode
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccode posPccode) throws DataAccessException;
 
   /**
   *save or update posPccode object method
   *@param posPccode PosPccode
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccode posPccode) throws DataAccessException;
  
   /**
   *query posPccode collection method
   *@param posPccode PosPccode send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccode> list(PosPccode posPccode,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPccode PosPccode send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccode> list(PosPccode posPccode)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccode PosPccode query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccode posPccode)throws DataAccessException;
  
   /**
   *query a posPccode by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccode load(Long id)throws DataAccessException;
  
}