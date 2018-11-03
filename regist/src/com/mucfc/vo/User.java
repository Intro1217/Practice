package com.mucfc.vo;

public class User {
	private int userid;//對應資料庫中的userid
	private String name;//對應資料庫中的name
	private String password;//對應資料庫中的password
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

}
