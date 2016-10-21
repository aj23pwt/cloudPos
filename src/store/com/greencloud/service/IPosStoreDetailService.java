package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosStoreDetail;
import org.springframework.dao.DataAccessException;
public interface IPosStoreDetailService extends IBaseService
{
   /**
   *save posStoreDetail object  method
   *@param posStoreDetail PosStoreDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void savePosStoreDetail(PosStoreDetail posStoreDetail) throws DataAccessException;
  
   /**
   *update posStoreDetail method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void updatePosStoreDetail(PosStoreDetail posStoreDetail) throws DataAccessException;
  
   /**
   *save or update posStoreDetail object method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdatePosStoreDetail(PosStoreDetail posStoreDetail) throws DataAccessException;

  /**
   *query a container obj
   *@param posStoreDetail PosStoreDetail query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 13:45
   */
  public Container<PosStoreDetail> findPosStoreDetail(PosStoreDetail posStoreDetail,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStoreDetail collection method
   *@param posStoreDetail PosStoreDetail send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreDetail> listPosStoreDetail(PosStoreDetail posStoreDetail)throws DataAccessException;
 
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
  public List<PosStoreDetail> listPosStoreDetail(PosStoreDetail posStoreDetail,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreDetail PosStoreDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int countPosStoreDetail(PosStoreDetail posStoreDetail)throws DataAccessException;
   
   /**
   *query a posStoreDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreDetail findPosStoreDetailById(Long id)throws DataAccessException;
}