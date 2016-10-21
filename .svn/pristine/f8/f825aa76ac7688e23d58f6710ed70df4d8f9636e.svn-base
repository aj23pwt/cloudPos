package com.greencloud.dao;
import com.aua.dao.IBaseDao;
import java.util.List;
import com.greencloud.entity.PosStoreArticle;
import org.springframework.dao.DataAccessException;
 /**
   * operate PosStoreArticle into db
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
public interface IPosStoreArticleDao extends IBaseDao
{

  /**
   *save posStoreArticle object  method
   *@param posStoreArticle PosStoreArticle 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void save(PosStoreArticle posStoreArticle) throws DataAccessException;

   /**
   *update posStoreArticle method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void update(PosStoreArticle posStoreArticle) throws DataAccessException;
 
   /**
   *save or update posStoreArticle object method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdate(PosStoreArticle posStoreArticle) throws DataAccessException;
  
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
  public List<PosStoreArticle> list(PosStoreArticle posStoreArticle,int firstResult ,int maxResults)throws DataAccessException;
  
   /**
   *query collection method  
   *@param posStoreArticle PosStoreArticle send query vo 
   *@throws DataAccessException
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public List<PosStoreArticle> list(PosStoreArticle posStoreArticle)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreArticle PosStoreArticle query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int count(PosStoreArticle posStoreArticle)throws DataAccessException;
  
   /**
   *query a posStoreArticle by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreArticle load(Long id)throws DataAccessException;
  
  public String posStoreMaxCode(String type, String pCode, Long hotelGroupId, Long hotelId);
  
}