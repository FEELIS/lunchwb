package com.lunchwb.vo;

public class GPSVo {

	private double gpsX;
	private double gpsY;
	private String roadAddress;
	
	
	public GPSVo(double gpsX, double gpsY, String roadAddress) {
		this.gpsX = gpsX;
		this.gpsY = gpsY;
		this.roadAddress = roadAddress;
	}


	public double getGpsX() {
		return gpsX;
	}


	public void setGpsX(double gpsX) {
		this.gpsX = gpsX;
	}


	public double getGpsY() {
		return gpsY;
	}


	public void setGpsY(double gpsY) {
		this.gpsY = gpsY;
	}


	public String getRoadAddress() {
		return roadAddress;
	}


	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}


	@Override
	public String toString() {
		return "GPSVO [gpsX=" + gpsX + ", gpsY=" + gpsY + ", roadAddress=" + roadAddress + "]";
	}
	
}
