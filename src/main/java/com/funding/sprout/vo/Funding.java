package com.funding.sprout.vo;

import java.sql.Timestamp;

public class Funding {
	private int fundingno; // 펀딩번호
	private char fundingstate; // 펀딩진행상태
	private String fundingcategory; // 펀딩분류
	private String fundingtitle; // 펀딩제목
	private String fundingcontent; // 펀딩본문
	private int fundingprice; // 목표금액
	private Timestamp fundingstart; // 시작일
	private Timestamp fundingfin; // 종료일
	private String maker; // 메이커
	
	
	public Funding() {
		
	}

	



	public Funding(int fundingno, char fundingstate, String fundingcategory, String fundingtitle, String fundingcontent,
			int fundingprice, Timestamp fundingstart, Timestamp fundingfin, String maker) {
		super();
		this.fundingno = fundingno;
		this.fundingstate = fundingstate;
		this.fundingcategory = fundingcategory;
		this.fundingtitle = fundingtitle;
		this.fundingcontent = fundingcontent;
		this.fundingprice = fundingprice;
		this.fundingstart = fundingstart;
		this.fundingfin = fundingfin;
		this.maker = maker;
	}





	@Override
	public String toString() {
		return "Funding [fundingno=" + fundingno + ", fundingstate=" + fundingstate + ", fundingcategory="
				+ fundingcategory + ", fundingtitle=" + fundingtitle + ", fundingcontent=" + fundingcontent
				+ ", fundingprice=" + fundingprice + ", fundingstart=" + fundingstart + ", fundingfin=" + fundingfin
				+ ", maker=" + maker + "]";
	}





	public int getFundingno() {
		return fundingno;
	}


	public void setFundingno(int fundingno) {
		this.fundingno = fundingno;
	}


	public char getFundingstate() {
		return fundingstate;
	}


	public void setFundingstate(char fundingstate) {
		this.fundingstate = fundingstate;
	}


	public String getFundingcategory() {
		return fundingcategory;
	}


	public void setFundingcategory(String fundingcategory) {
		this.fundingcategory = fundingcategory;
	}


	public String getFundingtitle() {
		return fundingtitle;
	}


	public void setFundingtitle(String fundingtitle) {
		this.fundingtitle = fundingtitle;
	}


	public String getFundingcontent() {
		return fundingcontent;
	}


	public void setFundingcontent(String fundingcontent) {
		this.fundingcontent = fundingcontent;
	}


	public int getFundingprice() {
		return fundingprice;
	}


	public void setFundingprice(int fundingprice) {
		this.fundingprice = fundingprice;
	}


	public Timestamp getFundingstart() {
		return fundingstart;
	}


	public void setFundingstart(Timestamp fundingstart) {
		this.fundingstart = fundingstart;
	}


	public Timestamp getFundingfin() {
		return fundingfin;
	}


	public void setFundingfin(Timestamp fundingfin) {
		this.fundingfin = fundingfin;
	}



	public String getMaker() {
		return maker;
	}



	public void setMaker(String maker) {
		this.maker = maker;
	}


}
