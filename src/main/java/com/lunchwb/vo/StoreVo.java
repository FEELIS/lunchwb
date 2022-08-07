package com.lunchwb.vo;

import java.util.Arrays;
import java.util.List;

public class StoreVo {
	
	//////////////////// store table ////////////////////
	private int storeNo;
	private int menu2ndCateNo; 
	private String storeName;
	private double storeX;
	private double storeY;
	private String storeRoadAddress;
	private String storeOldAddress;
	private List<String> storeOpeningHours;
	private List<String> storeBreaktime;
	
	//////////////////// ratingOthers table ////////////////////
	// private int storeNo; (store table fk)
	private float ratingNaver;
	private float ratingKakao;
	
	////////// 장바구니에서 사용 될 것들 /////////////////////////
	private int distance;
	private int score;
	
	//////////// review table /////////////////////
	private float rating_bujang;
	
	///////////// visited table //////////////////
	private int visitCnt;
	
	
	
	
	/////////////// 생성자 /////////////////////////////////////////////////////////////////////
	
	public StoreVo() {
		
	}

	
	public StoreVo(int storeNo, int menu2ndCateNo, String storeName, double storeX, double storeY,
			String storeRoadAddress, String storeOldAddress, List<String> storeOpeningHours,
			List<String> storeBreaktime, float ratingNaver, float ratingKakao, int distance, int score,
			float rating_bujang, int visitCnt) {
		this.storeNo = storeNo;
		this.menu2ndCateNo = menu2ndCateNo;
		this.storeName = storeName;
		this.storeX = storeX;
		this.storeY = storeY;
		this.storeRoadAddress = storeRoadAddress;
		this.storeOldAddress = storeOldAddress;
		this.storeOpeningHours = storeOpeningHours;
		this.storeBreaktime = storeBreaktime;
		this.ratingNaver = ratingNaver;
		this.ratingKakao = ratingKakao;
		this.distance = distance;
		this.score = score;
		this.rating_bujang = rating_bujang;
		this.visitCnt = visitCnt;
	}


	////////////// getter setter ////////////////////////////////////////////////////////////////////////

	public int getStoreNo() {
		return storeNo;
	}


	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}


	public int getMenu2ndCateNo() {
		return menu2ndCateNo;
	}


	public void setMenu2ndCateNo(int menu2ndCateNo) {
		this.menu2ndCateNo = menu2ndCateNo;
	}


	public String getStoreName() {
		return storeName;
	}


	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}


	public double getStoreX() {
		return storeX;
	}


	public void setStoreX(double storeX) {
		this.storeX = storeX;
	}


	public double getStoreY() {
		return storeY;
	}


	public void setStoreY(double storeY) {
		this.storeY = storeY;
	}


	public String getStoreRoadAddress() {
		return storeRoadAddress;
	}


	public void setStoreRoadAddress(String storeRoadAddress) {
		this.storeRoadAddress = storeRoadAddress;
	}


	public String getStoreOldAddress() {
		return storeOldAddress;
	}


	public void setStoreOldAddress(String storeOldAddress) {
		this.storeOldAddress = storeOldAddress;
	}

	
	public List<String> getStoreOpeningHours() {
		return storeOpeningHours;
	}


	public void setStoreOpeningHours(List<String> storeOpeningHours) {
		this.storeOpeningHours = storeOpeningHours;
	}


	public List<String> getStoreBreaktime() {
		return storeBreaktime;
	}


	public void setStoreBreaktime(List<String> storeBreaktime) {
		this.storeBreaktime = storeBreaktime;
	}


	public float getRatingNaver() {
		return ratingNaver;
	}


	public void setRatingNaver(float ratingNaver) {
		this.ratingNaver = ratingNaver;
	}


	public float getRatingKakao() {
		return ratingKakao;
	}


	public void setRatingKakao(float ratingKakao) {
		this.ratingKakao = ratingKakao;
	}


	public int getDistance() {
		return distance;
	}


	public void setDistance(int distance) {
		this.distance = distance;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public float getRating_bujang() {
		return rating_bujang;
	}


	public void setRating_bujang(float rating_bujang) {
		this.rating_bujang = rating_bujang;
	}


	public int getVisitCnt() {
		return visitCnt;
	}


	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}


	///// toString //////////////////////////////////////////////////////////////

	@Override
	public String toString() {
		return "StoreVo [storeNo=" + storeNo + ", menu2ndCateNo=" + menu2ndCateNo + ", storeName=" + storeName
				+ ", storeX=" + storeX + ", storeY=" + storeY + ", storeRoadAddress=" + storeRoadAddress
				+ ", storeOldAddress=" + storeOldAddress + ",\nstoreOpeningHours=" + storeOpeningHours.toString()
				+ ",\nstoreBreaktime=" + storeBreaktime.toString() + ", ratingNaver=" + ratingNaver + ", ratingKakao=" + ratingKakao
				+ ", distance=" + distance + ", score=" + score + ", rating_bujang=" + rating_bujang + ", visitCnt="
				+ visitCnt + "]";
	}
	
}
