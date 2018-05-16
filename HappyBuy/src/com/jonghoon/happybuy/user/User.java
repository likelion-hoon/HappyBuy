package com.jonghoon.happybuy.user;

// User의 컬럼은 8개
public class User {
	
	private int idx; 		   // 유저번호, auto increment
	private String email; 	   // 이메일
	private String password;   // 비밀번호
	private String number;     // 주민등록 번호, 앞 6자리
	private boolean gender;    // 성별
	private String address;    // 주소, 배송을 위해서 필요함
	private String pnumber;    // 핸드폰 번호, 문자 전송을 위해서 필요함
	private String point;      // 활동 점수, 홈페이지 활동을 하면 증가함, default 0 설정
	private String profilePath; // 이미지 프로필 경로 저장
	
	public User() { }
	
	// 로그인할때 jsp:setProperty 에서 사용 (login_proc.jsp)
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
	public User(String email, String password, String number, boolean gender, String address, String pnumber) {
		this.email = email;
		this.password = password;
		this.number = number;
		this.gender = gender;
		this.address = address;
		this.pnumber = pnumber;
	}
	
	// 전체 생성자 저장
	public User(int idx, String email, String password, String number, boolean gender, String address,
			String pnumber, String point, String profilePath) {
		
		this.idx = idx;
		this.email = email;
		this.password = password;
		this.number = number;
		this.gender = gender;
		this.address = address;
		this.pnumber = pnumber;
		this.point = point;
		this.profilePath = profilePath; 
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getProfilePath() {
		return profilePath;
	}
	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}
}
