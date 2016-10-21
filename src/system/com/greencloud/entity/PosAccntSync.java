package com.greencloud.entity;


public class PosAccntSync extends OperationInfo {

	private String entityName;
	private String accnt;
	private String resAccnt;
	private String type;
	private String isSync;
	private String isHalt;
	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getAccnt() {
		return accnt;
	}
	public void setAccnt(String accnt) {
		this.accnt = accnt;
	}
	public String getResAccnt() {
		return resAccnt;
	}
	public void setResAccnt(String resAccnt) {
		this.resAccnt = resAccnt;
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
