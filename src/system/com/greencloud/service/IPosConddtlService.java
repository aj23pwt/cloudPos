package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;

import java.util.Date;
import java.util.List;

import com.greencloud.dto.CondstDto;
import com.greencloud.entity.PosConddtl;

import org.springframework.dao.DataAccessException;
public interface IPosConddtlService extends IBaseService
{
   /**
   *save posConddtl object  method
   *@param posConddtl PosConddtl 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void savePosConddtl(PosConddtl posConddtl) throws DataAccessException;
  
   /**
   *update posConddtl method
   *@param posConddtl PosConddtl
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void updatePosConddtl(PosConddtl posConddtl) throws DataAccessException;
  
   /**
   *save or update posConddtl object method
   *@param posConddtl PosConddtl
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-03-23 16:31
   */
  public void saveOrUpdatePosConddtl(PosConddtl posConddtl) throws DataAccessException;

  /**
   *query a container obj
   *@param posConddtl PosConddtl query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-03-23 16:31
   */
  public Container<PosConddtl> findPosConddtl(PosConddtl posConddtl,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posConddtl collection method
   *@param posConddtl PosConddtl send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosConddtl> listPosConddtl(PosConddtl posConddtl)throws DataAccessException;
 
   /**
   *query posConddtl collection method
   *@param posConddtl PosConddtl send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-03-23  16:31
   */
  public List<PosConddtl> listPosConddtl(PosConddtl posConddtl,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posConddtl PosConddtl query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-03-23 16:31
   */
  public int countPosConddtl(PosConddtl posConddtl)throws DataAccessException;
   
   /**
   *query a posConddtl by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-03-23 16:31
   */
  public PosConddtl findPosConddtlById(Long id)throws DataAccessException;
  
  public List<CondstDto> getCondstDto(long hotelGroupId,long hotelId,String pccode, String sortCode);
  
  public List<PosConddtl> findPosConddtl(Long hotelGroupId,Long hotelId,Date modifyDatetime) ;
  
  public String getCondstTreeDto(long hotelGroupId,long hotelId,String pccode, String sortCode);
  public String getPosRemarkTreeDto(long hotelGroupId,long hotelId,String pccode, String sortCode);
}