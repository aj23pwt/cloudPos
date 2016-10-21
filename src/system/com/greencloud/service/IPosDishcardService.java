package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.entity.PosDishcard;

import org.springframework.dao.DataAccessException;
public interface IPosDishcardService extends IBaseService
{
   /**
   *save posDishcard object  method
   *@param posDishcard PosDishcard 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-19 14:56
   */
  public void savePosDishcard(PosDishcard posDishcard) throws DataAccessException;
  
   /**
   *update posDishcard method
   *@param posDishcard PosDishcard
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-19 14:56
   */
  public void updatePosDishcard(PosDishcard posDishcard) throws DataAccessException;
  
   /**
   *save or update posDishcard object method
   *@param posDishcard PosDishcard
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-19 14:56
   */
  public void saveOrUpdatePosDishcard(PosDishcard posDishcard) throws DataAccessException;

  /**
   *query a container obj
   *@param posDishcard PosDishcard query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-19 14:56
   */
  public Container<PosDishcard> findPosDishcard(PosDishcard posDishcard,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posDishcard collection method
   *@param posDishcard PosDishcard send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-19  14:56
   */
  public List<PosDishcard> listPosDishcard(PosDishcard posDishcard)throws DataAccessException;
 
   /**
   *query posDishcard collection method
   *@param posDishcard PosDishcard send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-19  14:56
   */
  public List<PosDishcard> listPosDishcard(PosDishcard posDishcard,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posDishcard PosDishcard query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-19 14:56
   */
  public int countPosDishcard(PosDishcard posDishcard)throws DataAccessException;
   
   /**
   *query a posDishcard by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-19 14:56
   */
  public PosDishcard findPosDishcardById(Long id)throws DataAccessException;
  public List<PosDishcard> getPosDishcardListBysql(String sql);
  public String updateKitchenMsg(Long hotelId, Long hotelGroupId, String accnt,String type,String mode,String station,String empno,Integer id,String oldTableNo, String newTableNo,String kitmsg);
}