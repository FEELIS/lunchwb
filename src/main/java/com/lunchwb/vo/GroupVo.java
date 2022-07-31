package com.lunchwb.vo;

public class GroupVo {
	
	//////////////////// group table ////////////////////
	private int groupNo;
	private int groupLeader;
	private String groupName;
	
	//////////////////// groupMember table ////////////////////
	private int groupMemberNo;
	private int userNo;
	// private int groupNo(group table fk);
	private int leaderCheck;
	private int bossCheck;
	private String memberName;
	private String memberSex;
	private int memberAge;

}
