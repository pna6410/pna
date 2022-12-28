package com.pna.dto;

import java.io.Serializable;

public class codeManageDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2935102017635013810L;
	
	private String code;
	private String codeName;
	private String parentCode;
	private String useYn;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
