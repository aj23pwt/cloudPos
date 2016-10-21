package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import java.util.List;
import com.greencloud.entity.PosHotelTransfer;
import com.greencloud.dao.IPosHotelTransferDao;
import com.greencloud.service.IPosHotelTransferService;
import org.springframework.dao.DataAccessException;
public class PosHotelTransferServiceImpl extends BaseServiceImpl implements IPosHotelTransferService
{
   //dao 
   private IPosHotelTransferDao posHotelTransferDao;
   
  /**
   *save posHotelTransfer object  method
   *@param posHotelTransfer PosHotelTransfer 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void savePosHotelTransfer(PosHotelTransfer posHotelTransfer) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosHotelTransfer method");
		}
         posHotelTransferDao.save(posHotelTransfer);
     	if(log.isDebugEnabled()){
			log.debug("end savePosHotelTransfer method");
		}
  }//end save method
  
   /**
   *update posHotelTransfer method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void updatePosHotelTransfer(PosHotelTransfer posHotelTransfer) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosHotelTransfer method");
		}
        posHotelTransferDao.update(posHotelTransfer);
        if(log.isDebugEnabled()){
			log.debug("end updatePosHotelTransfer method");
		}
  }//end update method
  
   /**
   *save or update posHotelTransfer object method
   *@param posHotelTransfer PosHotelTransfer
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-06-13 10:23
   */
  public void saveOrUpdatePosHotelTransfer(PosHotelTransfer posHotelTransfer) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosHotelTransfer method");
		}
		
        posHotelTransferDao.saveOrUpdate(posHotelTransfer);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosHotelTransfer method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posHotelTransfer PosHotelTransfer query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-06-13 10:23
   */
  public Container<PosHotelTransfer> findPosHotelTransfer(PosHotelTransfer posHotelTransfer,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosHotelTransfer method");
		}
        Container<PosHotelTransfer> container = new Container<PosHotelTransfer>();
        List<PosHotelTransfer> list = posHotelTransferDao.list(posHotelTransfer, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posHotelTransferDao.count(posHotelTransfer));
        if(log.isDebugEnabled()){
			log.debug("end findPosHotelTransfer method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posHotelTransfer PosHotelTransfer query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-06-13 10:23
   */
  public int countPosHotelTransfer(PosHotelTransfer posHotelTransfer)throws DataAccessException{
    return posHotelTransferDao.count(posHotelTransfer);
  }//end count method
  
   /**
   *query a posHotelTransfer by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-06-13 10:23
   */
  public PosHotelTransfer findPosHotelTransferById(Long id)throws DataAccessException{
    PosHotelTransfer  posHotelTransfer = posHotelTransferDao.load(id);
    return posHotelTransfer;
  }//end findPosHotelTransferById method
  
    /**
   *query posHotelTransfer collection method
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13  10:23
   */
  public List<PosHotelTransfer> listPosHotelTransfer(PosHotelTransfer  posHotelTransfer)
		throws DataAccessException {
	  List<PosHotelTransfer> list = posHotelTransferDao.list(posHotelTransfer);
      return list;
  }//end list method
  
   /**
   *query posHotelTransfer collection method
   *@param posHotelTransfer PosHotelTransfer send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-06-13  10:23
   */
  public List<PosHotelTransfer> listPosHotelTransfer(PosHotelTransfer posHotelTransfer,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosHotelTransfer> list = posHotelTransferDao.list(posHotelTransfer, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posHotelTransferDao 
   * @author weihuawon
   * @date 2016年M6月d13�?10:23
   */
  public void setPosHotelTransferDao(IPosHotelTransferDao posHotelTransferDao){ 
     this.posHotelTransferDao = posHotelTransferDao;
  }//end setPosHotelTransferDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posHotelTransferDao;
  }//end getDao method
}//end class PosHotelTransferServiceImpl