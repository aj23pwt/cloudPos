package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPccodeShift;
import org.springframework.dao.DataAccessException;
public interface IPosPccodeShiftService extends IBaseService
{
   /**
   *save posPccodeShift object  method
   *@param posPccodeShift PosPccodeShift 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccodeShift(PosPccodeShift posPccodeShift) throws DataAccessException;
  
   /**
   *update posPccodeShift method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccodeShift(PosPccodeShift posPccodeShift) throws DataAccessException;
  
   /**
   *save or update posPccodeShift object method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccodeShift(PosPccodeShift posPccodeShift) throws DataAccessException;

  /**
   *query a container obj
   *@param posPccodeShift PosPccodeShift query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccodeShift> findPosPccodeShift(PosPccodeShift posPccodeShift,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPccodeShift collection method
   *@param posPccodeShift PosPccodeShift send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeShift> listPosPccodeShift(PosPccodeShift posPccodeShift)throws DataAccessException;
 
   /**
   *query posPccodeShift collection method
   *@param posPccodeShift PosPccodeShift send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeShift> listPosPccodeShift(PosPccodeShift posPccodeShift,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeShift PosPccodeShift query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccodeShift(PosPccodeShift posPccodeShift)throws DataAccessException;
   
   /**
   *query a posPccodeShift by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeShift findPosPccodeShiftById(Long id)throws DataAccessException;
}