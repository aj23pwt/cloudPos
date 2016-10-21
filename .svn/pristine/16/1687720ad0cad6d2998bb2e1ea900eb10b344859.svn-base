package com.greencloud.service.impl;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.aua.util.SQLHelper;
import com.greencloud.constant.BizExceptionConstant;
import com.greencloud.controller.BasePosSycHttpRequester;
import com.greencloud.dao.IPosIpDao;
import com.greencloud.dao.IPosSubDao;
import com.greencloud.dto.PosUserDto;
import com.greencloud.entity.PosIp;
import com.greencloud.entity.SysOption;
import com.greencloud.exception.BizException;
import com.greencloud.facade.IPmsPosFacadeService;
import com.greencloud.hessian.HessianProxyFactory;
import com.greencloud.hessian.HessianProxyFactoryBean;
import com.greencloud.service.IPosSycOperation;
import com.greencloud.service.ISysOptionService;
import com.greencloud.util.UserManager;

@Service
public class PosSycOperationImpl implements IPosSycOperation {

	@Resource
	private JdbcTemplate jdbctemplatereceiver;
	private ISysOptionService sysOptionService;
	private IPosIpDao posIpDao;
	private IPosSubDao posSubDao;


	private <T> Field[] getFields(T t) {
		Field fields[] = t.getClass().getDeclaredFields();
		if (t.getClass().getSuperclass()!=null && "OperationInfo".equalsIgnoreCase(t.getClass().getSuperclass()
				.getSimpleName())
				|| "EntityInfo".equalsIgnoreCase(t.getClass().getSuperclass()
						.getSimpleName())
                || "EntityInfoUUID".equalsIgnoreCase(t.getClass().getSuperclass()
                        .getSimpleName())) {
			for (Field f : t.getClass().getSuperclass().getDeclaredFields()) {
				if (!"serialVersionUID".equalsIgnoreCase(f.getName()))
					fields = addElement(fields, f);
			}
		}
		if (t.getClass().getSuperclass()!=null && t.getClass().getSuperclass()
                .getSuperclass()!=null && "EntityInfo".equalsIgnoreCase(t.getClass().getSuperclass()
				.getSuperclass().getSimpleName())) {
			for (Field f : t.getClass().getSuperclass().getSuperclass()
					.getDeclaredFields()) {
				if (!"serialVersionUID".equalsIgnoreCase(f.getName()))
					fields = addElement(fields, f);
			}
		}
        if (t.getClass().getSuperclass()!=null && t.getClass().getSuperclass()
                .getSuperclass()!=null && "EntityInfoUUID".equalsIgnoreCase(t.getClass().getSuperclass()
                  .getSuperclass().getSimpleName())) {
            for (Field f : t.getClass().getSuperclass().getSuperclass()
                    .getDeclaredFields()) {
                if (!"serialVersionUID".equalsIgnoreCase(f.getName()))
                    fields = addElement(fields, f);
            }
        }
		return fields;
	}

	private <T> T[] addElement(T[] ori, T addedObj) {
		T[] result = Arrays.copyOf(ori, ori.length + 1);
		result[ori.length] = addedObj;
		return result;
	}

	private <T> void processType(PreparedStatement ps, String fieldname,
			Class<?> fieldType, int setindex, T t)
			throws IntrospectionException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, SQLException {
		PropertyDescriptor prop = new PropertyDescriptor(fieldname,
				t.getClass());
		Method getmethod = prop.getReadMethod();
		if (getmethod.invoke(t) == null) {
			ps.setNull(setindex, Types.NULL);
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.lang.Boolean")) {
			ps.setInt(setindex, Integer.valueOf((Integer) getmethod.invoke(t)));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.lang.String")) {
			ps.setString(setindex, String.valueOf(getmethod.invoke(t)));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase("int")) {
			ps.setInt(setindex, (Integer) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase("long")) {
			ps.setLong(setindex, (Long) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase("double")) {
			ps.setDouble(setindex, (Double) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.lang.Integer")) {
			ps.setInt(setindex, (Integer) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.lang.Long")) {
			ps.setLong(setindex, (Long) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.lang.Double")) {
			ps.setDouble(setindex, (Double) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.util.Date")) {
			// ps.setDate(setindex, new java.sql.Date(
			// ((Date) getmethod.invoke(t)).getTime()));
			ps.setTimestamp(
					setindex,
					new java.sql.Timestamp(((Date) getmethod.invoke(t))
							.getTime()));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"java.math.BigDecimal")) {
			ps.setBigDecimal(setindex, (BigDecimal) getmethod.invoke(t));
		} else if (fieldType.getCanonicalName().equalsIgnoreCase(
				"byte[]")) {
			ps.setObject(setindex, (Object) getmethod.invoke(t));
		}
	}

	private <T> void processField(PreparedStatement ps, Field f, int setindex,
			T t) throws IntrospectionException, IllegalAccessException,
			IllegalArgumentException, InvocationTargetException, SQLException {
		processType(ps, f.getName(), f.getType(), setindex, t);
	}

	/**
	 * 
	 * @param oldlist
	 * @param includeId
	 *            是否包含ID一起插入
	 */
	@Override
	public <T> void saveData(List<T> oldlist, boolean includeId,
            List<String> keyfields) {
    
        if (keyfields != null && keyfields.size() > 0) {
            deleteBeforeInsert(oldlist, keyfields);
        }
		final List<T> list = oldlist;
		if(list.size() == 0){
			return;
		}
		final boolean inId = includeId;
		T type = list.get(0);
		final String sql = getInsertSql(type, includeId);
		BatchPreparedStatementSetter setter = new BatchPreparedStatementSetter() {

			public int getBatchSize() {
				return list.size();
			}

			public void setValues(PreparedStatement ps, int index)
					throws SQLException {
				T t = list.get(index);
				Field fields[] = getFields(t);
				try {
					int setindex = 1;
					for (int i = 0; i < fields.length; i++) {
						if ("serialVersionUID".equalsIgnoreCase(fields[i]
								.getName()))
							continue;

						if (!inId && "id".equalsIgnoreCase(fields[i].getName())) {
							continue;
						}

						if (Modifier.isStatic(fields[i].getModifiers()))
							continue;

						processField(ps, fields[i], setindex, t);

						setindex++;
					}
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IntrospectionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		jdbctemplatereceiver.batchUpdate(sql, setter);

	}

	/**
	 * 
	 * @param oldlist
	 */
	@Override
	public <T> void updateData(List<T> oldlist, final List<String> excludeFields) {
		final List<T> list = oldlist;
		T type = list.get(0);
		final String sql = getUpdateSql(type, excludeFields, null);
		BatchPreparedStatementSetter setter = new BatchPreparedStatementSetter() {

			public int getBatchSize() {
				return list.size();
			}

			public void setValues(PreparedStatement ps, int index)
					throws SQLException {
				T t = list.get(index);
				Field fields[] = getFields(t);
				try {
					int setindex = 1;
					for (int i = 0; i < fields.length; i++) {
						if (excludeFields != null
								&& excludeFields.contains(fields[i].getName()))
							continue;
						if ("serialVersionUID".equalsIgnoreCase(fields[i]
								.getName()))
							continue;

						if ("id".equalsIgnoreCase(fields[i].getName())) {
							continue;
						}

						if (Modifier.isStatic(fields[i].getModifiers()))
							continue;

						processField(ps, fields[i], setindex, t);

						setindex++;
					}

					PropertyDescriptor prop;
					try {
						prop = new PropertyDescriptor("id", t.getClass());
						Method getmethod = prop.getReadMethod();
						ps.setString( setindex, String.valueOf(getmethod.invoke(t)) );
					} catch (IntrospectionException e){
						e.printStackTrace();
					} catch (IllegalAccessException e){
						e.printStackTrace();
					} catch (IllegalArgumentException e){
						e.printStackTrace();
					} catch (InvocationTargetException e){
						e.printStackTrace();
					}

				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IntrospectionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		jdbctemplatereceiver.batchUpdate(sql, setter);

	}

	@Override
	public <T> void deleteData(List<T> oldlist) {
		final List<T> list = oldlist;
		T type = list.get(0);
		final String sql = getDeleteSql(type, null);
		List deleteArgsList = new ArrayList();
		for (T t : oldlist) {

			PropertyDescriptor prop;
			try {
				prop = new PropertyDescriptor("id", t.getClass());
				Method getmethod = prop.getReadMethod();
				deleteArgsList.add(new Object[] { String.valueOf( getmethod
						.invoke(t)) });
			} catch (IntrospectionException e){
				e.printStackTrace();
			} catch (IllegalAccessException e){
				e.printStackTrace();
			} catch (IllegalArgumentException e){
				e.printStackTrace();
			} catch (InvocationTargetException e){
				e.printStackTrace();
			}

		}

		int[] rslts = jdbctemplatereceiver.batchUpdate(sql, deleteArgsList);

	}

	@Override
	public <T> void deleteDataBykey(List<T> oldlist, List<String> keyfields) {
		final List<T> list = oldlist;
		T type = list.get(0);
		if(queryForCount(type, keyfields)!=1)
			throw new RuntimeException("deleteDataBykey : not one line");
		final String sql = getDeleteSql(type, keyfields);
		List deleteArgsList = new ArrayList();
		for (T t : oldlist) {

			PropertyDescriptor prop;
			try {
				if (keyfields != null) {
					Object[] objarr = new Object[keyfields.size()];
					int i = 0;
					for (String key : keyfields) {
						prop = new PropertyDescriptor(key, t.getClass());
						Method getmethod = prop.getReadMethod();
						objarr[i] = getmethod.invoke(t);
						i++;
					}
					deleteArgsList.add(objarr);
				} else {
					prop = new PropertyDescriptor("id", t.getClass());
					Method getmethod = prop.getReadMethod();
					deleteArgsList.add(new Object[] { String
							.valueOf( getmethod.invoke(t)) });
				}

			} catch (IntrospectionException e){
				e.printStackTrace();
			} catch (IllegalAccessException e){
				e.printStackTrace();
			} catch (IllegalArgumentException e){
				e.printStackTrace();
			} catch (InvocationTargetException e){
				e.printStackTrace();
			}

		}

		int[] rslts = jdbctemplatereceiver.batchUpdate(sql, deleteArgsList);

	}

	
    private <T> void deleteBeforeInsert(List<T> oldlist, List<String> keyfields) {
        final List<T> list = oldlist;
        T type = list.get(0);
        final String sql = getDeleteSql(type, keyfields);
        List deleteArgsList = new ArrayList();
        for (T t : oldlist) {

            PropertyDescriptor prop;
            try {
                if (keyfields != null) {
                    Object[] objarr = new Object[keyfields.size()];
                    int i = 0;
                    for (String key : keyfields) {
                        prop = new PropertyDescriptor(key, t.getClass());
                        Method getmethod = prop.getReadMethod();
                        objarr[i] = getmethod.invoke(t);
                        i++;
                    }
                    deleteArgsList.add(objarr);
                } else {
                    prop = new PropertyDescriptor("id", t.getClass());
                    Method getmethod = prop.getReadMethod();
                    deleteArgsList.add(new Object[] { String
                            .valueOf( getmethod.invoke(t)) });
                }

            } catch (IntrospectionException e){
				e.printStackTrace();
			} catch (IllegalAccessException e){
				e.printStackTrace();
			} catch (IllegalArgumentException e){
				e.printStackTrace();
			} catch (InvocationTargetException e){
				e.printStackTrace();
			}

        }

        int[] rslts = jdbctemplatereceiver.batchUpdate(sql, deleteArgsList);

    }
	@Override
	public <T> void updateDataByKey(List<T> oldlist,
			final List<String> excludeFields, final List<String> keyfields) {
		
		final List<T> list = oldlist;
		T type = list.get(0);
		if(queryForCount(type, keyfields)!=1)
			throw new RuntimeException("update data by key : not one line");
		final String sql = getUpdateSql(type, excludeFields, keyfields);
		BatchPreparedStatementSetter setter = new BatchPreparedStatementSetter() {

			public int getBatchSize() {
				return list.size();
			}

			public void setValues(PreparedStatement ps, int index)
					throws SQLException {
				T t = list.get(index);
				Field fields[] = getFields(t);
				try {
					int setindex = 1;
					for (int i = 0; i < fields.length; i++) {
						if (excludeFields != null
								&& excludeFields.contains(fields[i].getName()))
							continue;
						if ("serialVersionUID".equalsIgnoreCase(fields[i]
								.getName()))
							continue;

						if ("id".equalsIgnoreCase(fields[i].getName())) {
							continue;
						}

						if (Modifier.isStatic(fields[i].getModifiers()))
							continue;

						processField(ps, fields[i], setindex, t);

						setindex++;
					}

					PropertyDescriptor prop;
					try {
						if (keyfields != null) {
							int i = 0;
							for (String key : keyfields) {
								prop = new PropertyDescriptor(key, t.getClass());
								Method getmethod = prop.getReadMethod();
								
								processType(ps, key, getmethod.getReturnType(), setindex, t);
								setindex ++;
							}
						} else {
							prop = new PropertyDescriptor("id", t.getClass());
							Method getmethod = prop.getReadMethod();
							ps.setString( setindex, String.valueOf(getmethod.invoke(t)) );
						}
					} catch (IntrospectionException e){
						e.printStackTrace();
					} catch (IllegalAccessException e){
						e.printStackTrace();
					} catch (IllegalArgumentException e){
						e.printStackTrace();
					} catch (InvocationTargetException e){
						e.printStackTrace();
					}

				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IntrospectionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		};
		jdbctemplatereceiver.batchUpdate(sql, setter);

	}

	private <T> String getDeleteSql(T t, List<String> keyfields) {
		StringBuilder sb = new StringBuilder();
		sb.append("delete from ");
		String className = t.getClass().getSimpleName();
		className = Introspector.decapitalize(className);
		String[] r = className.split("(?=\\p{Upper})");
		sb.append(StringUtils.join(r, "_"));
		sb.append(" where ");
		if (keyfields == null)
			sb.append("id = ?");
		else {
			for (int i = 0; i < keyfields.size(); i++) {
				String[] r1 = keyfields.get(i).split("(?=\\p{Upper})");
				sb.append(StringUtils.join(r1, "_"));
				sb.append(" = ?");
				if (i != keyfields.size() - 1)
					sb.append(" and ");
			}
		}
		if("SysOption".equalsIgnoreCase(className)){
			 if("T".equalsIgnoreCase(remoteGetSysOptionValue(UserManager.getHotelGroupId(),UserManager.getHotelId(),"pos","down_for_posbizdate"))){
				 sb.append(" and item <> 'pos_biz_date' ");
			 }
//	    	  SysOption sysOption = new SysOption();
//	    	  sysOption.setCatalog("pos");
//	    	  sysOption.setItem("down_for_posbizdate");
//	    	  List<SysOption> SysOptionList = sysOptionService.listSysOption(sysOption);
//	    	  if(SysOptionList != null && SysOptionList.size() > 0 && "T".equalsIgnoreCase(SysOptionList.get(0).getSetValue())){
//	    		  sb.append(" and item <> 'pos_biz_date' ");
//	    	  }			
		}
		return sb.toString();
	}
// 针对全表同步的entity,先删除表数据
	@Override
	public <T> void deleteDataAllTable(List<T> oldlist, List<String> keyfields) {
		final List<T> list = oldlist;
		T type = list.get(0);
		final String sql = deleteDataAllTableSql(type, keyfields);
		jdbctemplatereceiver.execute(sql);
	}
	private <T> String deleteDataAllTableSql(T t, List<String> keyfields) {
		StringBuilder sb = new StringBuilder();
		sb.append("delete from ");
		String className = t.getClass().getSimpleName();
		className = Introspector.decapitalize(className);
		String[] r = className.split("(?=\\p{Upper})");
		sb.append(StringUtils.join(r, "_"));
		if("SysOption".equalsIgnoreCase(className)){			
			 if("T".equalsIgnoreCase(remoteGetSysOptionValue(UserManager.getHotelGroupId(),UserManager.getHotelId(),"pos","down_for_posbizdate"))){
				 sb.append(" where item <> 'pos_biz_date' ");
			 }
//	    	  SysOption sysOption = new SysOption();
//	    	  sysOption.setCatalog("pos");
//	    	  sysOption.setItem("down_for_posbizdate");
//	    	  List<SysOption> SysOptionList = sysOptionService.listSysOption(sysOption);
//	    	  if(SysOptionList != null && SysOptionList.size() > 0 && "T".equalsIgnoreCase(SysOptionList.get(0).getSetValue())){
//	    		  sb.append(" where item <> 'pos_biz_date' ");
//	    	  }					
		}
//		if (keyfields != null)
//	    {
//			sb.append(" where ");
//			for (int i = 0; i < keyfields.size(); i++) {
//				String[] r1 = keyfields.get(i).split("(?=\\p{Upper})");
//				sb.append(StringUtils.join(r1, "_"));
//				sb.append(" = ?");
//				if (i != keyfields.size() - 1)
//					sb.append(" and ");
//			}
//		}
		return sb.toString();
	}
	
	private <T> String getInsertSql(T t) {
		return getInsertSql(t, true);
	}

	private <T> String getInsertSql(T t, boolean includeId) {
		StringBuilder sb = new StringBuilder();
		sb.append("insert into ");
		String className = t.getClass().getSimpleName();
		className = Introspector.decapitalize(className);
		String[] r = className.split("(?=\\p{Upper})");
		sb.append(StringUtils.join(r, "_"));

		sb.append(" (");
		Field fields[] = getFields(t);
		for (int i = 0; i < fields.length; i++) {
			if ("serialVersionUID".equalsIgnoreCase(fields[i].getName()))
				continue;

			if (!includeId && "id".equalsIgnoreCase(fields[i].getName())) {
				continue;
			}

			if (Modifier.isStatic(fields[i].getModifiers()))
				continue;

			String[] r1 = fields[i].getName().split("(?=\\p{Upper})");
			sb.append(StringUtils.join(r1, "_"));
			if (i != fields.length - 1)
				sb.append(",");
		}
		sb.append(")");
		sb.append("values (");
		for (int i = 0; i < fields.length; i++) {
			if ("serialVersionUID".equalsIgnoreCase(fields[i].getName()))
				continue;
			if (!includeId && "id".equalsIgnoreCase(fields[i].getName())) {
				continue;
			}
			if (Modifier.isStatic(fields[i].getModifiers()))
				continue;
			sb.append("?");
			if (i != fields.length - 1)
				sb.append(",");
		}
		sb.append(")");
		return sb.toString();
	}

	private <T> String getUpdateSql(T t, List<String> excludeFields,
			List<String> keyfields) {
		String id = null;
		StringBuilder sb = new StringBuilder();
		sb.append("update ");
		String className = t.getClass().getSimpleName();
		className = Introspector.decapitalize(className);
		String[] r = className.split("(?=\\p{Upper})");
		sb.append(StringUtils.join(r, "_"));

		sb.append(" set ");
		Field fields[] = getFields(t);
		for (int i = 0; i < fields.length; i++) {
			if (excludeFields != null
					&& excludeFields.contains(fields[i].getName()))
				continue;
			if ("serialVersionUID".equalsIgnoreCase(fields[i].getName()))
				continue;

			if ("id".equalsIgnoreCase(fields[i].getName())) {
				continue;
			}

			if (Modifier.isStatic(fields[i].getModifiers()))
				continue;

			String[] r1 = fields[i].getName().split("(?=\\p{Upper})");
			sb.append(StringUtils.join(r1, "_"));
			sb.append(" = ?");
			if (i != fields.length - 1)
				sb.append(",");
		}
		sb.append(" where ");
		if (keyfields == null)
			sb.append("id = ?");
		else {
			for (int i = 0; i < keyfields.size(); i++) {
				String[] r1 = keyfields.get(i).split("(?=\\p{Upper})");
				sb.append(StringUtils.join(r1, "_"));
				sb.append(" = ?");
				if (i != keyfields.size() - 1)
					sb.append(" and ");
			}
		}

		return sb.toString();
	}
	@SuppressWarnings("unused")
	private <T> int queryForCount(T t, List<String> keyfields){
		List deleteArgsList = new ArrayList();
		PropertyDescriptor prop;
		Object[] objarr = null;
		try {
			if (keyfields != null) {
				objarr = new Object[keyfields.size()];
				int i = 0;
				for (String key : keyfields) {
					prop = new PropertyDescriptor(key, t.getClass());
					Method getmethod = prop.getReadMethod();
					objarr[i] = getmethod.invoke(t);
					i++;
				}
				deleteArgsList.add(objarr);
			} else {
				prop = new PropertyDescriptor("id", t.getClass());
				Method getmethod = prop.getReadMethod();
				deleteArgsList.add(new Object[] { String
						.valueOf( getmethod.invoke(t)) });
			}

		} catch (IntrospectionException e){
			e.printStackTrace();
		} catch (IllegalAccessException e){
			e.printStackTrace();
		} catch (IllegalArgumentException e){
			e.printStackTrace();
		} catch (InvocationTargetException e){
			e.printStackTrace();
		}
		
		return jdbctemplatereceiver.queryForInt(getQueryCountSql(t,keyfields), objarr);
	}
	private <T> String getQueryCountSql (T t, List<String> keyfields){
		StringBuilder sb = new StringBuilder();
		sb.append("select count(*) from ");
		String className = t.getClass().getSimpleName();
		className = Introspector.decapitalize(className);
		String[] r = className.split("(?=\\p{Upper})");
		sb.append(StringUtils.join(r, "_"));

		sb.append(" where ");
		if (keyfields == null)
			sb.append("id = ?");
		else {
			for (int i = 0; i < keyfields.size(); i++) {
				String[] r1 = keyfields.get(i).split("(?=\\p{Upper})");
				sb.append(StringUtils.join(r1, "_"));
				sb.append(" = ?");
				if (i != keyfields.size() - 1)
					sb.append(" and ");
			}
		}
		return sb.toString();
	}

	public ISysOptionService getSysOptionService() {
		return sysOptionService;
	}

	public void setSysOptionService(ISysOptionService sysOptionService) {
		this.sysOptionService = sysOptionService;
	}
	
	private String getRemoteIp(long hotelGroupId, long hotelId){
		PosIp posIp = new PosIp();
		posIp.setHotelGroupId(hotelGroupId);
		posIp.setHotelId(hotelId);
		posIp.setCode("RPOS");
		List<PosIp> list = posIpDao.list(posIp);
		if(list != null && list.size()>0){
			PosIp posIpGet = list.get(0);
			return posIpGet.getServerIp();
		}else{
			return "";
		}
	}

	public IPosIpDao getPosIpDao() {
		return posIpDao;
	}

	public void setPosIpDao(IPosIpDao posIpDao) {
		this.posIpDao = posIpDao;
	}
	
	@SuppressWarnings("unchecked")
	public <T> T findInterfaceWithIp(String ip,Class<T> class1) {
		 String className = class1.getName();
	        if (className.lastIndexOf(".") > -1) {
	            className = className.substring(className.lastIndexOf(".") + 1);
	        }

	        // FICommonFacadeService
	        if (className.startsWith("FI")) {
	            className = Character.toLowerCase(className.charAt(0)) + className.substring(2);
	        } else {
	            className = Character.toLowerCase(className.charAt(1)) + className.substring(2);
	        }

	        if (ip != null) {
	            if (ip.indexOf("http://") == -1) {
	                ip = "http://" + ip;
	            }
	            String url = ip + "/";
	            url = url + className;
	            
	            
	            HessianProxyFactoryBean factory = new HessianProxyFactoryBean();
	            
	            HessianProxyFactory hpf = new HessianProxyFactory();
	            hpf.setOverloadEnabled(true);
	            
	            factory.setProxyFactory(hpf);
	            factory.setServiceUrl(url);
	            factory.setServiceInterface(class1);
	            factory.afterPropertiesSet();
	            return (T)factory.getObject();
	        }
	        
	        return null;
        
//        throw new BizException("参数错误.",BizExceptionConstant.INVALID_PARAM);
    }
	
	private String remoteGetSysOptionValue(long hotelGroupId,long hotelId,String catalog,String item){
		Map<String, String> params = new HashMap<String, String>();
		params.put("hotelGroupId", String.valueOf(UserManager.getHotelGroupId()));
		params.put("hotelId", String.valueOf(UserManager.getHotelId()));
		params.put("catalog","pos");
		params.put("item", "down_for_posbizdate");

		Map<String, String> propertys = new HashMap<String, String>();
		propertys.put("Charset", "UTF-8");
		propertys.put("Content-Type", "application/json");

		BasePosSycHttpRequester hp = new BasePosSycHttpRequester();
		String setValue = "F";
		
		String sycUrl = getRemoteIp(UserManager.getHotelGroupId(),UserManager.getHotelId());			
		String url = sycUrl + "/PosSycRemoteGet/getSysoptionValue.do";
		String response;
		try {
			response = hp.sendGet(url, params, propertys, "UTF-8")
			 	.getContent();
			JSONObject j = JSON.parseObject(response);
			setValue = j.getString("obj");
		 } catch (IOException e) {
			e.printStackTrace();
		 }
		
		 return setValue;
	}

	@Override
	public void updateDeleteSqlAllData(String hotelGroupId,String hotelId,String accnt) {
		posSubDao.updateDeleteSqlAllData(hotelGroupId, hotelId, accnt);
	}

	public IPosSubDao getPosSubDao() {
		return posSubDao;
	}

	public void setPosSubDao(IPosSubDao posSubDao) {
		this.posSubDao = posSubDao;
	}
}
