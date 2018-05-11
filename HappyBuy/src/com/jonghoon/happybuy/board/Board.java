package com.jonghoon.happybuy.board;

public class Board {

	private int idx; // 글 번호, auto increment
	private String title; // 글 제목
	private String content; // 글 내용
	private String name; // 작성자 
	private int hit; // 조회수, default 0
	private int recom; // 추천수, default 0
	private String date; // 작성시간, default CURRENT_TIMESTAMP(현재시간)

	public Board() {}

	// 실제 입력받는건 title과 content과 name
	public Board(String title, String content, String name) {
		this.title = title;
		this.content = content;
		this.name = name; 
	}
	
	// 전체값 입력받는 생성자
	public Board(int idx, String title, String content, String name, int hit, int recom, String date) {
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.name = name;
		this.hit = hit;
		this.recom = recom;
		this.date = date;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRecom() {
		return recom;
	}

	public void setRecom(int recom) {
		this.recom = recom;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
