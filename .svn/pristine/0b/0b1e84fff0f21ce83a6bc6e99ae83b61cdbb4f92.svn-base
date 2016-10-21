package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosPccodeNote;
import com.greencloud.entity.PosPluAll;

import org.springframework.dao.DataAccessException;
public interface IPosPccodeNoteService extends IBaseService
{
   /**
   *save posPccodeNote object  method
   *@param posPccodeNote PosPccodeNote 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccodeNote(PosPccodeNote posPccodeNote) throws DataAccessException;
  
   /**
   *update posPccodeNote method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccodeNote(PosPccodeNote posPccodeNote) throws DataAccessException;
  
   /**
   *save or update posPccodeNote object method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccodeNote(PosPccodeNote posPccodeNote) throws DataAccessException;

  /**
   *query a container obj
   *@param posPccodeNote PosPccodeNote query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccodeNote> findPosPccodeNote(PosPccodeNote posPccodeNote,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posPccodeNote collection method
   *@param posPccodeNote PosPccodeNote send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeNote> listPosPccodeNote(PosPccodeNote posPccodeNote)throws DataAccessException;
 
   /**
   *query posPccodeNote collection method
   *@param posPccodeNote PosPccodeNote send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeNote> listPosPccodeNote(PosPccodeNote posPccodeNote,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeNote PosPccodeNote query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccodeNote(PosPccodeNote posPccodeNote)throws DataAccessException;
   
   /**
   *query a posPccodeNote by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeNote findPosPccodeNoteById(Long id)throws DataAccessException;
  
  
  public List<PosPccodeNote> findPosPccodeNote(Long hotelGroupId,Long hotelId,Date modifyDatetime);
}