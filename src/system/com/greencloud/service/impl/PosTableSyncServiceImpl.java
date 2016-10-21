package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosTableSync;
import com.greencloud.dao.IPosTableSyncDao;
import com.greencloud.service.IPosTableSyncService;
import org.springframework.dao.DataAccessException;
public class PosTableSyncServiceImpl extends BaseServiceImpl implements IPosTableSyncService
{
   //dao 
   private IPosTableSyncDao posTableSyncDao;
   
  /**
   *save posTableSync object  method
   *@param posTableSync PosTableSync 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void savePosTableSync(PosTableSync posTableSync) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosTableSync method");
		}
         posTableSyncDao.save(posTableSync);
     	if(log.isDebugEnabled()){
			log.debug("end savePosTableSync method");
		}
  }//end save method
  
   /**
   *update posTableSync method
   *@param posTableSync PosTableSync
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void updatePosTableSync(PosTableSync posTableSync) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosTableSync method");
		}
        posTableSyncDao.update(posTableSync);
        if(log.isDebugEnabled()){
			log.debug("end updatePosTableSync method");
		}
  }//end update method
  
   /**
   *save or update posTableSync object method
   *@param posTableSync PosTableSync
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-09-06 15:32
   */
  public void saveOrUpdatePosTableSync(PosTableSync posTableSync) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosTableSync method");
		}
		
        posTableSyncDao.saveOrUpdate(posTableSync);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosTableSync method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posTableSync PosTableSync query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-09-06 15:32
   */
  public Container<PosTableSync> findPosTableSync(PosTableSync posTableSync,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosTableSync method");
		}
        Container<PosTableSync> container = new Container<PosTableSync>();
        List<PosTableSync> list = posTableSyncDao.list(posTableSync, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posTableSyncDao.count(posTableSync));
        if(log.isDebugEnabled()){
			log.debug("end findPosTableSync method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posTableSync PosTableSync query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-09-06 15:32
   */
  public int countPosTableSync(PosTableSync posTableSync)throws DataAccessException{
    return posTableSyncDao.count(posTableSync);
  }//end count method
  
   /**
   *query a posTableSync by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-09-06 15:32
   */
  public PosTableSync findPosTableSyncById(Long id)throws DataAccessException{
    PosTableSync  posTableSync = posTableSyncDao.load(id);
    return posTableSync;
  }//end findPosTableSyncById method
  
    /**
   *query posTableSync collection method
   *@param posTableSync PosTableSync send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06  15:32
   */
  public List<PosTableSync> listPosTableSync(PosTableSync  posTableSync)
		throws DataAccessException {
	  List<PosTableSync> list = posTableSyncDao.list(posTableSync);
      return list;
  }//end list method
  
   /**
   *query posTableSync collection method
   *@param posTableSync PosTableSync send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-06  15:32
   */
  public List<PosTableSync> listPosTableSync(PosTableSync posTableSync,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosTableSync> list = posTableSyncDao.list(posTableSync, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posTableSyncDao 
   * @author weihuawon
   * @date 2015年M9月d6�?15:32
   */
  public void setPosTableSyncDao(IPosTableSyncDao posTableSyncDao){ 
     this.posTableSyncDao = posTableSyncDao;
  }//end setPosTableSyncDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posTableSyncDao;
  }//end getDao method
}//end class PosTableSyncServiceImpl