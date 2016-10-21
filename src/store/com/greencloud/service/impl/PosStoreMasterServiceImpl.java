package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.greencloud.entity.PosStoreDetail;
import com.greencloud.entity.PosStoreMaster;
import com.greencloud.dao.IPosStoreDetailDao;
import com.greencloud.dao.IPosStoreMasterDao;
import com.greencloud.service.IPosStoreMasterService;

import org.springframework.dao.DataAccessException;
public class PosStoreMasterServiceImpl extends BaseServiceImpl implements IPosStoreMasterService
{
   //dao 
   private IPosStoreMasterDao posStoreMasterDao;
   private IPosStoreDetailDao posStoreDetailDao;
   
  public void setPosStoreDetailDao(IPosStoreDetailDao posStoreDetailDao) {
	this.posStoreDetailDao = posStoreDetailDao;
}

/**
   *save posStoreMaster object  method
   *@param posStoreMaster PosStoreMaster 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void savePosStoreMaster(PosStoreMaster posStoreMaster) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStoreMaster method");
		}
         posStoreMasterDao.save(posStoreMaster);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStoreMaster method");
		}
  }//end save method
  
   /**
   *update posStoreMaster method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void updatePosStoreMaster(PosStoreMaster posStoreMaster) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStoreMaster method");
		}
        posStoreMasterDao.update(posStoreMaster);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStoreMaster method");
		}
  }//end update method
  
   /**
   *save or update posStoreMaster object method
   *@param posStoreMaster PosStoreMaster
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdatePosStoreMaster(PosStoreMaster posStoreMaster) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStoreMaster method");
		}
		
        posStoreMasterDao.saveOrUpdate(posStoreMaster);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStoreMaster method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStoreMaster PosStoreMaster query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 13:45
   */
  public Container<PosStoreMaster> findPosStoreMaster(PosStoreMaster posStoreMaster,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStoreMaster method");
		}
        Container<PosStoreMaster> container = new Container<PosStoreMaster>();
        List<PosStoreMaster> list = posStoreMasterDao.list(posStoreMaster, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStoreMasterDao.count(posStoreMaster));
        if(log.isDebugEnabled()){
			log.debug("end findPosStoreMaster method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStoreMaster PosStoreMaster query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int countPosStoreMaster(PosStoreMaster posStoreMaster)throws DataAccessException{
    return posStoreMasterDao.count(posStoreMaster);
  }//end count method
  
   /**
   *query a posStoreMaster by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreMaster findPosStoreMasterById(Long id)throws DataAccessException{
    PosStoreMaster  posStoreMaster = posStoreMasterDao.load(id);
    return posStoreMaster;
  }//end findPosStoreMasterById method
  
    /**
   *query posStoreMaster collection method
   *@param posStoreMaster PosStoreMaster send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreMaster> listPosStoreMaster(PosStoreMaster  posStoreMaster)
		throws DataAccessException {
	  List<PosStoreMaster> list = posStoreMasterDao.list(posStoreMaster);
      return list;
  }//end list method
  
   /**
   *query posStoreMaster collection method
   *@param posStoreMaster PosStoreMaster send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreMaster> listPosStoreMaster(PosStoreMaster posStoreMaster,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStoreMaster> list = posStoreMasterDao.list(posStoreMaster, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStoreMasterDao 
   * @author weihuawon
   * @date 2015年M12月d16�?13:45
   */
  public void setPosStoreMasterDao(IPosStoreMasterDao posStoreMasterDao){ 
     this.posStoreMasterDao = posStoreMasterDao;
  }//end setPosStoreMasterDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStoreMasterDao;
  }//end getDao method

@Override
public void savePosStoreMasterAndDetails(PosStoreMaster posStoreMaster,
		ArrayList<Object> posStoreDetailList, Long hotelGroupId, Long hotelId) {
	// TODO Auto-generated method stub
	posStoreMaster.setHotelGroupId(hotelGroupId);
	posStoreMaster.setHotelId(hotelId);
	posStoreMasterDao.save(posStoreMaster);
	for(Iterator<Object> it = posStoreDetailList.iterator(); it.hasNext();){
		PosStoreDetail item = (PosStoreDetail)it.next();
//		PosStoreDetail posStoreDetail = new PosStoreDetail();
//		posStoreDetail.setHotelGroupId(hotelGroupId);
//		posStoreDetail.setHotelId(hotelId);
//		posStoreDetail.setAccnt(item.getAccnt());
		item.setAccnt(posStoreMaster.getAccnt());
		item.setHotelGroupId(hotelGroupId);
		item.setHotelId(hotelId);
		posStoreDetailDao.save(item);
	}
}

@Override
public void updatePosStoreMasterAndDetails(PosStoreMaster posStoreMaster,
		ArrayList<Object> posStoreDetailList) {
	posStoreMasterDao.update(posStoreMaster);
	for(Iterator<Object> it = posStoreDetailList.iterator(); it.hasNext();){
		PosStoreDetail item = (PosStoreDetail)it.next();
		item.setAccnt(posStoreMaster.getAccnt());
		item.setHotelGroupId(posStoreMaster.getHotelGroupId());
		item.setHotelId(posStoreMaster.getHotelId());
		posStoreDetailDao.saveOrUpdate(item);
	}
}

@Override
public void deletePosStoreMasterAndDetails(PosStoreMaster posStoreMaster,
		ArrayList<Object> posStoreDetailList) {
	posStoreMasterDao.delete(posStoreMaster);
	for(Iterator<Object> it = posStoreDetailList.iterator(); it.hasNext();){
		PosStoreDetail item = (PosStoreDetail)it.next();

		posStoreDetailDao.delete(item);
	}
}


}//end class PosStoreMasterServiceImpl