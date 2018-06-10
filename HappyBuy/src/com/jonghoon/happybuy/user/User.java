package com.jonghoon.happybuy.user;

// User의 컬럼은 8개
public class User {

	private int idx; // 유저번호, auto increment
	private String email; // 이메일
	private String password; // 비밀번호
	private String number; // 주민등록 번호, 앞 6자리
	private boolean gender; // 성별
	private String address; // 주소, 배송을 위해서 필요함
	private String pnumber; // 핸드폰 번호, 문자 전송을 위해서 필요함
	private String point; // 활동 점수, 홈페이지 활동을 하면 증가함, default 0 설정
	private String profilePath; // 이미지 프로필 경로 저장
	private boolean isSeller; // 고객, 판매자 확인 필드
	private String emailHash; // 이메일 확인 해시값
	private boolean emailChecked; // 이메일 확인 여부
	
	public User() {}

	// 로그인할때 사용
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}

	// 회원가입할때 사용
	public User(String email, String password, String number, boolean gender, String address, String pnumber) {
		this.email = email;
		this.password = password;
		this.number = number;
		this.gender = gender;
		this.address = address;
		this.pnumber = pnumber;
	}

	// 회원정보 수정할때 사용
	public User(int idx, String password, String address, String pnumber, String profilePath) {
		this.idx = idx;
		this.password = password;
		this.address = address;
		this.pnumber = pnumber;
		this.profilePath = profilePath;
	}

	// 전체 생성자 저장
	public User(String email, String password, String number, boolean gender, String address, String pnumber,
			 String profilePath, String emailHash, boolean emailChecked) {
		
		this.email = email;
		this.password = password;
		this.number = number;
		this.gender = gender;
		this.address = address;
		this.pnumber = pnumber;
		this.profilePath = profilePath;
		this.emailHash = emailHash;
		this.emailChecked = emailChecked;
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

	public boolean isSeller() {
		return isSeller;
	}

	public void setSeller(boolean isSeller) {
		this.isSeller = isSeller;
	}

	public String getEmailHash() {
		return emailHash;
	}

	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}

	public boolean isEmailChecked() {
		return emailChecked;
	}

	public void setEmailChecked(boolean emailChecked) {
		this.emailChecked = emailChecked;
	}
}
