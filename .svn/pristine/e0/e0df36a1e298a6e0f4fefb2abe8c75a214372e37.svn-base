package com.greencloud.service.impl;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.aua.dao.IBaseDao;
import com.aua.service.impl.BaseServiceImpl;
import com.aua.util.Container;
import com.greencloud.dao.IPosAccountDao;
import com.greencloud.entity.PosAccount;
import com.greencloud.service.IPosAccountService;
import com.greencloud.util.DateUtil;
public class PosAccountServiceImpl extends BaseServiceImpl implements IPosAccountService
{
   //dao 
   private IPosAccountDao posAccountDao;
   
  /**
   *save posAccount object  method
   *@param posAccount PosAccount 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void savePosAccount(PosAccount posAccount) throws DataAccessException{
     	if(log.isDebugEnabled()){
			log.debug("start savePosAccount method");
		}
         posAccountDao.save(posAccount);
     	if(log.isDebugEnabled()){
			log.debug("end savePosAccount method");
		}
  }//end save method
  
   /**
   *update posAccount method
   *@param posAccount PosAccount
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void updatePosAccount(PosAccount posAccount) throws DataAccessException{ 
  	    if(log.isDebugEnabled()){
			log.debug("start updatePosAccount method");
		}
        posAccountDao.update(posAccount);
        if(log.isDebugEnabled()){
			log.debug("end updatePosAccount method");
		}
  }//end update method
  
   /**
   *save or update posAccount object method
   *@param posAccount PosAccount
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void saveOrUpdatePosAccount(PosAccount posAccount) throws DataAccessException{//start saveOrUpdate method
      
        if(log.isDebugEnabled()){
			log.debug("start saveOrUpdatePosAccount method");
		}
		
        posAccountDao.saveOrUpdate(posAccount);
        
        if(log.isDebugEnabled()){
			log.debug("end saveOrUpdatePosAccount method");
		}
		
  }//end saveOrUpdate method

  /**
   *query a container obj
   *@param posAccount PosAccount query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-05-03 14:24
   */
  public Container<PosAccount> findPosAccount(PosAccount posAccount,int firstResult ,int maxResults)throws DataAccessException{
        if(log.isDebugEnabled()){
			log.debug("start findPosAccount method");
		}
        Container<PosAccount> container = new Container<PosAccount>();
        List<PosAccount> list = posAccountDao.list(posAccount, firstResult , maxResults);
        container.setResults(list);
        container.setTotalRows(posAccountDao.count(posAccount));
        if(log.isDebugEnabled()){
			log.debug("end findPosAccount method");
		}
       return container;
  }//end find method

  /**
   *count obj amount
   *@param posAccount PosAccount query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:24
   */
  public int countPosAccount(PosAccount posAccount)throws DataAccessException{
    return posAccountDao.count(posAccount);
  }//end count method
  
   /**
   *query a posAccount by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:24
   */
  public PosAccount findPosAccountById(Long id)throws DataAccessException{
    PosAccount  posAccount = posAccountDao.load(id);
    return posAccount;
  }//end findPosAccountById method
  
    /**
   *query posAccount collection method
   *@param posAccount PosAccount send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:24
   */
  public List<PosAccount> listPosAccount(PosAccount  posAccount)
		throws DataAccessException {
	  List<PosAccount> list = posAccountDao.list(posAccount);
      return list;
  }//end list method
  
   /**
   *query posAccount collection method
   *@param posAccount PosAccount send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03  14:24
   */
  public List<PosAccount> listPosAccount(PosAccount posAccount,int firstResult ,int maxResults)throws DataAccessException{
	   List<PosAccount> list = posAccountDao.list(posAccount, firstResult ,maxResults);
	   return list;
  }
  
  /**
   * Spring 
   * @param  posAccountDao 
   * @author weihuawon
   * @date 2015年M5月d3�?14:24
   */
  public void setPosAccountDao(IPosAccountDao posAccountDao){ 
     this.posAccountDao = posAccountDao;
  }//end setPosAccountDao method
  
  @Override
  protected IBaseDao getDao(){
    return this.posAccountDao;
  }//end getDao method

	@Override
	public List<PosAccount> getPosAccountPayView(Long hotelGroupId,Long hotelId,String bizDate, String accnts) {
		List<PosAccount> posAccountRe = new ArrayList<>(); 
		String[] accntArr = accnts.split(",");
		PosAccount posAccountSet = new PosAccount();
		posAccountSet.setHotelGroupId(hotelGroupId);
		posAccountSet.setHotelId(hotelId);
		posAccountSet.setNumber(2);
//		posAccountSet.setBizDate(Date(bizDate));
		try {
			posAccountSet.setBizDate(DateUtil.parseDateNoTime(bizDate, "yyyy-MM-dd"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(accntArr != null && accntArr.length >0){
			for(int i=0;i < accntArr.length;i++){			
				String accnt = accntArr[i];
				posAccountSet.setAccnt(accnt);
				List<PosAccount> posAccount = posAccountDao.list(posAccountSet);
				if(posAccount != null && posAccount.size() >0){
					posAccountRe.addAll(posAccount);
				}			
			}		
		}
		return posAccountRe;
	}
}//end class PosAccountServiceImpl