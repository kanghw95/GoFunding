package com.funding.sprout.vo;

public class Report {
	
	private int reportNo; // 신고번호
	private String reportId; // 위반아이디
	private String reportType; // 신고유형
	private String reportTitle; // 신고제목
	private String reportContent; // 신고내용
	
	public Report() {
		
	}
	
	public Report(int reportNo, String reportId, String reportType, String reportTitle, String reportContent) {
		super();
		this.reportNo = reportNo;
		this.reportId = reportId;
		this.reportType = reportType;
		this.reportTitle = reportTitle;
		this.reportContent = reportContent;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportId=" + reportId + ", reportType=" + reportType
				+ ", reportTitle=" + reportTitle + ", reportContent=" + reportContent + "]";
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
	
}
