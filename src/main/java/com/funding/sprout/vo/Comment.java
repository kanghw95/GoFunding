package com.funding.sprout.vo;

import java.sql.Date;

public class Comment {

	private int cmtNo; // 댓글 번호
	private String cmtContent; // 댓글 내용
	private Date cmtDate; // 댓글 작성일
	private int cmtRef; // 댓글 ref : 원글 혹은 원댓글
	private int cmtStep; // 댓글 step : 원글에서 몇번째 파생된거
	private int cmtLevel; // 댓글 level : 원글이면 0 답글이면 1 답답글이면 2
	private int boardNo; // 원본글 번호
	private String id; // 로그인한 id = 댓글 남기는 사람

	public Comment() {

	}

	public Comment(int cmtNo, String cmtContent, Date cmtDate, int cmtRef, int cmtStep, int cmtLevel, int boardNo,
			String id) {
		super();
		this.cmtNo = cmtNo;
		this.cmtContent = cmtContent;
		this.cmtDate = cmtDate;
		this.cmtRef = cmtRef;
		this.cmtStep = cmtStep;
		this.cmtLevel = cmtLevel;
		this.boardNo = boardNo;
		this.id = id;
	}

	@Override
	public String toString() {
		return "Comment [cmtNo=" + cmtNo + ", cmtContent=" + cmtContent + ", cmtDate=" + cmtDate + ", cmtRef=" + cmtRef
				+ ", cmtStep=" + cmtStep + ", cmtLevel=" + cmtLevel + ", boardNo=" + boardNo + ", id=" + id + "]";
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public Date getCmtDate() {
		return cmtDate;
	}

	public void setCmtDate(Date cmtDate) {
		this.cmtDate = cmtDate;
	}

	public int getCmtRef() {
		return cmtRef;
	}

	public void setCmtRef(int cmtRef) {
		this.cmtRef = cmtRef;
	}

	public int getCmtStep() {
		return cmtStep;
	}

	public void setCmtStep(int cmtStep) {
		this.cmtStep = cmtStep;
	}

	public int getCmtLevel() {
		return cmtLevel;
	}

	public void setCmtLevel(int cmtLevel) {
		this.cmtLevel = cmtLevel;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

}
