package com.jonghoon.happybuy.admin;

public class Admin {

	private int idx;
	private String identi; // 아이디
	private String password;

	public Admin() {}

	public Admin(int idx, String identi, String password) {
		this.idx = idx;
		this.identi = identi;
		this.password = password;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getIdenti() {
		return identi;
	}

	public void setIdenti(String identi) {
		this.identi = identi;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
