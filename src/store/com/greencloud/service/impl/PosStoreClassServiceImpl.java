package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosStoreClass;
import com.greencloud.dao.IPosStoreClassDao;
import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.service.IPosStoreClassService;

import org.springframework.dao.DataAccessException;
public class PosStoreClassServiceImpl extends BaseServiceImpl implements IPosStoreClassService
{
   //dao 
   private IPosStoreClassDao posStoreClassDao;
   
  /**
   *save posStoreClass object  method
   *@param posStoreClass PosStoreClass 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void savePosStoreClass(PosStoreClass posStoreClass) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStoreClass method");
		}
         posStoreClassDao.save(posStoreClass);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStoreClass method");
		}
  }//end save method
  
   /**
   *update posStoreClass method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void updatePosStoreClass(PosStoreClass posStoreClass) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStoreClass method");
		}
        posStoreClassDao.update(posStoreClass);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStoreClass method");
		}
  }//end update method
  
   /**
   *save or update posStoreClass object method
   *@param posStoreClass PosStoreClass
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdatePosStoreClass(PosStoreClass posStoreClass) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStoreClass method");
		}
		
        posStoreClassDao.saveOrUpdate(posStoreClass);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStoreClass method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStoreClass PosStoreClass query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 13:38
   */
  public Container<PosStoreClass> findPosStoreClass(PosStoreClass posStoreClass,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStoreClass method");
		}
        Container<PosStoreClass> container = new Container<PosStoreClass>();
        List<PosStoreClass> list = posStoreClassDao.list(posStoreClass, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStoreClassDao.count(posStoreClass));
        if(log.isDebugEnabled()){
			log.debug("end findPosStoreClass method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStoreClass PosStoreClass query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int countPosStoreClass(PosStoreClass posStoreClass)throws DataAccessException{
    return posStoreClassDao.count(posStoreClass);
  }//end count method
  
   /**
   *query a posStoreClass by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreClass findPosStoreClassById(Long id)throws DataAccessException{
    PosStoreClass  posStoreClass = posStoreClassDao.load(id);
    return posStoreClass;
  }//end findPosStoreClassById method
  
    /**
   *query posStoreClass collection method
   *@param posStoreClass PosStoreClass send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreClass> listPosStoreClass(PosStoreClass  posStoreClass)
		throws DataAccessException {
	  List<PosStoreClass> list = posStoreClassDao.list(posStoreClass);
      return list;
  }//end list method
  
   /**
   *query posStoreClass collection method
   *@param posStoreClass PosStoreClass send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreClass> listPosStoreClass(PosStoreClass posStoreClass,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStoreClass> list = posStoreClassDao.list(posStoreClass, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStoreClassDao 
   * @author weihuawon
   * @date 2015年M12月d2�?13:38
   */
  public void setPosStoreClassDao(IPosStoreClassDao posStoreClassDao){ 
     this.posStoreClassDao = posStoreClassDao;
  }//end setPosStoreClassDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStoreClassDao;
  }//end getDao method
  
  @Override
	public List<PosStoreClass> getPosStoreClassById(Long hotelGroupId, Long hotelId) {
			PosStoreClass  tsClass = new PosStoreClass();
			tsClass.setHotelGroupId(hotelGroupId);
			tsClass.setHotelId(hotelId);
			List<PosStoreClass> list = posStoreClassDao.list(tsClass);
			return list;
	}

@Override
	public void saveGroupPosClass(Long hotelGroupId, Long hotelId,PosStoreClass posStoreClass, String hotels) {
			if(posStoreClass!=null)
			{
					posStoreClass.setHotelGroupId(hotelGroupId);
					posStoreClass.setHotelId(hotelId);
					posStoreClassDao.save(posStoreClass);
			}
	 }

@Override
	public void updatePosClassByDto(Long hotelGroupId, Long hotelId,PosStoreEditDto posStoreEditDto) {
			if(posStoreEditDto!=null)
			{
					posStoreClassDao.update(posStoreEditDto.tsc);
			}
	}

@Override
	public void deleteGroupPosClass(Long hotelGroupId, Long hotelId,long id) {
			if(id!=0)
			{
				PosStoreClass posStoreClass =  new PosStoreClass();
				posStoreClass.setHotelGroupId(hotelGroupId);
				posStoreClass.setHotelId(hotelId);
				posStoreClass.setId(id);
				List<PosStoreClass> list = posStoreClassDao.list(posStoreClass);
				if(list !=null && list.size()>0)
				{
					posStoreClassDao.delete(list.get(0));
				}
			}
	}

}//end class PosStoreClassServiceImpl