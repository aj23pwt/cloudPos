package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosStoreDetail;
import com.greencloud.dao.IPosStoreDetailDao;
import com.greencloud.service.IPosStoreDetailService;
import org.springframework.dao.DataAccessException;
public class PosStoreDetailServiceImpl extends BaseServiceImpl implements IPosStoreDetailService
{
   //dao 
   private IPosStoreDetailDao posStoreDetailDao;
   
  /**
   *save posStoreDetail object  method
   *@param posStoreDetail PosStoreDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void savePosStoreDetail(PosStoreDetail posStoreDetail) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosStoreDetail method");
		}
         posStoreDetailDao.save(posStoreDetail);
     	if(log.isDebugEnabled()){
			log.debug("end savePosStoreDetail method");
		}
  }//end save method
  
   /**
   *update posStoreDetail method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void updatePosStoreDetail(PosStoreDetail posStoreDetail) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosStoreDetail method");
		}
        posStoreDetailDao.update(posStoreDetail);
        if(log.isDebugEnabled()){
			log.debug("end updatePosStoreDetail method");
		}
  }//end update method
  
   /**
   *save or update posStoreDetail object method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdatePosStoreDetail(PosStoreDetail posStoreDetail) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosStoreDetail method");
		}
		
        posStoreDetailDao.saveOrUpdate(posStoreDetail);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosStoreDetail method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posStoreDetail PosStoreDetail query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 13:45
   */
  public Container<PosStoreDetail> findPosStoreDetail(PosStoreDetail posStoreDetail,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosStoreDetail method");
		}
        Container<PosStoreDetail> container = new Container<PosStoreDetail>();
        List<PosStoreDetail> list = posStoreDetailDao.list(posStoreDetail, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posStoreDetailDao.count(posStoreDetail));
        if(log.isDebugEnabled()){
			log.debug("end findPosStoreDetail method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posStoreDetail PosStoreDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int countPosStoreDetail(PosStoreDetail posStoreDetail)throws DataAccessException{
    return posStoreDetailDao.count(posStoreDetail);
  }//end count method
  
   /**
   *query a posStoreDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreDetail findPosStoreDetailById(Long id)throws DataAccessException{
    PosStoreDetail  posStoreDetail = posStoreDetailDao.load(id);
    return posStoreDetail;
  }//end findPosStoreDetailById method
  
    /**
   *query posStoreDetail collection method
   *@param posStoreDetail PosStoreDetail send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreDetail> listPosStoreDetail(PosStoreDetail  posStoreDetail)
		throws DataAccessException {
	  List<PosStoreDetail> list = posStoreDetailDao.list(posStoreDetail);
      return list;
  }//end list method
  
   /**
   *query posStoreDetail collection method
   *@param posStoreDetail PosStoreDetail send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16  13:45
   */
  public List<PosStoreDetail> listPosStoreDetail(PosStoreDetail posStoreDetail,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosStoreDetail> list = posStoreDetailDao.list(posStoreDetail, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posStoreDetailDao 
   * @author weihuawon
   * @date 2015年M12月d16�?13:45
   */
  public void setPosStoreDetailDao(IPosStoreDetailDao posStoreDetailDao){ 
     this.posStoreDetailDao = posStoreDetailDao;
  }//end setPosStoreDetailDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posStoreDetailDao;
  }//end getDao method
}//end class PosStoreDetailServiceImpl