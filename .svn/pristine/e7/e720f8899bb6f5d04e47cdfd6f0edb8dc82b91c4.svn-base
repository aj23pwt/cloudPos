package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosPay;
import com.greencloud.dao.IPosPayDao;
import com.greencloud.service.IPosPayService;

import org.springframework.dao.DataAccessException;
public class PosPayServiceImpl extends BaseServiceImpl implements IPosPayService
{
   //dao 
   private IPosPayDao posPayDao;
   
  /**
   *save posPay object  method
   *@param posPay PosPay 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void savePosPay(PosPay posPay) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPay method");
		}
         posPayDao.save(posPay);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPay method");
		}
  }//end save method
  
   /**
   *update posPay method
   *@param posPay PosPay
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void updatePosPay(PosPay posPay) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPay method");
		}
        posPayDao.update(posPay);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPay method");
		}
  }//end update method
  
   /**
   *save or update posPay object method
   *@param posPay PosPay
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-04-01 13:44
   */
  public void saveOrUpdatePosPay(PosPay posPay) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPay method");
		}
		
        posPayDao.saveOrUpdate(posPay);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPay method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPay PosPay query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-04-01 13:44
   */
  public Container<PosPay> findPosPay(PosPay posPay,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPay method");
		}
        Container<PosPay> container = new Container<PosPay>();
        List<PosPay> list = posPayDao.list(posPay, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPayDao.count(posPay));
        if(log.isDebugEnabled()){
			log.debug("end findPosPay method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPay PosPay query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-04-01 13:44
   */
  public int countPosPay(PosPay posPay)throws DataAccessException{
    return posPayDao.count(posPay);
  }//end count method
  
   /**
   *query a posPay by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-04-01 13:44
   */
  public PosPay findPosPayById(Long id)throws DataAccessException{
    PosPay  posPay = posPayDao.load(id);
    return posPay;
  }//end findPosPayById method
  
    /**
   *query posPay collection method
   *@param posPay PosPay send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosPay> listPosPay(PosPay  posPay)
		throws DataAccessException {
	  List<PosPay> list = posPayDao.list(posPay);
      return list;
  }//end list method
  
   /**
   *query posPay collection method
   *@param posPay PosPay send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-04-01  13:44
   */
  public List<PosPay> listPosPay(PosPay posPay,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPay> list = posPayDao.list(posPay, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPayDao 
   * @author weihuawon
   * @date 2015年M4月d1�?13:44
   */
  public void setPosPayDao(IPosPayDao posPayDao){ 
     this.posPayDao = posPayDao;
  }//end setPosPayDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPayDao;
  }//end getDao method

@Override
public List<PosPay> getPosPayList(String sql) throws DataAccessException {
	// TODO Auto-generated method stub
	return posPayDao.getPosPayList(sql);
}
}//end class PosPayServiceImpl