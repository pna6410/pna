package com.pna.dto;

import java.io.Serializable;

public class mainManageDto  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2615264139770626531L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	private int id;
	private String name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}
