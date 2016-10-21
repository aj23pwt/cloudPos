package com.greencloud.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.aua.util.SQLHelper;
import com.greencloud.entity.CodeBase;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.OperationInfo;
import com.greencloud.entity.PosAccntSync;
import com.greencloud.entity.ReportCenter;

public interface IPosSubService {
	public List<Object> getDataBySql(String sql);
	public void updateDataBySql(String sql);
	public List<CodeBase> getCodeBaseByParentCode(long hotelGroupId,long hotelId,String parentCode);
	public void saveCode(Object codeTemp);
	public void saveCodeGroup(Object object, String hotels,long hotelGroupId);
	public void deleteCode(Object object,long hotelGroupId);
	public void updateCodeSta(Object object,long hotelGroupId);
	public void updateCodeGroup(Object object,long hotelGroupId);
	public void updateCode(Object object);
	public void saveCodeCollection(ArrayList<Object> arr);
	public Object getCodeDetail(Object object);
	public Object getCodeDetailHistory(String ename,Object object);
	public List<Object> getCodeList(String ename,Object object);
	public String getHotelTree(Boolean filterR);
	public List<Object> getSycCodeList(String ename,Object object,String date);
    public List<Object> getSycPmsCodeList(String ename,Object object,String date,String type);
	public List<Object> getSycDaysList(String ename,Object object,String date,int days);
	public List<OperationInfo> getSycLocalDateList(String ename,Object object);
	
	public List<Object> getPosAccntList(String ename,Object object);
	public List<Object> getPosAccntContainHistoryList(String ename,Object object);
	
	public List<Object> getPosSyncAccntList(String ename,PosAccntSync posAccntSync,String type);
	public List<Object> getHotelAnalysis(long hotelGroupId,long hotelId,String biz_date);
	public List<Object> getHotelAnalysisShift(long hotelGroupId,long hotelId,String biz_date,String flag);
	public String updatePosAuditProcess(long hotelGroupId,long hotelId);
	
	public List<ReportCenter> getReportCenterByCategory(long hotelGroupId,long hotelId,String category);
	public String updatePosAuditUpdatePosBizdate(long hotelGroupId,long hotelId);
	public String checkDetailByCode(Object object,boolean isGroup);
	public <T extends EntityInfo> List<T> getDataBySql(Long hotelGroupId,Long hotelId,Class<T> clazz,String sql);
	public <T extends EntityInfo> List<T> getDataBySql(Class<T> clazz,SQLHelper sh);
	public void updatePosAuditDateEndDate(long hotelGroupId,long hotelId,Date bizDate);
	public int selectCountPosAuditDate(long hotelGroupId,long hotelId,Date bizDate);
	public void updatePosAuditDate(long hotelGroupId,long hotelId,String bizDate2,Date bizDate,String userCode,String stationCode);
}
