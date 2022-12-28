package com.pna.dto.db;

import java.io.Serializable;

public class pnauserDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6192405595935017688L;
	
	private String userId;
	private String userName;
	private String userPw;
	private String userGrade;
	private String useYn;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}	
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
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