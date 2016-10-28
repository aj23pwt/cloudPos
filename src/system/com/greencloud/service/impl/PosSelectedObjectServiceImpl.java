package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.Iterator;
import java.util.List;

import com.greencloud.entity.PosMaster;
import com.greencloud.entity.PosSelectedObject;
import com.greencloud.dao.IPosMasterDao;
import com.greencloud.dao.IPosSelectedObjectDao;
import com.greencloud.service.IPosSelectedObjectService;

import org.springframework.dao.DataAccessException;
public class PosSelectedObjectServiceImpl extends BaseServiceImpl implements IPosSelectedObjectService
{
   //dao 
   private IPosSelectedObjectDao posSelectedObjectDao;
   private IPosMasterDao	posMasterDao;
   
  /**
   *save posSelectedObject object  method
   *@param posSelectedObject PosSelectedObject 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void savePosSelectedObject(PosSelectedObject posSelectedObject) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosSelectedObject method");
		}
         posSelectedObjectDao.save(posSelectedObject);
     	if(log.isDebugEnabled()){
			log.debug("end savePosSelectedObject method");
		}
  }//end save method
  
   /**
   *update posSelectedObject method
   *@param posSelectedObject PosSelectedObject
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void updatePosSelectedObject(PosSelectedObject posSelectedObject) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosSelectedObject method");
		}
        posSelectedObjectDao.update(posSelectedObject);
        if(log.isDebugEnabled()){
			log.debug("end updatePosSelectedObject method");
		}
  }//end update method
  
   /**
   *save or update posSelectedObject object method
   *@param posSelectedObject PosSelectedObject
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-11 15:34
   */
  public void saveOrUpdatePosSelectedObject(PosSelectedObject posSelectedObject) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosSelectedObject method");
		}
		
        posSelectedObjectDao.saveOrUpdate(posSelectedObject);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosSelectedObject method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posSelectedObject PosSelectedObject query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-09-11 15:34
   */
  public Container<PosSelectedObject> findPosSelectedObject(PosSelectedObject posSelectedObject,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosSelectedObject method");
		}
        Container<PosSelectedObject> container = new Container<PosSelectedObject>();
        List<PosSelectedObject> list = posSelectedObjectDao.list(posSelectedObject, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posSelectedObjectDao.count(posSelectedObject));
        if(log.isDebugEnabled()){
			log.debug("end findPosSelectedObject method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posSelectedObject PosSelectedObject query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-11 15:34
   */
  public int countPosSelectedObject(PosSelectedObject posSelectedObject)throws DataAccessException{
    return posSelectedObjectDao.count(posSelectedObject);
  }//end count method
  
   /**
   *query a posSelectedObject by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-11 15:34
   */
  public PosSelectedObject findPosSelectedObjectById(Long id)throws DataAccessException{
    PosSelectedObject  posSelectedObject = posSelectedObjectDao.load(id);
    return posSelectedObject;
  }//end findPosSelectedObjectById method
  
    /**
   *query posSelectedObject collection method
   *@param posSelectedObject PosSelectedObject send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11  15:34
   */
  public List<PosSelectedObject> listPosSelectedObject(PosSelectedObject  posSelectedObject)
		throws DataAccessException {
	  List<PosSelectedObject> list = posSelectedObjectDao.list(posSelectedObject);
      return list;
  }//end list method
  
   /**
   *query posSelectedObject collection method
   *@param posSelectedObject PosSelectedObject send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-11  15:34
   */
  public List<PosSelectedObject> listPosSelectedObject(PosSelectedObject posSelectedObject,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosSelectedObject> list = posSelectedObjectDao.list(posSelectedObject, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posSelectedObjectDao 
   * @author weihuawon
   * @date 2016年M9月d11�?15:34
   */
  public void setPosSelectedObjectDao(IPosSelectedObjectDao posSelectedObjectDao){ 
     this.posSelectedObjectDao = posSelectedObjectDao;
  }//end setPosSelectedObjectDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posSelectedObjectDao;
  }//end getDao method

@Override
public void savePosSelectedObject(long hotelGroupId, long hotelId,
		String stationCode, String stationDes, String userCode, String accnt,
		String pcrec, String mode) {
			
		PosSelectedObject pso = new PosSelectedObject();
		pso.setHotelGroupId(hotelGroupId);
		pso.setHotelId(hotelId);
		pso.setStationCode(stationCode);
		pso.setAccntType(mode);
		pso.setAccnt(accnt);

		List<PosSelectedObject> list = posSelectedObjectDao.list(pso);
		if(list != null && list.size() > 0){
			PosSelectedObject psoGet = new PosSelectedObject();
			psoGet = list.get(0);
			
			psoGet.setStationDes(stationDes);
			psoGet.setUserCode(userCode);
			psoGet.setCategory("");
			psoGet.setNumber(0);
			psoGet.setPcrec(pcrec);
			
			posSelectedObjectDao.update(psoGet);
		}else{
			pso.setStationDes(stationDes);
			pso.setUserCode(userCode);
			pso.setCategory("");
			pso.setNumber(0);
			pso.setPcrec(pcrec);
			
			posSelectedObjectDao.save(pso);
		}
		
//		PosMaster pm = new PosMaster();
//		pm.setHotelGroupId(hotelGroupId);
//		pm.setHotelId(hotelId);
//		pm.setAccnt(accnt);		
//		List<PosMaster> pmlist = posMasterDao.list(pm);
//		if(pmlist != null && pmlist.size() > 0){
//			if(pmlist.get(0).getPcrec() != null && !"".equalsIgnoreCase(pmlist.get(0).getPcrec())){
//				PosMaster pmp = new PosMaster();
//				pmp.setHotelGroupId(hotelGroupId);
//				pmp.setHotelId(hotelId);
//				pmp.setPcrec(pmlist.get(0).getPcrec());
//				List<PosMaster> pmplist = posMasterDao.list(pmp);
//				for(Iterator<PosMaster> i = pmplist.iterator();i.hasNext();){
//					PosMaster pmpGet = i.next();
//					if(pmpGet.getExtra() != null && !"".equalsIgnoreCase(pmpGet.getExtra())){
//						pmpGet.setExtra(pmpGet.getExtra().substring(0, 0).concat("1").concat(pmpGet.getExtra().substring(2)));												
//					}else{
//						pmpGet.setExtra("0100000000");
//					}
//					posMasterDao.save(pmpGet);
//				}
//			}else{
//				PosMaster pmGet = pmlist.get(0);
//				if(pmGet.getExtra() != null && !"".equalsIgnoreCase(pmGet.getExtra())){
//					pmGet.setExtra(pmGet.getExtra().substring(0,0).concat("1").concat(pmGet.getExtra().substring(2)));
//				}else{
//					pmGet.setExtra("0100000000");					
//				}
//				posMasterDao.save(pmGet);
//			}
//		}		
	}

@Override
public void deletePosSelectedObject(long hotelId, long hotelGroupId,String stationCode) {
	posSelectedObjectDao.deletePosSelectedObject(hotelId, hotelGroupId, stationCode);	
}

@Override
public List<PosSelectedObject> getPosSelectedObjectByAccnt(long hotelGroupId,
		long hotelId, String accnt, String pcrec, String stationCode) {
//	PosSelectedObject pso = new PosSelectedObject();	
//	pso.setHotelGroupId(hotelGroupId);
//	pso.setHotelId(hotelId);
//	if(pcrec != null && !"".equals(pcrec)){
//		pso.setPcrec(pcrec);
//	}else{
//		pso.setAccnt(accnt);
//	}
//	return posSelectedObjectDao.list(pso);
	return posSelectedObjectDao.getPosSelectedObjectByAccnt(hotelGroupId, hotelId, accnt, pcrec, stationCode);
}

public IPosMasterDao getPosMasterDao() {
	return posMasterDao;
}

public void setPosMasterDao(IPosMasterDao posMasterDao) {
	this.posMasterDao = posMasterDao;
}
}//end class PosSelectedObjectServiceImpl