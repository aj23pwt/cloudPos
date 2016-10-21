package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosPrnscope;
import com.greencloud.dao.IPosPrnscopeDao;
import com.greencloud.service.IPosPrnscopeService;

import org.springframework.dao.DataAccessException;
public class PosPrnscopeServiceImpl extends BaseServiceImpl implements IPosPrnscopeService
{
   //dao 
   private IPosPrnscopeDao posPrnscopeDao;
   
  /**
   *save posPrnscope object  method
   *@param posPrnscope PosPrnscope 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void savePosPrnscope(PosPrnscope posPrnscope) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosPrnscope method");
		}
         posPrnscopeDao.save(posPrnscope);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPrnscope method");
		}
  }//end save method
  
   /**
   *update posPrnscope method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void updatePosPrnscope(PosPrnscope posPrnscope) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosPrnscope method");
		}
        posPrnscopeDao.update(posPrnscope);
        if(log.isDebugEnabled()){
			log.debug("end updatePosPrnscope method");
		}
  }//end update method
  
   /**
   *save or update posPrnscope object method
   *@param posPrnscope PosPrnscope
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-06 19:51
   */
  public void saveOrUpdatePosPrnscope(PosPrnscope posPrnscope) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosPrnscope method");
		}
		
        posPrnscopeDao.saveOrUpdate(posPrnscope);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosPrnscope method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posPrnscope PosPrnscope query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-06 19:51
   */
  public Container<PosPrnscope> findPosPrnscope(PosPrnscope posPrnscope,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosPrnscope method");
		}
        Container<PosPrnscope> container = new Container<PosPrnscope>();
        List<PosPrnscope> list = posPrnscopeDao.list(posPrnscope, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posPrnscopeDao.count(posPrnscope));
        if(log.isDebugEnabled()){
			log.debug("end findPosPrnscope method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posPrnscope PosPrnscope query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-06 19:51
   */
  public int countPosPrnscope(PosPrnscope posPrnscope)throws DataAccessException{
    return posPrnscopeDao.count(posPrnscope);
  }//end count method
  
   /**
   *query a posPrnscope by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-06 19:51
   */
  public PosPrnscope findPosPrnscopeById(Long id)throws DataAccessException{
    PosPrnscope  posPrnscope = posPrnscopeDao.load(id);
    return posPrnscope;
  }//end findPosPrnscopeById method
  
    /**
   *query posPrnscope collection method
   *@param posPrnscope PosPrnscope send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  19:51
   */
  public List<PosPrnscope> listPosPrnscope(PosPrnscope  posPrnscope)
		throws DataAccessException {
	  List<PosPrnscope> list = posPrnscopeDao.list(posPrnscope);
      return list;
  }//end list method
  
   /**
   *query posPrnscope collection method
   *@param posPrnscope PosPrnscope send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-06  19:51
   */
  public List<PosPrnscope> listPosPrnscope(PosPrnscope posPrnscope,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosPrnscope> list = posPrnscopeDao.list(posPrnscope, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posPrnscopeDao 
   * @author weihuawon
   * @date 2015年M11月6号  19:51
   */
  public void setPosPrnscopeDao(IPosPrnscopeDao posPrnscopeDao){ 
     this.posPrnscopeDao = posPrnscopeDao;
  }//end setPosPrnscopeDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posPrnscopeDao;
  }//end getDao method

@Override
	public String checkSortIs(Long hotelGroupId, Long hotelId, String scode) {
		PosPrnscope posPrns = new PosPrnscope();
		posPrns.setHotelGroupId(hotelGroupId);
		posPrns.setHotelId(hotelId);
		posPrns.setPlusort(scode);
		posPrns.setPlucode("");
		List<PosPrnscope> list = posPrnscopeDao.list(posPrns);
		if(list!=null && list.size()>0)
		{
			return "Y";
		}
		return "N";
	}

	@Override
	public void modifySortPrnscope(Long hotelGroupId, Long hotelId, String scode,String strPrint) {
		posPrnscopeDao.modifySortPrnscope(hotelGroupId,hotelId,scode,strPrint);
	}

	@Override
	public void delete(PosPrnscope posPrnscope) throws DataAccessException {
     	if(log.isDebugEnabled()){
			log.debug("start savePosPrnscope method");
		}
         posPrnscopeDao.delete(posPrnscope);
     	if(log.isDebugEnabled()){
			log.debug("end savePosPrnscope method");
		}
	}
}//end class PosPrnscopeServiceImpl