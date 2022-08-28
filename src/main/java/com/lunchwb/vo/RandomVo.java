package com.lunchwb.vo;

import java.util.List;

public class RandomVo {
	
	private int randomNo;
	private String storeInfo;
	private int stopAtValue;
	private String groupName;
	private String resultTime;
	

	public RandomVo() {
		super();
	}


	public RandomVo(int randomNo, String storeInfo, int stopAtValue, String groupName, String resultTime) {
		super();
		this.randomNo = randomNo;
		this.storeInfo = storeInfo;
		this.stopAtValue = stopAtValue;
		this.groupName = groupName;
		this.resultTime = resultTime;
	}


	public int getRandomNo() {
		return randomNo;
	}


	public void setRandomNo(int randomNo) {
		this.randomNo = randomNo;
	}


	public String getStoreInfo() {
		return storeInfo;
	}


	public void setStoreInfo(String storeInfo) {
		this.storeInfo = storeInfo;
	}


	public int getStopAtValue() {
		return stopAtValue;
	}


	public void setStopAtValue(int stopAtValue) {
		this.stopAtValue = stopAtValue;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public String getResultTime() {
		return resultTime;
	}


	public void setResultTime(String resultTime) {
		this.resultTime = resultTime;
	}


	@Override
	public String toString() {
		return "RandomVo [randomNo=" + randomNo + ", storeInfo=" + storeInfo + ", stopAtValue=" + stopAtValue
				+ ", groupName=" + groupName + ", resultTime=" + resultTime + "]";
	}
	


}
