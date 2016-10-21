package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPluPrinter;
import com.greencloud.dao.IPosPluPrinterDao;
import com.greencloud.service.IPosPluPrinterService;
import org.springframework.dao.DataAccessException;
public class PosPluPrinterServiceImpl extends BaseServiceImpl implements IPosPluPrinterService
{
   //dao 
   private IPosPluPrinterDao posPluPrinterDao;
   
  /**
   *save posPluPrinter object  method
   *@param posPluPrinter PosPluPrinter 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-21 10:55
   */
  public void savePosPluPrinter(PosPluPrinter posPluPrinter) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPluPrinter method");
		}
         posPluPrinterDao.save(posPluPrinter);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPluPrinter method");
		}
  }//end save method
  
   /**
   *update posPluPrinter method
   *@param posPluPrinter PosPluPrinter
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-21 10:55
   */
  public void updatePosPluPrinter(PosPluPrinter posPluPrinter) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPluPrinter method");
		}
        posPluPrinterDao.update(posPluPrinter);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPluPrinter method");
		}
  }//end update method
  
   /**
   *save or update posPluPrinter object method
   *@param posPluPrinter PosPluPrinter
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-21 10:55
   */
  public void saveOrUpdatePosPluPrinter(PosPluPrinter posPluPrinter) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPluPrinter method");
		}
		
        posPluPrinterDao.saveOrUpdate(posPluPrinter);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPluPrinter method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPluPrinter PosPluPrinter query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-21 10:55
   */
  public Container<PosPluPrinter> findPosPluPrinter(PosPluPrinter posPluPrinter,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPluPrinter method");
		}
        Container<PosPluPrinter> container = new Container<PosPluPrinter>();
        List<PosPluPrinter> list = posPluPrinterDao.list(posPluPrinter, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPluPrinterDao.count(posPluPrinter));
        if(log.isDebugEnabled()){
			log.debug("end findPosPluPrinter method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPluPrinter PosPluPrinter query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-21 10:55
   */
  public int countPosPluPrinter(PosPluPrinter posPluPrinter)throws DataAccessException{
    return posPluPrinterDao.count(posPluPrinter);
  }//end count method
  
   /**
   *query a posPluPrinter by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-21 10:55
   */
  public PosPluPrinter findPosPluPrinterById(Long id)throws DataAccessException{
    PosPluPrinter  posPluPrinter = posPluPrinterDao.load(id);
    return posPluPrinter;
  }//end findPosPluPrinterById method
  
    /**
   *query posPluPrinter collection method
   *@param posPluPrinter PosPluPrinter send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-21  10:55
   */
  public List<PosPluPrinter> listPosPluPrinter(PosPluPrinter  posPluPrinter)
		throws DataAccessException {
	  List<PosPluPrinter> list = posPluPrinterDao.list(posPluPrinter);
      return list;
  }//end list method
  
   /**
   *query posPluPrinter collection method
   *@param posPluPrinter PosPluPrinter send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-21  10:55
   */
  public List<PosPluPrinter> listPosPluPrinter(PosPluPrinter posPluPrinter,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPluPrinter> list = posPluPrinterDao.list(posPluPrinter, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPluPrinterDao 
   * @author weihuawon
   * @date 2015年M11月d21�?10:55
   */
  public void setPosPluPrinterDao(IPosPluPrinterDao posPluPrinterDao){ 
     this.posPluPrinterDao = posPluPrinterDao;
  }//end setPosPluPrinterDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPluPrinterDao;
  }//end getDao method
}//end class PosPluPrinterServiceImpl