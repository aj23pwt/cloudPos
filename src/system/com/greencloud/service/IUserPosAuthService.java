package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosSortAll;
import com.greencloud.entity.UserPosAuth;

import org.springframework.dao.DataAccessException;
public interface IUserPosAuthService extends IBaseService
{
   /**
   *save userPosAuth object  method
   *@param userPosAuth UserPosAuth 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveUserPosAuth(UserPosAuth userPosAuth) throws DataAccessException;
  
   /**
   *update userPosAuth method
   *@param userPosAuth UserPosAuth
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void updateUserPosAuth(UserPosAuth userPosAuth) throws DataAccessException;
  
   /**
   *save or update userPosAuth object method
   *@param userPosAuth UserPosAuth
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveOrUpdateUserPosAuth(UserPosAuth userPosAuth) throws DataAccessException;

  /**
   *query a container obj
   *@param userPosAuth UserPosAuth query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-10-08 20:02
   */
  public Container<UserPosAuth> findUserPosAuth(UserPosAuth userPosAuth,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query userPosAuth collection method
   *@param userPosAuth UserPosAuth send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08  20:02
   */
  public List<UserPosAuth> listUserPosAuth(UserPosAuth userPosAuth)throws DataAccessException;
 
   /**
   *query userPosAuth collection method
   *@param userPosAuth UserPosAuth send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08  20:02
   */
  public List<UserPosAuth> listUserPosAuth(UserPosAuth userPosAuth,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param userPosAuth UserPosAuth query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-10-08 20:02
   */
  public int countUserPosAuth(UserPosAuth userPosAuth)throws DataAccessException;
   
   /**
   *query a userPosAuth by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-10-08 20:02
   */
  public UserPosAuth findUserPosAuthById(Long id)throws DataAccessException;
  
  public String getUserPosAuthTreeDto(Long hotelGroupId, long hotelId);
  public String getTasByParent(Long hotelGroupId, long hotelId,String parent);
  public String getUserPosAuthTreeDtoByUser(Long hotelGroupId, long hotelId,String userCode);
  public String getTasByParentByUser(Long hotelGroupId, long hotelId,String parent,String userCode);
  public List<UserPosAuth> findUserPosAuth(Long hotelGroupId, Long hotelId, Date modifyDatetime);
}