package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.entity.PosStoreClass;

import org.springframework.dao.DataAccessException;
public interface IPosStoreClassService extends IBaseService
{
   /**
   *save posStoreClass object  method
   *@param posStoreClass PosStoreClass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void savePosStoreClass(PosStoreClass posStoreClass) throws DataAccessException;
  
   /**
   *update posStoreClass method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void updatePosStoreClass(PosStoreClass posStoreClass) throws DataAccessException;
  
   /**
   *save or update posStoreClass object method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdatePosStoreClass(PosStoreClass posStoreClass) throws DataAccessException;

  /**
   *query a container obj
   *@param posStoreClass PosStoreClass query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 13:38
   */
  public Container<PosStoreClass> findPosStoreClass(PosStoreClass posStoreClass,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStoreClass collection method
   *@param posStoreClass PosStoreClass send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreClass> listPosStoreClass(PosStoreClass posStoreClass)throws DataAccessException;
 
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
  public List<PosStoreClass> listPosStoreClass(PosStoreClass posStoreClass,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreClass PosStoreClass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int countPosStoreClass(PosStoreClass posStoreClass)throws DataAccessException;
   
   /**
   *query a posStoreClass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreClass findPosStoreClassById(Long id)throws DataAccessException;
  
  public List<PosStoreClass> getPosStoreClassById(Long hotelGroupId, Long hotelId);

  public void saveGroupPosClass(Long hotelGroupId, Long hotelId,PosStoreClass posStoreClass, String hotels);

  public void updatePosClassByDto(Long hotelGroupId, Long hotelId,PosStoreEditDto posStoreEditDto);

  public void deleteGroupPosClass(Long hotelGroupId, Long hotelId,long id);
}