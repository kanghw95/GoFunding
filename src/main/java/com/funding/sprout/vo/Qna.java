package com.funding.sprout.vo;

import java.sql.Date;

public class Qna {
	
	private int qnaNo; // qna번호
	private String qnaTitle; // qna제목
	private String qnaContent; // qna내용
	private Date qnaDate; // qna작성일
	private int qnaCnt; // qna조회수
	private int qnaRef; // qna댓글ref
	private int qnaStep; // qna답글step
	private int qnaLevel; // qna답글level
	
	public Qna() {
		
	}
	
	public Qna(int qnaNo, String qnaTitle, String qnaContent, Date qnaDate, int qnaCnt, int qnaRef, int qnaStep,
			int qnaLevel) {
		super();
		this.qnaNo = qnaNo;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.qnaCnt = qnaCnt;
		this.qnaRef = qnaRef;
		this.qnaStep = qnaStep;
		this.qnaLevel = qnaLevel;
	}

	@Override
	public String toString() {
		return "Qna [qnaNo=" + qnaNo + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaDate=" + qnaDate
				+ ", qnaCnt=" + qnaCnt + ", qnaRef=" + qnaRef + ", qnaStep=" + qnaStep + ", qnaLevel=" + qnaLevel + "]";
	}
	
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public int getQnaCnt() {
		return qnaCnt;
	}
	public void setQnaCnt(int qnaCnt) {
		this.qnaCnt = qnaCnt;
	}
	public int getQnaRef() {
		return qnaRef;
	}
	public void setQnaRef(int qnaRef) {
		this.qnaRef = qnaRef;
	}
	public int getQnaStep() {
		return qnaStep;
	}
	public void setQnaStep(int qnaStep) {
		this.qnaStep = qnaStep;
	}
	public int getQnaLevel() {
		return qnaLevel;
	}
	public void setQnaLevel(int qnaLevel) {
		this.qnaLevel = qnaLevel;
	}
	

}