package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosModeDef;
import com.greencloud.dao.IPosModeDefDao;
import com.greencloud.service.IPosModeDefService;
import org.springframework.dao.DataAccessException;
public class PosModeDefServiceImpl extends BaseServiceImpl implements IPosModeDefService
{
   //dao 
   private IPosModeDefDao posModeDefDao;
   
  /**
   *save posModeDef object  method
   *@param posModeDef PosModeDef 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosModeDef(PosModeDef posModeDef) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosModeDef method");
		}
         posModeDefDao.save(posModeDef);
     	if(log.isDebugEnabled()){
			log.debug("end savePosModeDef method");
		}
  }//end save method
  
   /**
   *update posModeDef method
   *@param posModeDef PosModeDef
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosModeDef(PosModeDef posModeDef) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosModeDef method");
		}
        posModeDefDao.update(posModeDef);
        if(log.isDebugEnabled()){
			log.debug("end updatePosModeDef method");
		}
  }//end update method
  
   /**
   *save or update posModeDef object method
   *@param posModeDef PosModeDef
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosModeDef(PosModeDef posModeDef) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosModeDef method");
		}
		
        posModeDefDao.saveOrUpdate(posModeDef);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosModeDef method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posModeDef PosModeDef query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosModeDef> findPosModeDef(PosModeDef posModeDef,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosModeDef method");
		}
        Container<PosModeDef> container = new Container<PosModeDef>();
        List<PosModeDef> list = posModeDefDao.list(posModeDef, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posModeDefDao.count(posModeDef));
        if(log.isDebugEnabled()){
			log.debug("end findPosModeDef method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posModeDef PosModeDef query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosModeDef(PosModeDef posModeDef)throws DataAccessException{
    return posModeDefDao.count(posModeDef);
  }//end count method
  
   /**
   *query a posModeDef by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeDef findPosModeDefById(Long id)throws DataAccessException{
    PosModeDef  posModeDef = posModeDefDao.load(id);
    return posModeDef;
  }//end findPosModeDefById method
  
    /**
   *query posModeDef collection method
   *@param posModeDef PosModeDef send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeDef> listPosModeDef(PosModeDef  posModeDef)
		throws DataAccessException {
	  List<PosModeDef> list = posModeDefDao.list(posModeDef);
      return list;
  }//end list method
  
   /**
   *query posModeDef collection method
   *@param posModeDef PosModeDef send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeDef> listPosModeDef(PosModeDef posModeDef,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosModeDef> list = posModeDefDao.list(posModeDef, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posModeDefDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosModeDefDao(IPosModeDefDao posModeDefDao){ 
     this.posModeDefDao = posModeDefDao;
  }//end setPosModeDefDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posModeDefDao;
  }//end getDao method
}//end class PosModeDefServiceImpl