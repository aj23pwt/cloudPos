package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosStation;
import com.greencloud.dao.IPosStationDao;
import com.greencloud.dto.PosTableDto;
import com.greencloud.service.IPosStationService;

import org.springframework.dao.DataAccessException;
public class PosStationServiceImpl extends BaseServiceImpl implements IPosStationService
{
   //dao 
   private IPosStationDao posStationDao;
   
  /**
   *save posStation object  method
   *@param posStation PosStation 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosStation(PosStation posStation) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStation method");
		}
         posStationDao.save(posStation);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStation method");
		}
  }//end save method
  
   /**
   *update posStation method
   *@param posStation PosStation
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosStation(PosStation posStation) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStation method");
		}
        posStationDao.update(posStation);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStation method");
		}
  }//end update method
  
   /**
   *save or update posStation object method
   *@param posStation PosStation
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosStation(PosStation posStation) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStation method");
		}
		
        posStationDao.saveOrUpdate(posStation);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStation method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStation PosStation query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosStation> findPosStation(PosStation posStation,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStation method");
		}
        Container<PosStation> container = new Container<PosStation>();
        List<PosStation> list = posStationDao.list(posStation, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStationDao.count(posStation));
        if(log.isDebugEnabled()){
			log.debug("end findPosStation method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStation PosStation query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosStation(PosStation posStation)throws DataAccessException{
    return posStationDao.count(posStation);
  }//end count method
  
   /**
   *query a posStation by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosStation findPosStationById(Long id)throws DataAccessException{
    PosStation  posStation = posStationDao.load(id);
    return posStation;
  }//end findPosStationById method
  
    /**
   *query posStation collection method
   *@param posStation PosStation send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosStation> listPosStation(PosStation  posStation)
		throws DataAccessException {
	  List<PosStation> list = posStationDao.list(posStation);
      return list;
  }//end list method
  
   /**
   *query posStation collection method
   *@param posStation PosStation send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosStation> listPosStation(PosStation posStation,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStation> list = posStationDao.list(posStation, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStationDao 
   * @author weihuawon
   * @date 2015年M3月d24�?09:33
   */
  public void setPosStationDao(IPosStationDao posStationDao){ 
     this.posStationDao = posStationDao;
  }//end setPosStationDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStationDao;
  }//end getDao method

@Override
public List<PosTableDto> getPosTable() {
	// TODO Auto-generated method stub
	return posStationDao.getPosTable();
}
}//end class PosStationServiceImpl