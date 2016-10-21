package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosClose;
import com.greencloud.dao.IPosCloseDao;
import com.greencloud.service.IPosCloseService;
import org.springframework.dao.DataAccessException;
public class PosCloseServiceImpl extends BaseServiceImpl implements IPosCloseService
{
   //dao 
   private IPosCloseDao posCloseDao;
   
  /**
   *save posClose object  method
   *@param posClose PosClose 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void savePosClose(PosClose posClose) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosClose method");
		}
         posCloseDao.save(posClose);
     	if(log.isDebugEnabled()){
			log.debug("end savePosClose method");
		}
  }//end save method
  
   /**
   *update posClose method
   *@param posClose PosClose
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void updatePosClose(PosClose posClose) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosClose method");
		}
        posCloseDao.update(posClose);
        if(log.isDebugEnabled()){
			log.debug("end updatePosClose method");
		}
  }//end update method
  
   /**
   *save or update posClose object method
   *@param posClose PosClose
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void saveOrUpdatePosClose(PosClose posClose) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosClose method");
		}
		
        posCloseDao.saveOrUpdate(posClose);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosClose method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posClose PosClose query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-10 11:48
   */
  public Container<PosClose> findPosClose(PosClose posClose,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosClose method");
		}
        Container<PosClose> container = new Container<PosClose>();
        List<PosClose> list = posCloseDao.list(posClose, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posCloseDao.count(posClose));
        if(log.isDebugEnabled()){
			log.debug("end findPosClose method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posClose PosClose query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-10 11:48
   */
  public int countPosClose(PosClose posClose)throws DataAccessException{
    return posCloseDao.count(posClose);
  }//end count method
  
   /**
   *query a posClose by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-10 11:48
   */
  public PosClose findPosCloseById(Long id)throws DataAccessException{
    PosClose  posClose = posCloseDao.load(id);
    return posClose;
  }//end findPosCloseById method
  
    /**
   *query posClose collection method
   *@param posClose PosClose send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10  11:48
   */
  public List<PosClose> listPosClose(PosClose  posClose)
		throws DataAccessException {
	  List<PosClose> list = posCloseDao.list(posClose);
      return list;
  }//end list method
  
   /**
   *query posClose collection method
   *@param posClose PosClose send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10  11:48
   */
  public List<PosClose> listPosClose(PosClose posClose,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosClose> list = posCloseDao.list(posClose, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posCloseDao 
   * @author weihuawon
   * @date 2015年M7月d10�?11:48
   */
  public void setPosCloseDao(IPosCloseDao posCloseDao){ 
     this.posCloseDao = posCloseDao;
  }//end setPosCloseDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posCloseDao;
  }//end getDao method
}//end class PosCloseServiceImpl