package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosDetail;
import com.greencloud.dao.IPosDetailDao;
import com.greencloud.service.IPosDetailService;

import org.springframework.dao.DataAccessException;
public class PosDetailServiceImpl extends BaseServiceImpl implements IPosDetailService
{
   //dao 
   private IPosDetailDao posDetailDao;
   
  /**
   *save posDetail object  method
   *@param posDetail PosDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void savePosDetail(PosDetail posDetail) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosDetail method");
		}
         posDetailDao.save(posDetail);
     	if(log.isDebugEnabled()){
			log.debug("end savePosDetail method");
		}
  }//end save method
  
   /**
   *update posDetail method
   *@param posDetail PosDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void updatePosDetail(PosDetail posDetail) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosDetail method");
		}
        posDetailDao.update(posDetail);
        if(log.isDebugEnabled()){
			log.debug("end updatePosDetail method");
		}
  }//end update method
  
   /**
   *save or update posDetail object method
   *@param posDetail PosDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:36
   */
  public void saveOrUpdatePosDetail(PosDetail posDetail) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosDetail method");
		}
		
        posDetailDao.saveOrUpdate(posDetail);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosDetail method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posDetail PosDetail query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-05-03 14:36
   */
  public Container<PosDetail> findPosDetail(PosDetail posDetail,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosDetail method");
		}
        Container<PosDetail> container = new Container<PosDetail>();
        List<PosDetail> list = posDetailDao.list(posDetail, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posDetailDao.count(posDetail));
        if(log.isDebugEnabled()){
			log.debug("end findPosDetail method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posDetail PosDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:36
   */
  public int countPosDetail(PosDetail posDetail)throws DataAccessException{
    return posDetailDao.count(posDetail);
  }//end count method
  
   /**
   *query a posDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:36
   */
  public PosDetail findPosDetailById(Long id)throws DataAccessException{
    PosDetail  posDetail = posDetailDao.load(id);
    return posDetail;
  }//end findPosDetailById method
  
    /**
   *query posDetail collection method
   *@param posDetail PosDetail send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:36
   */
  public List<PosDetail> listPosDetail(PosDetail  posDetail)
		throws DataAccessException {
	  List<PosDetail> list = posDetailDao.list(posDetail);
      return list;
  }//end list method
  
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
  public List<PosDetail> listPosDetail(PosDetail posDetail,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosDetail> list = posDetailDao.list(posDetail, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posDetailDao 
   * @author weihuawon
   * @date 2015年M5月d3�?14:36
   */
  public void setPosDetailDao(IPosDetailDao posDetailDao){ 
     this.posDetailDao = posDetailDao;
  }//end setPosDetailDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posDetailDao;
  }//end getDao method

@Override
public <T> List<T> getShiftCloseList(String hotelGroupId, String hotelId,String pccode, String empid, String shift,String biz_date,String reportNo) {
	return posDetailDao.getShiftCloseList(hotelGroupId,hotelId,pccode,empid,shift,biz_date,reportNo);
}
}//end class PosDetailServiceImpl