package com.lunchwb.vo;

public class NotificationVo {
	//////////////////// notification table ////////////////////
	private int notiNo;
	private int userNo;
	
	/* join해서 써야합니다.*/
	// private int notiType;
	private int groupNo;
	private int replyNo;
	private String alertCmt;
	private int notiState;
	
	////////////////////notiNo table ////////////////////
	private int notiType;
	private String notiName;
	
	//////////////이름들 가져오기
	//user
	private String userName;
	
	//group
	private String groupName;
	
	//report cate
	private String reportCateName;
	
	
	
	public NotificationVo() {}

	public NotificationVo(int notiNo, int userNo, int groupNo, int replyNo, String alertCmt, int notiState,
			int notiType, String notiName) {
		this.notiNo = notiNo;
		this.userNo = userNo;
		this.groupNo = groupNo;
		this.replyNo = replyNo;
		this.alertCmt = alertCmt;
		this.notiState = notiState;
		this.notiType = notiType;
		this.notiName = notiName;
	}

	public NotificationVo(int notiNo, int userNo, int groupNo, int replyNo, String alertCmt, int notiState,
			int notiType, String notiName, String userName, String groupName, String reportCateName) {
		super();
		this.notiNo = notiNo;
		this.userNo = userNo;
		this.groupNo = groupNo;
		this.replyNo = replyNo;
		this.alertCmt = alertCmt;
		this.notiState = notiState;
		this.notiType = notiType;
		this.notiName = notiName;
		this.userName = userName;
		this.groupName = groupName;
		this.reportCateName = reportCateName;
	}

	public int getNotiNo() {
		return notiNo;
	}

	public void setNotiNo(int notiNo) {
		this.notiNo = notiNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getAlertCmt() {
		return alertCmt;
	}

	public void setAlertCmt(String alertCmt) {
		this.alertCmt = alertCmt;
	}

	public int getNotiState() {
		return notiState;
	}

	public void setNotiState(int notiState) {
		this.notiState = notiState;
	}

	public int getNotiType() {
		return notiType;
	}

	public void setNotiType(int notiType) {
		this.notiType = notiType;
	}

	public String getNotiName() {
		return notiName;
	}

	public void setNotiName(String notiName) {
		this.notiName = notiName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getReportCateName() {
		return reportCateName;
	}

	public void setReportCateName(String reportCateName) {
		this.reportCateName = reportCateName;
	}

	@Override
	public String toString() {
		return "NotificationVo [notiNo=" + notiNo + ", userNo=" + userNo + ", groupNo=" + groupNo + ", replyNo="
				+ replyNo + ", alertCmt=" + alertCmt + ", notiState=" + notiState + ", notiType=" + notiType
				+ ", notiName=" + notiName + ", userName=" + userName + ", groupName=" + groupName + ", reportCateName="
				+ reportCateName + "]";
	}

	
};
