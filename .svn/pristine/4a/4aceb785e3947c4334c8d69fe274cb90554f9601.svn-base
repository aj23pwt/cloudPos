package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPccodeAuditFlag;
import com.greencloud.dao.IPosPccodeAuditFlagDao;
import com.greencloud.service.IPosPccodeAuditFlagService;
import org.springframework.dao.DataAccessException;
public class PosPccodeAuditFlagServiceImpl extends BaseServiceImpl implements IPosPccodeAuditFlagService
{
   //dao 
   private IPosPccodeAuditFlagDao posPccodeAuditFlagDao;
   
  /**
   *save posPccodeAuditFlag object  method
   *@param posPccodeAuditFlag PosPccodeAuditFlag 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-03-30 10:39
   */
  public void savePosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPccodeAuditFlag method");
		}
         posPccodeAuditFlagDao.save(posPccodeAuditFlag);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPccodeAuditFlag method");
		}
  }//end save method
  
   /**
   *update posPccodeAuditFlag method
   *@param posPccodeAuditFlag PosPccodeAuditFlag
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-03-30 10:39
   */
  public void updatePosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPccodeAuditFlag method");
		}
        posPccodeAuditFlagDao.update(posPccodeAuditFlag);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPccodeAuditFlag method");
		}
  }//end update method
  
   /**
   *save or update posPccodeAuditFlag object method
   *@param posPccodeAuditFlag PosPccodeAuditFlag
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-03-30 10:39
   */
  public void saveOrUpdatePosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPccodeAuditFlag method");
		}
		
        posPccodeAuditFlagDao.saveOrUpdate(posPccodeAuditFlag);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPccodeAuditFlag method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPccodeAuditFlag PosPccodeAuditFlag query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-03-30 10:39
   */
  public Container<PosPccodeAuditFlag> findPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPccodeAuditFlag method");
		}
        Container<PosPccodeAuditFlag> container = new Container<PosPccodeAuditFlag>();
        List<PosPccodeAuditFlag> list = posPccodeAuditFlagDao.list(posPccodeAuditFlag, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPccodeAuditFlagDao.count(posPccodeAuditFlag));
        if(log.isDebugEnabled()){
			log.debug("end findPosPccodeAuditFlag method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPccodeAuditFlag PosPccodeAuditFlag query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-03-30 10:39
   */
  public int countPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag)throws DataAccessException{
    return posPccodeAuditFlagDao.count(posPccodeAuditFlag);
  }//end count method
  
   /**
   *query a posPccodeAuditFlag by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-03-30 10:39
   */
  public PosPccodeAuditFlag findPosPccodeAuditFlagById(Long id)throws DataAccessException{
    PosPccodeAuditFlag  posPccodeAuditFlag = posPccodeAuditFlagDao.load(id);
    return posPccodeAuditFlag;
  }//end findPosPccodeAuditFlagById method
  
    /**
   *query posPccodeAuditFlag collection method
   *@param posPccodeAuditFlag PosPccodeAuditFlag send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-03-30  10:39
   */
  public List<PosPccodeAuditFlag> listPosPccodeAuditFlag(PosPccodeAuditFlag  posPccodeAuditFlag)
		throws DataAccessException {
	  List<PosPccodeAuditFlag> list = posPccodeAuditFlagDao.list(posPccodeAuditFlag);
      return list;
  }//end list method
  
   /**
   *query posPccodeAuditFlag collection method
   *@param posPccodeAuditFlag PosPccodeAuditFlag send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-03-30  10:39
   */
  public List<PosPccodeAuditFlag> listPosPccodeAuditFlag(PosPccodeAuditFlag posPccodeAuditFlag,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPccodeAuditFlag> list = posPccodeAuditFlagDao.list(posPccodeAuditFlag, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPccodeAuditFlagDao 
   * @author weihuawon
   * @date 2016年M3月d30�?10:39
   */
  public void setPosPccodeAuditFlagDao(IPosPccodeAuditFlagDao posPccodeAuditFlagDao){ 
     this.posPccodeAuditFlagDao = posPccodeAuditFlagDao;
  }//end setPosPccodeAuditFlagDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPccodeAuditFlagDao;
  }//end getDao method
}//end class PosPccodeAuditFlagServiceImpl