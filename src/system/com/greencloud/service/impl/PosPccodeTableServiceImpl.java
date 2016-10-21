package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPccodeTable;
import com.greencloud.dao.IPosPccodeTableDao;
import com.greencloud.service.IPosPccodeTableService;
import org.springframework.dao.DataAccessException;
public class PosPccodeTableServiceImpl extends BaseServiceImpl implements IPosPccodeTableService
{
   //dao 
   private IPosPccodeTableDao posPccodeTableDao;
   
  /**
   *save posPccodeTable object  method
   *@param posPccodeTable PosPccodeTable 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccodeTable(PosPccodeTable posPccodeTable) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPccodeTable method");
		}
         posPccodeTableDao.save(posPccodeTable);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPccodeTable method");
		}
  }//end save method
  
   /**
   *update posPccodeTable method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccodeTable(PosPccodeTable posPccodeTable) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPccodeTable method");
		}
        posPccodeTableDao.update(posPccodeTable);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPccodeTable method");
		}
  }//end update method
  
   /**
   *save or update posPccodeTable object method
   *@param posPccodeTable PosPccodeTable
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccodeTable(PosPccodeTable posPccodeTable) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPccodeTable method");
		}
		
        posPccodeTableDao.saveOrUpdate(posPccodeTable);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPccodeTable method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPccodeTable PosPccodeTable query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccodeTable> findPosPccodeTable(PosPccodeTable posPccodeTable,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPccodeTable method");
		}
        Container<PosPccodeTable> container = new Container<PosPccodeTable>();
        List<PosPccodeTable> list = posPccodeTableDao.list(posPccodeTable, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPccodeTableDao.count(posPccodeTable));
        if(log.isDebugEnabled()){
			log.debug("end findPosPccodeTable method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPccodeTable PosPccodeTable query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccodeTable(PosPccodeTable posPccodeTable)throws DataAccessException{
    return posPccodeTableDao.count(posPccodeTable);
  }//end count method
  
   /**
   *query a posPccodeTable by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeTable findPosPccodeTableById(Long id)throws DataAccessException{
    PosPccodeTable  posPccodeTable = posPccodeTableDao.load(id);
    return posPccodeTable;
  }//end findPosPccodeTableById method
  
    /**
   *query posPccodeTable collection method
   *@param posPccodeTable PosPccodeTable send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeTable> listPosPccodeTable(PosPccodeTable  posPccodeTable)
		throws DataAccessException {
	  List<PosPccodeTable> list = posPccodeTableDao.list(posPccodeTable);
      return list;
  }//end list method
  
   /**
   *query posPccodeTable collection method
   *@param posPccodeTable PosPccodeTable send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeTable> listPosPccodeTable(PosPccodeTable posPccodeTable,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPccodeTable> list = posPccodeTableDao.list(posPccodeTable, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPccodeTableDao 
   * @author weihuawon
   * @date 2015年M3月d24�?09:33
   */
  public void setPosPccodeTableDao(IPosPccodeTableDao posPccodeTableDao){ 
     this.posPccodeTableDao = posPccodeTableDao;
  }//end setPosPccodeTableDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPccodeTableDao;
  }//end getDao method
}//end class PosPccodeTableServiceImpl