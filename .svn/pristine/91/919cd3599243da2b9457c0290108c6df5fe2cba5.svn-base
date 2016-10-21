package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStoreArticle;
import com.greencloud.dao.IPosStoreArticleDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStoreArticle into db
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public class PosStoreArticleDaoImpl extends BaseDaoImpl implements IPosStoreArticleDao{

  /**
   *save posStoreArticle object  method
   *@param posStoreArticle PosStoreArticle 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void save(PosStoreArticle posStoreArticle) throws DataAccessException {
       super.save(posStoreArticle);
  }
  
  /**
   *update posStoreArticle method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void update(PosStoreArticle posStoreArticle) throws DataAccessException{
     super.update(posStoreArticle);
  }
  
   /**
   *save or update posStoreArticle object method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdate(PosStoreArticle posStoreArticle) throws DataAccessException{
     super.saveOrUpdate(posStoreArticle);
  }
  
   /**
   *query posStoreArticle collection method
   *@param posStoreArticle PosStoreArticle send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreArticle> list(PosStoreArticle posStoreArticle,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreArticle obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreArticle);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStoreArticle PosStoreArticle send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public List<PosStoreArticle> list(PosStoreArticle posStoreArticle)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStoreArticle obj WHERE 1=1 ");
  	 spellSQL(sh,posStoreArticle);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStoreArticle PosStoreArticle query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int count(PosStoreArticle posStoreArticle)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStoreArticle obj WHERE 1=1 ");
    spellSQL(sh,posStoreArticle);
    return count(sh);
  }
  
   /**
   *query a posStoreArticle by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreArticle load(Long id)throws DataAccessException
  {
    return load(PosStoreArticle.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStoreArticle query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 13:38
   */
  private void spellSQL(SQLHelper sh,PosStoreArticle posStoreArticle)
  {
    if(posStoreArticle != null){
    	if(posStoreArticle.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStoreArticle.getId());
         }
         if(posStoreArticle.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStoreArticle.getHotelGroupId());
         }
         if(posStoreArticle.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStoreArticle.getHotelId());
         }
        if(isNotNull(posStoreArticle.getCode())){
           sh.appendSql(" AND obj.code = ? ");
           sh.insertValue(posStoreArticle.getCode().trim());
        }
        if(isNotNull(posStoreArticle.getName())){
           sh.appendSql(" AND obj.name = ? ");
           sh.insertValue(posStoreArticle.getName().trim());
        }
        if(isNotNull(posStoreArticle.getUnit())){
           sh.appendSql(" AND obj.unit = ? ");
           sh.insertValue(posStoreArticle.getUnit().trim());
        }
       if(posStoreArticle.getPrice()!= null){
           sh.appendSql(" AND obj.price = ? ");
           sh.insertValue(posStoreArticle.getPrice());
        }
       if(posStoreArticle.getMaxQuan()!= null){
           sh.appendSql(" AND obj.maxQuan = ? ");
           sh.insertValue(posStoreArticle.getMaxQuan());
        }
       if(posStoreArticle.getMinQuan()!= null){
           sh.appendSql(" AND obj.minQuan = ? ");
           sh.insertValue(posStoreArticle.getMinQuan());
        }
        if(isNotNull(posStoreArticle.getSseg())){
           sh.appendSql(" AND obj.sseg = ? ");
           sh.insertValue(posStoreArticle.getSseg().trim());
        }
        if(isNotNull(posStoreArticle.getSname())){
           sh.appendSql(" AND obj.sname = ? ");
           sh.insertValue(posStoreArticle.getSname().trim());
        }
        if(isNotNull(posStoreArticle.getCseg())){
           sh.appendSql(" AND obj.cseg = ? ");
           sh.insertValue(posStoreArticle.getCseg().trim());
        }
        if(isNotNull(posStoreArticle.getCname())){
           sh.appendSql(" AND obj.cname = ? ");
           sh.insertValue(posStoreArticle.getCname().trim());
        }
        if(isNotNull(posStoreArticle.getOactmode())){
           sh.appendSql(" AND obj.oactmode = ? ");
           sh.insertValue(posStoreArticle.getOactmode().trim());
        }
        if(isNotNull(posStoreArticle.getActmode())){
           sh.appendSql(" AND obj.actmode = ? ");
           sh.insertValue(posStoreArticle.getActmode().trim());
        }
        if(isNotNull(posStoreArticle.getHelpcode())){
           sh.appendSql(" AND obj.helpcode = ? ");
           sh.insertValue(posStoreArticle.getHelpcode().trim());
        }
        if(isNotNull(posStoreArticle.getStandent())){
           sh.appendSql(" AND obj.standent = ? ");
           sh.insertValue(posStoreArticle.getStandent().trim());
        }
        if(isNotNull(posStoreArticle.getBand())){
           sh.appendSql(" AND obj.band = ? ");
           sh.insertValue(posStoreArticle.getBand().trim());
        }
       if(posStoreArticle.getWarning()!= null){
           sh.appendSql(" AND obj.warning = ? ");
           sh.insertValue(posStoreArticle.getWarning());
        }
       if(posStoreArticle.getLpno()!= null){
           sh.appendSql(" AND obj.lpno = ? ");
           sh.insertValue(posStoreArticle.getLpno());
        }
       if(posStoreArticle.getLprice()!= null){
           sh.appendSql(" AND obj.lprice = ? ");
           sh.insertValue(posStoreArticle.getLprice());
        }
        if(isNotNull(posStoreArticle.getUnit2())){
           sh.appendSql(" AND obj.unit2 = ? ");
           sh.insertValue(posStoreArticle.getUnit2().trim());
        }
       if(posStoreArticle.getEqun2()!= null){
           sh.appendSql(" AND obj.equn2 = ? ");
           sh.insertValue(posStoreArticle.getEqun2());
        }
       if(posStoreArticle.getMinprice()!= null){
           sh.appendSql(" AND obj.minprice = ? ");
           sh.insertValue(posStoreArticle.getMinprice());
        }
        if(isNotNull(posStoreArticle.getMinsup())){
           sh.appendSql(" AND obj.minsup = ? ");
           sh.insertValue(posStoreArticle.getMinsup().trim());
        }
       if(posStoreArticle.getMaxprice()!= null){
           sh.appendSql(" AND obj.maxprice = ? ");
           sh.insertValue(posStoreArticle.getMaxprice());
        }
        if(isNotNull(posStoreArticle.getMaxsup())){
           sh.appendSql(" AND obj.maxsup = ? ");
           sh.insertValue(posStoreArticle.getMaxsup().trim());
        }
       if(posStoreArticle.getAvprice()!= null){
           sh.appendSql(" AND obj.avprice = ? ");
           sh.insertValue(posStoreArticle.getAvprice());
        }
        if(isNotNull(posStoreArticle.getStorage())){
           sh.appendSql(" AND obj.storage = ? ");
           sh.insertValue(posStoreArticle.getStorage().trim());
        }
        if(isNotNull(posStoreArticle.getQuocode())){
           sh.appendSql(" AND obj.quocode = ? ");
           sh.insertValue(posStoreArticle.getQuocode().trim());
        }
       if(posStoreArticle.getCsnumber()!= null){
           sh.appendSql(" AND obj.csnumber = ? ");
           sh.insertValue(posStoreArticle.getCsnumber());
        }
        if(isNotNull(posStoreArticle.getCsunit())){
           sh.appendSql(" AND obj.csunit = ? ");
           sh.insertValue(posStoreArticle.getCsunit().trim());
        }
       if(posStoreArticle.getCsbili()!= null){
           sh.appendSql(" AND obj.csbili = ? ");
           sh.insertValue(posStoreArticle.getCsbili());
        }
        if(isNotNull(posStoreArticle.getCstype())){
           sh.appendSql(" AND obj.cstype = ? ");
           sh.insertValue(posStoreArticle.getCstype().trim());
        }
       if(posStoreArticle.getSafeQuan()!= null){
           sh.appendSql(" AND obj.safeQuan = ? ");
           sh.insertValue(posStoreArticle.getSafeQuan());
        }
        if(isNotNull(posStoreArticle.getRef())){
           sh.appendSql(" AND obj.ref = ? ");
           sh.insertValue(posStoreArticle.getRef().trim());
        }
       if(posStoreArticle.getSalePrice()!= null){
           sh.appendSql(" AND obj.salePrice = ? ");
           sh.insertValue(posStoreArticle.getSalePrice());
        }
       if(posStoreArticle.getLimitnumber()!= null){
           sh.appendSql(" AND obj.limitnumber = ? ");
           sh.insertValue(posStoreArticle.getLimitnumber());
        }
        if(isNotNull(posStoreArticle.getEngName())){
           sh.appendSql(" AND obj.engName = ? ");
           sh.insertValue(posStoreArticle.getEngName().trim());
        }
        if(isNotNull(posStoreArticle.getEngSname())){
           sh.appendSql(" AND obj.engSname = ? ");
           sh.insertValue(posStoreArticle.getEngSname().trim());
        }
        if(isNotNull(posStoreArticle.getEngCname())){
           sh.appendSql(" AND obj.engCname = ? ");
           sh.insertValue(posStoreArticle.getEngCname().trim());
        }
        if(isNotNull(posStoreArticle.getIsGroup())){
           sh.appendSql(" AND obj.isGroup = ? ");
           sh.insertValue(posStoreArticle.getIsGroup().trim());
        }
        if(isNotNull(posStoreArticle.getGroupCode())){
           sh.appendSql(" AND obj.groupCode = ? ");
           sh.insertValue(posStoreArticle.getGroupCode().trim());
        }
        if(isNotNull(posStoreArticle.getCodeType())){
           sh.appendSql(" AND obj.codeType = ? ");
           sh.insertValue(posStoreArticle.getCodeType().trim());
        }
        if(isNotNull(posStoreArticle.getCreateUser())){
            sh.appendSql(" AND obj.createUser = ? ");
            sh.insertValue(posStoreArticle.getCreateUser().trim());
         }
        if(posStoreArticle.getCreateDatetime()!= null){
            sh.appendSql(" AND obj.createDatetime = ? ");
            sh.insertValue(posStoreArticle.getCreateDatetime());
         }
         if(isNotNull(posStoreArticle.getModifyUser())){
            sh.appendSql(" AND obj.modifyUser = ? ");
            sh.insertValue(posStoreArticle.getModifyUser().trim());
         }
        if(posStoreArticle.getModifyDatetime()!= null){
            sh.appendSql(" AND obj.modifyDatetime = ? ");
            sh.insertValue(posStoreArticle.getModifyDatetime());
         }
    }
  }
  
  @Override
 	public String posStoreMaxCode(String type, String pCode, Long hotelGroupId, Long hotelId)
 	{
 	  		String sql = "";
 	  		if(type.equals("class"))
 	  		{
 	  			sql = "select ifnull(max(cast(code as signed)),0) from pos_store_class where hotel_group_id = " + hotelGroupId + " and hotel_id = " + hotelId;
 	  		}else if(type.equals("subClass"))
 	  		{
 	  			sql = "select ifnull(max(cast(code as signed)),0) from pos_store_subclass where hotel_group_id = " + hotelGroupId + " and hotel_id = " + hotelId	+ " and cseg = '"+pCode+"'";
 	  		}else if(type.equals("article"))
 	  		{
 	  			sql = "select ifnull(max(cast(code as signed)),0) from pos_store_article where hotel_group_id = " + hotelGroupId + " and hotel_id = " + hotelId	+ " and sseg = '"+pCode+"'";
 	  		}
 	  		
 	  		SQLHelper sh=new SQLHelper(sql);
 	  		return Long.toString(countByNativeSQL(sh));
 	}
}