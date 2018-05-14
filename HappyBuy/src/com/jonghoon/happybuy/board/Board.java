package com.jonghoon.happybuy.board;

public class Board {

	private int idx; // 글 번호, auto increment
	private String title; // 글 제목
	private String content; // 글 내용
	private String name; // 작성자 
	private int hit; // 조회수, default 0
	private int recom; // 추천수, default 0
	private String date; // 작성시간, default CURRENT_TIMESTAMP(현재시간)
	private String fileName; // 게시판에 보여지는 파일이름
	private String fileRealName; // 실제 파일이름
	
	public Board() {}
	
	// idx, title, content, fileName, fileRealName 5개 입력받음
	public Board(int idx, String title, String content, String fileName, String fileRealName) {
		this.idx = idx; 
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}

	// createBoard에서 사용, title, content, name, fileName, fileRealName 5개 입력받음
	public Board(String title, String content, String name, String fileName, String fileRealName) {
		this.title = title;
		this.content = content;
		this.name = name; 
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}
	
	// 전체값 입력받는 생성자
	public Board(int idx, String title, String content, String name, int hit, int recom, String date, String fileName,
			String fileRealName) {
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.name = name;
		this.hit = hit;
		this.recom = recom;
		this.date = date;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	

}
