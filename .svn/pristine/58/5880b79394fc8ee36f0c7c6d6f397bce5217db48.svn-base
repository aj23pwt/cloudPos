package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.Date;
import java.util.List;

import com.greencloud.entity.PosCondst;
import com.greencloud.dao.IPosCondstDao;
import com.greencloud.service.IPosCondstService;

import org.springframework.dao.DataAccessException;
public class PosCondstServiceImpl extends BaseServiceImpl implements IPosCondstService
{
   //dao 
   private IPosCondstDao posCondstDao;
   
  /**
   *save posCondst object  method
   *@param posCondst PosCondst 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosCondst(PosCondst posCondst) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosCondst method");
		}
         posCondstDao.save(posCondst);
     	if(log.isDebugEnabled()){
			log.debug("end savePosCondst method");
		}
  }//end save method
  
   /**
   *update posCondst method
   *@param posCondst PosCondst
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosCondst(PosCondst posCondst) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosCondst method");
		}
        posCondstDao.update(posCondst);
        if(log.isDebugEnabled()){
			log.debug("end updatePosCondst method");
		}
  }//end update method
  
   /**
   *save or update posCondst object method
   *@param posCondst PosCondst
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosCondst(PosCondst posCondst) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosCondst method");
		}
		
        posCondstDao.saveOrUpdate(posCondst);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosCondst method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posCondst PosCondst query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosCondst> findPosCondst(PosCondst posCondst,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosCondst method");
		}
        Container<PosCondst> container = new Container<PosCondst>();
        List<PosCondst> list = posCondstDao.list(posCondst, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posCondstDao.count(posCondst));
        if(log.isDebugEnabled()){
			log.debug("end findPosCondst method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posCondst PosCondst query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosCondst(PosCondst posCondst)throws DataAccessException{
    return posCondstDao.count(posCondst);
  }//end count method
  
   /**
   *query a posCondst by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCondst findPosCondstById(Long id)throws DataAccessException{
    PosCondst  posCondst = posCondstDao.load(id);
    return posCondst;
  }//end findPosCondstById method
  
    /**
   *query posCondst collection method
   *@param posCondst PosCondst send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCondst> listPosCondst(PosCondst  posCondst)
		throws DataAccessException {
	  List<PosCondst> list = posCondstDao.list(posCondst);
      return list;
  }//end list method
  
   /**
   *query posCondst collection method
   *@param posCondst PosCondst send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCondst> listPosCondst(PosCondst posCondst,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosCondst> list = posCondstDao.list(posCondst, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posCondstDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosCondstDao(IPosCondstDao posCondstDao){ 
     this.posCondstDao = posCondstDao;
  }//end setPosCondstDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posCondstDao;
  }//end getDao method

@Override
public List<PosCondst> findPosCondst(Long hotelGroupId, Long hotelId,	Date modifyDatetime) {
	return posCondstDao.findPosCondst(hotelGroupId, hotelId, modifyDatetime);
}
}//end class PosCondstServiceImpl