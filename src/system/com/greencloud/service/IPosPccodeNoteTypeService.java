package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosPccodeNoteType;
import org.springframework.dao.DataAccessException;
public interface IPosPccodeNoteTypeService extends IBaseService
{
   /**
   *save posPccodeNoteType object  method
   *@param posPccodeNoteType PosPccodeNoteType 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void savePosPccodeNoteType(PosPccodeNoteType posPccodeNoteType) throws DataAccessException;
  
   /**
   *update posPccodeNoteType method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void updatePosPccodeNoteType(PosPccodeNoteType posPccodeNoteType) throws DataAccessException;
  
   /**
   *save or update posPccodeNoteType object method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void saveOrUpdatePosPccodeNoteType(PosPccodeNoteType posPccodeNoteType) throws DataAccessException;

  /**
   *query a container obj
   *@param posPccodeNoteType PosPccodeNoteType query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-09-29 10:51
   */
  public Container<PosPccodeNoteType> findPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPccodeNoteType collection method
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29  10:51
   */
  public List<PosPccodeNoteType> listPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType)throws DataAccessException;
 
   /**
   *query posPccodeNoteType collection method
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29  10:51
   */
  public List<PosPccodeNoteType> listPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeNoteType PosPccodeNoteType query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-29 10:51
   */
  public int countPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType)throws DataAccessException;
   
   /**
   *query a posPccodeNoteType by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-29 10:51
   */
  public PosPccodeNoteType findPosPccodeNoteTypeById(Long id)throws DataAccessException;
}