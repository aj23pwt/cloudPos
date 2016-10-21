package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosCurrentPrice;
import com.greencloud.dao.IPosCurrentPriceDao;
import com.greencloud.service.IPosCurrentPriceService;
import org.springframework.dao.DataAccessException;
public class PosCurrentPriceServiceImpl extends BaseServiceImpl implements IPosCurrentPriceService
{
   //dao 
   private IPosCurrentPriceDao posCurrentPriceDao;
   
  /**
   *save posCurrentPrice object  method
   *@param posCurrentPrice PosCurrentPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosCurrentPrice(PosCurrentPrice posCurrentPrice) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosCurrentPrice method");
		}
         posCurrentPriceDao.save(posCurrentPrice);
     	if(log.isDebugEnabled()){
			log.debug("end savePosCurrentPrice method");
		}
  }//end save method
  
   /**
   *update posCurrentPrice method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosCurrentPrice(PosCurrentPrice posCurrentPrice) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosCurrentPrice method");
		}
        posCurrentPriceDao.update(posCurrentPrice);
        if(log.isDebugEnabled()){
			log.debug("end updatePosCurrentPrice method");
		}
  }//end update method
  
   /**
   *save or update posCurrentPrice object method
   *@param posCurrentPrice PosCurrentPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosCurrentPrice(PosCurrentPrice posCurrentPrice) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosCurrentPrice method");
		}
		
        posCurrentPriceDao.saveOrUpdate(posCurrentPrice);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosCurrentPrice method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posCurrentPrice PosCurrentPrice query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosCurrentPrice> findPosCurrentPrice(PosCurrentPrice posCurrentPrice,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosCurrentPrice method");
		}
        Container<PosCurrentPrice> container = new Container<PosCurrentPrice>();
        List<PosCurrentPrice> list = posCurrentPriceDao.list(posCurrentPrice, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posCurrentPriceDao.count(posCurrentPrice));
        if(log.isDebugEnabled()){
			log.debug("end findPosCurrentPrice method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posCurrentPrice PosCurrentPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosCurrentPrice(PosCurrentPrice posCurrentPrice)throws DataAccessException{
    return posCurrentPriceDao.count(posCurrentPrice);
  }//end count method
  
   /**
   *query a posCurrentPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosCurrentPrice findPosCurrentPriceById(Long id)throws DataAccessException{
    PosCurrentPrice  posCurrentPrice = posCurrentPriceDao.load(id);
    return posCurrentPrice;
  }//end findPosCurrentPriceById method
  
    /**
   *query posCurrentPrice collection method
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCurrentPrice> listPosCurrentPrice(PosCurrentPrice  posCurrentPrice)
		throws DataAccessException {
	  List<PosCurrentPrice> list = posCurrentPriceDao.list(posCurrentPrice);
      return list;
  }//end list method
  
   /**
   *query posCurrentPrice collection method
   *@param posCurrentPrice PosCurrentPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosCurrentPrice> listPosCurrentPrice(PosCurrentPrice posCurrentPrice,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosCurrentPrice> list = posCurrentPriceDao.list(posCurrentPrice, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posCurrentPriceDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosCurrentPriceDao(IPosCurrentPriceDao posCurrentPriceDao){ 
     this.posCurrentPriceDao = posCurrentPriceDao;
  }//end setPosCurrentPriceDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posCurrentPriceDao;
  }//end getDao method
}//end class PosCurrentPriceServiceImpl