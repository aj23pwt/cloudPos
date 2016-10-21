package com.greencloud.facade;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.hibernate.SessionFactory;
import org.hibernate.persister.entity.AbstractEntityPersister;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.greencloud.service.ReceiverOperation;

@Service("syncReceiver")
public class SyncReceiver implements ISyncService {

	@Resource
	private ReceiverOperation operatoin;

	public <T> int syncData(SyncType type, List<T> list,
			List<List<String>> ips, List<String> updateFieldNameList,List<String> keyfields) {
		if (type.equals(SyncType.ADD)) {
			operatoin.saveData(list, true, keyfields);
		} else if (type.equals(SyncType.ADD_EX_ID)) {
			System.out.println("ADD_EX_ID --- syncData");
			operatoin.saveData(list, false, keyfields);
		} else if (type.equals(SyncType.UPDATE)) {
			operatoin.updateData(list, updateFieldNameList);
		}else if (type.equals(SyncType.DELETE)) {
			operatoin.deleteData(list);
		}else if (type.equals(SyncType.UPDATE_KEY)) {
			operatoin.updateDataByKey(list, updateFieldNameList, keyfields);
		}else if (type.equals(SyncType.DELETE_KEY)) {
			operatoin.deleteDataBykey(list, keyfields);
		}

		return 0;
	}

}
