package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosSysReason;
import com.greencloud.dao.IPosSysReasonDao;
import com.greencloud.service.IPosSysReasonService;
import org.springframework.dao.DataAccessException;
public class PosSysReasonServiceImpl extends BaseServiceImpl implements IPosSysReasonService
{
   //dao 
   private IPosSysReasonDao posSysReasonDao;
   
  /**
   *save posSysReason object  method
   *@param posSysReason PosSysReason 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosSysReason(PosSysReason posSysReason) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosSysReason method");
		}
         posSysReasonDao.save(posSysReason);
     	if(log.isDebugEnabled()){
			log.debug("end savePosSysReason method");
		}
  }//end save method
  
   /**
   *update posSysReason method
   *@param posSysReason PosSysReason
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosSysReason(PosSysReason posSysReason) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosSysReason method");
		}
        posSysReasonDao.update(posSysReason);
        if(log.isDebugEnabled()){
			log.debug("end updatePosSysReason method");
		}
  }//end update method
  
   /**
   *save or update posSysReason object method
   *@param posSysReason PosSysReason
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosSysReason(PosSysReason posSysReason) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosSysReason method");
		}
		
        posSysReasonDao.saveOrUpdate(posSysReason);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosSysReason method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posSysReason PosSysReason query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosSysReason> findPosSysReason(PosSysReason posSysReason,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosSysReason method");
		}
        Container<PosSysReason> container = new Container<PosSysReason>();
        List<PosSysReason> list = posSysReasonDao.list(posSysReason, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posSysReasonDao.count(posSysReason));
        if(log.isDebugEnabled()){
			log.debug("end findPosSysReason method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posSysReason PosSysReason query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosSysReason(PosSysReason posSysReason)throws DataAccessException{
    return posSysReasonDao.count(posSysReason);
  }//end count method
  
   /**
   *query a posSysReason by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosSysReason findPosSysReasonById(Long id)throws DataAccessException{
    PosSysReason  posSysReason = posSysReasonDao.load(id);
    return posSysReason;
  }//end findPosSysReasonById method
  
    /**
   *query posSysReason collection method
   *@param posSysReason PosSysReason send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosSysReason> listPosSysReason(PosSysReason  posSysReason)
		throws DataAccessException {
	  List<PosSysReason> list = posSysReasonDao.list(posSysReason);
      return list;
  }//end list method
  
   /**
   *query posSysReason collection method
   *@param posSysReason PosSysReason send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosSysReason> listPosSysReason(PosSysReason posSysReason,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosSysReason> list = posSysReasonDao.list(posSysReason, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posSysReasonDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosSysReasonDao(IPosSysReasonDao posSysReasonDao){ 
     this.posSysReasonDao = posSysReasonDao;
  }//end setPosSysReasonDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posSysReasonDao;
  }//end getDao method
}//end class PosSysReasonServiceImpl