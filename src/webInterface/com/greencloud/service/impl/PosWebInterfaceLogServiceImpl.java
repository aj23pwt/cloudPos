package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosWebInterfaceLog;
import com.greencloud.dao.IPosWebInterfaceLogDao;
import com.greencloud.service.IPosWebInterfaceLogService;
import org.springframework.dao.DataAccessException;
public class PosWebInterfaceLogServiceImpl extends BaseServiceImpl implements IPosWebInterfaceLogService
{
   //dao 
   private IPosWebInterfaceLogDao posWebInterfaceLogDao;
   
  /**
   *save posWebInterfaceLog object  method
   *@param posWebInterfaceLog PosWebInterfaceLog 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void savePosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosWebInterfaceLog method");
		}
         posWebInterfaceLogDao.save(posWebInterfaceLog);
     	if(log.isDebugEnabled()){
			log.debug("end savePosWebInterfaceLog method");
		}
  }//end save method
  
   /**
   *update posWebInterfaceLog method
   *@param posWebInterfaceLog PosWebInterfaceLog
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void updatePosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosWebInterfaceLog method");
		}
        posWebInterfaceLogDao.update(posWebInterfaceLog);
        if(log.isDebugEnabled()){
			log.debug("end updatePosWebInterfaceLog method");
		}
  }//end update method
  
   /**
   *save or update posWebInterfaceLog object method
   *@param posWebInterfaceLog PosWebInterfaceLog
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-08 18:38
   */
  public void saveOrUpdatePosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosWebInterfaceLog method");
		}
		
        posWebInterfaceLogDao.saveOrUpdate(posWebInterfaceLog);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosWebInterfaceLog method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posWebInterfaceLog PosWebInterfaceLog query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-08 18:38
   */
  public Container<PosWebInterfaceLog> findPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosWebInterfaceLog method");
		}
        Container<PosWebInterfaceLog> container = new Container<PosWebInterfaceLog>();
        List<PosWebInterfaceLog> list = posWebInterfaceLogDao.list(posWebInterfaceLog, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posWebInterfaceLogDao.count(posWebInterfaceLog));
        if(log.isDebugEnabled()){
			log.debug("end findPosWebInterfaceLog method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posWebInterfaceLog PosWebInterfaceLog query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-08 18:38
   */
  public int countPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog)throws DataAccessException{
    return posWebInterfaceLogDao.count(posWebInterfaceLog);
  }//end count method
  
   /**
   *query a posWebInterfaceLog by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-08 18:38
   */
  public PosWebInterfaceLog findPosWebInterfaceLogById(Long id)throws DataAccessException{
    PosWebInterfaceLog  posWebInterfaceLog = posWebInterfaceLogDao.load(id);
    return posWebInterfaceLog;
  }//end findPosWebInterfaceLogById method
  
    /**
   *query posWebInterfaceLog collection method
   *@param posWebInterfaceLog PosWebInterfaceLog send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08  18:38
   */
  public List<PosWebInterfaceLog> listPosWebInterfaceLog(PosWebInterfaceLog  posWebInterfaceLog)
		throws DataAccessException {
	  List<PosWebInterfaceLog> list = posWebInterfaceLogDao.list(posWebInterfaceLog);
      return list;
  }//end list method
  
   /**
   *query posWebInterfaceLog collection method
   *@param posWebInterfaceLog PosWebInterfaceLog send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-08  18:38
   */
  public List<PosWebInterfaceLog> listPosWebInterfaceLog(PosWebInterfaceLog posWebInterfaceLog,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosWebInterfaceLog> list = posWebInterfaceLogDao.list(posWebInterfaceLog, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posWebInterfaceLogDao 
   * @author weihuawon
   * @date 2016年M1月d8�?18:38
   */
  public void setPosWebInterfaceLogDao(IPosWebInterfaceLogDao posWebInterfaceLogDao){ 
     this.posWebInterfaceLogDao = posWebInterfaceLogDao;
  }//end setPosWebInterfaceLogDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posWebInterfaceLogDao;
  }//end getDao method
}//end class PosWebInterfaceLogServiceImpl