package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosAccount;
import com.greencloud.dao.IPosAccountDao;
import com.greencloud.dto.KaiYuanPosDetailDto;
import com.greencloud.dto.KaiYuanPosPayDto;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosAccount into db
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public class PosAccountDaoImpl extends BaseDaoImpl implements IPosAccountDao{

  /**
   *save posAccount object  method
   *@param posAccount PosAccount 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void save(PosAccount posAccount) throws DataAccessException {
       super.save(posAccount);
  }
  
  /**
   *update posAccount method
   *@param posAccount PosAccount
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void update(PosAccount posAccount) throws DataAccessException{
     super.update(posAccount);
  }
  
   /**
   *save or update posAccount object method
   *@param posAccount PosAccount
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public void saveOrUpdate(PosAccount posAccount) throws DataAccessException{
     super.saveOrUpdate(posAccount);
  }
  
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
  public List<PosAccount> list(PosAccount posAccount,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosAccount obj WHERE 1=1 ");
  	 spellSQL(sh,posAccount);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posAccount PosAccount send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-05-03 14:24
   */
  public List<PosAccount> list(PosAccount posAccount)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosAccount obj WHERE 1=1 ");
  	 spellSQL(sh,posAccount);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posAccount PosAccount query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-05-03 14:24
   */
  public int count(PosAccount posAccount)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosAccount obj WHERE 1=1 ");
    spellSQL(sh,posAccount);
    return count(sh);
  }
  
   /**
   *query a posAccount by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-05-03 14:24
   */
  public PosAccount load(Long id)throws DataAccessException
  {
    return load(PosAccount.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posAccount query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-05-03 14:24
   */
  private void spellSQL(SQLHelper sh,PosAccount posAccount)
  {
    if(posAccount != null){
    	if(posAccount.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posAccount.getId());
         }
         if(posAccount.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posAccount.getHotelGroupId());
         }
         if(posAccount.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posAccount.getHotelId());
         }
        if(isNotNull(posAccount.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posAccount.getAccnt().trim());
        }
       if(posAccount.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posAccount.getNumber());
        }
       if(posAccount.getInumber()!= null){
           sh.appendSql(" AND obj.inumber = ? ");
           sh.insertValue(posAccount.getInumber());
        }
       if(posAccount.getSubid()!= null){
           sh.appendSql(" AND obj.subid = ? ");
           sh.insertValue(posAccount.getSubid());
        }
        if(isNotNull(posAccount.getShift())){
           sh.appendSql(" AND obj.shift = ? ");
           sh.insertValue(posAccount.getShift().trim());
        }
        if(isNotNull(posAccount.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posAccount.getPccode().trim());
        }
        if(isNotNull(posAccount.getTableno())){
           sh.appendSql(" AND obj.tableno = ? ");
           sh.insertValue(posAccount.getTableno().trim());
        }
        if(isNotNull(posAccount.getEmpid())){
           sh.appendSql(" AND obj.empid = ? ");
           sh.insertValue(posAccount.getEmpid().trim());
        }
       if(posAccount.getBizDate()!= null){
           sh.appendSql(" AND obj.bizDate = ? ");
           sh.insertValue(posAccount.getBizDate());
        }
       if(posAccount.getLogdate()!= null){
           sh.appendSql(" AND obj.logdate = ? ");
           sh.insertValue(posAccount.getLogdate());
        }
        if(isNotNull(posAccount.getPaycode())){
           sh.appendSql(" AND obj.paycode = ? ");
           sh.insertValue(posAccount.getPaycode().trim());
        }
        if(isNotNull(posAccount.getDescript())){
           sh.appendSql(" AND obj.descript = ? ");
           sh.insertValue(posAccount.getDescript().trim());
        }
        if(isNotNull(posAccount.getDescriptEn())){
           sh.appendSql(" AND obj.descriptEn = ? ");
           sh.insertValue(posAccount.getDescriptEn().trim());
        }
       if(posAccount.getAmount()!= null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posAccount.getAmount());
        }
       if(posAccount.getCredit()!= null){
           sh.appendSql(" AND obj.credit = ? ");
           sh.insertValue(posAccount.getCredit());
        }
       if(posAccount.getBal()!= null){
           sh.appendSql(" AND obj.bal = ? ");
           sh.insertValue(posAccount.getBal());
        }
        if(isNotNull(posAccount.getBillno())){
           sh.appendSql(" AND obj.billno = ? ");
           sh.insertValue(posAccount.getBillno().trim());
        }
        if(isNotNull(posAccount.getFoliono())){
           sh.appendSql(" AND obj.foliono = ? ");
           sh.insertValue(posAccount.getFoliono().trim());
        }
        if(isNotNull(posAccount.getOrderno())){
           sh.appendSql(" AND obj.orderno = ? ");
           sh.insertValue(posAccount.getOrderno().trim());
        }
        if(isNotNull(posAccount.getSign())){
           sh.appendSql(" AND obj.sign = ? ");
           sh.insertValue(posAccount.getSign().trim());
        }
        if(isNotNull(posAccount.getFlag())){
           sh.appendSql(" AND obj.flag = ? ");
           sh.insertValue(posAccount.getFlag().trim());
        }
        if(isNotNull(posAccount.getSta())){
           sh.appendSql(" AND obj.sta = ? ");
           sh.insertValue(posAccount.getSta().trim());
        }
        if(isNotNull(posAccount.getReason())){
           sh.appendSql(" AND obj.reason = ? ");
           sh.insertValue(posAccount.getReason().trim());
        }
        if(isNotNull(posAccount.getInfo1())){
           sh.appendSql(" AND obj.info1 = ? ");
           sh.insertValue(posAccount.getInfo1().trim());
        }
        if(isNotNull(posAccount.getInfo2())){
           sh.appendSql(" AND obj.info2 = ? ");
           sh.insertValue(posAccount.getInfo2().trim());
        }
        if(isNotNull(posAccount.getBank())){
           sh.appendSql(" AND obj.bank = ? ");
           sh.insertValue(posAccount.getBank().trim());
        }
        if(isNotNull(posAccount.getCardno())){
           sh.appendSql(" AND obj.cardno = ? ");
           sh.insertValue(posAccount.getCardno().trim());
        }
        if(isNotNull(posAccount.getDtlAccnt())){
           sh.appendSql(" AND obj.dtlAccnt = ? ");
           sh.insertValue(posAccount.getDtlAccnt().trim());
        }
        if(isNotNull(posAccount.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posAccount.getCreateUser().trim());
         }
        if(posAccount.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posAccount.getCreateDatetime());
         }
         if(isNotNull(posAccount.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posAccount.getModifyUser().trim());
         }
        if(posAccount.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posAccount.getModifyDatetime());
         }
    }
  }

@Override
public List<KaiYuanPosPayDto> getPosPayByaccntS(long hotelGroupId,
		long hotelId, String billNo) {
	SQLHelper sh = new SQLHelper("SELECT paycode as paycode,descript as descript,credit as credit from pos_account WHERE hotel_group_id = ? and hotel_id = ? and number = '2' and billno = ? and sta <> 'X'") ;
	
	sh.insertValue(hotelGroupId);
	sh.insertValue(hotelId);
	sh.insertValue(billNo);
	
	return findByNativeSQL(sh, KaiYuanPosPayDto.class);
}
}