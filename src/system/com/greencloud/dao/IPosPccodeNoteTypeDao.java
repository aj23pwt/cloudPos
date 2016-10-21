package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPccodeNoteType;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPccodeNoteType into db
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
public interface IPosPccodeNoteTypeDao extends IBaseDao
{

  /**
   *save posPccodeNoteType object  method
   *@param posPccodeNoteType PosPccodeNoteType 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void save(PosPccodeNoteType posPccodeNoteType) throws DataAccessException;

   /**
   *update posPccodeNoteType method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void update(PosPccodeNoteType posPccodeNoteType) throws DataAccessException;
 
   /**
   *save or update posPccodeNoteType object method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void saveOrUpdate(PosPccodeNoteType posPccodeNoteType) throws DataAccessException;
  
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
  public List<PosPccodeNoteType> list(PosPccodeNoteType posPccodeNoteType,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public List<PosPccodeNoteType> list(PosPccodeNoteType posPccodeNoteType)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeNoteType PosPccodeNoteType query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-29 10:51
   */
  public int count(PosPccodeNoteType posPccodeNoteType)throws DataAccessException;
  
   /**
   *query a posPccodeNoteType by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-29 10:51
   */
  public PosPccodeNoteType load(Long id)throws DataAccessException;
  
}