package com.greencloud.dao;
import com.aua.dao.IBaseDao;

import java.util.List;

import com.greencloud.dto.KaiYuanPosDetailDto;
import com.greencloud.entity.PosDetail;

import org.springframework.dao.DataAccessException;
 /**
   * operate PosDetail into db
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
public interface IPosDetailDao extends IBaseDao
{

  /**
   *save posDetail object  method
   *@param posDetail PosDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void save(PosDetail posDetail) throws DataAccessException;

   /**
   *update posDetail method
   *@param posDetail PosDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void update(PosDetail posDetail) throws DataAccessException;
 
   /**
   *save or update posDetail object method
   *@param posDetail PosDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void saveOrUpdate(PosDetail posDetail) throws DataAccessException;
  
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
  public List<PosDetail> list(PosDetail posDetail,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posDetail PosDetail send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public List<PosDetail> list(PosDetail posDetail)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posDetail PosDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:36
   */
  public int count(PosDetail posDetail)throws DataAccessException;
  
   /**
   *query a posDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:36
   */
  public PosDetail load(Long id)throws DataAccessException;

  public <T> List<T> getShiftCloseList(String hotelGroupId, String hotelId,String pccode, String empid, String shift, String biz_date,String reportNo);
  
  
  public String updateKitchenInputDishcard(String hotelGroupId, String hotelId,String accnt, String id, String type,String station);
  public  List<KaiYuanPosDetailDto> getPosDetailByBillNo(long hotelGroupId,long hotelId,String billNo);
  public  List<KaiYuanPosDetailDto> getPosDetailByAccnt(long hotelGroupId,long hotelId,String accnt);
}