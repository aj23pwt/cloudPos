package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosStoreDetail;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosStoreDetail into db
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
public interface IPosStoreDetailDao extends IBaseDao
{

  /**
   *save posStoreDetail object  method
   *@param posStoreDetail PosStoreDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void save(PosStoreDetail posStoreDetail) throws DataAccessException;

   /**
   *update posStoreDetail method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void update(PosStoreDetail posStoreDetail) throws DataAccessException;
 
   /**
   *save or update posStoreDetail object method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdate(PosStoreDetail posStoreDetail) throws DataAccessException;
  
   /**
   *query posStoreDetail collection method
   *@param posStoreDetail PosStoreDetail send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreDetail> list(PosStoreDetail posStoreDetail,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStoreDetail PosStoreDetail send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public List<PosStoreDetail> list(PosStoreDetail posStoreDetail)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreDetail PosStoreDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int count(PosStoreDetail posStoreDetail)throws DataAccessException;
  
   /**
   *query a posStoreDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreDetail load(Long id)throws DataAccessException;
  
}