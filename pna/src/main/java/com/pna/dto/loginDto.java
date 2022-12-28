package com.pna.dto;

import java.io.Serializable;

public class loginDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6436224653189203863L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	private String userId;
	
	private String userName;
	
	private String userPw;

	private String userGrade;

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

	
	

}
