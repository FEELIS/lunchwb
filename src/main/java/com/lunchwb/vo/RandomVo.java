package com.lunchwb.vo;

import java.util.List;

public class RandomVo {
	
	private int randomeNo;
	private List<String> storeInfo;
	private int stopAtValue;
	private String groupName;
	private String resultTime;
	

	public RandomVo() {
		super();
	}


	public RandomVo(int randomeNo, List<String> storeInfo, int stopAtValue, String groupName, String resultTime) {
		super();
		this.randomeNo = randomeNo;
		this.storeInfo = storeInfo;
		this.stopAtValue = stopAtValue;
		this.groupName = groupName;
		this.resultTime = resultTime;
	}


	public int getRandomeNo() {
		return randomeNo;
	}


	public void setRandomeNo(int randomeNo) {
		this.randomeNo = randomeNo;
	}


	public List<String> getStoreInfo() {
		return storeInfo;
	}


	public void setStoreInfo(List<String> storeInfo) {
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
		return "RandomVo [randomeNo=" + randomeNo + ", storeInfo=" + storeInfo + ", stopAtValue=" + stopAtValue
				+ ", groupName=" + groupName + ", resultTime=" + resultTime + "]";
	}
	



}
