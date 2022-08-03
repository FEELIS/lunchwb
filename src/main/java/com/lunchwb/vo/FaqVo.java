package com.lunchwb.vo;

public class FaqVo {
	//////////////////// FAQ table ////////////////////
	private int faqNo;
	private int adminNo;
	private String faqTitle;
	private String faqContent;
	private String faqStatus;

	// 생성자
	public FaqVo() {
	};
	
	public FaqVo(String faqStatus) {
		this.faqStatus = faqStatus;
	};


	public FaqVo(int faqNo, int adminNo, String faqTitle, String faqContent, String faqStatus) {
		this.faqNo = faqNo;
		this.adminNo = adminNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqStatus = faqStatus;
	};

	// 메소드 - gs
	public int getFaqNo() {
		return faqNo;
	};

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	};

	public int getAdminNo() {
		return adminNo;
	};

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	};

	public String getFaqTitle() {
		return faqTitle;
	};

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	};

	public String getFaqContent() {
		return faqContent;
	};

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	};

	public String getFaqStatus() {
		return faqStatus;
	};

	public void setFaqStatus(String faqStatus) {
		this.faqStatus = faqStatus;
	};

	@Override
	public String toString() {
		return "FaqVo [faqNo=" + faqNo + ", adminNo=" + adminNo + ", faqTitle=" + faqTitle + ", faqContent="
				+ faqContent + ", faqStatus=" + faqStatus + "]";
	};

};
