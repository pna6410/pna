package com.pna.dto;

import java.io.Serializable;

public class menuManageDto implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2615264139770626531L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private long menuId;
	private String menuName;
	private long parentMenuId;
	private String programUrl;
	private long sortNo;
	private String systemGrade;
	private String useYn;
	private int level;
	private String projectId;

	public long getMenuId() {
		return menuId;
	}
	public void setMenuId(long menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public long getParentMenuId() {
		return parentMenuId;
	}
	public void setParentMenuId(long parentMenuId) {
		this.parentMenuId = parentMenuId;
	}
	public String getProgramUrl() {
		return programUrl;
	}
	public void setProgramUrl(String programUrl) {
		this.programUrl = programUrl;
	}
	public long getSortNo() {
		return sortNo;
	}
	public void setSortNo(long sortNo) {
		this.sortNo = sortNo;
	}
	public String getSystemGrade() {
		return systemGrade;
	}
	public void setSystemGrade(String systemGrade) {
		this.systemGrade = systemGrade;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	

}
