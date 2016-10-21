package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosConddtl;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosConddtl into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosConddtlDao extends IBaseDao
{

  /**
   *save posConddtl object  method
   *@param posConddtl PosConddtl 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosConddtl posConddtl) throws DataAccessException;

   /**
   *update posConddtl method
   *@param posConddtl PosConddtl
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosConddtl posConddtl) throws DataAccessException;
 
   /**
   *save or update posConddtl object method
   *@param posConddtl PosConddtl
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosConddtl posConddtl) throws DataAccessException;
  
   /**
   *query posConddtl collection method
   *@param posConddtl PosConddtl send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosConddtl> list(PosConddtl posConddtl,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posConddtl PosConddtl send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosConddtl> list(PosConddtl posConddtl)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posConddtl PosConddtl query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosConddtl posConddtl)throws DataAccessException;
  
   /**
   *query a posConddtl by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosConddtl load(Long id)throws DataAccessException;
  
  public List<PosConddtl> findPosConddtl(Long hotelGroupId, Long hotelId,Date modifyDatetime);
  
}