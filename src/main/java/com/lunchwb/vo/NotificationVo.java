package com.lunchwb.vo;

public class NotificationVo {
	//////////////////// notification table ////////////////////
	private int notiNo;
	private int userNo;
	
	/* join해서 써야합니다.*/
	// private int notiType;
	private int groupNo;
	private int replyNo;
	private String alertComment;
	private int notiState;
	
	
	////////////////////notiNo table ////////////////////
	private int notiType;
	private String notiName;
	
	
	public NotificationVo() {}

	public NotificationVo(int notiNo, int userNo, int groupNo, int replyNo, String alertComment, int notiState,
			int notiType, String notiName) {
		this.notiNo = notiNo;
		this.userNo = userNo;
		this.groupNo = groupNo;
		this.replyNo = replyNo;
		this.alertComment = alertComment;
		this.notiState = notiState;
		this.notiType = notiType;
		this.notiName = notiName;
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

	public String getAlertComment() {
		return alertComment;
	}

	public void setAlertComment(String alertComment) {
		this.alertComment = alertComment;
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

	@Override
	public String toString() {
		return "NotificationVo [notiNo=" + notiNo + ", userNo=" + userNo + ", groupNo=" + groupNo + ", replyNo="
				+ replyNo + ", alertComment=" + alertComment + ", notiState=" + notiState + ", notiType=" + notiType
				+ ", notiName=" + notiName + "]";
	}
	
};
