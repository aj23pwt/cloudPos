package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosAccntSync;
import com.greencloud.dao.IPosAccntSyncDao;
import com.greencloud.service.IPosAccntSyncService;
import org.springframework.dao.DataAccessException;
public class PosAccntSyncServiceImpl extends BaseServiceImpl implements IPosAccntSyncService
{
   //dao 
   private IPosAccntSyncDao posAccntSyncDao;
   
  /**
   *save posAccntSync object  method
   *@param posAccntSync PosAccntSync 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void savePosAccntSync(PosAccntSync posAccntSync) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosAccntSync method");
		}
         posAccntSyncDao.save(posAccntSync);
     	if(log.isDebugEnabled()){
			log.debug("end savePosAccntSync method");
		}
  }//end save method
  
   /**
   *update posAccntSync method
   *@param posAccntSync PosAccntSync
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void updatePosAccntSync(PosAccntSync posAccntSync) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosAccntSync method");
		}
        posAccntSyncDao.update(posAccntSync);
        if(log.isDebugEnabled()){
			log.debug("end updatePosAccntSync method");
		}
  }//end update method
  
   /**
   *save or update posAccntSync object method
   *@param posAccntSync PosAccntSync
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-04 22:31
   */
  public void saveOrUpdatePosAccntSync(PosAccntSync posAccntSync) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosAccntSync method");
		}
		
        posAccntSyncDao.saveOrUpdate(posAccntSync);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosAccntSync method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posAccntSync PosAccntSync query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-04 22:31
   */
  public Container<PosAccntSync> findPosAccntSync(PosAccntSync posAccntSync,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosAccntSync method");
		}
        Container<PosAccntSync> container = new Container<PosAccntSync>();
        List<PosAccntSync> list = posAccntSyncDao.list(posAccntSync, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posAccntSyncDao.count(posAccntSync));
        if(log.isDebugEnabled()){
			log.debug("end findPosAccntSync method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posAccntSync PosAccntSync query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-04 22:31
   */
  public int countPosAccntSync(PosAccntSync posAccntSync)throws DataAccessException{
    return posAccntSyncDao.count(posAccntSync);
  }//end count method
  
   /**
   *query a posAccntSync by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-04 22:31
   */
  public PosAccntSync findPosAccntSyncById(Long id)throws DataAccessException{
    PosAccntSync  posAccntSync = posAccntSyncDao.load(id);
    return posAccntSync;
  }//end findPosAccntSyncById method
  
    /**
   *query posAccntSync collection method
   *@param posAccntSync PosAccntSync send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04  22:31
   */
  public List<PosAccntSync> listPosAccntSync(PosAccntSync  posAccntSync)
		throws DataAccessException {
	  List<PosAccntSync> list = posAccntSyncDao.list(posAccntSync);
      return list;
  }//end list method
  
   /**
   *query posAccntSync collection method
   *@param posAccntSync PosAccntSync send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-04  22:31
   */
  public List<PosAccntSync> listPosAccntSync(PosAccntSync posAccntSync,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosAccntSync> list = posAccntSyncDao.list(posAccntSync, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posAccntSyncDao 
   * @author weihuawon
   * @date 2015年M7月d4�?22:31
   */
  public void setPosAccntSyncDao(IPosAccntSyncDao posAccntSyncDao){ 
     this.posAccntSyncDao = posAccntSyncDao;
  }//end setPosAccntSyncDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posAccntSyncDao;
  }//end getDao method
}//end class PosAccntSyncServiceImpl