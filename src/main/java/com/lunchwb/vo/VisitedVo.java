package com.lunchwb.vo;

public class VisitedVo {
	
	//////////////////// visited table //////////////////// 
	private int visitedNo;
	private int userNo;
	private int groupNo;
	private int StoreNo;
	private int menuNo;
	private String visitedDate;
	
	//////////////////// 달력용 //////////////////// 
	private String menu1stCateName;
	//private int groupNo;
	private String groupName;
	private String storeName;
	private String menuName;
	//private String visitedDate;
	private String selectMonth;
	
	//생성자
	public VisitedVo() {
	}
	
	// 달력정보가져오기 용(입력값)
	public VisitedVo(int userNo,String selectMonth) {
		this.userNo = userNo;
		this.selectMonth = selectMonth;
	}

	// 달력 출력용
	public VisitedVo(int groupNo, String visitedDate, String menu1stCateName, String groupName, String storeName,
			String menuName) {
		this.groupNo = groupNo;
		this.visitedDate = visitedDate;
		this.menu1stCateName = menu1stCateName;
		this.groupName = groupName;
		this.storeName = storeName;
		this.menuName = menuName;
	}

	public VisitedVo(int visitedNo, int userNo, int groupNo, int storeNo, int menuNo, String visitedDate,
			String menu1stCateName, String groupName, String storeName, String menuName, String selectMonth) {
		this.visitedNo = visitedNo;
		this.userNo = userNo;
		this.groupNo = groupNo;
		this.StoreNo = storeNo;
		this.menuNo = menuNo;
		this.visitedDate = visitedDate;
		this.menu1stCateName = menu1stCateName;
		this.groupName = groupName;
		this.storeName = storeName;
		this.menuName = menuName;
		this.selectMonth = selectMonth;
	}

	public int getVisitedNo() {
		return visitedNo;
	}

	public void setVisitedNo(int visitedNo) {
		this.visitedNo = visitedNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getStoreNo() {
		return StoreNo;
	}

	public void setStoreNo(int storeNo) {
		StoreNo = storeNo;
	}

	public int getMenuNo() {
		return menuNo;
	}

	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	public String getVisitedDate() {
		return visitedDate;
	}

	public void setVisitedDate(String visitedDate) {
		this.visitedDate = visitedDate;
	}

	public String getMenu1stCateName() {
		return menu1stCateName;
	}

	public void setMenu1stCateName(String menu1stCateName) {
		this.menu1stCateName = menu1stCateName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getSelectMonth() {
		return selectMonth;
	}

	public void setSelectMonth(String selectMonth) {
		this.selectMonth = selectMonth;
	}

	@Override
	public String toString() {
		return "VisitedVo [visitedNo=" + visitedNo + ", userNo=" + userNo + ", groupNo=" + groupNo + ", StoreNo="
				+ StoreNo + ", menuNo=" + menuNo + ", visitedDate=" + visitedDate + ", menu1stCateName="
				+ menu1stCateName + ", groupName=" + groupName + ", storeName=" + storeName + ", menuName=" + menuName
				+ ", selectMonth=" + selectMonth + "]";
	}
	
	
	
	

};
