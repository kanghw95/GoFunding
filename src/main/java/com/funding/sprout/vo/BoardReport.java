package com.funding.sprout.vo;

public class BoardReport {
	private int bReportNo; // 글 신고 번호
	private String bReportId; // 글 위반 아이디 
	private String bReportType; // 글 신고유형
	private String bReportWr; // 글 신고사유
	private String bReportTitle; // 신고글제목
	private String bReportContent; // 신고글내용
	private String bReportAdd; //글 추가 신고사항
	private boolean bReportState; // 글 신고처리상태
	private String id; // 글신고아이디
	
	@Override
	public String toString() {
		return "boardreport [bReportNo=" + bReportNo + ", bReportId=" + bReportId + ", bReportType=" + bReportType
				+ ", bReportWr=" + bReportWr + ", bReportTitle=" + bReportTitle + ", bReportContent=" + bReportContent
				+ ", bReportAdd=" + bReportAdd + ", bReportState=" + bReportState + ", id=" + id + "]";
	}
	
	public int getbReportNo() {
		return bReportNo;
	}
	public void setbReportNo(int bReportNo) {
		this.bReportNo = bReportNo;
	}
	public String getbReportId() {
		return bReportId;
	}
	public void setbReportId(String bReportId) {
		this.bReportId = bReportId;
	}
	public String getbReportType() {
		return bReportType;
	}
	public void setbReportType(String bReportType) {
		this.bReportType = bReportType;
	}
	public String getbReportWr() {
		return bReportWr;
	}
	public void setbReportWr(String bReportWr) {
		this.bReportWr = bReportWr;
	}
	public String getbReportTitle() {
		return bReportTitle;
	}
	public void setbReportTitle(String bReportTitle) {
		this.bReportTitle = bReportTitle;
	}
	public String getbReportContent() {
		return bReportContent;
	}
	public void setbReportContent(String bReportContent) {
		this.bReportContent = bReportContent;
	}
	public String getbReportAdd() {
		return bReportAdd;
	}
	public void setbReportAdd(String bReportAdd) {
		this.bReportAdd = bReportAdd;
	}
	public boolean isbReportState() {
		return bReportState;
	}
	public void setbReportState(boolean bReportState) {
		this.bReportState = bReportState;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
