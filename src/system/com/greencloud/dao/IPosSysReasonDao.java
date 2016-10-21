package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosSysReason;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosSysReason into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosSysReasonDao extends IBaseDao
{

  /**
   *save posSysReason object  method
   *@param posSysReason PosSysReason 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosSysReason posSysReason) throws DataAccessException;

   /**
   *update posSysReason method
   *@param posSysReason PosSysReason
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosSysReason posSysReason) throws DataAccessException;
 
   /**
   *save or update posSysReason object method
   *@param posSysReason PosSysReason
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosSysReason posSysReason) throws DataAccessException;
  
   /**
   *query posSysReason collection method
   *@param posSysReason PosSysReason send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosSysReason> list(PosSysReason posSysReason,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posSysReason PosSysReason send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosSysReason> list(PosSysReason posSysReason)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posSysReason PosSysReason query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosSysReason posSysReason)throws DataAccessException;
  
   /**
   *query a posSysReason by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosSysReason load(Long id)throws DataAccessException;
  
}