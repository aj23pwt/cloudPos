package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.entity.PosDetail;

import org.springframework.dao.DataAccessException;
public interface IPosDetailService extends IBaseService
{
   /**
   *save posDetail object  method
   *@param posDetail PosDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void savePosDetail(PosDetail posDetail) throws DataAccessException;
  
   /**
   *update posDetail method
   *@param posDetail PosDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void updatePosDetail(PosDetail posDetail) throws DataAccessException;
  
   /**
   *save or update posDetail object method
   *@param posDetail PosDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void saveOrUpdatePosDetail(PosDetail posDetail) throws DataAccessException;

  /**
   *query a container obj
   *@param posDetail PosDetail query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-05-03 14:36
   */
  public Container<PosDetail> findPosDetail(PosDetail posDetail,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posDetail collection method
   *@param posDetail PosDetail send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:36
   */
  public List<PosDetail> listPosDetail(PosDetail posDetail)throws DataAccessException;
 
   /**
   *query posDetail collection method
   *@param posDetail PosDetail send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:36
   */
  public List<PosDetail> listPosDetail(PosDetail posDetail,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posDetail PosDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:36
   */
  public int countPosDetail(PosDetail posDetail)throws DataAccessException;
   
   /**
   *query a posDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:36
   */
  public PosDetail findPosDetailById(Long id)throws DataAccessException;

  public <T> List<T> getShiftCloseList(String hotelGroupId, String hotelId,String pccode, String empid, String shift, String biz_date,String reportNo);
}