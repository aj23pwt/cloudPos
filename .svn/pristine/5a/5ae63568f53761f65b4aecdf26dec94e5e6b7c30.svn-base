package com.greencloud.service.impl;
import com.aua.util.Container;
import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;

import java.util.List;

import com.greencloud.entity.PosDishcard;
import com.greencloud.entity.PosPccodeTable;
import com.greencloud.dao.IPosDishcardDao;
import com.greencloud.dao.IPosPccodeTableDao;
import com.greencloud.service.IPosDishcardService;

import org.springframework.dao.DataAccessException;
public class PosDishcardServiceImpl extends BaseServiceImpl implements IPosDishcardService
{
   //dao 
   private IPosDishcardDao posDishcardDao;
   private IPosPccodeTableDao posPccodeTableDao;
   
   
	public void setPosPccodeTableDao(IPosPccodeTableDao posPccodeTableDao) {
		this.posPccodeTableDao = posPccodeTableDao;
	}
  /**
   *save posDishcard object  method
   *@param posDishcard PosDishcard 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-11-19 14:56
   */
  public void savePosDishcard(PosDishcard posDishcard) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosDishcard method");
		}
         posDishcardDao.save(posDishcard);
     	if(log.isDebugEnabled()){
			log.debug("end savePosDishcard method");
		}
  }//end save method
  
   /**
   *update posDishcard method
   *@param posDishcard PosDishcard
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-19 14:56
   */
  public void updatePosDishcard(PosDishcard posDishcard) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosDishcard method");
		}
        posDishcardDao.update(posDishcard);
        if(log.isDebugEnabled()){
			log.debug("end updatePosDishcard method");
		}
  }//end update method
  
   /**
   *save or update posDishcard object method
   *@param posDishcard PosDishcard
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-11-19 14:56
   */
  public void saveOrUpdatePosDishcard(PosDishcard posDishcard) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosDishcard method");
		}
		
        posDishcardDao.saveOrUpdate(posDishcard);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosDishcard method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posDishcard PosDishcard query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-11-19 14:56
   */
  public Container<PosDishcard> findPosDishcard(PosDishcard posDishcard,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosDishcard method");
		}
        Container<PosDishcard> container = new Container<PosDishcard>();
        List<PosDishcard> list = posDishcardDao.list(posDishcard, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posDishcardDao.count(posDishcard));
        if(log.isDebugEnabled()){
			log.debug("end findPosDishcard method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posDishcard PosDishcard query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-11-19 14:56
   */
  public int countPosDishcard(PosDishcard posDishcard)throws DataAccessException{
    return posDishcardDao.count(posDishcard);
  }//end count method
  
   /**
   *query a posDishcard by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-11-19 14:56
   */
  public PosDishcard findPosDishcardById(Long id)throws DataAccessException{
    PosDishcard  posDishcard = posDishcardDao.load(id);
    return posDishcard;
  }//end findPosDishcardById method
  
    /**
   *query posDishcard collection method
   *@param posDishcard PosDishcard send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-19  14:56
   */
  public List<PosDishcard> listPosDishcard(PosDishcard  posDishcard)
		throws DataAccessException {
	  List<PosDishcard> list = posDishcardDao.list(posDishcard);
      return list;
  }//end list method
  
   /**
   *query posDishcard collection method
   *@param posDishcard PosDishcard send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-11-19  14:56
   */
  public List<PosDishcard> listPosDishcard(PosDishcard posDishcard,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosDishcard> list = posDishcardDao.list(posDishcard, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posDishcardDao 
   * @author weihuawon
   * @date 2015年M11月19号 14:56
   */
  public void setPosDishcardDao(IPosDishcardDao posDishcardDao){ 
     this.posDishcardDao = posDishcardDao;
  }//end setPosDishcardDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posDishcardDao;
  }//end getDao method

@Override
public List<PosDishcard> getPosDishcardListBysql(String sql) {
	// TODO Auto-generated method stub
	return posDishcardDao.getPosDishcardListBysql(sql);
}
@Override
public String updateKitchenMsg(Long hotelId, Long hotelGroupId, String accnt,String type,String mode,String station,String empno,Integer id,String oldTableNo, String newTableNo,String kitmsg){
//	String oldDesc = "";
//	String newDesc = "";
//	String kitmsg = "";
//	PosPccodeTable posTableSet = new PosPccodeTable();
//	posTableSet.setHotelGroupId(hotelGroupId);
//	posTableSet.setHotelId(hotelId);
//	posTableSet.setCode(oldTableNo);
//	List<PosPccodeTable> posTableGet = posPccodeTableDao.list(posTableSet);
//	if (posTableGet != null && posTableGet.size() > 0){
//		oldDesc = posTableGet.get(0).getDescript();
//		if (oldDesc != null && oldDesc != "" && oldTableNo != oldDesc){
//			oldTableNo = oldTableNo+"["+oldDesc+"]";
//		}
//	}
//	
//	posTableSet.setCode(newTableNo);
//	List<PosPccodeTable> posTableGetN = posPccodeTableDao.list(posTableSet);
//	if (posTableGetN != null && posTableGetN.size() > 0){
//		newDesc = posTableGetN.get(0).getDescript();
//		if (newDesc != null && newDesc != "" && newTableNo != newDesc){
//			newTableNo = newTableNo+"["+newDesc+"]";
//		}
//	}
//	kitmsg = oldTableNo +" -换台-> " + newTableNo;
	return posDishcardDao.updateKitchenMsg(hotelId, hotelGroupId, accnt, type, mode,id,oldTableNo,newTableNo, station, empno, kitmsg);	
}


//}
}//end class PosDishcardServiceImpl