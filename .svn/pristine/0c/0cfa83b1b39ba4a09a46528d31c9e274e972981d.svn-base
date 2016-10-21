package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosStoreUnit;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosStoreUnit into db
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
public interface IPosStoreUnitDao extends IBaseDao
{

  /**
   *save posStoreUnit object  method
   *@param posStoreUnit PosStoreUnit 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void save(PosStoreUnit posStoreUnit) throws DataAccessException;

   /**
   *update posStoreUnit method
   *@param posStoreUnit PosStoreUnit
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void update(PosStoreUnit posStoreUnit) throws DataAccessException;
 
   /**
   *save or update posStoreUnit object method
   *@param posStoreUnit PosStoreUnit
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void saveOrUpdate(PosStoreUnit posStoreUnit) throws DataAccessException;
  
   /**
   *query posStoreUnit collection method
   *@param posStoreUnit PosStoreUnit send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18  15:49
   */
  public List<PosStoreUnit> list(PosStoreUnit posStoreUnit,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStoreUnit PosStoreUnit send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public List<PosStoreUnit> list(PosStoreUnit posStoreUnit)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreUnit PosStoreUnit query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-18 15:49
   */
  public int count(PosStoreUnit posStoreUnit)throws DataAccessException;
  
   /**
   *query a posStoreUnit by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-18 15:49
   */
  public PosStoreUnit load(Long id)throws DataAccessException;
  
}