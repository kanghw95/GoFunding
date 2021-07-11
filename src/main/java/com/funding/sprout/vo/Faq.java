package com.funding.sprout.vo;

import java.sql.Date;

public class Faq {
	
	private int faqNo; // faq 번호
	private String faqTitle; // faq 제목
	private String faqContent; // faq 내용
	private Date faqDate; // faq 작성일
	private int faqCnt; // faq 조회수
	private String id; // 작성자 아이디
	
	public Faq() {
		
	}
	
	public Faq(int faqNo, String faqTitle, String faqContent, Date faqDate, int faqCnt, String id) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqDate = faqDate;
		this.faqCnt = faqCnt;
		this.id = id;
	}

	@Override
	public String toString() {
		return "Faq [faqNo=" + faqNo + ", faqTitle=" + faqTitle + ", faqContent=" + faqContent + ", faqDate=" + faqDate
				+ ", faqCnt=" + faqCnt + ", id=" + id + "]";
	}
	
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqContent() {
		return faqContent;
	}
	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}
	public Date getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}
	public int getFaqCnt() {
		return faqCnt;
	}
	public void setFaqCnt(int faqCnt) {
		this.faqCnt = faqCnt;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
