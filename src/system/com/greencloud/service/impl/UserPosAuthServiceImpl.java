package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.greencloud.entity.CodeBase;
import com.greencloud.entity.CodeTransaction;
import com.greencloud.entity.PosSortAll;
import com.greencloud.entity.UserPosAuth;
import com.greencloud.entity.UserPosAuthUserAuth;
import com.greencloud.dao.IUserPosAuthDao;
import com.greencloud.dao.IUserPosAuthUserAuthDao;
import com.greencloud.dao.impl.UserPosAuthDaoImpl;
import com.greencloud.dto.PosPluAllTreeDto;
import com.greencloud.service.IUserPosAuthService;
import com.greencloud.util.UserManager;

import org.springframework.dao.DataAccessException;
public class UserPosAuthServiceImpl extends BaseServiceImpl implements IUserPosAuthService
{
   //dao 
   private IUserPosAuthDao userPosAuthDao;
   private IUserPosAuthUserAuthDao userPosAuthUserAuthDao;
   public void setUserPosAuthUserAuthDao(
		IUserPosAuthUserAuthDao userPosAuthUserAuthDao) {
	this.userPosAuthUserAuthDao = userPosAuthUserAuthDao;
}

/**
   *save userPosAuth object  method
   *@param userPosAuth UserPosAuth 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveUserPosAuth(UserPosAuth userPosAuth) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start saveUserPosAuth method");
		}
         userPosAuthDao.save(userPosAuth);
     	if(log.isDebugEnabled()){
			log.debug("end saveUserPosAuth method");
		}
  }//end save method
  
   /**
   *update userPosAuth method
   *@param userPosAuth UserPosAuth
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void updateUserPosAuth(UserPosAuth userPosAuth) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updateUserPosAuth method");
		}
        userPosAuthDao.update(userPosAuth);
        if(log.isDebugEnabled()){
			log.debug("end updateUserPosAuth method");
		}
  }//end update method
  
   /**
   *save or update userPosAuth object method
   *@param userPosAuth UserPosAuth
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-10-08 20:02
   */
  public void saveOrUpdateUserPosAuth(UserPosAuth userPosAuth) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdateUserPosAuth method");
		}
		
        userPosAuthDao.saveOrUpdate(userPosAuth);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdateUserPosAuth method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param userPosAuth UserPosAuth query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-10-08 20:02
   */
  public Container<UserPosAuth> findUserPosAuth(UserPosAuth userPosAuth,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findUserPosAuth method");
		}
        Container<UserPosAuth> container = new Container<UserPosAuth>();
        List<UserPosAuth> list = userPosAuthDao.list(userPosAuth, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(userPosAuthDao.count(userPosAuth));
        if(log.isDebugEnabled()){
			log.debug("end findUserPosAuth method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param userPosAuth UserPosAuth query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-10-08 20:02
   */
  public int countUserPosAuth(UserPosAuth userPosAuth)throws DataAccessException{
    return userPosAuthDao.count(userPosAuth);
  }//end count method
  
   /**
   *query a userPosAuth by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-10-08 20:02
   */
  public UserPosAuth findUserPosAuthById(Long id)throws DataAccessException{
    UserPosAuth  userPosAuth = userPosAuthDao.load(id);
    return userPosAuth;
  }//end findUserPosAuthById method
  
    /**
   *query userPosAuth collection method
   *@param userPosAuth UserPosAuth send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-10-08  20:02
   */
  public List<UserPosAuth> listUserPosAuth(UserPosAuth  userPosAuth)
		throws DataAccessException {
	  List<UserPosAuth> list = userPosAuthDao.list(userPosAuth);
      return list;
  }//end list method
  
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
  public List<UserPosAuth> listUserPosAuth(UserPosAuth userPosAuth,int firstResult ,int maxResults)throws DataAccessException{
	   List<UserPosAuth> list = userPosAuthDao.list(userPosAuth, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  userPosAuthDao 
   * @author weihuawon
   * @date 2015年M10月d8�?20:02
   */
  public void setUserPosAuthDao(IUserPosAuthDao userPosAuthDao){ 
     this.userPosAuthDao = userPosAuthDao;
  }//end setUserPosAuthDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.userPosAuthDao;
  }//end getDao method

@Override
public String getUserPosAuthTreeDto(Long hotelGroupId, long hotelId) {
	StringBuffer sb = new StringBuffer("");
	sb.append("<node label='" + "所有" + "' value='*' checked='0'>");
	sb.append("\n");

	List<UserPosAuth> list = new ArrayList<UserPosAuth>();
	UserPosAuth userPosAuth = new UserPosAuth();
	userPosAuth.setHotelGroupId(hotelGroupId);
	userPosAuth.setHotelId(hotelId);
	userPosAuth.setParentCode("0");
	List<UserPosAuth> clist = userPosAuthDao.list(userPosAuth);
	
	if (clist != null && clist.size() > 0) {
		for (Iterator<UserPosAuth> i = clist.iterator(); i.hasNext();) {
			UserPosAuth userPosAuthGet = i.next();
			sb.append("<node label='" + userPosAuthGet.getDescript()
					+ "' value='" + getTasByParent(hotelGroupId,hotelId,userPosAuthGet.getCode())
					+ "' checked='0'>");
			sb.append("\n");
			UserPosAuth userPosAuth2 = new UserPosAuth();
			userPosAuth2.setHotelGroupId(hotelGroupId);
			userPosAuth2.setHotelId(hotelId);
			userPosAuth2.setParentCode(userPosAuthGet.getCode());
			List<UserPosAuth> slist = userPosAuthDao.list(userPosAuth2);
			if (slist != null && slist.size() > 0) {
				for (Iterator<UserPosAuth> j = slist.iterator(); j.hasNext();) {
					UserPosAuth userPosAuthGet2 = j.next();
					sb.append("<node label='" + userPosAuthGet2.getDescript()
							+ "' value='" + userPosAuthGet2.getCode()
							+ "' checked='0'>");
					sb.append("\n");
					sb.append("</node>");
				}
			}
			sb.append("</node>");
		}
	}
	sb.append("</node>");
	return sb.toString();
}
@Override
public String getTasByParent(Long hotelGroupId, long hotelId,String parent) {
	StringBuffer sb = new StringBuffer();
	UserPosAuth userPosAuth2 = new UserPosAuth();
	userPosAuth2.setHotelGroupId(hotelGroupId);
	userPosAuth2.setHotelId(hotelId);
	userPosAuth2.setParentCode(parent);
	List<UserPosAuth> slist = userPosAuthDao.list(userPosAuth2);
	if (slist != null && slist.size() > 0) {
		for (Iterator<UserPosAuth> ii = slist.iterator(); ii.hasNext();) {
			UserPosAuth userPosAuth = ii.next();
			if (ii.hasNext()) {
				sb.append(userPosAuth.getCode());
				sb.append(",");
			} else {
				sb.append(userPosAuth.getCode());
			}
		}
	}
	return sb.toString();
}

@Override
public String getUserPosAuthTreeDtoByUser(Long hotelGroupId, long hotelId,
		String userCode) {
	StringBuffer sb = new StringBuffer("");
	sb.append("<node label='" + "所有" + "' value='*' checked='0'>");
	sb.append("\n");

	List<UserPosAuth> list = new ArrayList<UserPosAuth>();
	UserPosAuth userPosAuth = new UserPosAuth();
	userPosAuth.setHotelGroupId(hotelGroupId);
	userPosAuth.setHotelId(hotelId);
	userPosAuth.setParentCode("0");
	List<UserPosAuth> clist = userPosAuthDao.list(userPosAuth);
	
	if (clist != null && clist.size() > 0) {
		for (Iterator<UserPosAuth> i = clist.iterator(); i.hasNext();) {
			UserPosAuth userPosAuthGet = i.next();
			sb.append("<node label='" + userPosAuthGet.getDescript()
					+ "' value='" + getTasByParent(hotelGroupId,hotelId,userPosAuthGet.getCode())
					+"' checked='0'>");
			sb.append("\n");
			UserPosAuth userPosAuth2 = new UserPosAuth();
			userPosAuth2.setHotelGroupId(hotelGroupId);
			userPosAuth2.setHotelId(hotelId);
			userPosAuth2.setParentCode(userPosAuthGet.getCode());
			List<UserPosAuth> slist = userPosAuthDao.list(userPosAuth2);
			if (slist != null && slist.size() > 0) {
				for (Iterator<UserPosAuth> j = slist.iterator(); j.hasNext();) {
					UserPosAuth userPosAuthGet2 = j.next();
					sb.append("<node label='" + userPosAuthGet2.getDescript()
							+ "' value='" + userPosAuthGet2.getCode()
							+"' checked='" +getTasByParentByUser(hotelGroupId,hotelId,userPosAuthGet2.getCode(),userCode)+"'>");
					sb.append("\n");
					sb.append("</node>");
				}
			}
			sb.append("</node>");
		}
	}
	sb.append("</node>");
	return sb.toString();
}

@Override
public String getTasByParentByUser(Long hotelGroupId, long hotelId,
		String parent, String userCode) {
	// TODO Auto-generated method stub
	String check = "0";
	UserPosAuthUserAuth userAuth = new  UserPosAuthUserAuth();
	userAuth.setHotelGroupId(hotelGroupId);
	userAuth.setHotelId(hotelId);
	userAuth.setUserCode(userCode);
	userAuth.setAuthCode("*");
	List<UserPosAuthUserAuth> list = new ArrayList<UserPosAuthUserAuth>();
	list = userPosAuthUserAuthDao.list(userAuth);
	if(list != null && list.size()>0){
		check = "1";
	}else{
		userAuth.setAuthCode(parent);
		list = userPosAuthUserAuthDao.list(userAuth);
		if(list != null && list.size()>0){
		check = "1";
		}
	}
	return check;
}

@Override
public List<UserPosAuth> findUserPosAuth(Long hotelGroupId, Long hotelId,
		Date modifyDatetime) {
	// TODO Auto-generated method stub
	return userPosAuthDao.findUserPosAuth(hotelGroupId, hotelId, modifyDatetime);
}
}//end class UserPosAuthServiceImpl