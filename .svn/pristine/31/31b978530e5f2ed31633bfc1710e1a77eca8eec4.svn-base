package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosModeName;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosModeName into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosModeNameDao extends IBaseDao
{

  /**
   *save posModeName object  method
   *@param posModeName PosModeName 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosModeName posModeName) throws DataAccessException;

   /**
   *update posModeName method
   *@param posModeName PosModeName
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosModeName posModeName) throws DataAccessException;
 
   /**
   *save or update posModeName object method
   *@param posModeName PosModeName
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosModeName posModeName) throws DataAccessException;
  
   /**
   *query posModeName collection method
   *@param posModeName PosModeName send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeName> list(PosModeName posModeName,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posModeName PosModeName send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosModeName> list(PosModeName posModeName)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posModeName PosModeName query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosModeName posModeName)throws DataAccessException;
  
   /**
   *query a posModeName by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeName load(Long id)throws DataAccessException;
  
}