package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.List;

import com.greencloud.dto.PosStoreDto;
import com.greencloud.dto.PosStoreEditDto;
import com.greencloud.entity.PosStoreArticle;

import org.springframework.dao.DataAccessException;
public interface IPosStoreArticleService extends IBaseService
{
   /**
   *save posStoreArticle object  method
   *@param posStoreArticle PosStoreArticle 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void savePosStoreArticle(PosStoreArticle posStoreArticle) throws DataAccessException;
  
   /**
   *update posStoreArticle method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void updatePosStoreArticle(PosStoreArticle posStoreArticle) throws DataAccessException;
  
   /**
   *save or update posStoreArticle object method
   *@param posStoreArticle PosStoreArticle
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-12-02 13:38
   */
  public void saveOrUpdatePosStoreArticle(PosStoreArticle posStoreArticle) throws DataAccessException;

  /**
   *query a container obj
   *@param posStoreArticle PosStoreArticle query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-12-02 13:38
   */
  public Container<PosStoreArticle> findPosStoreArticle(PosStoreArticle posStoreArticle,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posStoreArticle collection method
   *@param posStoreArticle PosStoreArticle send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-12-02  13:38
   */
  public List<PosStoreArticle> listPosStoreArticle(PosStoreArticle posStoreArticle)throws DataAccessException;
 
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
  public List<PosStoreArticle> listPosStoreArticle(PosStoreArticle posStoreArticle,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posStoreArticle PosStoreArticle query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-12-02 13:38
   */
  public int countPosStoreArticle(PosStoreArticle posStoreArticle)throws DataAccessException;
   
   /**
   *query a posStoreArticle by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-12-02 13:38
   */
  public PosStoreArticle findPosStoreArticleById(Long id)throws DataAccessException;
  
  public List<PosStoreDto> getStoreTree(Long hotelGroupId, Long hotelId)throws DataAccessException;
  
  public List<PosStoreArticle> getPosStoreArticleBycode(Long hotelGroupId, Long hotelId,String acode);

	public void saveGroupPosArticle(Long hotelGroupId, Long hotelId,PosStoreArticle posStoreArticle);

	public void updatePosArticleByDto(Long hotelGroupId, Long hotelId,PosStoreEditDto posStoreEditDto);

	public void deleteGroupPosArticle(Long hotelGroupId, Long hotelId,PosStoreArticle posStoreArticle);

	public String posStoreMaxCode(Long hotelGroupId, Long hotelId, String type, String pCode);

	public void getArticleMess(Long hotelGroupId, Long hotelId, String acode,String code);

	public PosStoreArticle getArticleByCode(Long hotelGroupId, Long hotelId,String acode);

	public List<PosStoreArticle> checkDataArticle(Long hotelGroupId,Long hotelId, String scode);
}