package com.lunchwb.vo;

import java.util.Date;

public class VoteVo {
	
	//////////////////// vote table ////////////////////
	private int voteNo;
	private int voteMadeUser;
	private int groupNo;
	private Date voteEndTime;
	private String voteItems;
	private String voteResults;
	private int voteState;
	
	//////////////////// vote_members table ////////////////////
	private int voteMemberNo;
	// private int voteNo; (vote table fk)
	private int userNo;
	private String userName;
	private int voteMemberState;
	
	
	///////////// 기타 /////////////////////////////////
	private int userGrade;
	
	////////// 생성자 ////////////////////////////////////////
	
	public VoteVo() {
		
	}

	
	/////////// getter setter ////////////////////////////////

	public int getVoteNo() {
		return voteNo;
	}

	public void setVoteNo(int voteNo) {
		this.voteNo = voteNo;
	}

	public int getVoteMadeUser() {
		return voteMadeUser;
	}

	public void setVoteMadeUser(int voteMadeUser) {
		this.voteMadeUser = voteMadeUser;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public Date getVoteEndTime() {
		return voteEndTime;
	}

	public void setVoteEndTime(Date voteEndTime) {
		this.voteEndTime = voteEndTime;
	}

	public String getVoteItems() {
		return voteItems;
	}

	public void setVoteItems(String voteItems) {
		this.voteItems = voteItems;
	}

	public String getVoteResults() {
		return voteResults;
	}

	public void setVoteResults(String voteResults) {
		this.voteResults = voteResults;
	}

	public int getVoteMemberNo() {
		return voteMemberNo;
	}

	public void setVoteMemberNo(int voteMemberNo) {
		this.voteMemberNo = voteMemberNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getVoteState() {
		return voteState;
	}

	public void setVoteState(int voteState) {
		this.voteState = voteState;
	}


	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getVoteMemberState() {
		return voteMemberState;
	}

	public void setVoteMemberState(int voteMemberState) {
		this.voteMemberState = voteMemberState;
	}
	
	public int getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}

	///// toString //////////////////////////////////////////

	@Override
	public String toString() {
		return "VoteVo [voteNo=" + voteNo + ", voteMadeUser=" + voteMadeUser + ", groupNo=" + groupNo + ", voteEndTime="
				+ voteEndTime + ", voteItems=" + voteItems + ", voteResults=" + voteResults + ", voteState=" + voteState
				+ ", voteMemberNo=" + voteMemberNo + ", userNo=" + userNo + ", userName=" + userName
				+ ", voteMemberState=" + voteMemberState + ", userGrade=" + userGrade + "]";
	}	
			
}
