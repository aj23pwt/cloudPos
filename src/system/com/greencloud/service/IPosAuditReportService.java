package com.greencloud.service;
import com.aua.service.IBaseService;
import com.aua.util.Container;
import java.util.List;

import com.greencloud.entity.PosAuditReport;
import org.springframework.dao.DataAccessException;
public interface IPosAuditReportService extends IBaseService
{
   /**
   *save posAuditReport object  method
   *@param posAuditReport PosAuditReport 
   *@throws DataAccessException 
   *@author  
   *@version 1.0
   *@date 2015-09-21 14:10
   */
  public void savePosAuditReport(PosAuditReport posAuditReport) throws DataAccessException;
  
   /**
   *update posAuditReport method
   *@param posAuditReport PosAuditReport
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-21 14:10
   */
  public void updatePosAuditReport(PosAuditReport posAuditReport) throws DataAccessException;
  
   /**
   *save or update posAuditReport object method
   *@param posAuditReport PosAuditReport
   *@throws DataAccessException
   *@author  
   *@version 1.0
   *@date 2015-09-21 14:10
   */
  public void saveOrUpdatePosAuditReport(PosAuditReport posAuditReport) throws DataAccessException;

  /**
   *query a container obj
   *@param posAuditReport PosAuditReport query vo
   *@param firstResult
   *@param maxResults 
   *@throws DataAccessException 
   *@author weihuawon
   *@date 2015-09-21 14:10
   */
  public Container<PosAuditReport> findPosAuditReport(PosAuditReport posAuditReport,int firstResult ,int maxResults)throws DataAccessException;
   
   /**
   *query posAuditReport collection method
   *@param posAuditReport PosAuditReport send query vo 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-21  14:10
   */
  public List<PosAuditReport> listPosAuditReport(PosAuditReport posAuditReport)throws DataAccessException;
 
   /**
   *query posAuditReport collection method
   *@param posAuditReport PosAuditReport send query vo 
   *@param firstResult 
   *@param maxResults 
   *@throws DataAccessException 
   *@author 
   *@version 1.0
   *@date 2015-09-21  14:10
   */
  public List<PosAuditReport> listPosAuditReport(PosAuditReport posAuditReport,int firstResult ,int maxResults)throws DataAccessException;
 
  /**
   *count obj amount
   *@param posAuditReport PosAuditReport query vo
   *@throws DataAccessException
   *@author 
   *@date 2015-09-21 14:10
   */
  public int countPosAuditReport(PosAuditReport posAuditReport)throws DataAccessException;
   
   /**
   *query a posAuditReport by id 
   *@param id 
   *@throws DataAccessException 
   *@author 
   *@date 2015-09-21 14:10
   */
  public PosAuditReport findPosAuditReportById(Long id)throws DataAccessException;
  
  /**
   * query by native sql
   * @param sql
   * @return
   */
  public List<Object> search(String sql);
}