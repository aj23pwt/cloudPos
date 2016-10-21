package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosDrinksDepositOrder;
import com.greencloud.dao.IPosDrinksDepositOrderDao;
import com.greencloud.service.IPosDrinksDepositOrderService;
import org.springframework.dao.DataAccessException;
public class PosDrinksDepositOrderServiceImpl extends BaseServiceImpl implements IPosDrinksDepositOrderService
{
   //dao 
   private IPosDrinksDepositOrderDao posDrinksDepositOrderDao;
   
  /**
   *save posDrinksDepositOrder object  method
   *@param posDrinksDepositOrder PosDrinksDepositOrder 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void savePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosDrinksDepositOrder method");
		}
         posDrinksDepositOrderDao.save(posDrinksDepositOrder);
     	if(log.isDebugEnabled()){
			log.debug("end savePosDrinksDepositOrder method");
		}
  }//end save method
  
   /**
   *update posDrinksDepositOrder method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void updatePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosDrinksDepositOrder method");
		}
        posDrinksDepositOrderDao.update(posDrinksDepositOrder);
        if(log.isDebugEnabled()){
			log.debug("end updatePosDrinksDepositOrder method");
		}
  }//end update method
  
   /**
   *save or update posDrinksDepositOrder object method
   *@param posDrinksDepositOrder PosDrinksDepositOrder
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdatePosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosDrinksDepositOrder method");
		}
		
        posDrinksDepositOrderDao.saveOrUpdate(posDrinksDepositOrder);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosDrinksDepositOrder method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posDrinksDepositOrder PosDrinksDepositOrder query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 15:46
   */
  public Container<PosDrinksDepositOrder> findPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosDrinksDepositOrder method");
		}
        Container<PosDrinksDepositOrder> container = new Container<PosDrinksDepositOrder>();
        List<PosDrinksDepositOrder> list = posDrinksDepositOrderDao.list(posDrinksDepositOrder, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posDrinksDepositOrderDao.count(posDrinksDepositOrder));
        if(log.isDebugEnabled()){
			log.debug("end findPosDrinksDepositOrder method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posDrinksDepositOrder PosDrinksDepositOrder query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int countPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder)throws DataAccessException{
    return posDrinksDepositOrderDao.count(posDrinksDepositOrder);
  }//end count method
  
   /**
   *query a posDrinksDepositOrder by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksDepositOrder findPosDrinksDepositOrderById(Long id)throws DataAccessException{
    PosDrinksDepositOrder  posDrinksDepositOrder = posDrinksDepositOrderDao.load(id);
//    log.debug(posDrinksDepositOrder);
    return posDrinksDepositOrder;
  }//end findPosDrinksDepositOrderById method
  
    /**
   *query posDrinksDepositOrder collection method
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksDepositOrder> listPosDrinksDepositOrder(PosDrinksDepositOrder  posDrinksDepositOrder)
		throws DataAccessException {
	  List<PosDrinksDepositOrder> list = posDrinksDepositOrderDao.list(posDrinksDepositOrder);
      return list;
  }//end list method
  
   /**
   *query posDrinksDepositOrder collection method
   *@param posDrinksDepositOrder PosDrinksDepositOrder send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksDepositOrder> listPosDrinksDepositOrder(PosDrinksDepositOrder posDrinksDepositOrder,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosDrinksDepositOrder> list = posDrinksDepositOrderDao.list(posDrinksDepositOrder, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posDrinksDepositOrderDao 
   * @author weihuawon
   * @date 2015年M11月d6�?15:46
   */
  public void setPosDrinksDepositOrderDao(IPosDrinksDepositOrderDao posDrinksDepositOrderDao){ 
     this.posDrinksDepositOrderDao = posDrinksDepositOrderDao;
  }//end setPosDrinksDepositOrderDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posDrinksDepositOrderDao;
  }//end getDao method
}//end class PosDrinksDepositOrderServiceImpl