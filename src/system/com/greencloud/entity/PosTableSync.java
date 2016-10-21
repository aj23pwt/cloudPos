package com.greencloud.entity;


public class PosTableSync extends OperationInfo {

	private String entityName;
	private String dataFrom;
	private String dataTo;
	private String type;
	private String isSync;
	private String isHalt;
	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getDataFrom() {
		return dataFrom;
	}
	public void setDataFrom(String dataFrom) {
		this.dataFrom = dataFrom;
	}
	public String getDataTo() {
		return dataTo;
	}
	public void setDataTo(String dataTo) {
		this.dataTo = dataTo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIsSync() {
		return isSync;
	}
	public void setIsSync(String isSync) {
		this.isSync = isSync;
	}
	public String getIsHalt() {
		return isHalt;
	}
	public void setIsHalt(String isHalt) {
		this.isHalt = isHalt;
	}
	
}
