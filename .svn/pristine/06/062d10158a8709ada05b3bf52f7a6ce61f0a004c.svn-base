package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosMasterHistory;
import com.greencloud.dao.IPosMasterHistoryDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosMasterHistory into db
   *@author 
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public class PosMasterHistoryDaoImpl extends BaseDaoImpl implements IPosMasterHistoryDao{

  /**
   *save posMasterHistory object  method
   *@param posMasterHistory PosMasterHistory 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public void save(PosMasterHistory posMasterHistory) throws DataAccessException {
       super.save(posMasterHistory);
  }
  
  /**
   *update posMasterHistory method
   *@param posMasterHistory PosMasterHistory
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public void update(PosMasterHistory posMasterHistory) throws DataAccessException{
     super.update(posMasterHistory);
  }
  
   /**
   *save or update posMasterHistory object method
   *@param posMasterHistory PosMasterHistory
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public void saveOrUpdate(PosMasterHistory posMasterHistory) throws DataAccessException{
     super.saveOrUpdate(posMasterHistory);
  }
  
   /**
   *query posMasterHistory collection method
   *@param posMasterHistory PosMasterHistory send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-04  11:29
   */
  public List<PosMasterHistory> list(PosMasterHistory posMasterHistory,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosMasterHistory obj WHERE 1=1 ");
  	 spellSQL(sh,posMasterHistory);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posMasterHistory PosMasterHistory send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-01-04 11:29
   */
  public List<PosMasterHistory> list(PosMasterHistory posMasterHistory)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosMasterHistory obj WHERE 1=1 ");
  	 spellSQL(sh,posMasterHistory);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posMasterHistory PosMasterHistory query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-04 11:29
   */
  public int count(PosMasterHistory posMasterHistory)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosMasterHistory obj WHERE 1=1 ");
    spellSQL(sh,posMasterHistory);
    return count(sh);
  }
  
   /**
   *query a posMasterHistory by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-04 11:29
   */
  public PosMasterHistory load(Long id)throws DataAccessException
  {
    return load(PosMasterHistory.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posMasterHistory query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-04 11:29
   */
  private void spellSQL(SQLHelper sh,PosMasterHistory posMasterHistory)
  {
    if(posMasterHistory != null){
    	if(posMasterHistory.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posMasterHistory.getId());
         }
         if(posMasterHistory.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posMasterHistory.getHotelGroupId());
         }
         if(posMasterHistory.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posMasterHistory.getHotelId());
         }
        if(isNotNull(posMasterHistory.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posMasterHistory.getAccnt().trim());
        }
        if(isNotNull(posMasterHistory.getType1())){
           sh.appendSql(" AND obj.type1 = ? ");
           sh.insertValue(posMasterHistory.getType1().trim());
        }
        if(isNotNull(posMasterHistory.getType2())){
           sh.appendSql(" AND obj.type2 = ? ");
           sh.insertValue(posMasterHistory.getType2().trim());
        }
        if(isNotNull(posMasterHistory.getType3())){
           sh.appendSql(" AND obj.type3 = ? ");
           sh.insertValue(posMasterHistory.getType3().trim());
        }
        if(isNotNull(posMasterHistory.getType4())){
           sh.appendSql(" AND obj.type4 = ? ");
           sh.insertValue(posMasterHistory.getType4().trim());
        }
        if(isNotNull(posMasterHistory.getType5())){
           sh.appendSql(" AND obj.type5 = ? ");
           sh.insertValue(posMasterHistory.getType5().trim());
        }
        if(isNotNull(posMasterHistory.getPccode())){
           sh.appendSql(" AND obj.pccode = ? ");
           sh.insertValue(posMasterHistory.getPccode().trim());
        }
        if(isNotNull(posMasterHistory.getMode())){
           sh.appendSql(" AND obj.mode = ? ");
           sh.insertValue(posMasterHistory.getMode().trim());
        }
        if(isNotNull(posMasterHistory.getShift())){
           sh.appendSql(" AND obj.shift = ? ");
           sh.insertValue(posMasterHistory.getShift().trim());
        }
        if(isNotNull(posMasterHistory.getEmpid())){
           sh.appendSql(" AND obj.empid = ? ");
           sh.insertValue(posMasterHistory.getEmpid().trim());
        }
        if(isNotNull(posMasterHistory.getSta())){
           sh.appendSql(" AND obj.sta = ? ");
           sh.insertValue(posMasterHistory.getSta().trim());
        }
        if(isNotNull(posMasterHistory.getOsta())){
           sh.appendSql(" AND obj.osta = ? ");
           sh.insertValue(posMasterHistory.getOsta().trim());
        }
       if(posMasterHistory.getBizDate()!= null){
           sh.appendSql(" AND obj.bizDate = ? ");
           sh.insertValue(posMasterHistory.getBizDate());
        }
        if(isNotNull(posMasterHistory.getTableno())){
           sh.appendSql(" AND obj.tableno = ? ");
           sh.insertValue(posMasterHistory.getTableno().trim());
        }
        if(isNotNull(posMasterHistory.getExttableno())){
           sh.appendSql(" AND obj.exttableno = ? ");
           sh.insertValue(posMasterHistory.getExttableno().trim());
        }
       if(posMasterHistory.getGsts()!= null){
           sh.appendSql(" AND obj.gsts = ? ");
           sh.insertValue(posMasterHistory.getGsts());
        }
       if(posMasterHistory.getChildren()!= null){
           sh.appendSql(" AND obj.children = ? ");
           sh.insertValue(posMasterHistory.getChildren());
        }
        if(isNotNull(posMasterHistory.getPhone())){
           sh.appendSql(" AND obj.phone = ? ");
           sh.insertValue(posMasterHistory.getPhone().trim());
        }
        if(isNotNull(posMasterHistory.getMarket())){
           sh.appendSql(" AND obj.market = ? ");
           sh.insertValue(posMasterHistory.getMarket().trim());
        }
        if(isNotNull(posMasterHistory.getSource())){
           sh.appendSql(" AND obj.source = ? ");
           sh.insertValue(posMasterHistory.getSource().trim());
        }
        if(isNotNull(posMasterHistory.getHaccnt())){
           sh.appendSql(" AND obj.haccnt = ? ");
           sh.insertValue(posMasterHistory.getHaccnt().trim());
        }
        if(isNotNull(posMasterHistory.getName())){
           sh.appendSql(" AND obj.name = ? ");
           sh.insertValue(posMasterHistory.getName().trim());
        }
        if(isNotNull(posMasterHistory.getCusno())){
           sh.appendSql(" AND obj.cusno = ? ");
           sh.insertValue(posMasterHistory.getCusno().trim());
        }
        if(isNotNull(posMasterHistory.getCusinfo())){
           sh.appendSql(" AND obj.cusinfo = ? ");
           sh.insertValue(posMasterHistory.getCusinfo().trim());
        }
        if(isNotNull(posMasterHistory.getCardno())){
           sh.appendSql(" AND obj.cardno = ? ");
           sh.insertValue(posMasterHistory.getCardno().trim());
        }
        if(isNotNull(posMasterHistory.getCardinfo())){
           sh.appendSql(" AND obj.cardinfo = ? ");
           sh.insertValue(posMasterHistory.getCardinfo().trim());
        }
        if(isNotNull(posMasterHistory.getSaleid())){
           sh.appendSql(" AND obj.saleid = ? ");
           sh.insertValue(posMasterHistory.getSaleid().trim());
        }
        if(isNotNull(posMasterHistory.getSaleinfo())){
           sh.appendSql(" AND obj.saleinfo = ? ");
           sh.insertValue(posMasterHistory.getSaleinfo().trim());
        }
       if(posMasterHistory.getDsc()!= null){
           sh.appendSql(" AND obj.dsc = ? ");
           sh.insertValue(posMasterHistory.getDsc());
        }
        if(isNotNull(posMasterHistory.getReason())){
           sh.appendSql(" AND obj.reason = ? ");
           sh.insertValue(posMasterHistory.getReason().trim());
        }
       if(posMasterHistory.getSrv()!= null){
           sh.appendSql(" AND obj.srv = ? ");
           sh.insertValue(posMasterHistory.getSrv());
        }
       if(posMasterHistory.getTax()!= null){
           sh.appendSql(" AND obj.tax = ? ");
           sh.insertValue(posMasterHistory.getTax());
        }
       if(posMasterHistory.getAmount()!= null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posMasterHistory.getAmount());
        }
       if(posMasterHistory.getAmount1()!= null){
           sh.appendSql(" AND obj.amount1 = ? ");
           sh.insertValue(posMasterHistory.getAmount1());
        }
       if(posMasterHistory.getAmount2()!= null){
           sh.appendSql(" AND obj.amount2 = ? ");
           sh.insertValue(posMasterHistory.getAmount2());
        }
       if(posMasterHistory.getAmount3()!= null){
           sh.appendSql(" AND obj.amount3 = ? ");
           sh.insertValue(posMasterHistory.getAmount3());
        }
       if(posMasterHistory.getAmount4()!= null){
           sh.appendSql(" AND obj.amount4 = ? ");
           sh.insertValue(posMasterHistory.getAmount4());
        }
       if(posMasterHistory.getAmount5()!= null){
           sh.appendSql(" AND obj.amount5 = ? ");
           sh.insertValue(posMasterHistory.getAmount5());
        }
       if(posMasterHistory.getMaxamount()!= null){
           sh.appendSql(" AND obj.maxamount = ? ");
           sh.insertValue(posMasterHistory.getMaxamount());
        }
       if(posMasterHistory.getCharge()!= null){
           sh.appendSql(" AND obj.charge = ? ");
           sh.insertValue(posMasterHistory.getCharge());
        }
       if(posMasterHistory.getCredit()!= null){
           sh.appendSql(" AND obj.credit = ? ");
           sh.insertValue(posMasterHistory.getCredit());
        }
       if(posMasterHistory.getBal()!= null){
           sh.appendSql(" AND obj.bal = ? ");
           sh.insertValue(posMasterHistory.getBal());
        }
        if(isNotNull(posMasterHistory.getBillno())){
           sh.appendSql(" AND obj.billno = ? ");
           sh.insertValue(posMasterHistory.getBillno().trim());
        }
       if(posMasterHistory.getDscamount()!= null){
           sh.appendSql(" AND obj.dscamount = ? ");
           sh.insertValue(posMasterHistory.getDscamount());
        }
       if(posMasterHistory.getSrvamount()!= null){
           sh.appendSql(" AND obj.srvamount = ? ");
           sh.insertValue(posMasterHistory.getSrvamount());
        }
       if(posMasterHistory.getTaxamount()!= null){
           sh.appendSql(" AND obj.taxamount = ? ");
           sh.insertValue(posMasterHistory.getTaxamount());
        }
        if(isNotNull(posMasterHistory.getPaycode())){
           sh.appendSql(" AND obj.paycode = ? ");
           sh.insertValue(posMasterHistory.getPaycode().trim());
        }
        if(isNotNull(posMasterHistory.getExtra())){
           sh.appendSql(" AND obj.extra = ? ");
           sh.insertValue(posMasterHistory.getExtra().trim());
        }
       if(posMasterHistory.getLastnum()!= null){
           sh.appendSql(" AND obj.lastnum = ? ");
           sh.insertValue(posMasterHistory.getLastnum());
        }
       if(posMasterHistory.getLastrnum()!= null){
           sh.appendSql(" AND obj.lastrnum = ? ");
           sh.insertValue(posMasterHistory.getLastrnum());
        }
       if(posMasterHistory.getLastpnum()!= null){
           sh.appendSql(" AND obj.lastpnum = ? ");
           sh.insertValue(posMasterHistory.getLastpnum());
        }
        if(isNotNull(posMasterHistory.getPcrec())){
           sh.appendSql(" AND obj.pcrec = ? ");
           sh.insertValue(posMasterHistory.getPcrec().trim());
        }
        if(isNotNull(posMasterHistory.getCmscode())){
           sh.appendSql(" AND obj.cmscode = ? ");
           sh.insertValue(posMasterHistory.getCmscode().trim());
        }
        if(isNotNull(posMasterHistory.getReceiptNo())){
           sh.appendSql(" AND obj.receiptNo = ? ");
           sh.insertValue(posMasterHistory.getReceiptNo().trim());
        }
       if(posMasterHistory.getReceiptAmount()!= null){
           sh.appendSql(" AND obj.receiptAmount = ? ");
           sh.insertValue(posMasterHistory.getReceiptAmount());
        }
        if(isNotNull(posMasterHistory.getInfo())){
           sh.appendSql(" AND obj.info = ? ");
           sh.insertValue(posMasterHistory.getInfo().trim());
        }
        if(isNotNull(posMasterHistory.getToaccnt())){
           sh.appendSql(" AND obj.toaccnt = ? ");
           sh.insertValue(posMasterHistory.getToaccnt().trim());
        }
        if(isNotNull(posMasterHistory.getAccntinfo())){
           sh.appendSql(" AND obj.accntinfo = ? ");
           sh.insertValue(posMasterHistory.getAccntinfo().trim());
        }
        if(isNotNull(posMasterHistory.getResno())){
           sh.appendSql(" AND obj.resno = ? ");
           sh.insertValue(posMasterHistory.getResno().trim());
        }
        if(isNotNull(posMasterHistory.getQrCode())){
           sh.appendSql(" AND obj.qrCode = ? ");
           sh.insertValue(posMasterHistory.getQrCode().trim());
        }
        if(isNotNull(posMasterHistory.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posMasterHistory.getCreateUser().trim());
         }
        if(posMasterHistory.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posMasterHistory.getCreateDatetime());
         }
         if(isNotNull(posMasterHistory.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posMasterHistory.getModifyUser().trim());
         }
        if(posMasterHistory.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posMasterHistory.getModifyDatetime());
         }
    }
  }
}