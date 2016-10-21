package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.UserPosAuthUserAuth;

import org.springframework.dao.DataAccessException;
 /**
   * operate UserPosAuthUserAuth into db
   *@author 
   *@version 1.0
   *@date 2015-10-08 20:02
   */
public interface IUserPosAuthUserAuthDao extends IBaseDao
{

  /**
   *save userPosAuthUserAuth object  method
   *@param userPosAuthUserAuth UserPosAuthUserAuth 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void save(UserPosAuthUserAuth userPosAuthUserAuth) throws DataAccessException;

   /**
   *update userPosAuthUserAuth method
   *@param userPosAuthUserAuth UserPosAuthUserAuth
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void update(UserPosAuthUserAuth userPosAuthUserAuth) throws DataAccessException;
 
   /**
   *save or update userPosAuthUserAuth object method
   *@param userPosAuthUserAuth UserPosAuthUserAuth
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveOrUpdate(UserPosAuthUserAuth userPosAuthUserAuth) throws DataAccessException;
  
   /**
   *query userPosAuthUserAuth collection method
   *@param userPosAuthUserAuth UserPosAuthUserAuth send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08  20:02
   */
  public List<UserPosAuthUserAuth> list(UserPosAuthUserAuth userPosAuthUserAuth,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param userPosAuthUserAuth UserPosAuthUserAuth send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public List<UserPosAuthUserAuth> list(UserPosAuthUserAuth userPosAuthUserAuth)throws DataAccessException;
 
  /**
   *count obj amount
   *@param userPosAuthUserAuth UserPosAuthUserAuth query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-10-08 20:02
   */
  public int count(UserPosAuthUserAuth userPosAuthUserAuth)throws DataAccessException;
  
   /**
   *query a userPosAuthUserAuth by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-10-08 20:02
   */
  public UserPosAuthUserAuth load(Long id)throws DataAccessException;
  public List<UserPosAuthUserAuth> findUserPosAuthUserAuth(Long hotelGroupId, Long hotelId, Date modifyDatetime);
}