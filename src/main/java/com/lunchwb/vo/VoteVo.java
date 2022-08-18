package com.lunchwb.vo;

public class VoteVo {
	
	//////////////////// vote table ////////////////////
	private int voteNo;
	private int voteMadeUser;
	private int groupNo;
	private String voteEndTime;
	private String voteItems;
	private String voteResults;
	
	
	//////////////////// vote_members table ////////////////////
	private int voteMemberNo;
	// private int voteNo; (vote table fk)
	private int groupMemberNo;
	private String userName;
	
	
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

	public String getVoteEndTime() {
		return voteEndTime;
	}

	public void setVoteEndTime(String voteEndTime) {
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

	public int getGroupMemberNo() {
		return groupMemberNo;
	}

	public void setGroupMemberNo(int groupMemberNo) {
		this.groupMemberNo = groupMemberNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
		
	///// toString //////////////////////////////////////////
	

}
