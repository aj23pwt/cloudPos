package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosPccodeShift;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosPccodeShift into db
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
public interface IPosPccodeShiftDao extends IBaseDao
{

  /**
   *save posPccodeShift object  method
   *@param posPccodeShift PosPccodeShift 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void save(PosPccodeShift posPccodeShift) throws DataAccessException;

   /**
   *update posPccodeShift method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void update(PosPccodeShift posPccodeShift) throws DataAccessException;
 
   /**
   *save or update posPccodeShift object method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdate(PosPccodeShift posPccodeShift) throws DataAccessException;
  
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
  public List<PosPccodeShift> list(PosPccodeShift posPccodeShift,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posPccodeShift PosPccodeShift send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public List<PosPccodeShift> list(PosPccodeShift posPccodeShift)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posPccodeShift PosPccodeShift query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int count(PosPccodeShift posPccodeShift)throws DataAccessException;
  
   /**
   *query a posPccodeShift by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeShift load(Long id)throws DataAccessException;
  
}