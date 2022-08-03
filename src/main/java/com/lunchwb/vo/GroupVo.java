package com.lunchwb.vo;

public class GroupVo {
	
	//////////////////// groups table ////////////////////
	private int groupNo;
	private int groupLeader;
	private String groupName;
	
	//////////////////// groupMember table ////////////////////
	// private int groupNo(group table fk);
	private int groupMemberNo;
	private int userNo;
	
	private int leaderCheck;
	private int bossCheck;
	private String memberName;
	private String memberSex;
	private int memberAge;
	
	public GroupVo() {
	}
	
	public GroupVo(int groupLeader, String groupName, int groupMemberNo, int userNo, int leaderCheck, 
			int bossCheck, String memberName, String memberSex, int memberAge) {
		this.groupLeader = groupLeader;
		this.groupName = groupName;
		this.groupMemberNo = groupMemberNo;
		this.userNo = userNo;
		this.leaderCheck = leaderCheck;
		this.bossCheck = bossCheck;
		this.memberName = memberName;
		this.memberSex = memberSex;
		this.memberAge = memberAge;
	}

	public GroupVo(int groupNo, int groupLeader, String groupName, int groupMemberNo, int userNo, 
			int leaderCheck, int bossCheck, String memberName, String memberSex, int memberAge) {
		this.groupNo = groupNo;
		this.groupLeader = groupLeader;
		this.groupName = groupName;
		this.groupMemberNo = groupMemberNo;
		this.userNo = userNo;
		this.leaderCheck = leaderCheck;
		this.bossCheck = bossCheck;
		this.memberName = memberName;
		this.memberSex = memberSex;
		this.memberAge = memberAge;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getGroupLeader() {
		return groupLeader;
	}

	public void setGroupLeader(int groupLeader) {
		this.groupLeader = groupLeader;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getGroupMemberNo() {
		return groupMemberNo;
	}

	public void setGroupMemberNo(int groupMemberNo) {
		this.groupMemberNo = groupMemberNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getLeaderCheck() {
		return leaderCheck;
	}

	public void setLeaderCheck(int leaderCheck) {
		this.leaderCheck = leaderCheck;
	}

	public int getBossCheck() {
		return bossCheck;
	}

	public void setBossCheck(int bossCheck) {
		this.bossCheck = bossCheck;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberSex() {
		return memberSex;
	}

	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
	}

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	@Override
	public String toString() {
		return "GroupVo [groupNo=" + groupNo + ", groupLeader=" + groupLeader + ", groupName=" + groupName
				+ ", groupMemberNo=" + groupMemberNo + ", userNo=" + userNo + ", leaderCheck=" + leaderCheck
				+ ", bossCheck=" + bossCheck + ", memberName=" + memberName + ", memberSex=" + memberSex
				+ ", memberAge=" + memberAge + "]";
	}
	
}
