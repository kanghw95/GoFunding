package com.funding.sprout.vo;

import java.sql.Date;

public class Comment {

	private int CmtNo; // 댓글 번호
	private String CmtContent; // 댓글 내용
	private Date CmtDate; // 댓글 작성일
	private int CmtRef; // 댓글 ref
	private int CmtStep; // 댓글 step
	private int CmtLevel; // 댓글 level

	public Comment() {

	}

	public Comment(int cmtNo, String cmtContent, Date cmtDate, int cmtRef, int cmtStep, int cmtLevel) {
		super();
		CmtNo = cmtNo;
		CmtContent = cmtContent;
		CmtDate = cmtDate;
		CmtRef = cmtRef;
		CmtStep = cmtStep;
		CmtLevel = cmtLevel;
	}

	@Override
	public String toString() {
		return "Comment [CmtNo=" + CmtNo + ", CmtContent=" + CmtContent + ", CmtDate=" + CmtDate + ", CmtRef=" + CmtRef
				+ ", CmtStep=" + CmtStep + ", CmtLevel=" + CmtLevel + "]";
	}

	
	public int getCmtNo() {
		return CmtNo;
	}

	public void setCmtNo(int cmtNo) {
		CmtNo = cmtNo;
	}

	public String getCmtContent() {
		return CmtContent;
	}

	public void setCmtContent(String cmtContent) {
		CmtContent = cmtContent;
	}

	public Date getCmtDate() {
		return CmtDate;
	}

	public void setCmtDate(Date cmtDate) {
		CmtDate = cmtDate;
	}

	public int getCmtRef() {
		return CmtRef;
	}

	public void setCmtRef(int cmtRef) {
		CmtRef = cmtRef;
	}

	public int getCmtStep() {
		return CmtStep;
	}

	public void setCmtStep(int cmtStep) {
		CmtStep = cmtStep;
	}

	public int getCmtLevel() {
		return CmtLevel;
	}

	public void setCmtLevel(int cmtLevel) {
		CmtLevel = cmtLevel;
	}

}
