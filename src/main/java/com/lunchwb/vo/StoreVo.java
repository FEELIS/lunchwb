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
	private String storeBreaktime;
	
	////////////////// food 2nd category ////////////////////
	private String menu2ndCateName;
	
	
	//////////////////// ratingOthers table ////////////////////
	// private int storeNo; (store table fk)
	private float ratingNaver;
	private float ratingKakao;
	
	////////// 장바구니에서 사용 될 것들 /////////////////////////
	private int distance;
	private int score;
	private boolean stored;
	
	//////////// review table /////////////////////
	private float ratingBujang;
	
	///////////// visited table //////////////////
	private int visitCnt;
	
	
	
	
	/////////////// 생성자 /////////////////////////////////////////////////////////////////////
	
	public StoreVo() {
		
	}

	
	public StoreVo(int storeNo, int menu2ndCateNo, String storeName, double storeX, double storeY,
			String storeRoadAddress, String storeOldAddress, String storeOpeningHours, String storeBreaktime,
			String menu2ndCateName, float ratingNaver, float ratingKakao, int distance, int score, boolean stored,
			float ratingBujang, int visitCnt) {
		this.storeNo = storeNo;
		this.menu2ndCateNo = menu2ndCateNo;
		this.storeName = storeName;
		this.storeX = storeX;
		this.storeY = storeY;
		this.storeRoadAddress = storeRoadAddress;
		this.storeOldAddress = storeOldAddress;
		this.storeOpeningHours = storeOpeningHours;
		this.storeBreaktime = storeBreaktime;
		this.menu2ndCateName = menu2ndCateName;
		this.ratingNaver = ratingNaver;
		this.ratingKakao = ratingKakao;
		this.distance = distance;
		this.score = score;
		this.stored = stored;
		this.ratingBujang = ratingBujang;
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

	
	public String getStoreOpeningHours() {
		return storeOpeningHours;
	}


	public void setStoreOpeningHours(String storeOpeningHours) {
		this.storeOpeningHours = storeOpeningHours;
	}


	public String getStoreBreaktime() {
		return storeBreaktime;
	}


	public void setStoreBreaktime(String storeBreaktime) {
		this.storeBreaktime = storeBreaktime;
	}
	

	public String getMenu2ndCateName() {
		return menu2ndCateName;
	}


	public void setMenu2ndCateName(String menu2ndCateName) {
		this.menu2ndCateName = menu2ndCateName;
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


	public float getRatingBujang() {
		return ratingBujang;
	}


	public void setRatingBujang(float ratingBujang) {
		this.ratingBujang = ratingBujang;
	}


	public int getVisitCnt() {
		return visitCnt;
	}


	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	
	
	public boolean isStored() {
		return stored;
	}


	public void setStored(boolean stored) {
		this.stored = stored;
	}


	///// toString //////////////////////////////////////////////////////////////

	@Override
	public String toString() {
		return "StoreVo [storeNo=" + storeNo + ", menu2ndCateNo=" + menu2ndCateNo + ", storeName=" + storeName
				+ ", storeX=" + storeX + ", storeY=" + storeY + ", storeRoadAddress=" + storeRoadAddress
				+ ", storeOldAddress=" + storeOldAddress + ", storeOpeningHours=" + storeOpeningHours + ", storeBreaktime=" + storeBreaktime
				+ ", menu2ndCateName=" + menu2ndCateName + ", ratingNaver=" + ratingNaver + ", ratingKakao=" + ratingKakao
				+ ", distance=" + distance + ", score=" + score + ", stored=" + stored + ", ratingBujang="
				+ ratingBujang + ", visitCnt=" + visitCnt + "]";
	}
	
}
