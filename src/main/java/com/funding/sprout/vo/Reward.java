package com.funding.sprout.vo;


public class Reward {
	private int rewardNo; //리워드 번호
	private String rewardTitle; // 리워드명
	private int rewardEA; // 수량
	private int rewardPrice; // 금액 
	private int fundingNo; // 펀딩번호
	private int rewardCount; //펀딩참여인원
	
	public Reward() {
		
	}
	
	
	
	public Reward(int rewardNo, String rewardTitle, int rewardEA, int rewardPrice, int fundingNo, int rewardCount) {
		super();
		this.rewardNo = rewardNo;
		this.rewardTitle = rewardTitle;
		this.rewardEA = rewardEA;
		this.rewardPrice = rewardPrice;
		this.fundingNo = fundingNo;
		this.rewardCount = rewardCount;
	}



	@Override
	public String toString() {
		return "Reward [rewardNo=" + rewardNo + ", rewardTitle=" + rewardTitle + ", rewardEA=" + rewardEA
				+ ", rewardPrice=" + rewardPrice + ", fundingNo=" + fundingNo + ", rewardCount=" + rewardCount + "]";
	}



	public int getRewardNo() {
		return rewardNo;
	}

	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}

	public String getRewardTitle() {
		return rewardTitle;
	}

	public void setRewardTitle(String rewardTitle) {
		this.rewardTitle = rewardTitle;
	}

	public int getRewardEA() {
		return rewardEA;
	}

	public void setRewardEA(int rewardEA) {
		this.rewardEA = rewardEA;
	}

	public int getRewardPrice() {
		return rewardPrice;
	}

	public void setRewardPrice(int rewardPrice) {
		this.rewardPrice = rewardPrice;
	}

	public int getFundingNo() {
		return fundingNo;
	}

	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}

	public int getRewardCount() {
		return rewardCount;
	}

	public void setRewardCount(int rewardCount) {
		this.rewardCount = rewardCount;
	}
	
}
