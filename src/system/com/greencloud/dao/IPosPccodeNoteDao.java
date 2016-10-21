package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosPccodeNote;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosPccodeNote into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
public interface IPosPccodeNoteDao extends IBaseDao
{

  /**
   *save posPccodeNote object  method
   *@param posPccodeNote PosPccodeNote 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccodeNote posPccodeNote) throws DataAccessException;

   /**
   *update posPccodeNote method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccodeNote posPccodeNote) throws DataAccessException;
 
   /**
   *save or update posPccodeNote object method
   *@param posPccodeNote PosPccodeNote
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccodeNote posPccodeNote) throws DataAccessException;
  
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
  public List<PosPccodeNote> list(PosPccodeNote posPccodeNote,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPccodeNote PosPccodeNote send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccodeNote> list(PosPccodeNote posPccodeNote)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeNote PosPccodeNote query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccodeNote posPccodeNote)throws DataAccessException;
  
   /**
   *query a posPccodeNote by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeNote load(Long id)throws DataAccessException;
  
  
  public List<PosPccodeNote> findPosPccodeNote(Long hotelGroupId, Long hotelId,Date modifyDatetime) ;
  
}