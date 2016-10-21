package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPrinter;
import com.greencloud.entity.PosPserver;
import com.greencloud.dao.IPosPrinterDao;
import com.greencloud.dao.IPosPserverDao;
import com.greencloud.service.IPosPrinterService;
import org.springframework.dao.DataAccessException;
public class PosPrinterServiceImpl extends BaseServiceImpl implements IPosPrinterService
{
   //dao 
   private IPosPrinterDao posPrinterDao;
   private IPosPserverDao posPserverDao;
   
  public void setPosPserverDao(IPosPserverDao posPserverDao) {
	this.posPserverDao = posPserverDao;
}

/**
   *save posPrinter object  method
   *@param posPrinter PosPrinter 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-03 18:58
   */
  public void savePosPrinter(PosPrinter posPrinter) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPrinter method");
		}
         posPrinterDao.save(posPrinter);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPrinter method");
		}
  }//end save method
  
   /**
   *update posPrinter method
   *@param posPrinter PosPrinter
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-03 18:58
   */
  public void updatePosPrinter(PosPrinter posPrinter) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPrinter method");
		}
        posPrinterDao.update(posPrinter);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPrinter method");
		}
  }//end update method
  
   /**
   *save or update posPrinter object method
   *@param posPrinter PosPrinter
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-03 18:58
   */
  public void saveOrUpdatePosPrinter(PosPrinter posPrinter) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPrinter method");
		}
		
        posPrinterDao.saveOrUpdate(posPrinter);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPrinter method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPrinter PosPrinter query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-03 18:58
   */
  public Container<PosPrinter> findPosPrinter(PosPrinter posPrinter,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPrinter method");
		}
        Container<PosPrinter> container = new Container<PosPrinter>();
        List<PosPrinter> list = posPrinterDao.list(posPrinter, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPrinterDao.count(posPrinter));
        if(log.isDebugEnabled()){
			log.debug("end findPosPrinter method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPrinter PosPrinter query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-03 18:58
   */
  public int countPosPrinter(PosPrinter posPrinter)throws DataAccessException{
    return posPrinterDao.count(posPrinter);
  }//end count method
  
   /**
   *query a posPrinter by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-03 18:58
   */
  public PosPrinter findPosPrinterById(Long id)throws DataAccessException{
    PosPrinter  posPrinter = posPrinterDao.load(id);
    return posPrinter;
  }//end findPosPrinterById method
  
    /**
   *query posPrinter collection method
   *@param posPrinter PosPrinter send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-03  18:58
   */
  public List<PosPrinter> listPosPrinter(PosPrinter  posPrinter)
		throws DataAccessException {
	  List<PosPrinter> list = posPrinterDao.list(posPrinter);
      return list;
  }//end list method
  
   /**
   *query posPrinter collection method
   *@param posPrinter PosPrinter send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-03  18:58
   */
  public List<PosPrinter> listPosPrinter(PosPrinter posPrinter,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPrinter> list = posPrinterDao.list(posPrinter, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPrinterDao 
   * @author weihuawon
   * @date 2015年M11月d3�?18:58
   */
  public void setPosPrinterDao(IPosPrinterDao posPrinterDao){ 
     this.posPrinterDao = posPrinterDao;
  }//end setPosPrinterDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPrinterDao;
  }//end getDao method
  
  
  /**
   *save PosPserver object  method
   *@param PosPserver posPserver 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-26 11:26
   */
public void savePosPserver(PosPserver posPserver) throws DataAccessException
	{
	 	if(log.isDebugEnabled()){
			log.debug("start savePosPserver method");
		}
	 	posPserverDao.save(posPserver);
	 	if(log.isDebugEnabled()){
			log.debug("end savePosPserver method");
		}	
	}
  /**
   *update PosPserver object  method
   *@param PosPserver posPserver 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-26 11:26
   */
public void updatePosPserver(PosPserver posPserver) throws DataAccessException
	{
	 	if(log.isDebugEnabled()){
			log.debug("start updatePosPserver method");
		}
	 	posPserverDao.save(posPserver);
	 	if(log.isDebugEnabled()){
			log.debug("end updatePosPserver method");
		}	
	}
/**
 *save PosPserver object  method
 *@param PosPserver posPserver 
 *@throws DataAccessException 
 *@author  
 *@version 1.0
 *@date 2015-11-26 11:26
 */
public void saveOrUpdatePosPserver(PosPserver posPserver) throws DataAccessException
	{
    if(log.isDebugEnabled()){
		log.debug("start saveOrUpdatePosPrinter method");
	}	
    posPserverDao.saveOrUpdate(posPserver);    
    if(log.isDebugEnabled()){
		log.debug("end saveOrUpdatePosPrinter method");
	}
	}
   /**
   *query collection method  
   *@param PosPserver posPserve send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-11-26 11:26
   */
public List<PosPserver> listPosPserver(PosPserver posPserve)throws DataAccessException
	{
	  List<PosPserver> list = posPserverDao.list(posPserve);
      return list;
	}
  
}//end class PosPrinterServiceImpl