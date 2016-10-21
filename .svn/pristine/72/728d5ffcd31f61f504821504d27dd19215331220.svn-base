package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPccode;
import com.greencloud.dao.IPosPccodeDao;
import com.greencloud.service.IPosPccodeService;
import org.springframework.dao.DataAccessException;
public class PosPccodeServiceImpl extends BaseServiceImpl implements IPosPccodeService
{
   //dao 
   private IPosPccodeDao posPccodeDao;
   
  /**
   *save posPccode object  method
   *@param posPccode PosPccode 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccode(PosPccode posPccode) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPccode method");
		}
         posPccodeDao.save(posPccode);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPccode method");
		}
  }//end save method
  
   /**
   *update posPccode method
   *@param posPccode PosPccode
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccode(PosPccode posPccode) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPccode method");
		}
        posPccodeDao.update(posPccode);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPccode method");
		}
  }//end update method
  
   /**
   *save or update posPccode object method
   *@param posPccode PosPccode
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccode(PosPccode posPccode) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPccode method");
		}
		
        posPccodeDao.saveOrUpdate(posPccode);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPccode method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPccode PosPccode query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccode> findPosPccode(PosPccode posPccode,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPccode method");
		}
        Container<PosPccode> container = new Container<PosPccode>();
        List<PosPccode> list = posPccodeDao.list(posPccode, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPccodeDao.count(posPccode));
        if(log.isDebugEnabled()){
			log.debug("end findPosPccode method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPccode PosPccode query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccode(PosPccode posPccode)throws DataAccessException{
    return posPccodeDao.count(posPccode);
  }//end count method
  
   /**
   *query a posPccode by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccode findPosPccodeById(Long id)throws DataAccessException{
    PosPccode  posPccode = posPccodeDao.load(id);
    return posPccode;
  }//end findPosPccodeById method
  
    /**
   *query posPccode collection method
   *@param posPccode PosPccode send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccode> listPosPccode(PosPccode  posPccode)
		throws DataAccessException {
	  List<PosPccode> list = posPccodeDao.list(posPccode);
      return list;
  }//end list method
  
   /**
   *query posPccode collection method
   *@param posPccode PosPccode send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccode> listPosPccode(PosPccode posPccode,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPccode> list = posPccodeDao.list(posPccode, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPccodeDao 
   * @author weihuawon
   * @date 2015年M3月d24�?09:33
   */
  public void setPosPccodeDao(IPosPccodeDao posPccodeDao){ 
     this.posPccodeDao = posPccodeDao;
  }//end setPosPccodeDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPccodeDao;
  }//end getDao method
}//end class PosPccodeServiceImpl