package com.jonghoon.happybuy.reply;

public class Reply {
	
	private int idx; 
	private String content; 
	private String date; 
	private int board_id;  // 외래키, getReplyList()에 사용됨
	private int user_id; // 외래키, user의 email 알아 낼때 사용됨
	
	public Reply() {}
	
	// createReply 할때 사용할 생성자
	public Reply(String content, int board_id, int user_id) {
		this.content = content; 
		this.board_id = board_id; 
		this.user_id = user_id; 
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
}
