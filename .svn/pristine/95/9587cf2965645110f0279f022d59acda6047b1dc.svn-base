package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosSortAll;
import com.greencloud.dao.IPosSortAllDao;
import com.greencloud.service.IPosSortAllService;

import org.springframework.dao.DataAccessException;
public class PosSortAllServiceImpl extends BaseServiceImpl implements IPosSortAllService
{
   //dao 
   private IPosSortAllDao posSortAllDao;
   
  /**
   *save posSortAll object  method
   *@param posSortAll PosSortAll 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void savePosSortAll(PosSortAll posSortAll) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosSortAll method");
		}
         posSortAllDao.save(posSortAll);
     	if(log.isDebugEnabled()){
			log.debug("end savePosSortAll method");
		}
  }//end save method
  
   /**
   *update posSortAll method
   *@param posSortAll PosSortAll
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void updatePosSortAll(PosSortAll posSortAll) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosSortAll method");
		}
        posSortAllDao.update(posSortAll);
        if(log.isDebugEnabled()){
			log.debug("end updatePosSortAll method");
		}
  }//end update method
  
   /**
   *save or update posSortAll object method
   *@param posSortAll PosSortAll
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-20 16:10
   */
  public void saveOrUpdatePosSortAll(PosSortAll posSortAll) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosSortAll method");
		}
		
        posSortAllDao.saveOrUpdate(posSortAll);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosSortAll method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posSortAll PosSortAll query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-20 16:10
   */
  public Container<PosSortAll> findPosSortAll(PosSortAll posSortAll,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosSortAll method");
		}
        Container<PosSortAll> container = new Container<PosSortAll>();
        List<PosSortAll> list = posSortAllDao.list(posSortAll, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posSortAllDao.count(posSortAll));
        if(log.isDebugEnabled()){
			log.debug("end findPosSortAll method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posSortAll PosSortAll query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-20 16:10
   */
  public int countPosSortAll(PosSortAll posSortAll)throws DataAccessException{
    return posSortAllDao.count(posSortAll);
  }//end count method
  
   /**
   *query a posSortAll by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-20 16:10
   */
  public PosSortAll findPosSortAllById(Long id)throws DataAccessException{
    PosSortAll  posSortAll = posSortAllDao.load(id);
    return posSortAll;
  }//end findPosSortAllById method
  
    /**
   *query posSortAll collection method
   *@param posSortAll PosSortAll send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20  16:10
   */
  public List<PosSortAll> listPosSortAll(PosSortAll  posSortAll)
		throws DataAccessException {
	  List<PosSortAll> list = posSortAllDao.list(posSortAll);
      return list;
  }//end list method
  
   /**
   *query posSortAll collection method
   *@param posSortAll PosSortAll send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-20  16:10
   */
  public List<PosSortAll> listPosSortAll(PosSortAll posSortAll,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosSortAll> list = posSortAllDao.list(posSortAll, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posSortAllDao 
   * @author weihuawon
   * @date 2015年M3月d20�?16:10
   */
  public void setPosSortAllDao(IPosSortAllDao posSortAllDao){ 
     this.posSortAllDao = posSortAllDao;
  }//end setPosSortAllDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posSortAllDao;
  }//end getDao method

@Override
public List<PosSortAll> getPosSortAll(Long hotelGroupId, Long hotelId) {
	PosSortAll posSortAll = new PosSortAll();
	posSortAll.setHotelGroupId(hotelGroupId);
	posSortAll.setHotelId(hotelId);
	List<PosSortAll> list = posSortAllDao.list(posSortAll);
	return list;
}

@Override
public List<PosSortAll> findPosSortAll(Long hotelGroupId, Long hotelId,Date modifyDatetime) {
	return posSortAllDao.findPosSortAll(hotelGroupId, hotelId, modifyDatetime);
}

@Override
public List<PosSortAll> listPosSortAllByPcode(Long hotelGroupId, Long hotelId,String pcCode) throws DataAccessException {
	return posSortAllDao.listPosSortAllByPcode(hotelGroupId, hotelId, pcCode);
}
}//end class PosSortAllServiceImpl