package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosCondst;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosCondst into db
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
public interface IPosCondstDao extends IBaseDao
{

  /**
   *save posCondst object  method
   *@param posCondst PosCondst 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void save(PosCondst posCondst) throws DataAccessException;

   /**
   *update posCondst method
   *@param posCondst PosCondst
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void update(PosCondst posCondst) throws DataAccessException;
 
   /**
   *save or update posCondst object method
   *@param posCondst PosCondst
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdate(PosCondst posCondst) throws DataAccessException;
  
   /**
   *query posCondst collection method
   *@param posCondst PosCondst send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCondst> list(PosCondst posCondst,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posCondst PosCondst send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public List<PosCondst> list(PosCondst posCondst)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posCondst PosCondst query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int count(PosCondst posCondst)throws DataAccessException;
  
   /**
   *query a posCondst by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCondst load(Long id)throws DataAccessException;
  
  public List<PosCondst> findPosCondst(Long hotelGroupId, Long hotelId,	Date modifyDatetime);
  
}