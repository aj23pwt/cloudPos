package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosHotelTransfer;
import org.springframework.dao.DataAccessException;
public interface IPosHotelTransferService extends IBaseService
{
   /**
   *save posHotelTransfer object  method
   *@param posHotelTransfer PosHotelTransfer 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void savePosHotelTransfer(PosHotelTransfer posHotelTransfer) throws DataAccessException;
  
   /**
   *update posHotelTransfer method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void updatePosHotelTransfer(PosHotelTransfer posHotelTransfer) throws DataAccessException;
  
   /**
   *save or update posHotelTransfer object method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void saveOrUpdatePosHotelTransfer(PosHotelTransfer posHotelTransfer) throws DataAccessException;

  /**
   *query a container obj
   *@param posHotelTransfer PosHotelTransfer query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-06-13 10:23
   */
  public Container<PosHotelTransfer> findPosHotelTransfer(PosHotelTransfer posHotelTransfer,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posHotelTransfer collection method
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13  10:23
   */
  public List<PosHotelTransfer> listPosHotelTransfer(PosHotelTransfer posHotelTransfer)throws DataAccessException;
 
   /**
   *query posHotelTransfer collection method
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13  10:23
   */
  public List<PosHotelTransfer> listPosHotelTransfer(PosHotelTransfer posHotelTransfer,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posHotelTransfer PosHotelTransfer query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-06-13 10:23
   */
  public int countPosHotelTransfer(PosHotelTransfer posHotelTransfer)throws DataAccessException;
   
   /**
   *query a posHotelTransfer by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-06-13 10:23
   */
  public PosHotelTransfer findPosHotelTransferById(Long id)throws DataAccessException;
}