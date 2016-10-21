package com.greencloud.dao;

import java.util.List;

public interface IPosHibernateDao {
	 public void deleteCodeGroup(Object object, Long hotelGroupId);
	 public void updateCodeGroup(Object object, Long hotelGroupId);
	 public void updateCodeGroupSta(Object object, Long hotelGroupId);
	 public void updateParamGroup(Object object, Long hotelGroupId);
}
