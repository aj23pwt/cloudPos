package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPrice;
import com.greencloud.dao.IPosPriceDao;
import com.greencloud.service.IPosPriceService;
import org.springframework.dao.DataAccessException;
public class PosPriceServiceImpl extends BaseServiceImpl implements IPosPriceService
{
   //dao 
   private IPosPriceDao posPriceDao;
   
  /**
   *save posPrice object  method
   *@param posPrice PosPrice 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosPrice(PosPrice posPrice) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPrice method");
		}
         posPriceDao.save(posPrice);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPrice method");
		}
  }//end save method
  
   /**
   *update posPrice method
   *@param posPrice PosPrice
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosPrice(PosPrice posPrice) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPrice method");
		}
        posPriceDao.update(posPrice);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPrice method");
		}
  }//end update method
  
   /**
   *save or update posPrice object method
   *@param posPrice PosPrice
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosPrice(PosPrice posPrice) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPrice method");
		}
		
        posPriceDao.saveOrUpdate(posPrice);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPrice method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPrice PosPrice query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosPrice> findPosPrice(PosPrice posPrice,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPrice method");
		}
        Container<PosPrice> container = new Container<PosPrice>();
        List<PosPrice> list = posPriceDao.list(posPrice, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPriceDao.count(posPrice));
        if(log.isDebugEnabled()){
			log.debug("end findPosPrice method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPrice PosPrice query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosPrice(PosPrice posPrice)throws DataAccessException{
    return posPriceDao.count(posPrice);
  }//end count method
  
   /**
   *query a posPrice by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPrice findPosPriceById(Long id)throws DataAccessException{
    PosPrice  posPrice = posPriceDao.load(id);
    return posPrice;
  }//end findPosPriceById method
  
    /**
   *query posPrice collection method
   *@param posPrice PosPrice send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPrice> listPosPrice(PosPrice  posPrice)
		throws DataAccessException {
	  List<PosPrice> list = posPriceDao.list(posPrice);
      return list;
  }//end list method
  
   /**
   *query posPrice collection method
   *@param posPrice PosPrice send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPrice> listPosPrice(PosPrice posPrice,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPrice> list = posPriceDao.list(posPrice, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPriceDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosPriceDao(IPosPriceDao posPriceDao){ 
     this.posPriceDao = posPriceDao;
  }//end setPosPriceDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPriceDao;
  }//end getDao method
}//end class PosPriceServiceImpl