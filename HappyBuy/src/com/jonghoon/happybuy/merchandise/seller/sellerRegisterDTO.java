package com.jonghoon.happybuy.merchandise.seller;

public class sellerRegisterDTO {

	private String email;
	private String reason;
	private String date;

	public sellerRegisterDTO() {}

	public sellerRegisterDTO(String email, String reason) {
		this.email = email;
		this.reason = reason;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
