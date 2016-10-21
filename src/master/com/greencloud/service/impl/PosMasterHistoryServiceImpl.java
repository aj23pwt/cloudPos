package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosMasterHistory;
import com.greencloud.dao.IPosMasterHistoryDao;
import com.greencloud.service.IPosMasterHistoryService;
import org.springframework.dao.DataAccessException;
public class PosMasterHistoryServiceImpl extends BaseServiceImpl implements IPosMasterHistoryService
{
   //dao 
   private IPosMasterHistoryDao posMasterHistoryDao;
   
  /**
   *save posMasterHistory object  method
   *@param posMasterHistory PosMasterHistory 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-04 15:37
   */
  public void savePosMasterHistory(PosMasterHistory posMasterHistory) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosMasterHistory method");
		}
         posMasterHistoryDao.save(posMasterHistory);
     	if(log.isDebugEnabled()){
			log.debug("end savePosMasterHistory method");
		}
  }//end save method
  
   /**
   *update posMasterHistory method
   *@param posMasterHistory PosMasterHistory
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04 15:37
   */
  public void updatePosMasterHistory(PosMasterHistory posMasterHistory) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosMasterHistory method");
		}
        posMasterHistoryDao.update(posMasterHistory);
        if(log.isDebugEnabled()){
			log.debug("end updatePosMasterHistory method");
		}
  }//end update method
  
   /**
   *save or update posMasterHistory object method
   *@param posMasterHistory PosMasterHistory
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-04 15:37
   */
  public void saveOrUpdatePosMasterHistory(PosMasterHistory posMasterHistory) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosMasterHistory method");
		}
		
        posMasterHistoryDao.saveOrUpdate(posMasterHistory);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosMasterHistory method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posMasterHistory PosMasterHistory query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-04 15:37
   */
  public Container<PosMasterHistory> findPosMasterHistory(PosMasterHistory posMasterHistory,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosMasterHistory method");
		}
        Container<PosMasterHistory> container = new Container<PosMasterHistory>();
        List<PosMasterHistory> list = posMasterHistoryDao.list(posMasterHistory, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posMasterHistoryDao.count(posMasterHistory));
        if(log.isDebugEnabled()){
			log.debug("end findPosMasterHistory method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posMasterHistory PosMasterHistory query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-04 15:37
   */
  public int countPosMasterHistory(PosMasterHistory posMasterHistory)throws DataAccessException{
    return posMasterHistoryDao.count(posMasterHistory);
  }//end count method
  
   /**
   *query a posMasterHistory by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-04 15:37
   */
  public PosMasterHistory findPosMasterHistoryById(Long id)throws DataAccessException{
    PosMasterHistory  posMasterHistory = posMasterHistoryDao.load(id);
    return posMasterHistory;
  }//end findPosMasterHistoryById method
  
    /**
   *query posMasterHistory collection method
   *@param posMasterHistory PosMasterHistory send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04  15:37
   */
  public List<PosMasterHistory> listPosMasterHistory(PosMasterHistory  posMasterHistory)
		throws DataAccessException {
	  List<PosMasterHistory> list = posMasterHistoryDao.list(posMasterHistory);
      return list;
  }//end list method
  
   /**
   *query posMasterHistory collection method
   *@param posMasterHistory PosMasterHistory send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04  15:37
   */
  public List<PosMasterHistory> listPosMasterHistory(PosMasterHistory posMasterHistory,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosMasterHistory> list = posMasterHistoryDao.list(posMasterHistory, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posMasterHistoryDao 
   * @author weihuawon
   * @date 2016年M1月d4�?15:37
   */
  public void setPosMasterHistoryDao(IPosMasterHistoryDao posMasterHistoryDao){ 
     this.posMasterHistoryDao = posMasterHistoryDao;
  }//end setPosMasterHistoryDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posMasterHistoryDao;
  }//end getDao method
}//end class PosMasterHistoryServiceImpl