package com.greencloud.dao.impl;
import com.aua.util.SQLHelper;
import com.aua.dao.impl.BaseDaoImpl;

import static com.aua.util.StringHelper.*;

import java.util.List;

import com.greencloud.entity.PosStorePluArticle;
import com.greencloud.dao.IPosStorePluArticleDao;

import org.springframework.dao.DataAccessException;

   /**
   * operate PosStorePluArticle into db
   *@author 
   *@version 1.0
   *@date 2016-01-21 09:34
   */
  public class PosStorePluArticleDaoImpl extends BaseDaoImpl implements IPosStorePluArticleDao{

  /**
   *save posStorePluArticle object  method
   *@param posStorePluArticle PosStorePluArticle 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2016-01-21 09:34
   */
  public void save(PosStorePluArticle posStorePluArticle) throws DataAccessException {
       super.save(posStorePluArticle);
  }
  
  /**
   *update posStorePluArticle method
   *@param posStorePluArticle PosStorePluArticle
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-21 09:34
   */
  public void update(PosStorePluArticle posStorePluArticle) throws DataAccessException{
     super.update(posStorePluArticle);
  }
  
   /**
   *save or update posStorePluArticle object method
   *@param posStorePluArticle PosStorePluArticle
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2016-01-21 09:34
   */
  public void saveOrUpdate(PosStorePluArticle posStorePluArticle) throws DataAccessException{
     super.saveOrUpdate(posStorePluArticle);
  }
  
   /**
   *query posStorePluArticle collection method
   *@param posStorePluArticle PosStorePluArticle send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2016-01-21  09:34
   */
  public List<PosStorePluArticle> list(PosStorePluArticle posStorePluArticle,int firstResult ,int maxResults)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStorePluArticle obj WHERE 1=1 ");
  	 spellSQL(sh,posStorePluArticle);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 sh.setFirstResult(firstResult);
  	 sh.setMaxResults(maxResults);
  	 return find(sh);
  }
  
   /**
   *query collection method  
   *@param posStorePluArticle PosStorePluArticle send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2016-01-21 09:34
   */
  public List<PosStorePluArticle> list(PosStorePluArticle posStorePluArticle)throws DataAccessException{
  	 SQLHelper sh = new SQLHelper("SELECT obj FROM PosStorePluArticle obj WHERE 1=1 ");
  	 spellSQL(sh,posStorePluArticle);
  	 sh.appendSql(" ORDER BY obj.id DESC");
  	 return find(sh);
  }
  
  /**
   *count obj amount
   *@param posStorePluArticle PosStorePluArticle query vo
   *@throws DataAccessException
   *@author 
   *@date 2016-01-21 09:34
   */
  public int count(PosStorePluArticle posStorePluArticle)throws DataAccessException
  {
    SQLHelper sh = new SQLHelper("SELECT count(obj) FROM PosStorePluArticle obj WHERE 1=1 ");
    spellSQL(sh,posStorePluArticle);
    return count(sh);
  }
  
   /**
   *query a posStorePluArticle by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2016-01-21 09:34
   */
  public PosStorePluArticle load(Long id)throws DataAccessException
  {
    return load(PosStorePluArticle.class ,id);
  }
  
  /*
   *basic spell SQL method 
   *@param posStorePluArticle query vo
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2016-01-21 09:34
   */
   
  @Override
  public void deletePluArticle(PosStorePluArticle posStorePluArticle) {
  	
  	
  }
   
  private void spellSQL(SQLHelper sh,PosStorePluArticle posStorePluArticle)
  {
    if(posStorePluArticle != null){
        if(isNotNull(posStorePluArticle.getPluCode())){
           sh.appendSql(" AND obj.pluCode = ? ");
           sh.insertValue(posStorePluArticle.getPluCode().trim());
        }
        if(isNotNull(posStorePluArticle.getPluName())){
           sh.appendSql(" AND obj.pluName = ? ");
           sh.insertValue(posStorePluArticle.getPluName().trim());
        }
        if(isNotNull(posStorePluArticle.getArtCode())){
           sh.appendSql(" AND obj.artCode = ? ");
           sh.insertValue(posStorePluArticle.getArtCode().trim());
        }
        if(isNotNull(posStorePluArticle.getArtName())){
           sh.appendSql(" AND obj.artName = ? ");
           sh.insertValue(posStorePluArticle.getArtName().trim());
        }
        if(posStorePluArticle.getRate()!= null){
            sh.appendSql(" AND obj.rate = ? ");
            sh.insertValue(posStorePluArticle.getRate());
         }       
        if(posStorePluArticle.getId()!= null){
            sh.appendSql(" AND obj.id = ? ");
            sh.insertValue(posStorePluArticle.getId());
         }
         if(posStorePluArticle.getHotelGroupId()!= null){
            sh.appendSql(" AND obj.hotelGroupId = ? ");
            sh.insertValue(posStorePluArticle.getHotelGroupId());
         }
         if(posStorePluArticle.getHotelId()!= null){
            sh.appendSql(" AND obj.hotelId = ? ");
            sh.insertValue(posStorePluArticle.getHotelId());
         }
         if(isNotNull(posStorePluArticle.getCreateUser())){
             sh.appendSql(" AND obj.createUser = ? ");
             sh.insertValue(posStorePluArticle.getCreateUser().trim());
          }
         if(posStorePluArticle.getCreateDatetime()!= null){
             sh.appendSql(" AND obj.createDatetime = ? ");
             sh.insertValue(posStorePluArticle.getCreateDatetime());
          }
          if(isNotNull(posStorePluArticle.getModifyUser())){
             sh.appendSql(" AND obj.modifyUser = ? ");
             sh.insertValue(posStorePluArticle.getModifyUser().trim());
          }
         if(posStorePluArticle.getModifyDatetime()!= null){
             sh.appendSql(" AND obj.modifyDatetime = ? ");
             sh.insertValue(posStorePluArticle.getModifyDatetime());
          }
    }
  }
}