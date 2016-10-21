package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;
import static com.aua.util.StringHelper.*;
import java.util.List;
import com.greencloud.entity.PosClose;
import com.greencloud.dao.IPosCloseDao;
import org.springframework.dao.DataAccessException;

   /**
   * operate PosClose into db
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public class PosCloseDaoImpl extends BaseDaoImpl implements IPosCloseDao{

  /**
   *save posClose object  method
   *@param posClose PosClose 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void save(PosClose posClose) throws DataAccessException {
       super.save(posClose);
  }
  
  /**
   *update posClose method
   *@param posClose PosClose
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void update(PosClose posClose) throws DataAccessException{
     super.update(posClose);
  }
  
   /**
   *save or update posClose object method
   *@param posClose PosClose
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public void saveOrUpdate(PosClose posClose) throws DataAccessException{
     super.saveOrUpdate(posClose);
  }
  
   /**
   *query posClose collection method
   *@param posClose PosClose send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-07-10  11:48
   */
  public List<PosClose> list(PosClose posClose,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosClose obj WHERE 1=1 ");
  	 spellSQL(sh,posClose);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posClose PosClose send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-07-10 11:48
   */
  public List<PosClose> list(PosClose posClose)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosClose obj WHERE 1=1 ");
  	 spellSQL(sh,posClose);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posClose PosClose query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-07-10 11:48
   */
  public int count(PosClose posClose)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosClose obj WHERE 1=1 ");
    spellSQL(sh,posClose);
    return count(sh);
  }
  
   /**
   *query a posClose by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-07-10 11:48
   */
  public PosClose load(Long id)throws DataAccessException
  {
    return load(PosClose.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posClose query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-07-10 11:48
   */
  private void spellSQL(SQLHelper sh,PosClose posClose)
  {
    if(posClose != null){
        if(isNotNull(posClose.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posClose.getAccnt().trim());
        }
        if(isNotNull(posClose.getBillno())){
           sh.appendSql(" AND obj.billno = ? ");
           sh.insertValue(posClose.getBillno().trim());
        }
        if(isNotNull(posClose.getCloseFlag())){
           sh.appendSql(" AND obj.closeFlag = ? ");
           sh.insertValue(posClose.getCloseFlag().trim());
        }
       if(posClose.getCharge()!= null){
           sh.appendSql(" AND obj.charge = ? ");
           sh.insertValue(posClose.getCharge());
        }
       if(posClose.getPay()!= null){
           sh.appendSql(" AND obj.pay = ? ");
           sh.insertValue(posClose.getPay());
        }
        if(isNotNull(posClose.getTransType())){
           sh.appendSql(" AND obj.transType = ? ");
           sh.insertValue(posClose.getTransType().trim());
        }
        if(isNotNull(posClose.getTransAccnt())){
           sh.appendSql(" AND obj.transAccnt = ? ");
           sh.insertValue(posClose.getTransAccnt().trim());
        }
       if(posClose.getGenBizDate()!= null){
           sh.appendSql(" AND obj.genBizDate = ? ");
           sh.insertValue(posClose.getGenBizDate());
        }
        if(isNotNull(posClose.getGenUser())){
           sh.appendSql(" AND obj.genUser = ? ");
           sh.insertValue(posClose.getGenUser().trim());
        }
        if(isNotNull(posClose.getGenCashier())){
           sh.appendSql(" AND obj.genCashier = ? ");
           sh.insertValue(posClose.getGenCashier().trim());
        }
       if(posClose.getGenDatetime()!= null){
           sh.appendSql(" AND obj.genDatetime = ? ");
           sh.insertValue(posClose.getGenDatetime());
        }
       if(posClose.getDelBizDate()!= null){
           sh.appendSql(" AND obj.delBizDate = ? ");
           sh.insertValue(posClose.getDelBizDate());
        }
        if(isNotNull(posClose.getDelUser())){
           sh.appendSql(" AND obj.delUser = ? ");
           sh.insertValue(posClose.getDelUser().trim());
        }
        if(isNotNull(posClose.getDelCashier())){
           sh.appendSql(" AND obj.delCashier = ? ");
           sh.insertValue(posClose.getDelCashier().trim());
        }
       if(posClose.getDelDatetime()!= null){
           sh.appendSql(" AND obj.delDatetime = ? ");
           sh.insertValue(posClose.getDelDatetime());
        }
        if(isNotNull(posClose.getTableno())){
           sh.appendSql(" AND obj.tableno = ? ");
           sh.insertValue(posClose.getTableno().trim());
        }
        if(isNotNull(posClose.getAuditUser())){
           sh.appendSql(" AND obj.auditUser = ? ");
           sh.insertValue(posClose.getAuditUser().trim());
        }
        if(isNotNull(posClose.getAuditRemark())){
           sh.appendSql(" AND obj.auditRemark = ? ");
           sh.insertValue(posClose.getAuditRemark().trim());
        }
    }
  }
}