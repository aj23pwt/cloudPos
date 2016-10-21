package com.greencloud.dao.impl;


import static com.aua.util.StringHelper.isNotNull;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.CallableStatementCallback;

import com.aua.dao.impl.BaseDaoImpl;
import com.aua.util.SQLHelper;
import com.greencloud.dao.IPosSubDao;
import com.greencloud.entity.EntityInfo;
import com.greencloud.entity.OperationInfo;
import com.greencloud.entity.PosAccntSync;
import com.greencloud.entity.ReportCenter;
import com.greencloud.entity.SysOption;
import com.greencloud.service.ISysOptionService;
import com.greencloud.util.DateUtil;
import com.greencloud.util.ModelUtil;

public class PosSubDaoImpl extends BaseDaoImpl  implements IPosSubDao {
	
	private ISysOptionService sysOptionService;

	@Override
	public void saveCode(Object object) {
		this.getHibernateTemplate().save(object);
	}

	@Override
	public List<Object> getDataBySql(String sql) {
		 SQLHelper sh = new SQLHelper(sql);
	  	 return this.findByNativeSQL(sh);
	}

	@Override
	public void updateDataBySql(String sql) {
		SQLHelper sh = new SQLHelper(sql);
	 	this.bulkUpdateByNativeSQL(sh);
	}

	@Override
	public Object getCodeDetail(Object object) {
		OperationInfo objectInfo = (OperationInfo)object;
		Object codeObject = null;
		if (null != objectInfo)
		{
			codeObject = getHibernateTemplate().get(objectInfo.getClass(),objectInfo.getId());
		//	this.getSession().evict(codeObject);
		//	getHibernateTemplate().getSessionFactory().evict(codeObject);
			this.flush();
		}
		
		return codeObject;
	}

	@Override
	public List<Object> getCodeList(String ename,Object object) {
		OperationInfo objectInfo = (OperationInfo)object;
		 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		 if(objectInfo.getId()!= null){
	            sh.appendSql(" AND obj.id = ? ");
	            sh.insertValue(objectInfo.getId());
	      }
	      if(objectInfo.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(objectInfo.getHotelGroupId());
	      }
	      if(objectInfo.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(objectInfo.getHotelId());
	      }
	      if (ModelUtil.hasProperty(objectInfo, "isHalt")){
	    	  String isHalt = (String)ModelUtil.getPropertyValue(objectInfo, "isHalt");
	    	  if(isHalt != null && isHalt.equals("F")){
	    		  sh.appendSql(" AND obj.isHalt = ? ");
		           sh.insertValue(isHalt);
	    	  }
	      }
	      if(ename.equals("PosPluStd") && ModelUtil.getPropertyValue(objectInfo, "code")!=null){
	    	   sh.appendSql(" AND obj.code = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "code"));
	      }
	      if (ModelUtil.hasProperty(objectInfo, "parentCode")){
	    	  sh.appendSql(" AND obj.parentCode = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "parentCode"));
	      }
	      if (ModelUtil.hasProperty(objectInfo, "pccode") &&  ModelUtil.getPropertyValue(objectInfo, "pccode")!=null  &&!ename.equals("PosCondst") && !ename.equalsIgnoreCase("PosConddtl")){
	    	  sh.appendSql(" AND obj.pccode = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "pccode"));
	           sh.appendSql(" ORDER BY obj.listOrder ");
	      }
	      else {
	    	  sh.appendSql(" ORDER BY obj.listOrder");
	      }
	  	 return find(sh);
	}

	@Override
	public void deleteCode(Object object) {
		this.getHibernateTemplate().delete(object);		
	}

	@Override
	public void updateCode(Object object) {
		this.getHibernateTemplate().update(object);
	}

	@Override
	public void updateCodeSta(Object object) {
		if(ModelUtil.hasProperty(object, "isHalt")){
			String isHalt= (String)ModelUtil.getPropertyValue(object, "isHalt");
			if(isHalt != null && isHalt.equals("T")){
				ModelUtil.setPropertyValue(object, "isHalt", "F");
			}else{
				ModelUtil.setPropertyValue(object, "isHalt", "T");
			}
			this.getHibernateTemplate().update(object);
		}
	}

	@Override
	public List<Object> getSycCodeList(String ename, Object object, String date) {
		// TODO Auto-generated method stub
		 OperationInfo objectInfo = (OperationInfo)object;
		 List<Object> list = null ;
			 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      if(objectInfo.getHotelGroupId()!= null){
		            sh.appendSql(" AND obj.hotelGroupId = ? ");
		            sh.insertValue(objectInfo.getHotelGroupId());
		      }
		      if(objectInfo.getHotelId()!= null){
		            sh.appendSql(" AND obj.hotelId = ? ");
		            sh.insertValue(objectInfo.getHotelId());
		      }
		      if("CodeBase".equalsIgnoreCase(ename)){
		    	    sh.appendSql(" AND obj.parentCode like 'pos_%' ");
		      }
		      // 如果是sysoption 同步 则 比较餐饮营业日期的modifyDatetime 如果大于本地的就同步 不大于就不同步
		      if("SysOption".equalsIgnoreCase(ename)){
		    	  SysOption sysOption =  getSysOptionService().findSysOptionByCatalogItem("pos", "down_for_posbizdate", objectInfo.getHotelGroupId(), objectInfo.getHotelId());
//		    	    sh.appendSql(" AND (obj.item = 'pos_biz_date' or obj.item = 'pos_pic_path') ");
		    	  if(sysOption != null && "T".equalsIgnoreCase(sysOption.getSetValue())){
		    		  sh.appendSql(" AND obj.item <> 'pos_biz_date' ");
		    	  }else{
		    		  sh.appendSql(" AND (obj.item = 'pos_biz_date' or obj.item = 'pos_pic_path') ");
		    	  }		    	  
		      }
		      if(objectInfo.getModifyDatetime()!= null){
		      sh.appendSql(" AND obj.modifyDatetime > ? ");
		      sh.insertValue(objectInfo.getModifyDatetime());
		      }
		      sh.appendSql(" ORDER BY obj.id");
		      if(find(sh).size()>0){
		    	  SQLHelper newsh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
			      if(objectInfo.getHotelGroupId()!= null){
			    	  newsh.appendSql(" AND obj.hotelGroupId = ? ");
			    	  newsh.insertValue(objectInfo.getHotelGroupId());
			      }
			      if(objectInfo.getHotelId()!= null){
			    	  newsh.appendSql(" AND obj.hotelId = ? ");
			    	  newsh.insertValue(objectInfo.getHotelId());
			      }
			      if("CodeBase".equalsIgnoreCase(ename)){
			    	  newsh.appendSql(" AND obj.parentCode like 'pos_%' ");
			      }
			      if("SysOption".equalsIgnoreCase(ename)){
			    	  SysOption sysOption =  getSysOptionService().findSysOptionByCatalogItem("pos", "down_for_posbizdate", objectInfo.getHotelGroupId(), objectInfo.getHotelId());
			    	  if(sysOption != null && "T".equalsIgnoreCase(sysOption.getSetValue())){
			    		  newsh.appendSql(" AND obj.item <> 'pos_biz_date' ");
			    	  }			    	  
			      }
			      newsh.appendSql(" ORDER BY obj.id");
			      list = find(newsh);
		      }
	      return list ;
	}
	@Override
	public List<Object> getSycDaysList(String ename, Object object,
			String date, int days) {
		// TODO Auto-generated method stub
		 OperationInfo objectInfo = (OperationInfo)object;
		 List<Object> list = null ;
		 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
	      if(objectInfo.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(objectInfo.getHotelGroupId());
	      }
	      if(objectInfo.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(objectInfo.getHotelId());
	      }
	      if("PosRes".equalsIgnoreCase(ename)){
	    	   // sh.appendSql(" AND obj.sta in ('R','G') ");
	    	    sh.appendSql(" AND obj.sta <> 'I' ");
	      }
	      if("CodeBase".equalsIgnoreCase(ename)){
	    	    sh.appendSql(" AND obj.parentCode like 'pos_%' ");
	      }
	      if(objectInfo.getModifyDatetime()!= null){
		      sh.appendSql(" AND obj.modifyDatetime > ? ");
		      sh.insertValue(objectInfo.getModifyDatetime());
	      }
	      sh.appendSql(" ORDER BY obj.id");
	      if(find(sh).size()>0){
	    	  SQLHelper newsh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      if(objectInfo.getHotelGroupId()!= null){
		    	  newsh.appendSql(" AND obj.hotelGroupId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelGroupId());
		      }
		      if(objectInfo.getHotelId()!= null){
		    	  newsh.appendSql(" AND obj.hotelId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelId());
		      }
		      if("PosRes".equalsIgnoreCase(ename)){
//		    	    sh.appendSql(" AND obj.sta in ('R','G') ");
		    	    sh.appendSql(" AND obj.sta <> 'I' ");
		      }
		      if(days>0 && days<31){
		    	  newsh.appendSql(" AND obj.modifyDatetime >= ? ");
		          newsh.insertValue( DateUtil.addDays(objectInfo.getModifyDatetime(), -days));
		      }
		      if("CodeBase".equalsIgnoreCase(ename)){
		    	  newsh.appendSql(" AND obj.parentCode like 'pos_%' ");
		      }
		      newsh.appendSql(" ORDER BY obj.id");
		      list = find(newsh);
	      }
	      return list ;
	}

	@Override
	public List<OperationInfo> getSycLocalDateList(String ename, Object object) {
		// TODO Auto-generated method stub
			 OperationInfo objectInfo = (OperationInfo)object;
			 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      if(objectInfo.getHotelGroupId()!= null){
		            sh.appendSql(" AND obj.hotelGroupId = ? ");
		            sh.insertValue(objectInfo.getHotelGroupId());
		      }
		      if(objectInfo.getHotelId()!= null){
		            sh.appendSql(" AND obj.hotelId = ? ");
		            sh.insertValue(objectInfo.getHotelId());
		      }
		      if("PosRes".equalsIgnoreCase(ename)){
		    	    sh.appendSql(" AND obj.sta <> 'I' ");
		      }
		      if("SysOption".equalsIgnoreCase(ename)){
		    	  sh.appendSql(" AND obj.catalog = 'system' and obj.item = 'pos_biz_date' ");
		      }
		      sh.appendSql(" ORDER BY obj.modifyDatetime DESC LIMIT 1 ");
			  return find(sh);
	}

	@Override
	public List<Object> getPosAccntList(String ename, Object object) {
		// TODO Auto-generated method stub
		 OperationInfo objectInfo = (OperationInfo)object;
		 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
	      if(objectInfo.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(objectInfo.getHotelGroupId());
	      }
	      if(objectInfo.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(objectInfo.getHotelId());
	      }
	      if (ModelUtil.hasProperty(objectInfo, "accnt") && (String) ModelUtil.getPropertyValue(objectInfo, "accnt")!= null){
	    	  sh.appendSql(" AND obj.accnt = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "accnt"));
	      }
	      if (ModelUtil.hasProperty(objectInfo, "pcrec") && (String) ModelUtil.getPropertyValue(objectInfo, "pcrec")!= null){
	    	  sh.appendSql(" AND obj.pcrec = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "pcrec"));
	      }
	      sh.appendSql(" ORDER BY obj.modifyDatetime ");
		  return find(sh);
	}

	@Override
	public List<Object> getPosSyncAccntList(String ename, PosAccntSync posAccntSync,String type) {
		// TODO Auto-generated method stub
		 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
	      if(posAccntSync.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(posAccntSync.getHotelGroupId());
	      }
	      if(posAccntSync.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(posAccntSync.getHotelId());
	      }
	      if("res".equalsIgnoreCase(type) && isNotNull(posAccntSync.getResAccnt())){
	    	   sh.appendSql(" AND obj.accnt = ? ");
	           sh.insertValue(posAccntSync.getResAccnt().trim());
	      }
	      else if (isNotNull(posAccntSync.getAccnt())){
	    	   sh.appendSql(" AND obj.accnt = ? ");
	           sh.insertValue(posAccntSync.getAccnt().trim());
	      }
	      sh.appendSql(" ORDER BY obj.modifyDatetime ");
		  return find(sh);
	}

	@Override
	public List<Object> getHotelAnalysis(long hotelGroupId, long hotelId,
			String biz_date) {
		// TODO Auto-generated method stub
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" Call up_pos_biz_hotel_analysis(?,?,?) ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(biz_date);
		return findByNativeSQL(sh);
	}

	@Override
	public Object getCodeDetailHistory(String ename,Object object) {
		// TODO Auto-generated method stub
		OperationInfo objectInfo = (OperationInfo)object;
		 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		 if(objectInfo.getId()!= null){
	            sh.appendSql(" AND obj.id = ? ");
	            sh.insertValue(objectInfo.getId());
	      }
	      if(objectInfo.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(objectInfo.getHotelGroupId());
	      }
	      if(objectInfo.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(objectInfo.getHotelId());
	      }
	      if (ModelUtil.hasProperty(objectInfo, "accnt") && (String) ModelUtil.getPropertyValue(objectInfo, "accnt")!= null){
	    	   sh.appendSql(" AND obj.accnt = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "accnt"));
	      }
	      List<Object> list = new ArrayList<Object>();
	      list.addAll(find(sh)) ;
		  if(list.size() < 1){
			      if(ename.equalsIgnoreCase("PosMaster")){
			    	  ename = ename+"History";
			    	  SQLHelper shHistory = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
			 		 if(objectInfo.getId()!= null){
			 			shHistory.appendSql(" AND obj.id = ? ");
			 			shHistory.insertValue(objectInfo.getId());
			 	      }
			 	      if(objectInfo.getHotelGroupId()!= null){
			 	    	 shHistory.appendSql(" AND obj.hotelGroupId = ? ");
			 	    	shHistory.insertValue(objectInfo.getHotelGroupId());
			 	      }
			 	      if(objectInfo.getHotelId()!= null){
			 	    	 shHistory.appendSql(" AND obj.hotelId = ? ");
			 	    	 shHistory.insertValue(objectInfo.getHotelId());
			 	      }  
			 	     if (ModelUtil.hasProperty(objectInfo, "accnt") && (String) ModelUtil.getPropertyValue(objectInfo, "accnt")!= null){
			 	    	shHistory.appendSql(" AND obj.accnt = ? ");
			 	    	shHistory.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "accnt"));
				      }
			 	      list.addAll(find(shHistory));
			  }
	      }
	      if(list.size()>0){
	    	    return list.get(0);
	      }else return null;
	}

	@Override
	public String updatePosAuditProcess(final long hotelGroupId, final long hotelId) {
		// TODO Auto-generated method stub
		String sql = "{CALL up_pos_audit_init(?,?,?)}";	
		@SuppressWarnings({"unchecked","rawtypes"})
		Object object = getJdbcTemplate().execute(sql,new CallableStatementCallback(){
			public Object doInCallableStatement(CallableStatement cs) throws SQLException, DataAccessException 
			{
			     cs.setLong(1,hotelGroupId);
			     cs.setLong(2,hotelId);
			     cs.registerOutParameter(3,java.sql.Types.VARCHAR);
			     cs.execute();
			     return cs.getString(3);
			}
		});	
		return object.toString().trim();
	}

	@Override
	public List<Object> getSycPmsCodeList(String ename, Object object,
			String date, String type) {
		// TODO Auto-generated method stub
		 OperationInfo objectInfo = (OperationInfo)object;
		 List<Object> list = new ArrayList<Object>() ;
		 if(type.equalsIgnoreCase("HOTEL")){
			 SQLHelper newsh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      if(objectInfo.getHotelGroupId()!= null){
		    	  newsh.appendSql(" AND obj.hotelGroupId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelGroupId());
		      }
		      if(objectInfo.getHotelId()!= null){
		    	  newsh.appendSql(" AND obj.hotelId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelId());
		      }
		      // 如果是sysoption 同步 则 比较餐饮营业日期的modifyDatetime 如果大于本地的就同步 不大于就不同步
		      if("SysOption".equalsIgnoreCase(ename)){
		    	  SysOption sysOption =  getSysOptionService().findSysOptionByCatalogItem("pos", "down_for_posbizdate", objectInfo.getHotelGroupId(), objectInfo.getHotelId());
		    	  if(sysOption != null && "T".equalsIgnoreCase(sysOption.getSetValue())){
		    		  newsh.appendSql(" AND obj.item <> 'pos_biz_date' ");
		    	  }		    	  
		      }
		      newsh.appendSql(" ORDER BY obj.id");
		      list = find(newsh);
			}
		 else if(type.equalsIgnoreCase("GROUP")){
			 //先下载集团的数据 hotelGroupId,hotelId=0
			 SQLHelper newsh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      if(objectInfo.getHotelGroupId()!= null){
		    	  newsh.appendSql(" AND obj.hotelGroupId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelGroupId());
		    	  newsh.appendSql(" AND obj.hotelId = 0 ");
		      }
		      newsh.appendSql(" ORDER BY obj.id");
		      list.addAll(find(newsh));
		      newsh.clear();
		    //再下载集团该酒店的数据 hotelGroupId=?,hotelId=?
		      newsh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      if(objectInfo.getHotelGroupId()!= null){
		    	  newsh.appendSql(" AND obj.hotelGroupId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelGroupId());
		      }
		      if(objectInfo.getHotelId()!= null){
		    	  newsh.appendSql(" AND obj.hotelId = ? ");
		    	  newsh.insertValue(objectInfo.getHotelId());
		      }
		      // 如果是sysoption 同步 则 比较餐饮营业日期的modifyDatetime 如果大于本地的就同步 不大于就不同步
		      if("SysOption".equalsIgnoreCase(ename)){
		    	  SysOption sysOption =  getSysOptionService().findSysOptionByCatalogItem("pos", "down_for_posbizdate", objectInfo.getHotelGroupId(), objectInfo.getHotelId());
		    	  if(sysOption != null && "T".equalsIgnoreCase(sysOption.getSetValue())){
		    		  newsh.appendSql(" AND obj.item <> 'pos_biz_date' ");
		    	  }		    	  
		      }
		      newsh.appendSql(" ORDER BY obj.id");
		      list.addAll(find(newsh));
			}
		 else if(type.equalsIgnoreCase("ALL")){
			  SQLHelper newsh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
		      newsh.appendSql(" ORDER BY obj.id");
		      list = find(newsh);
		 }
		return list;
	}
	
	
	@Override
	public List<ReportCenter> getReportCenterByCategory(long hotelGroupId,long hotelId, String category) {
		SQLHelper sh = new SQLHelper("SELECT obj FROM ReportCenter obj WHERE 1=1 ");
	    sh.appendSql(" AND obj.hotelGroupId = ? ");
	    sh.insertValue(hotelGroupId);
	    sh.appendSql(" AND obj.hotelId = ? ");
	    sh.insertValue(hotelId);
	    sh.appendSql(" AND obj.repCategory = ? ");
	    sh.insertValue(category);
	    sh.appendSql("AND is_halt = 'F' ORDER BY obj.id ");
		 return find(sh);
	}

	@Override
	public String updatePosAuditUpdatePosBizdate(long hotelGroupId, long hotelId) {
		// TODO Auto-generated method stub
		 SQLHelper sh = new SQLHelper(" UPDATE  sys_option SET set_value = DATE_ADD(set_value, INTERVAL 1 DAY),modify_datetime=NOW() WHERE ");
		    sh.appendSql(" hotel_group_id = ? ");
		    sh.insertValue(hotelGroupId);
		    sh.appendSql(" AND hotel_id = ? ");
		    sh.insertValue(hotelId);
		    sh.appendSql("  AND catalog = 'system' AND item = 'pos_biz_date'  ");
		    return this.bulkUpdateByNativeSQL(sh)+"";
	}

	@Override
	public List<Object> getPosAccntContainHistoryList(String ename,
			Object object) {
		List<Object> list = new ArrayList<Object>();
		 OperationInfo objectInfo = (OperationInfo)object;
		 SQLHelper sh = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
	      if(objectInfo.getHotelGroupId()!= null){
	            sh.appendSql(" AND obj.hotelGroupId = ? ");
	            sh.insertValue(objectInfo.getHotelGroupId());
	      }
	      if(objectInfo.getHotelId()!= null){
	            sh.appendSql(" AND obj.hotelId = ? ");
	            sh.insertValue(objectInfo.getHotelId());
	      }
	      if (ModelUtil.hasProperty(objectInfo, "accnt") && (String) ModelUtil.getPropertyValue(objectInfo, "accnt")!= null){
	    	  sh.appendSql(" AND obj.accnt = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "accnt"));
	      }
	      if (ModelUtil.hasProperty(objectInfo, "pcrec") && (String) ModelUtil.getPropertyValue(objectInfo, "pcrec")!= null){
	    	  sh.appendSql(" AND obj.pcrec = ? ");
	           sh.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "pcrec"));
	      }
	      sh.appendSql(" ORDER BY obj.id ");
	      list.addAll(find(sh));
	      if(list.size() < 1){
		      if(ename.equalsIgnoreCase("PosMaster") || ename.equalsIgnoreCase("PosAccount") || ename.equalsIgnoreCase("PosDetail")){
		    	  ename = ename+"History";
		    	  SQLHelper shHistory = new SQLHelper("SELECT obj FROM "+ename+" obj WHERE 1=1 ");
			      if(objectInfo.getHotelGroupId()!= null){
			    	  shHistory.appendSql(" AND obj.hotelGroupId = ? ");
			    	  shHistory.insertValue(objectInfo.getHotelGroupId());
			      }
			      if(objectInfo.getHotelId()!= null){
			    	  shHistory.appendSql(" AND obj.hotelId = ? ");
			    	  shHistory.insertValue(objectInfo.getHotelId());
			      }
			      if (ModelUtil.hasProperty(objectInfo, "accnt") && (String) ModelUtil.getPropertyValue(objectInfo, "accnt")!= null){
			    	  shHistory.appendSql(" AND obj.accnt = ? ");
			    	  shHistory.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "accnt"));
			      }
			      if (ModelUtil.hasProperty(objectInfo, "pcrec") && (String) ModelUtil.getPropertyValue(objectInfo, "pcrec")!= null){
			    	  shHistory.appendSql(" AND obj.pcrec = ? ");
			    	  shHistory.insertValue((String) ModelUtil.getPropertyValue(objectInfo, "pcrec"));
			      }
			      shHistory.appendSql(" ORDER BY obj.id ");
			      list.addAll(find(shHistory));
		      }
	      }
	      return list;
	}

	@Override
	public List<Object> getHotelAnalysisShift(long hotelGroupId, long hotelId,
			String biz_date, String flag) {
		// TODO Auto-generated method stub
		SQLHelper sh = new SQLHelper();
		sh.appendSql(" Call up_pos_biz_hotel_analysis_shift(?,?,?,?) ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(biz_date);
		sh.insertValue(flag);
		return findByNativeSQL(sh);
	}

	@Override
	public List<Object> isCodeExistedCc(Object object)
	{
		if (ModelUtil.hasProperty(object, "code") && ModelUtil.hasProperty(object, "hotelGroupId") && ModelUtil.hasProperty(object, "hotelId")){
			 SQLHelper sh = new SQLHelper("SELECT obj FROM "+object.getClass().getSimpleName()+" obj WHERE 1=1 ");
			 if(ModelUtil.hasProperty(object,"hotelGroupId")){
		            sh.appendSql(" AND obj.hotelGroupId = ? ");
		            sh.insertValue((long)ModelUtil.getPropertyValue(object, "hotelGroupId"));
		      }
		      if(ModelUtil.hasProperty(object,"hotelId")){
		            sh.appendSql(" AND obj.hotelId = ? ");
		            sh.insertValue((long)ModelUtil.getPropertyValue(object, "hotelId"));
		      }
		      if (ModelUtil.hasProperty(object,"code")){
		    		sh.appendSql(" AND obj.code = ? ");
			        sh.insertValue((String)ModelUtil.getPropertyValue(object, "code"));
		      }
		      if (ModelUtil.hasProperty(object, "parentCode"))
			  {
		    	  sh.appendSql(" AND obj.parentCode = ? ");
			        sh.insertValue((String)ModelUtil.getPropertyValue(object, "parentCode"));
			  }
		      return find(sh);
	      }else{
	    	  return null ;
	      }
	}
/*		  List<Object> list = new ArrayList<Object>();
			if (ModelUtil.hasProperty(object, "code") && ModelUtil.hasProperty(object, "descript") && ModelUtil.hasProperty(object, "hotelGroupId") && ModelUtil.hasProperty(object, "hotelId"))
			{
					String code = (String) ModelUtil.getPropertyValue(object, "code");
					String descript = (String) ModelUtil.getPropertyValue(object, "descript");
					Long hotelGroupId = (Long) ModelUtil.getPropertyValue(object, "hotelGroupId");
					String parentCode = null;
					String codeClassName = object.getClass().getName();
					StringBuffer buffer = new StringBuffer().append("select hotelGroupId,hotelId, code,descript from ").append(codeClassName).append(" where hotelGroupId=:hotelGroupId and (code=:code or descript=:descript) ");
					if (ModelUtil.hasProperty(object, "parentCode"))
					{
						parentCode = (String) ModelUtil.getPropertyValue(object,"parentCode");	
						if (parentCode != null)
						{
							buffer.append(" and parentCode=:parentCode");
						}
						else
						{
							buffer.append(" and parentCode is null");
						}
					}					
						
					Query query = getSession().createQuery(buffer.toString());
					query.setLong("hotelGroupId", hotelGroupId);
					query.setString("code", code);
					query.setString("descript", descript);
					if (null != parentCode)
					{
						query.setString("parentCode", parentCode);
					}
					
					list = query.list();
				}				
			
			return list;
	}
	*/

	@Override
	public <T extends EntityInfo> List<T> getDataBySql(Long hotelGroupId,
			Long hotelId, Class<T> clazz, String sql)
	{
		SQLHelper sh = new SQLHelper();
		sh.appendSql(sql);
		return findByNativeSQL(sh, clazz);
	}

	@Override
	public <T extends EntityInfo> List<T> getDataBySql(Class<T> clazz,
			SQLHelper sh)
	{
		return findByNativeSQL(sh, clazz);
	}

	@Override
	public void updatePosAuditDate(long hotelGroupId, long hotelId,String bizSdate, Date bizDate, String userCode,String stationCode) {
		SQLHelper sh = new SQLHelper(" insert pos_audit_date(hotel_group_id,hotel_id,biz_sdate,biz_date,date_begin,audit_user,station) values(?,?,?,?,now(),?,?) ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(bizSdate);
		sh.insertValue(bizDate);
		sh.insertValue(userCode);
		sh.insertValue(stationCode);
	
		bulkUpdateByNativeSQL(sh);
//		findByNativeSQL(sh);
	}

	@Override
	public void updatePosAuditDateEndDate(long hotelGroupId, long hotelId,Date bizDate) {
		SQLHelper sh = new SQLHelper(" update pos_audit_date set date_end = now() where hotel_group_id = ? and hotel_id = ? and biz_date = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(bizDate);	
		bulkUpdateByNativeSQL(sh);
		
	}

	public ISysOptionService getSysOptionService() {
		return sysOptionService;
	}

	public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}

	@Override
	public void deletePosAuditDateByBizDate(long hotelGroupId, long hotelId,Date bizDate) {
		SQLHelper sh = new SQLHelper(" delete from pos_audit_date where hotel_group_id = ? and hotel_id = ? and biz_date = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(bizDate);	
		bulkUpdateByNativeSQL(sh);
	}

	@Override
	public int selectCountPosAuditDate(long hotelGroupId, long hotelId,Date bizDate) {
		// TODO Auto-generated method stub
	    SQLHelper sh = new SQLHelper("SELECT count(*) FROM pos_audit_date obj WHERE hotel_group_id = ? and hotel_id = ? and biz_date = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(bizDate);
		return countByNativeSQL(sh);
	}

	@Override
	public void updateDeleteSqlAllData(String hotelGroupId, String hotelId,String accnt) {
		StringBuilder sb = new StringBuilder();
		SQLHelper sh = new SQLHelper("delete from pos_detail where hotel_group_id = ? and hotel_id = ? and accnt = ? ");
		sh.insertValue(hotelGroupId);
		sh.insertValue(hotelId);
		sh.insertValue(accnt);
		bulkUpdateByNativeSQL(sh);
	}
	
	
}
