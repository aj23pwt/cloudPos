package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPccodeNoteType;
import com.greencloud.dao.IPosPccodeNoteTypeDao;
import com.greencloud.service.IPosPccodeNoteTypeService;
import org.springframework.dao.DataAccessException;
public class PosPccodeNoteTypeServiceImpl extends BaseServiceImpl implements IPosPccodeNoteTypeService
{
   //dao 
   private IPosPccodeNoteTypeDao posPccodeNoteTypeDao;
   
  /**
   *save posPccodeNoteType object  method
   *@param posPccodeNoteType PosPccodeNoteType 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void savePosPccodeNoteType(PosPccodeNoteType posPccodeNoteType) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPccodeNoteType method");
		}
         posPccodeNoteTypeDao.save(posPccodeNoteType);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPccodeNoteType method");
		}
  }//end save method
  
   /**
   *update posPccodeNoteType method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void updatePosPccodeNoteType(PosPccodeNoteType posPccodeNoteType) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPccodeNoteType method");
		}
        posPccodeNoteTypeDao.update(posPccodeNoteType);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPccodeNoteType method");
		}
  }//end update method
  
   /**
   *save or update posPccodeNoteType object method
   *@param posPccodeNoteType PosPccodeNoteType
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-09-29 10:51
   */
  public void saveOrUpdatePosPccodeNoteType(PosPccodeNoteType posPccodeNoteType) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPccodeNoteType method");
		}
		
        posPccodeNoteTypeDao.saveOrUpdate(posPccodeNoteType);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPccodeNoteType method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPccodeNoteType PosPccodeNoteType query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-09-29 10:51
   */
  public Container<PosPccodeNoteType> findPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPccodeNoteType method");
		}
        Container<PosPccodeNoteType> container = new Container<PosPccodeNoteType>();
        List<PosPccodeNoteType> list = posPccodeNoteTypeDao.list(posPccodeNoteType, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPccodeNoteTypeDao.count(posPccodeNoteType));
        if(log.isDebugEnabled()){
			log.debug("end findPosPccodeNoteType method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPccodeNoteType PosPccodeNoteType query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-09-29 10:51
   */
  public int countPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType)throws DataAccessException{
    return posPccodeNoteTypeDao.count(posPccodeNoteType);
  }//end count method
  
   /**
   *query a posPccodeNoteType by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-09-29 10:51
   */
  public PosPccodeNoteType findPosPccodeNoteTypeById(Long id)throws DataAccessException{
    PosPccodeNoteType  posPccodeNoteType = posPccodeNoteTypeDao.load(id);
    return posPccodeNoteType;
  }//end findPosPccodeNoteTypeById method
  
    /**
   *query posPccodeNoteType collection method
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29  10:51
   */
  public List<PosPccodeNoteType> listPosPccodeNoteType(PosPccodeNoteType  posPccodeNoteType)
		throws DataAccessException {
	  List<PosPccodeNoteType> list = posPccodeNoteTypeDao.list(posPccodeNoteType);
      return list;
  }//end list method
  
   /**
   *query posPccodeNoteType collection method
   *@param posPccodeNoteType PosPccodeNoteType send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-09-29  10:51
   */
  public List<PosPccodeNoteType> listPosPccodeNoteType(PosPccodeNoteType posPccodeNoteType,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPccodeNoteType> list = posPccodeNoteTypeDao.list(posPccodeNoteType, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPccodeNoteTypeDao 
   * @author weihuawon
   * @date 2016年M9月d29�?10:51
   */
  public void setPosPccodeNoteTypeDao(IPosPccodeNoteTypeDao posPccodeNoteTypeDao){ 
     this.posPccodeNoteTypeDao = posPccodeNoteTypeDao;
  }//end setPosPccodeNoteTypeDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPccodeNoteTypeDao;
  }//end getDao method
}//end class PosPccodeNoteTypeServiceImpl