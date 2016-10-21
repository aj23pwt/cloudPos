package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosHotelTransfer;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosHotelTransfer into db
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
public interface IPosHotelTransferDao extends IBaseDao
{

  /**
   *save posHotelTransfer object  method
   *@param posHotelTransfer PosHotelTransfer 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void save(PosHotelTransfer posHotelTransfer) throws DataAccessException;

   /**
   *update posHotelTransfer method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void update(PosHotelTransfer posHotelTransfer) throws DataAccessException;
 
   /**
   *save or update posHotelTransfer object method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void saveOrUpdate(PosHotelTransfer posHotelTransfer) throws DataAccessException;
  
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
  public List<PosHotelTransfer> list(PosHotelTransfer posHotelTransfer,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public List<PosHotelTransfer> list(PosHotelTransfer posHotelTransfer)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posHotelTransfer PosHotelTransfer query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-06-13 10:23
   */
  public int count(PosHotelTransfer posHotelTransfer)throws DataAccessException;
  
   /**
   *query a posHotelTransfer by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-06-13 10:23
   */
  public PosHotelTransfer load(Long id)throws DataAccessException;
  
}