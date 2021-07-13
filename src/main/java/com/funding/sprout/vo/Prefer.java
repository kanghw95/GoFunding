package com.funding.sprout.vo;

public class Prefer {
	private String id;
	private int fundingNo;
	private String fundingTitle;
	private String maker;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	public String getFundingTitle() {
		return fundingTitle;
	}
	public void setFundingTitle(String fundingTitle) {
		this.fundingTitle = fundingTitle;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public Prefer(String id, int fundingNo, String fundingTitle, String fundingState, String maker) {
		super();
		this.id = id;
		this.fundingNo = fundingNo;
		this.fundingTitle = fundingTitle;
		this.maker = maker;
	}
	public Prefer() {
	}
	
	
	
}
