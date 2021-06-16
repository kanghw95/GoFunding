package com.funding.sprout.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
	private String userId; // 아이디
	private String userPwd; // 비밀번호
	private String userName; // 이름
	private String userNick; // 닉네임	
	private String userPhone; // 전화번호
	private String userAddress; // 주소
	private String userEmail; // 이메일
	private char gender; // 성별
	private int userAge; // 나이
	private String userFav; // 관심사
	private int point; // 포인트
	private char authority; // 권한
	private Timestamp suspensionStart; // 정지시작일
	private Timestamp suspensionFin; // 정지종료일
	private int reportCnt; // 신고누적횟수
	private Date joinDate; // 가입일
	private Date loginDate; // 최근로그인일자
	private int userNo;
	
	public User() {
	}

	public User(String userId, String userPwd, String userName, String userNick, String userPhone, String userAddress,
			String userEmail, char gender, int userAge, String userFav, int point, char authority,
			Timestamp suspensionStart, Timestamp suspensionFin, int reportCnt, Date joinDate, Date loginDate, int userNo) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userAddress = userAddress;
		this.userEmail = userEmail;
		this.gender = gender;
		this.userAge = userAge;
		this.userFav = userFav;
		this.point = point;
		this.authority = authority;
		this.suspensionStart = suspensionStart;
		this.suspensionFin = suspensionFin;
		this.reportCnt = reportCnt;
		this.joinDate = joinDate;
		this.loginDate = loginDate;
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserFav() {
		return userFav;
	}

	public void setUserFav(String userFav) {
		this.userFav = userFav;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public char getAuthority() {
		return authority;
	}

	public void setAuthority(char authority) {
		this.authority = authority;
	}

	public Timestamp getSuspensionStart() {
		return suspensionStart;
	}

	public void setSuspensionStart(Timestamp suspensionStart) {
		this.suspensionStart = suspensionStart;
	}

	public Timestamp getSuspensionFin() {
		return suspensionFin;
	}

	public void setSuspensionFin(Timestamp suspensionFin) {
		this.suspensionFin = suspensionFin;
	}

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}
	
	public int getUserNo() {
		return userNo;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userNick=" + userNick
				+ ", userPhone=" + userPhone + ", userAddress=" + userAddress + ", userEmail=" + userEmail + ", gender="
				+ gender + ", userAge=" + userAge + ", userFav=" + userFav + ", point=" + point + ", authority="
				+ authority + ", suspensionStart=" + suspensionStart + ", suspensionFin=" + suspensionFin
				+ ", reportCnt=" + reportCnt + ", joinDate=" + joinDate + ", loginDate=" + loginDate + ", userNo=" + userNo + "]";
	}

}

