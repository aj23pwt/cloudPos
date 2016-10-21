package com.greencloud.service;

import java.util.List;

public interface IPosSycOperation {

	public <T> void deleteData(List<T> oldlist);

	public <T> void updateData(List<T> oldlist, final List<String> excludeFields);

	public <T> void deleteDataBykey(List<T> oldlist, List<String> keyfields);

	public <T> void updateDataByKey(List<T> oldlist,
			final List<String> excludeFields, List<String> keyfields);

	public <T> void saveData(List<T> oldlist, boolean includeId,
            List<String> keyfields);
	
	public <T> void deleteDataAllTable(List<T> oldlist, List<String> keyfields);
	
	public void updateDeleteSqlAllData(String hotelGroupId,String hotelId,String accnt);
}
