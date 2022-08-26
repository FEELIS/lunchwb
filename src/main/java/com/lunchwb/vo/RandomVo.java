package com.lunchwb.vo;

public class RandomVo {
	
	private int randomeNo;
	private String storeInfo;
	private int stopAtValue;
	private String resultTime;

	public RandomVo() {
		super();
	}

	public RandomVo(int randomeNo, String storeInfo, int stopAtValue, String resultTime) {
		this.randomeNo = randomeNo;
		this.storeInfo = storeInfo;
		this.stopAtValue = stopAtValue;
		this.resultTime = resultTime;
	}

	public int getRandomeNo() {
		return randomeNo;
	}

	public void setRandomeNo(int randomeNo) {
		this.randomeNo = randomeNo;
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

	public String getResultTime() {
		return resultTime;
	}

	public void setResultTime(String resultTime) {
		this.resultTime = resultTime;
	}

	@Override
	public String toString() {
		return "RandomVo [randomeNo=" + randomeNo + ", storeInfo=" + storeInfo + ", stopAtValue=" + stopAtValue
				+ ", resultTime=" + resultTime + "]";
	}
}
