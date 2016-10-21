package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosStoreClass;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosStoreClass into db
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
public interface IPosStoreClassDao extends IBaseDao
{

  /**
   *save posStoreClass object  method
   *@param posStoreClass PosStoreClass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void save(PosStoreClass posStoreClass) throws DataAccessException;

   /**
   *update posStoreClass method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void update(PosStoreClass posStoreClass) throws DataAccessException;
 
   /**
   *save or update posStoreClass object method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdate(PosStoreClass posStoreClass) throws DataAccessException;
  
   /**
   *query posStoreClass collection method
   *@param posStoreClass PosStoreClass send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreClass> list(PosStoreClass posStoreClass,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStoreClass PosStoreClass send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public List<PosStoreClass> list(PosStoreClass posStoreClass)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreClass PosStoreClass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int count(PosStoreClass posStoreClass)throws DataAccessException;
  
   /**
   *query a posStoreClass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreClass load(Long id)throws DataAccessException;
  
}