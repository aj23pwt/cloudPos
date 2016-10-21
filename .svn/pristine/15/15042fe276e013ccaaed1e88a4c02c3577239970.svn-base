package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosAccess;
import com.greencloud.dao.IPosAccessDao;
import com.greencloud.service.IPosAccessService;

import org.springframework.dao.DataAccessException;
public class PosAccessServiceImpl extends BaseServiceImpl implements IPosAccessService
{
   //dao 
   private IPosAccessDao posAccessDao;
   
  /**
   *save posAccess object  method
   *@param posAccess PosAccess 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosAccess(PosAccess posAccess) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosAccess method");
		}
         posAccessDao.save(posAccess);
     	if(log.isDebugEnabled()){
			log.debug("end savePosAccess method");
		}
  }//end save method
  
   /**
   *update posAccess method
   *@param posAccess PosAccess
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosAccess(PosAccess posAccess) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosAccess method");
		}
        posAccessDao.update(posAccess);
        if(log.isDebugEnabled()){
			log.debug("end updatePosAccess method");
		}
  }//end update method
  
   /**
   *save or update posAccess object method
   *@param posAccess PosAccess
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosAccess(PosAccess posAccess) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosAccess method");
		}
		
        posAccessDao.saveOrUpdate(posAccess);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosAccess method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posAccess PosAccess query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosAccess> findPosAccess(PosAccess posAccess,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosAccess method");
		}
        Container<PosAccess> container = new Container<PosAccess>();
        List<PosAccess> list = posAccessDao.list(posAccess, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posAccessDao.count(posAccess));
        if(log.isDebugEnabled()){
			log.debug("end findPosAccess method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posAccess PosAccess query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosAccess(PosAccess posAccess)throws DataAccessException{
    return posAccessDao.count(posAccess);
  }//end count method
  
   /**
   *query a posAccess by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosAccess findPosAccessById(Long id)throws DataAccessException{
    PosAccess  posAccess = posAccessDao.load(id);
    return posAccess;
  }//end findPosAccessById method
  
    /**
   *query posAccess collection method
   *@param posAccess PosAccess send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosAccess> listPosAccess(PosAccess  posAccess)
		throws DataAccessException {
	  List<PosAccess> list = posAccessDao.list(posAccess);
      return list;
  }//end list method
  
   /**
   *query posAccess collection method
   *@param posAccess PosAccess send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosAccess> listPosAccess(PosAccess posAccess,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosAccess> list = posAccessDao.list(posAccess, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posAccessDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosAccessDao(IPosAccessDao posAccessDao){ 
     this.posAccessDao = posAccessDao;
  }//end setPosAccessDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posAccessDao;
  }//end getDao method

@Override
public List<PosAccess> listPosAccessForOrder(PosAccess posAccess)throws DataAccessException {
	// TODO Auto-generated method stub
	return posAccessDao.listPosAccessForOrder(posAccess);
}

}//end class PosAccessServiceImpl