package com.lunchwb.vo;

public class VoteVo {
	
	//////////////////// vote table ////////////////////
	private int voteNo;
	private int voteMadeUser;
	private String voteEndTime;
	private String voteItems;
	
	//////////////////// voteGroup table ////////////////////
	// private int voteNo; (vote table fk)
	private int userNo;
	private int bossCheck;
	private String memberName;
	private int votedCheck;
	

}
