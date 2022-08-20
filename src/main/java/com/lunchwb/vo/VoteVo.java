package com.lunchwb.vo;

import java.util.Date;
import java.util.List;

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
	private int voteVoted;
	
	
	///////////// 기타 /////////////////////////////////
	private int userGrade;
	private List<StoreVo> voteStoreInfo;
	private List<Integer> voteResultList;
	
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
	
	public int getVoteVoted() {
		return voteVoted;
	}

	public void setVoteVoted(int voteVoted) {
		this.voteVoted = voteVoted;
	}

	public int getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}
	
	public List<StoreVo> getVoteStoreInfo() {
		return voteStoreInfo;
	}

	public void setVoteStoreInfo(List<StoreVo> voteStoreInfo) {
		this.voteStoreInfo = voteStoreInfo;
	}
	
	public List<Integer> getVoteResultList() {
		return voteResultList;
	}

	public void setVoteResultList(List<Integer> voteResultList) {
		this.voteResultList = voteResultList;
	}
	
	
	///////////// toString //////////////////////////////////////////
	
	@Override
	public String toString() {
		return "VoteVo [voteNo=" + voteNo + ", voteMadeUser=" + voteMadeUser + ", groupNo=" + groupNo + ", voteEndTime="
				+ voteEndTime + ", voteItems=" + voteItems + ", voteResults=" + voteResults + ", voteState=" + voteState
				+ ", voteMemberNo=" + voteMemberNo + ", userNo=" + userNo + ", userName=" + userName + ", voteVoted="
				+ voteVoted + ", userGrade=" + userGrade + "]";
	}

}
