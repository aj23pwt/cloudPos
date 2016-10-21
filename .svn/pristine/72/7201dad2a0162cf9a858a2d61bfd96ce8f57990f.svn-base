package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosStoreUnit;
import com.greencloud.dao.IPosStoreUnitDao;
import com.greencloud.service.IPosStoreUnitService;
import org.springframework.dao.DataAccessException;
public class PosStoreUnitServiceImpl extends BaseServiceImpl implements IPosStoreUnitService
{
   //dao 
   private IPosStoreUnitDao posStoreUnitDao;
   
  /**
   *save posStoreUnit object  method
   *@param posStoreUnit PosStoreUnit 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void savePosStoreUnit(PosStoreUnit posStoreUnit) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStoreUnit method");
		}
         posStoreUnitDao.save(posStoreUnit);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStoreUnit method");
		}
  }//end save method
  
   /**
   *update posStoreUnit method
   *@param posStoreUnit PosStoreUnit
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void updatePosStoreUnit(PosStoreUnit posStoreUnit) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStoreUnit method");
		}
        posStoreUnitDao.update(posStoreUnit);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStoreUnit method");
		}
  }//end update method
  
   /**
   *save or update posStoreUnit object method
   *@param posStoreUnit PosStoreUnit
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-18 15:49
   */
  public void saveOrUpdatePosStoreUnit(PosStoreUnit posStoreUnit) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStoreUnit method");
		}
		
        posStoreUnitDao.saveOrUpdate(posStoreUnit);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStoreUnit method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStoreUnit PosStoreUnit query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-18 15:49
   */
  public Container<PosStoreUnit> findPosStoreUnit(PosStoreUnit posStoreUnit,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStoreUnit method");
		}
        Container<PosStoreUnit> container = new Container<PosStoreUnit>();
        List<PosStoreUnit> list = posStoreUnitDao.list(posStoreUnit, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStoreUnitDao.count(posStoreUnit));
        if(log.isDebugEnabled()){
			log.debug("end findPosStoreUnit method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStoreUnit PosStoreUnit query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-18 15:49
   */
  public int countPosStoreUnit(PosStoreUnit posStoreUnit)throws DataAccessException{
    return posStoreUnitDao.count(posStoreUnit);
  }//end count method
  
   /**
   *query a posStoreUnit by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-18 15:49
   */
  public PosStoreUnit findPosStoreUnitById(Long id)throws DataAccessException{
    PosStoreUnit  posStoreUnit = posStoreUnitDao.load(id);
    return posStoreUnit;
  }//end findPosStoreUnitById method
  
    /**
   *query posStoreUnit collection method
   *@param posStoreUnit PosStoreUnit send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18  15:49
   */
  public List<PosStoreUnit> listPosStoreUnit(PosStoreUnit  posStoreUnit)
		throws DataAccessException {
	  List<PosStoreUnit> list = posStoreUnitDao.list(posStoreUnit);
      return list;
  }//end list method
  
   /**
   *query posStoreUnit collection method
   *@param posStoreUnit PosStoreUnit send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-18  15:49
   */
  public List<PosStoreUnit> listPosStoreUnit(PosStoreUnit posStoreUnit,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStoreUnit> list = posStoreUnitDao.list(posStoreUnit, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStoreUnitDao 
   * @author weihuawon
   * @date 2016年M1月d18�?15:49
   */
  public void setPosStoreUnitDao(IPosStoreUnitDao posStoreUnitDao){ 
     this.posStoreUnitDao = posStoreUnitDao;
  }//end setPosStoreUnitDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStoreUnitDao;
  }//end getDao method
}//end class PosStoreUnitServiceImpl