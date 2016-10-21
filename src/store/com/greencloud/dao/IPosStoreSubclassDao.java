package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosStoreSubclass;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosStoreSubclass into db
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
public interface IPosStoreSubclassDao extends IBaseDao
{

  /**
   *save posStoreSubclass object  method
   *@param posStoreSubclass PosStoreSubclass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void save(PosStoreSubclass posStoreSubclass) throws DataAccessException;

   /**
   *update posStoreSubclass method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void update(PosStoreSubclass posStoreSubclass) throws DataAccessException;
 
   /**
   *save or update posStoreSubclass object method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void saveOrUpdate(PosStoreSubclass posStoreSubclass) throws DataAccessException;
  
   /**
   *query posStoreSubclass collection method
   *@param posStoreSubclass PosStoreSubclass send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  14:20
   */
  public List<PosStoreSubclass> list(PosStoreSubclass posStoreSubclass,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStoreSubclass PosStoreSubclass send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public List<PosStoreSubclass> list(PosStoreSubclass posStoreSubclass)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreSubclass PosStoreSubclass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 14:20
   */
  public int count(PosStoreSubclass posStoreSubclass)throws DataAccessException;
  
   /**
   *query a posStoreSubclass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 14:20
   */
  public PosStoreSubclass load(Long id)throws DataAccessException;
  
}