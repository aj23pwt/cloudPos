package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStoreDetail;
import com.greencloud.dao.IPosStoreDetailDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStoreDetail into db
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public class PosStoreDetailDaoImpl extends BaseDaoImpl implements IPosStoreDetailDao{

  /**
   *save posStoreDetail object  method
   *@param posStoreDetail PosStoreDetail 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void save(PosStoreDetail posStoreDetail) throws DataAccessException {
       super.save(posStoreDetail);
  }
  
  /**
   *update posStoreDetail method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void update(PosStoreDetail posStoreDetail) throws DataAccessException{
     super.update(posStoreDetail);
  }
  
   /**
   *save or update posStoreDetail object method
   *@param posStoreDetail PosStoreDetail
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public void saveOrUpdate(PosStoreDetail posStoreDetail) throws DataAccessException{
     super.saveOrUpdate(posStoreDetail);
  }
  
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
  public List<PosStoreDetail> list(PosStoreDetail posStoreDetail,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreDetail obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreDetail);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStoreDetail PosStoreDetail send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-16 13:45
   */
  public List<PosStoreDetail> list(PosStoreDetail posStoreDetail)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreDetail obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreDetail);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStoreDetail PosStoreDetail query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-16 13:45
   */
  public int count(PosStoreDetail posStoreDetail)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStoreDetail obj WHERE 1=1 ");
    spellSQL(sh,posStoreDetail);
    return count(sh);
  }
  
   /**
   *query a posStoreDetail by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-16 13:45
   */
  public PosStoreDetail load(Long id)throws DataAccessException
  {
    return load(PosStoreDetail.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStoreDetail query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-16 13:45
   */
  private void spellSQL(SQLHelper sh,PosStoreDetail posStoreDetail)
  {
    if(posStoreDetail != null){
        if(isNotNull(posStoreDetail.getAccnt())){
           sh.appendSql(" AND obj.accnt = ? ");
           sh.insertValue(posStoreDetail.getAccnt().trim());
        }
        if(isNotNull(posStoreDetail.getArticleCode())){
           sh.appendSql(" AND obj.articleCode = ? ");
           sh.insertValue(posStoreDetail.getArticleCode().trim());
        }
        if(isNotNull(posStoreDetail.getPackingSize())){
           sh.appendSql(" AND obj.packingSize = ? ");
           sh.insertValue(posStoreDetail.getPackingSize().trim());
        }
       if(posStoreDetail.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posStoreDetail.getPrice());
        }
        if(isNotNull(posStoreDetail.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posStoreDetail.getUnit().trim());
        }
       if(posStoreDetail.getNumber()!= null){
           sh.appendSql(" AND obj.number = ? ");
           sh.insertValue(posStoreDetail.getNumber());
        }
       if(posStoreDetail.getAmount()!= null){
           sh.appendSql(" AND obj.amount = ? ");
           sh.insertValue(posStoreDetail.getAmount());
        }
       
       if(posStoreDetail.getId()!= null){
           sh.appendSql(" AND obj.id = ? ");
           sh.insertValue(posStoreDetail.getId());
        }
        if(posStoreDetail.getHotelGroupId()!= null){
           sh.appendSql(" AND obj.hotelGroupId = ? ");
           sh.insertValue(posStoreDetail.getHotelGroupId());
        }
        if(posStoreDetail.getHotelId()!= null){
           sh.appendSql(" AND obj.hotelId = ? ");
           sh.insertValue(posStoreDetail.getHotelId());
        }
        if(isNotNull(posStoreDetail.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posStoreDetail.getCreateUser().trim());
         }
        if(posStoreDetail.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posStoreDetail.getCreateDatetime());
         }
         if(isNotNull(posStoreDetail.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posStoreDetail.getModifyUser().trim());
         }
        if(posStoreDetail.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posStoreDetail.getModifyDatetime());
         }
    }
  }
}