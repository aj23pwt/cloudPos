package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosResOrder;
import com.greencloud.dao.IPosResOrderDao;
import com.greencloud.service.IPosResOrderService;
import org.springframework.dao.DataAccessException;
public class PosResOrderServiceImpl extends BaseServiceImpl implements IPosResOrderService
{
   //dao 
   private IPosResOrderDao posResOrderDao;
   
  /**
   *save posResOrder object  method
   *@param posResOrder PosResOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void savePosResOrder(PosResOrder posResOrder) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosResOrder method");
		}
         posResOrderDao.save(posResOrder);
     	if(log.isDebugEnabled()){
			log.debug("end savePosResOrder method");
		}
  }//end save method
  
   /**
   *update posResOrder method
   *@param posResOrder PosResOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void updatePosResOrder(PosResOrder posResOrder) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosResOrder method");
		}
        posResOrderDao.update(posResOrder);
        if(log.isDebugEnabled()){
			log.debug("end updatePosResOrder method");
		}
  }//end update method
  
   /**
   *save or update posResOrder object method
   *@param posResOrder PosResOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void saveOrUpdatePosResOrder(PosResOrder posResOrder) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosResOrder method");
		}
		
        posResOrderDao.saveOrUpdate(posResOrder);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosResOrder method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posResOrder PosResOrder query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-04-01 13:44
   */
  public Container<PosResOrder> findPosResOrder(PosResOrder posResOrder,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosResOrder method");
		}
        Container<PosResOrder> container = new Container<PosResOrder>();
        List<PosResOrder> list = posResOrderDao.list(posResOrder, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posResOrderDao.count(posResOrder));
        if(log.isDebugEnabled()){
			log.debug("end findPosResOrder method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posResOrder PosResOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-01 13:44
   */
  public int countPosResOrder(PosResOrder posResOrder)throws DataAccessException{
    return posResOrderDao.count(posResOrder);
  }//end count method
  
   /**
   *query a posResOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-01 13:44
   */
  public PosResOrder findPosResOrderById(Long id)throws DataAccessException{
    PosResOrder  posResOrder = posResOrderDao.load(id);
    return posResOrder;
  }//end findPosResOrderById method
  
    /**
   *query posResOrder collection method
   *@param posResOrder PosResOrder send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosResOrder> listPosResOrder(PosResOrder  posResOrder)
		throws DataAccessException {
	  List<PosResOrder> list = posResOrderDao.list(posResOrder);
      return list;
  }//end list method
  
   /**
   *query posResOrder collection method
   *@param posResOrder PosResOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosResOrder> listPosResOrder(PosResOrder posResOrder,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosResOrder> list = posResOrderDao.list(posResOrder, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posResOrderDao 
   * @author weihuawon
   * @date 2015年M4月d1�?13:44
   */
  public void setPosResOrderDao(IPosResOrderDao posResOrderDao){ 
     this.posResOrderDao = posResOrderDao;
  }//end setPosResOrderDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posResOrderDao;
  }//end getDao method
}//end class PosResOrderServiceImpl