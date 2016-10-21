package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.UserPosAuth;
import com.greencloud.entity.UserPosAuthUserAuth;

import org.springframework.dao.DataAccessException;
public interface IUserPosAuthUserAuthService extends IBaseService
{
   /**
   *save userPosAuthUserAuth object  method
   *@param userPosAuthUserAuth UserPosAuthUserAuth 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth) throws DataAccessException;
  
   /**
   *update userPosAuthUserAuth method
   *@param userPosAuthUserAuth UserPosAuthUserAuth
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void updateUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth) throws DataAccessException;
  
   /**
   *save or update userPosAuthUserAuth object method
   *@param userPosAuthUserAuth UserPosAuthUserAuth
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveOrUpdateUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth) throws DataAccessException;

  /**
   *query a container obj
   *@param userPosAuthUserAuth UserPosAuthUserAuth query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-10-08 20:02
   */
  public Container<UserPosAuthUserAuth> findUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query userPosAuthUserAuth collection method
   *@param userPosAuthUserAuth UserPosAuthUserAuth send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08  20:02
   */
  public List<UserPosAuthUserAuth> listUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth)throws DataAccessException;
 
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
  public List<UserPosAuthUserAuth> listUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param userPosAuthUserAuth UserPosAuthUserAuth query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-10-08 20:02
   */
  public int countUserPosAuthUserAuth(UserPosAuthUserAuth userPosAuthUserAuth)throws DataAccessException;
   
   /**
   *query a userPosAuthUserAuth by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-10-08 20:02
   */
  public UserPosAuthUserAuth findUserPosAuthUserAuthById(Long id)throws DataAccessException;
  public List<UserPosAuthUserAuth> findUserPosAuthUserAuth(Long hotelGroupId, Long hotelId, Date modifyDatetime);
}