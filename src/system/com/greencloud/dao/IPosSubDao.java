package com.greencloud.dao;

import java.util.Date;
import java.util.List;

import com.aua.util.SQLHelper;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.OperationInfo;
import com.greencloud.entity.PosAccntSync;
import com.greencloud.entity.ReportCenter;

public interface IPosSubDao {
	 public List<Object> getDataBySql(String sql);
	 public void updateDataBySql(String sql);
	 public void saveCode(Object object);
	 public Object getCodeDetail(Object object);
	 public Object getCodeDetailHistory(String ename,Object object);
	 public List<Object> getCodeList(String ename,Object object);
	 public void deleteCode(Object object);
	 public void updateCode(Object object);
	 public void updateCodeSta(Object object);
	 public List<Object> getSycCodeList(String ename,Object object,String date);
	 public List<Object> getSycDaysList(String ename,Object object,String date,int days);
	 public List<Object> getSycPmsCodeList(String ename,Object object,String date,String type);
	 public List<OperationInfo> getSycLocalDateList(String ename,Object object);
	 public List<Object> getPosAccntList(String ename,Object object);
	 public List<Object> getPosAccntContainHistoryList(String ename,Object object);
	 public List<Object> getPosSyncAccntList(String ename,PosAccntSync posAccntSync,String type);
	 public List<Object> getHotelAnalysis(long hotelGroupId,long hotelId,String biz_date);
	 public List<Object> getHotelAnalysisShift(long hotelGroupId,long hotelId,String biz_date,String flag);
	 public String updatePosAuditProcess(long hotelGroupId,long hotelId);
	 
	 public List<ReportCenter> getReportCenterByCategory(long hotelGroupId,	long hotelId, String category) ;
	 public String updatePosAuditUpdatePosBizdate(long hotelGroupId,long hotelId);
	 
	 public List<Object> isCodeExistedCc(Object object);
	 public <T extends EntityInfo> List<T> getDataBySql(Long hotelGroupId,Long hotelId,Class<T> clazz,String sql);
	 public <T extends EntityInfo> List<T> getDataBySql(Class<T> clazz,SQLHelper sh);
	 public void updatePosAuditDate(long hotelGroupId,long hotelId,String bizDate2,Date bizDate,String userCode,String stationCode);
	 public void updatePosAuditDateEndDate(long hotelGroupId,long hotelId,Date bizDate);	 
	 public void deletePosAuditDateByBizDate(long hotelGroupId,long hotelId,Date bizDate);
	 public int selectCountPosAuditDate(long hotelGroupId,long hotelId,Date bizDate);
	 public void updateDeleteSqlAllData(String hotelGroupId,String hotelId,String accnt);
}
