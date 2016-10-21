package com.greencloud.entity;



public class PosPccodeNoteType extends OperationInfo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String pccode;
	private String masterType;
	private String noteCode;
	private String isHalt;
	private Integer listOrder;
	private String isGroup;
	private String groupCode;
	private String codeType;
	public String getPccode() {
		return pccode;
	}
	public void setPccode(String pccode) {
		this.pccode = pccode;
	}
	public String getMasterType() {
		return masterType;
	}
	public void setMasterType(String masterType) {
		this.masterType = masterType;
	}
	public String getNoteCode() {
		return noteCode;
	}
	public void setNoteCode(String noteCode) {
		this.noteCode = noteCode;
	}
	public String getIsHalt() {
		return isHalt;
	}
	public void setIsHalt(String isHalt) {
		this.isHalt = isHalt;
	}
	public Integer getListOrder() {
		return listOrder;
	}
	public void setListOrder(Integer listOrder) {
		this.listOrder = listOrder;
	}
	public String getIsGroup() {
		return isGroup;
	}
	public void setIsGroup(String isGroup) {
		this.isGroup = isGroup;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String getCodeType() {
		return codeType;
	}
	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}
	
}
