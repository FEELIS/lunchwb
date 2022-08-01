package com.lunchwb.vo;

public class StoreVo {
	
	//////////////////// store table ////////////////////
	private int storeNo;
	private int menu2ndCateNo; 
	private String storeName;
	private double storeX;
	private double storeY;
	private String storeRoadAddress;
	private String storeOldAddress;
	private String storeOpeningHours;
	private int storeVisitCount;
	
	//////////////////// ratingBujang table ////////////////////
	// private int storeNo; (store table fk)
	private float ratingSum;
	private float ratingAvg;
	private float ratingNum;
	
	//////////////////// ratingOthers table ////////////////////
	// private int storeNo; (store table fk)
	private float ratingNaver;
	private float ratingKakao;
	private float ratingGoogle;
	

}
