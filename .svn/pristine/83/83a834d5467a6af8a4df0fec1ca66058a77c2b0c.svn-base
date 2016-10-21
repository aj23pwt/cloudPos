package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosPccodeShift;
import com.greencloud.dao.IPosPccodeShiftDao;
import com.greencloud.service.IPosPccodeShiftService;
import org.springframework.dao.DataAccessException;
public class PosPccodeShiftServiceImpl extends BaseServiceImpl implements IPosPccodeShiftService
{
   //dao 
   private IPosPccodeShiftDao posPccodeShiftDao;
   
  /**
   *save posPccodeShift object  method
   *@param posPccodeShift PosPccodeShift 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void savePosPccodeShift(PosPccodeShift posPccodeShift) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPccodeShift method");
		}
         posPccodeShiftDao.save(posPccodeShift);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPccodeShift method");
		}
  }//end save method
  
   /**
   *update posPccodeShift method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void updatePosPccodeShift(PosPccodeShift posPccodeShift) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPccodeShift method");
		}
        posPccodeShiftDao.update(posPccodeShift);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPccodeShift method");
		}
  }//end update method
  
   /**
   *save or update posPccodeShift object method
   *@param posPccodeShift PosPccodeShift
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-24 09:33
   */
  public void saveOrUpdatePosPccodeShift(PosPccodeShift posPccodeShift) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPccodeShift method");
		}
		
        posPccodeShiftDao.saveOrUpdate(posPccodeShift);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPccodeShift method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPccodeShift PosPccodeShift query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-24 09:33
   */
  public Container<PosPccodeShift> findPosPccodeShift(PosPccodeShift posPccodeShift,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPccodeShift method");
		}
        Container<PosPccodeShift> container = new Container<PosPccodeShift>();
        List<PosPccodeShift> list = posPccodeShiftDao.list(posPccodeShift, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPccodeShiftDao.count(posPccodeShift));
        if(log.isDebugEnabled()){
			log.debug("end findPosPccodeShift method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPccodeShift PosPccodeShift query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-24 09:33
   */
  public int countPosPccodeShift(PosPccodeShift posPccodeShift)throws DataAccessException{
    return posPccodeShiftDao.count(posPccodeShift);
  }//end count method
  
   /**
   *query a posPccodeShift by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-24 09:33
   */
  public PosPccodeShift findPosPccodeShiftById(Long id)throws DataAccessException{
    PosPccodeShift  posPccodeShift = posPccodeShiftDao.load(id);
    return posPccodeShift;
  }//end findPosPccodeShiftById method
  
    /**
   *query posPccodeShift collection method
   *@param posPccodeShift PosPccodeShift send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeShift> listPosPccodeShift(PosPccodeShift  posPccodeShift)
		throws DataAccessException {
	  List<PosPccodeShift> list = posPccodeShiftDao.list(posPccodeShift);
      return list;
  }//end list method
  
   /**
   *query posPccodeShift collection method
   *@param posPccodeShift PosPccodeShift send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-24  09:33
   */
  public List<PosPccodeShift> listPosPccodeShift(PosPccodeShift posPccodeShift,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPccodeShift> list = posPccodeShiftDao.list(posPccodeShift, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPccodeShiftDao 
   * @author weihuawon
   * @date 2015年M3月d24�?09:33
   */
  public void setPosPccodeShiftDao(IPosPccodeShiftDao posPccodeShiftDao){ 
     this.posPccodeShiftDao = posPccodeShiftDao;
  }//end setPosPccodeShiftDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPccodeShiftDao;
  }//end getDao method
}//end class PosPccodeShiftServiceImpl