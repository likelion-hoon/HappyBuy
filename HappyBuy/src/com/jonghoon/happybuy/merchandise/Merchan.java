package com.jonghoon.happybuy.merchandise;

public class Merchan {

	private String identiChar; // 판별번호
	private String title; // 제목
	private String description; // 설명
	private int price; // 가격
	private String uploadDate; // 물품을 올린 날짜
	private String dueDate; // 물품 판매 마감 날짜
	private String picUrl; // 물품 사진 경로
	private int user_id; // user_id(외래키), 이걸로 email값을 얻을 수 있다.

	public Merchan() {}

	// 필드 모두 사용 생성자
	public Merchan(String identiChar, String title, String description, int price,  String dueDate,
			String picUrl, int user_id) {
		
		this.identiChar = identiChar;
		this.title = title;
		this.description = description; 
		this.price = price;
		this.dueDate = dueDate;
		this.picUrl = picUrl;
		this.user_id = user_id; 
	}

	public String getIdentiChar() {
		return identiChar;
	}

	public void setIdentiChar(String identiChar) {
		this.identiChar = identiChar;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

}
