package com.greencloud.entity;
/**
 * UserRole 角色实体类
 * @author cys
 */
public class UserRole extends OperationInfo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4199489984962578889L;

	/**
	 * 保留id，激活酒店时使用，业务不关心
	 */
	private Long saveId;
	/**
	 * parentId
	 */
	private Long parentId;
	/**
	 * 角色代码
	 */
	private String code;
	/**
	 * 中文描述
	 */
	private String descript;
	/**
	 * 英文描述
	 */
	private String descriptEn;
	/**
	 * 权限缓存id
	 */
	private Long cacheId;
	/**
	 * 是否停用
	 */
	private String isHalt;
	/**
	 * 排序
	 */
	private Integer listOrder;
	
	/**
	 * 是否是集团添加的  当hotel_id!=0时 开始检查此属性
	 */
	private String isGroup;
	/**
	 * 是否是系统的角色，是系统角色，手动无法删除
	 */
	private String isSys;

	public String getIsSys() {
		return isSys;
	}


	public void setIsSys(String isSys) {
		this.isSys = isSys;
	}


	public String getIsGroup() {
		return isGroup;
	}


	public void setIsGroup(String isGroup) {
		this.isGroup = isGroup;
	}


	public UserRole() {
	}

	
	public Long getSaveId() {
		return saveId;
	}


	public void setSaveId(Long saveId) {
		this.saveId = saveId;
	}


	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescript() {
		return this.descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getDescriptEn() {
		return this.descriptEn;
	}

	public void setDescriptEn(String descriptEn) {
		this.descriptEn = descriptEn;
	}

	public void setCacheId(Long cacheId) {
		this.cacheId = cacheId;
	}


	public Long getCacheId() {
		return cacheId;
	}


	public String getIsHalt() {
		return this.isHalt;
	}

	public void setIsHalt(String isHalt) {
		this.isHalt = isHalt;
	}

	public Integer getListOrder() {
		return this.listOrder;
	}

	public void setListOrder(Integer listOrder) {
		this.listOrder = listOrder;
	}



	public Long getParentId() {
		return parentId;
	}



	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

}
