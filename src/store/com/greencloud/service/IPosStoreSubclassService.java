package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.entity.PosStoreSubclass;

import org.springframework.dao.DataAccessException;
public interface IPosStoreSubclassService extends IBaseService
{
   /**
   *save posStoreSubclass object  method
   *@param posStoreSubclass PosStoreSubclass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void savePosStoreSubclass(PosStoreSubclass posStoreSubclass) throws DataAccessException;
  
   /**
   *update posStoreSubclass method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void updatePosStoreSubclass(PosStoreSubclass posStoreSubclass) throws DataAccessException;
  
   /**
   *save or update posStoreSubclass object method
   *@param posStoreSubclass PosStoreSubclass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 14:20
   */
  public void saveOrUpdatePosStoreSubclass(PosStoreSubclass posStoreSubclass) throws DataAccessException;

  /**
   *query a container obj
   *@param posStoreSubclass PosStoreSubclass query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 14:20
   */
  public Container<PosStoreSubclass> findPosStoreSubclass(PosStoreSubclass posStoreSubclass,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStoreSubclass collection method
   *@param posStoreSubclass PosStoreSubclass send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  14:20
   */
  public List<PosStoreSubclass> listPosStoreSubclass(PosStoreSubclass posStoreSubclass)throws DataAccessException;
 
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
  public List<PosStoreSubclass> listPosStoreSubclass(PosStoreSubclass posStoreSubclass,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreSubclass PosStoreSubclass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 14:20
   */
  public int countPosStoreSubclass(PosStoreSubclass posStoreSubclass)throws DataAccessException;
   
   /**
   *query a posStoreSubclass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 14:20
   */
  public PosStoreSubclass findPosStoreSubclassById(Long id)throws DataAccessException;
  
  
  public List<PosStoreSubclass> getPosStoreSubClassBycode(Long hotelGroupId,Long hotelId, String scode);

  public void saveGroupPosSubClass(Long hotelGroupId, Long hotelId,PosStoreSubclass posSubClass, String hotels);

  public void updatePosSubClassByDto(Long hotelGroupId, Long hotelId,PosStoreEditDto posStoreEditDto);

  public void deleteGroupPosSubClass(Long hotelGroupId, Long hotelId,PosStoreSubclass posSubClass);

  public List<PosStoreSubclass> checkDataSubClass(Long hotelGroupId, Long hotelId,String scode);
}