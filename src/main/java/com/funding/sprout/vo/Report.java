package com.funding.sprout.vo;

public class Report {
	
	private int reportNo; // 신고번호
	private String reportId; // 위반아이디
	private String reportType; // 신고유형
	private String reportWr; // 신고 사유 
	private String reportTitle; // 신고제목
	private String reportContent; // 신고내용
	private String id; // 아이디
	private char reportState;
	
	public Report() {
		
	}
	
	public Report(int reportNo, String reportId, String reportType, String reportWr, String reportTitle, String reportContent, String id, char reportState) {
		super();
		this.reportNo = reportNo;
		this.reportId = reportId;
		this.reportType = reportType;
		this.reportWr = reportWr;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
		this.id = id;
		this.reportState = reportState;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportId=" + reportId + ", reportType=" + reportType + ", reportWr="
				+ reportWr + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent + ", id=" + id
				+ ", reportState=" + reportState + "]";
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

	public String getReportWr() {
		return reportWr;
	}

	public void setReportWr(String reportWr) {
		this.reportWr = reportWr;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public char getReportState() {
		return reportState;
	}

	public void setReportState(char reportState) {
		this.reportState = reportState;
	}
	
}
