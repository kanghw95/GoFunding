package com.funding.sprout.vo;

public class Report {
	
	private int reportNo; // 신고번호
	private String reportId; // 위반아이디
	private String reportType; // 신고유형
	private String reportWr; // 신고 사유 
	private String reportTitle; // 신고제목
	private String reportContent; // 신고내용
	private String reportAdd; // 추가신고사항
	private char reportState; // 글 신고처리상태
	private String id; // 아이디
	
	public Report() {
		
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportId=" + reportId + ", reportType=" + reportType + ", reportWr="
				+ reportWr + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent + ", reportAdd="
				+ reportAdd + ", reportState=" + reportState + ", id=" + id + "]";
	}
	
	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public String getReportType() {
		return reportType;
	}

	public void setReportType(String reportType) {
		this.reportType = reportType;
	}

	public String getReportWr() {
		return reportWr;
	}

	public void setReportWr(String reportWr) {
		this.reportWr = reportWr;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportAdd() {
		return reportAdd;
	}

	public void setReportAdd(String reportAdd) {
		this.reportAdd = reportAdd;
	}

	public char getReportState() {
		return reportState;
	}

	public void setReportState(char reportState) {
		this.reportState = reportState;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}