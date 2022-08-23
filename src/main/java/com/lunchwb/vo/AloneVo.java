package com.lunchwb.vo;

public class AloneVo {
	
	//////////////////// review table ////////////////////
	private int reviewNo;
	private int userNo;
	private int visitedNo;
	private String reviewContent;
	private int userScore;
	private String reviewFileName;
	private int reviewReported;
	
	// visited table //
	private int visitedDate;
	private int visitedCount;
	
	// store table //
	private int storeNo;
	private String storeName;
	private double storeX;
	private double storeY;
	private String storeRoadAddress;
	private String storeOldAddress;
	
	
	// 생성자
	public AloneVo() {
		
	};
	
	public AloneVo(int userNo) {
		this.userNo = userNo;
	};
	
	
	public AloneVo(int reviewNo, int userNo, int visitedNo, String reviewContent, int userScore, String reviewFileName,
			int reviewReported, int visitedDate, int visitedCount, int storeNo, String storeName, double storeX,
			double storeY, String storeRoadAddress, String storeOldAddress) {
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.visitedNo = visitedNo;
		this.reviewContent = reviewContent;
		this.userScore = userScore;
		this.reviewFileName = reviewFileName;
		this.reviewReported = reviewReported;
		this.visitedDate = visitedDate;
		this.visitedCount = visitedCount;
		this.storeNo = storeNo;
		this.storeName = storeName;
		this.storeX = storeX;
		this.storeY = storeY;
		this.storeRoadAddress = storeRoadAddress;
		this.storeOldAddress = storeOldAddress;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getVisitedNo() {
		return visitedNo;
	}

	public void setVisitedNo(int visitedNo) {
		this.visitedNo = visitedNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public int getUserScore() {
		return userScore;
	}

	public void setUserScore(int userScore) {
		this.userScore = userScore;
	}

	public String getreviewFileName() {
		return reviewFileName;
	}

	public void setreviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}

	public int getReviewReported() {
		return reviewReported;
	}

	public void setReviewReported(int reviewReported) {
		this.reviewReported = reviewReported;
	}

	public int getVisitedDate() {
		return visitedDate;
	}

	public void setVisitedDate(int visitedDate) {
		this.visitedDate = visitedDate;
	}

	public int getVisitedCount() {
		return visitedCount;
	}

	public void setVisitedCount(int visitedCount) {
		this.visitedCount = visitedCount;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
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

	@Override
	public String toString() {
		return "AloneVo [reviewNo=" + reviewNo + ", userNo=" + userNo + ", visitedNo=" + visitedNo + ", reviewContent="
				+ reviewContent + ", userScore=" + userScore + ", reviewFileName=" + reviewFileName
				+ ", reviewReported=" + reviewReported + ", visitedDate=" + visitedDate + ", visitedCount="
				+ visitedCount + ", storeNo=" + storeNo + ", storeName=" + storeName + ", storeX=" + storeX
				+ ", storeY=" + storeY + ", storeRoadAddress=" + storeRoadAddress + ", storeOldAddress="
				+ storeOldAddress + "]";
	};

	

}
