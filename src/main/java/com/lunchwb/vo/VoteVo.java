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
	

}
