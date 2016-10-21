package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPluStd;
import com.greencloud.dao.IPosPluStdDao;
import com.greencloud.service.IPosPluStdService;
import org.springframework.dao.DataAccessException;
public class PosPluStdServiceImpl extends BaseServiceImpl implements IPosPluStdService
{
   //dao 
   private IPosPluStdDao posPluStdDao;
   
  /**
   *save posPluStd object  method
   *@param posPluStd PosPluStd 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosPluStd(PosPluStd posPluStd) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPluStd method");
		}
         posPluStdDao.save(posPluStd);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPluStd method");
		}
  }//end save method
  
   /**
   *update posPluStd method
   *@param posPluStd PosPluStd
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosPluStd(PosPluStd posPluStd) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPluStd method");
		}
        posPluStdDao.update(posPluStd);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPluStd method");
		}
  }//end update method
  
   /**
   *save or update posPluStd object method
   *@param posPluStd PosPluStd
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosPluStd(PosPluStd posPluStd) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPluStd method");
		}
		
        posPluStdDao.saveOrUpdate(posPluStd);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPluStd method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPluStd PosPluStd query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosPluStd> findPosPluStd(PosPluStd posPluStd,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPluStd method");
		}
        Container<PosPluStd> container = new Container<PosPluStd>();
        List<PosPluStd> list = posPluStdDao.list(posPluStd, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPluStdDao.count(posPluStd));
        if(log.isDebugEnabled()){
			log.debug("end findPosPluStd method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPluStd PosPluStd query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosPluStd(PosPluStd posPluStd)throws DataAccessException{
    return posPluStdDao.count(posPluStd);
  }//end count method
  
   /**
   *query a posPluStd by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosPluStd findPosPluStdById(Long id)throws DataAccessException{
    PosPluStd  posPluStd = posPluStdDao.load(id);
    return posPluStd;
  }//end findPosPluStdById method
  
    /**
   *query posPluStd collection method
   *@param posPluStd PosPluStd send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPluStd> listPosPluStd(PosPluStd  posPluStd)
		throws DataAccessException {
	  List<PosPluStd> list = posPluStdDao.list(posPluStd);
      return list;
  }//end list method
  
   /**
   *query posPluStd collection method
   *@param posPluStd PosPluStd send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosPluStd> listPosPluStd(PosPluStd posPluStd,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPluStd> list = posPluStdDao.list(posPluStd, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPluStdDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosPluStdDao(IPosPluStdDao posPluStdDao){ 
     this.posPluStdDao = posPluStdDao;
  }//end setPosPluStdDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPluStdDao;
  }//end getDao method
}//end class PosPluStdServiceImpl