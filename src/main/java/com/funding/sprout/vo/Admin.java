package com.funding.sprout.vo;


public class Admin {

	private String adminId; // 아이디
	private String adminPwd; // 비밀번호
	private String adminName; // 이름
	private String adminNick; // 닉네임
	private String adminPhone; // 전화번호
	private String adminAddress; // 주소
	private String adminEmail; // 이메일
	private char gender; // 성별
	private int adminAge; // 나이
	private char authority; // 권한
	
	public Admin() {
		
	}

	public Admin(String adminId, String adminPwd, String adminName, String adminNick, String adminPhone,
			String adminAddress, String adminEmail, char gender, int adminAge, char authority) {
		super();
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminName = adminName;
		this.adminNick = adminNick;
		this.adminPhone = adminPhone;
		this.adminAddress = adminAddress;
		this.adminEmail = adminEmail;
		this.gender = gender;
		this.adminAge = adminAge;
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminPwd=" + adminPwd + ", adminName=" + adminName + ", adminNick="
				+ adminNick + ", adminPhone=" + adminPhone + ", adminAddress=" + adminAddress + ", adminEmail="
				+ adminEmail + ", gender=" + gender + ", adminAge=" + adminAge + ", authority=" + authority + "]";
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminNick() {
		return adminNick;
	}

	public void setAdminNick(String adminNick) {
		this.adminNick = adminNick;
	}

	public String getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(String adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getAdminAddress() {
		return adminAddress;
	}

	public void setAdminAddress(String adminAddress) {
		this.adminAddress = adminAddress;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getAdminAge() {
		return adminAge;
	}

	public void setAdminAge(int adminAge) {
		this.adminAge = adminAge;
	}

	public char getAuthority() {
		return authority;
	}

	public void setAuthority(char authority) {
		this.authority = authority;
	}

}
