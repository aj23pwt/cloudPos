package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosCondst;

import org.springframework.dao.DataAccessException;
public interface IPosCondstService extends IBaseService
{
   /**
   *save posCondst object  method
   *@param posCondst PosCondst 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosCondst(PosCondst posCondst) throws DataAccessException;
  
   /**
   *update posCondst method
   *@param posCondst PosCondst
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosCondst(PosCondst posCondst) throws DataAccessException;
  
   /**
   *save or update posCondst object method
   *@param posCondst PosCondst
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosCondst(PosCondst posCondst) throws DataAccessException;

  /**
   *query a container obj
   *@param posCondst PosCondst query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosCondst> findPosCondst(PosCondst posCondst,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posCondst collection method
   *@param posCondst PosCondst send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCondst> listPosCondst(PosCondst posCondst)throws DataAccessException;
 
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
  public List<PosCondst> listPosCondst(PosCondst posCondst,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posCondst PosCondst query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosCondst(PosCondst posCondst)throws DataAccessException;
   
   /**
   *query a posCondst by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCondst findPosCondstById(Long id)throws DataAccessException;
  
  
  public List<PosCondst> findPosCondst(Long hotelGroupId,Long hotelId,Date modifyDatetime); 
}