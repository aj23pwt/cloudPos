package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosModeName;
import com.greencloud.dao.IPosModeNameDao;
import com.greencloud.service.IPosModeNameService;
import org.springframework.dao.DataAccessException;
public class PosModeNameServiceImpl extends BaseServiceImpl implements IPosModeNameService
{
   //dao 
   private IPosModeNameDao posModeNameDao;
   
  /**
   *save posModeName object  method
   *@param posModeName PosModeName 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosModeName(PosModeName posModeName) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosModeName method");
		}
         posModeNameDao.save(posModeName);
     	if(log.isDebugEnabled()){
			log.debug("end savePosModeName method");
		}
  }//end save method
  
   /**
   *update posModeName method
   *@param posModeName PosModeName
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosModeName(PosModeName posModeName) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosModeName method");
		}
        posModeNameDao.update(posModeName);
        if(log.isDebugEnabled()){
			log.debug("end updatePosModeName method");
		}
  }//end update method
  
   /**
   *save or update posModeName object method
   *@param posModeName PosModeName
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosModeName(PosModeName posModeName) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosModeName method");
		}
		
        posModeNameDao.saveOrUpdate(posModeName);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosModeName method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posModeName PosModeName query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosModeName> findPosModeName(PosModeName posModeName,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosModeName method");
		}
        Container<PosModeName> container = new Container<PosModeName>();
        List<PosModeName> list = posModeNameDao.list(posModeName, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posModeNameDao.count(posModeName));
        if(log.isDebugEnabled()){
			log.debug("end findPosModeName method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posModeName PosModeName query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosModeName(PosModeName posModeName)throws DataAccessException{
    return posModeNameDao.count(posModeName);
  }//end count method
  
   /**
   *query a posModeName by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosModeName findPosModeNameById(Long id)throws DataAccessException{
    PosModeName  posModeName = posModeNameDao.load(id);
    return posModeName;
  }//end findPosModeNameById method
  
    /**
   *query posModeName collection method
   *@param posModeName PosModeName send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeName> listPosModeName(PosModeName  posModeName)
		throws DataAccessException {
	  List<PosModeName> list = posModeNameDao.list(posModeName);
      return list;
  }//end list method
  
   /**
   *query posModeName collection method
   *@param posModeName PosModeName send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosModeName> listPosModeName(PosModeName posModeName,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosModeName> list = posModeNameDao.list(posModeName, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posModeNameDao 
   * @author weihuawon
   * @date 2015年M3月d23�?16:31
   */
  public void setPosModeNameDao(IPosModeNameDao posModeNameDao){ 
     this.posModeNameDao = posModeNameDao;
  }//end setPosModeNameDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posModeNameDao;
  }//end getDao method
}//end class PosModeNameServiceImpl