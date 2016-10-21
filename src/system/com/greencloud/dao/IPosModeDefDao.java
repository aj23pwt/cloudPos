package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosModeDef;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosModeDef into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosModeDefDao extends IBaseDao
{

  /**
   *save posModeDef object  method
   *@param posModeDef PosModeDef 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosModeDef posModeDef) throws DataAccessException;

   /**
   *update posModeDef method
   *@param posModeDef PosModeDef
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosModeDef posModeDef) throws DataAccessException;
 
   /**
   *save or update posModeDef object method
   *@param posModeDef PosModeDef
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosModeDef posModeDef) throws DataAccessException;
  
   /**
   *query posModeDef collection method
   *@param posModeDef PosModeDef send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeDef> list(PosModeDef posModeDef,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posModeDef PosModeDef send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosModeDef> list(PosModeDef posModeDef)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posModeDef PosModeDef query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosModeDef posModeDef)throws DataAccessException;
  
   /**
   *query a posModeDef by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeDef load(Long id)throws DataAccessException;
  
}