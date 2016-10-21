package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosDrinksConsume;
import com.greencloud.dao.IPosDrinksConsumeDao;
import com.greencloud.service.IPosDrinksConsumeService;
import org.springframework.dao.DataAccessException;
public class PosDrinksConsumeServiceImpl extends BaseServiceImpl implements IPosDrinksConsumeService
{
   //dao 
   private IPosDrinksConsumeDao posDrinksConsumeDao;
   
  /**
   *save posDrinksConsume object  method
   *@param posDrinksConsume PosDrinksConsume 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void savePosDrinksConsume(PosDrinksConsume posDrinksConsume) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosDrinksConsume method");
		}
         posDrinksConsumeDao.save(posDrinksConsume);
     	if(log.isDebugEnabled()){
			log.debug("end savePosDrinksConsume method");
		}
  }//end save method
  
   /**
   *update posDrinksConsume method
   *@param posDrinksConsume PosDrinksConsume
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void updatePosDrinksConsume(PosDrinksConsume posDrinksConsume) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosDrinksConsume method");
		}
        posDrinksConsumeDao.update(posDrinksConsume);
        if(log.isDebugEnabled()){
			log.debug("end updatePosDrinksConsume method");
		}
  }//end update method
  
   /**
   *save or update posDrinksConsume object method
   *@param posDrinksConsume PosDrinksConsume
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 15:46
   */
  public void saveOrUpdatePosDrinksConsume(PosDrinksConsume posDrinksConsume) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosDrinksConsume method");
		}
		
        posDrinksConsumeDao.saveOrUpdate(posDrinksConsume);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosDrinksConsume method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posDrinksConsume PosDrinksConsume query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 15:46
   */
  public Container<PosDrinksConsume> findPosDrinksConsume(PosDrinksConsume posDrinksConsume,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosDrinksConsume method");
		}
        Container<PosDrinksConsume> container = new Container<PosDrinksConsume>();
        List<PosDrinksConsume> list = posDrinksConsumeDao.list(posDrinksConsume, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posDrinksConsumeDao.count(posDrinksConsume));
        if(log.isDebugEnabled()){
			log.debug("end findPosDrinksConsume method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posDrinksConsume PosDrinksConsume query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 15:46
   */
  public int countPosDrinksConsume(PosDrinksConsume posDrinksConsume)throws DataAccessException{
    return posDrinksConsumeDao.count(posDrinksConsume);
  }//end count method
  
   /**
   *query a posDrinksConsume by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 15:46
   */
  public PosDrinksConsume findPosDrinksConsumeById(Long id)throws DataAccessException{
    PosDrinksConsume  posDrinksConsume = posDrinksConsumeDao.load(id);
    return posDrinksConsume;
  }//end findPosDrinksConsumeById method
  
    /**
   *query posDrinksConsume collection method
   *@param posDrinksConsume PosDrinksConsume send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksConsume> listPosDrinksConsume(PosDrinksConsume  posDrinksConsume)
		throws DataAccessException {
	  List<PosDrinksConsume> list = posDrinksConsumeDao.list(posDrinksConsume);
      return list;
  }//end list method
  
   /**
   *query posDrinksConsume collection method
   *@param posDrinksConsume PosDrinksConsume send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  15:46
   */
  public List<PosDrinksConsume> listPosDrinksConsume(PosDrinksConsume posDrinksConsume,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosDrinksConsume> list = posDrinksConsumeDao.list(posDrinksConsume, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posDrinksConsumeDao 
   * @author weihuawon
   * @date 2015年M11月d6�?15:46
   */
  public void setPosDrinksConsumeDao(IPosDrinksConsumeDao posDrinksConsumeDao){ 
     this.posDrinksConsumeDao = posDrinksConsumeDao;
  }//end setPosDrinksConsumeDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posDrinksConsumeDao;
  }//end getDao method
}//end class PosDrinksConsumeServiceImpl