package com.lunchwb.vo;

public class GroupVo {
	
	//////////////////// groups table ////////////////////
	private int groupNo;
	private int groupLeader;
	private String groupName;
	
	//////////////////// group_member table ////////////////////
	// private int groupNo(group table fk);
	// private int userNo(users table pk);
	private int groupMemberNo;
	private int userNo;
	private int leaderCheck;
	private int bossCheck;
	
	/////////////////// users table ////////////////////
	private String userName;
	private int userBirthYear;
	private String userSex;
	
	///////group_member table +//////
	private int groupOrder;
	
	
	
	public GroupVo() {
	}
	
	public GroupVo(int groupNo, int groupLeader, String groupName, int groupMemberNo, int userNo, int leaderCheck,
					int bossCheck, String userName, int userBirthYear, String userSex, int groupOrder) {
		this.groupNo = groupNo;
		this.groupLeader = groupLeader;
		this.groupName = groupName;
		this.groupMemberNo = groupMemberNo;
		this.userNo = userNo;
		this.leaderCheck = leaderCheck;
		this.bossCheck = bossCheck;
		this.userName = userName;
		this.userBirthYear = userBirthYear;
		this.userSex = userSex;
		this.groupOrder = groupOrder;
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
	
	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}

	
	@Override
	public String toString() {
		return "GroupVo [groupNo=" + groupNo + ", groupLeader=" + groupLeader + ", groupName=" + groupName
				+ ", groupMemberNo=" + groupMemberNo + ", userNo=" + userNo + ", leaderCheck=" + leaderCheck
				+ ", bossCheck=" + bossCheck + ", userName=" + userName + ", userBirthYear=" + userBirthYear
				+ ", userSex=" + userSex + ", groupOrder=" + groupOrder + ", getGroupNo()=" + getGroupNo()
				+ ", getGroupLeader()=" + getGroupLeader() + ", getGroupName()=" + getGroupName()
				+ ", getGroupMemberNo()=" + getGroupMemberNo() + ", getUserNo()=" + getUserNo() + ", getLeaderCheck()="
				+ getLeaderCheck() + ", getBossCheck()=" + getBossCheck() + ", getUserName()=" + getUserName()
				+ ", getUserBirthYear()=" + getUserBirthYear() + ", getUserSex()=" + getUserSex() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

	
	
}
