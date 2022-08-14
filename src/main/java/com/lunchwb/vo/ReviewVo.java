package com.lunchwb.vo;

public class ReviewVo {
	
	//////////////////// review table ////////////////////
	private int reviewNo;
	private int userNo;
	private int visitedNo;
	private String reviewContent;
	private int userScore;
	private String reviewFilePath;
	private int reviewReported;
	
	// store table //
	private int storeNo;
	
	// users table
	private String userName;
	
	// menu table
	private String menuName;
	
	// visited table
	private String visitedDate;
	
	// Informaion of reviews of store
	private String avgAge;
	private int withCount;
	private int visitedCount;
	
	
	public ReviewVo() {
	}
	
	public ReviewVo(int reviewNo, int userNo, int visitedNo, String reviewContent, int userScore, String reviewFilePath,
			int reviewReported, int storeNo, String userName, String menuName, String visitedDate, String avgAge,
			int withCount, int visitedCount) {
		this.reviewNo = reviewNo;
		this.userNo = userNo;
		this.visitedNo = visitedNo;
		this.reviewContent = reviewContent;
		this.userScore = userScore;
		this.reviewFilePath = reviewFilePath;
		this.reviewReported = reviewReported;
		this.storeNo = storeNo;
		this.userName = userName;
		this.menuName = menuName;
		this.visitedDate = visitedDate;
		this.avgAge = avgAge;
		this.withCount = withCount;
		this.visitedCount = visitedCount;
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

	public String getReviewFilePath() {
		return reviewFilePath;
	}

	public void setReviewFilePath(String reviewFilePath) {
		this.reviewFilePath = reviewFilePath;
	}

	public int getReviewReported() {
		return reviewReported;
	}

	public void setReviewReported(int reviewReported) {
		this.reviewReported = reviewReported;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getVisitedDate() {
		return visitedDate;
	}

	public void setVisitedDate(String visitedDate) {
		this.visitedDate = visitedDate;
	}

	public String getAvgAge() {
		return avgAge;
	}

	public void setAvgAge(String avgAge) {
		this.avgAge = avgAge;
	}

	public int getWithCount() {
		return withCount;
	}

	public void setWithCount(int withCount) {
		this.withCount = withCount;
	}

	public int getVisitedCount() {
		return visitedCount;
	}

	public void setVisitedCount(int visitedCount) {
		this.visitedCount = visitedCount;
	}

	
	@Override
	public String toString() {
		return "ReviewVo [reviewNo=" + reviewNo + ", userNo=" + userNo + ", visitedNo=" + visitedNo + ", reviewContent="
				+ reviewContent + ", userScore=" + userScore + ", reviewFilePath=" + reviewFilePath
				+ ", reviewReported=" + reviewReported + ", storeNo=" + storeNo + ", userName=" + userName
				+ ", menuName=" + menuName + ", visitedDate=" + visitedDate + ", avgAge=" + avgAge + ", withCount="
				+ withCount + ", visitedCount=" + visitedCount + "]";
	}

}
