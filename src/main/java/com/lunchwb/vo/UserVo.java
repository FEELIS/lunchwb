package com.lunchwb.vo;

import java.util.Date;

public class UserVo {
	
	//////////////////// users table ////////////////////
	
	private int userNo;
	private String userEmail;
	private String userPassword;
	private String userName;
	private int userBirthYear;
	private String userSex;
	private String userJoinDate;
	private String userGrade;
	
	
	/* 자동 로그인 */
	private String sessionId;
	private Date limitDate;
	private boolean autoLogin;
	
	
	/* SNS 로그인 */
	private String naverLogin;
	
	
	
	public UserVo() {
	}

	public UserVo(int userNo, String userEmail, String userPassword, String userName, int userBirthYear, String userSex,
			String userJoinDate, String userGrade, String sessionId, Date limitDate, boolean autoLogin,
			String naverLogin) {
		super();
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userBirthYear = userBirthYear;
		this.userSex = userSex;
		this.userJoinDate = userJoinDate;
		this.userGrade = userGrade;
		this.sessionId = sessionId;
		this.limitDate = limitDate;
		this.autoLogin = autoLogin;
		this.naverLogin = naverLogin;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserBirthYear() {
		return userBirthYear;
	}

	public void setUserBirthYear(int userBirthYear) {
		this.userBirthYear = userBirthYear;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserJoinDate() {
		return userJoinDate;
	}

	public void setUserJoinDate(String userJoinDate) {
		this.userJoinDate = userJoinDate;
	}

	public String getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Date getLimitDate() {
		return limitDate;
	}

	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
	}

	public boolean isAutoLogin() {
		return autoLogin;
	}

	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}

	public String getNaverLogin() {
		return naverLogin;
	}

	public void setNaverLogin(String naverLogin) {
		this.naverLogin = naverLogin;
	}

	@Override
	public String toString() {
		return "UserVo [userNo=" + userNo + ", userEmail=" + userEmail + ", userPassword=" + userPassword
				+ ", userName=" + userName + ", userBirthYear=" + userBirthYear + ", userSex=" + userSex
				+ ", userJoinDate=" + userJoinDate + ", userGrade=" + userGrade + ", sessionId=" + sessionId
				+ ", limitDate=" + limitDate + ", autoLogin=" + autoLogin + ", naverLogin=" + naverLogin + "]";
	}
	
	
	
	
	

	
}
