package com.funding.sprout.vo;

import java.sql.Timestamp;

public class Application {

	private int applyNo;
	private String maker;
	private String description;
	private String id;
	private String makerTel;
	private String makerEmail;
	private String makerInfo;
	private String fundingTitle;
	private String fundingCategory;
	private String fundingContent;
	private String fundingPrice;
	private Timestamp fundingStart; 
	private Timestamp fundingFin;
	private String fundingPlan;
	private String rewardDesc;
	private String rewardPrice;
	private String rewardTitle;
	private String rewardEA;
	private String feedback;
	
	public Application() {
		super();
	}

	public Application(int applyNo, String maker, String description, String id, String makerTel, String makerEmail,
			String makerInfo, String fundingTitle, String fundingCategory, String fundingContent, String fundingPrice,
			Timestamp fundingStart, Timestamp fundingFin, String fundingPlan, String rewardDesc, String rewardPrice,
			String rewardTitle, String rewardEA, String feedback) {
		super();
		this.applyNo = applyNo;
		this.maker = maker;
		this.description = description;
		this.id = id;
		this.makerTel = makerTel;
		this.makerEmail = makerEmail;
		this.makerInfo = makerInfo;
		this.fundingTitle = fundingTitle;
		this.fundingCategory = fundingCategory;
		this.fundingContent = fundingContent;
		this.fundingPrice = fundingPrice;
		this.fundingStart = fundingStart;
		this.fundingFin = fundingFin;
		this.fundingPlan = fundingPlan;
		this.rewardDesc = rewardDesc;
		this.rewardPrice = rewardPrice;
		this.rewardTitle = rewardTitle;
		this.rewardEA = rewardEA;
		this.feedback = feedback;
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getMakerTel() {
		return makerTel;
	}

	public void setMakerTel(String makerTel) {
		this.makerTel = makerTel;
	}

	public String getMakerEmail() {
		return makerEmail;
	}

	public void setMakerEmail(String makerEmail) {
		this.makerEmail = makerEmail;
	}

	public String getMakerInfo() {
		return makerInfo;
	}

	public void setMakerInfo(String makerInfo) {
		this.makerInfo = makerInfo;
	}

	public String getFundingTitle() {
		return fundingTitle;
	}

	public void setFundingTitle(String fundingTitle) {
		this.fundingTitle = fundingTitle;
	}

	public String getFundingCategory() {
		return fundingCategory;
	}

	public void setFundingCategory(String fundingCategory) {
		this.fundingCategory = fundingCategory;
	}

	public String getFundingContent() {
		return fundingContent;
	}

	public void setFundingContent(String fundingContent) {
		this.fundingContent = fundingContent;
	}

	public String getFundingPrice() {
		return fundingPrice;
	}

	public void setFundingPrice(String fundingPrice) {
		this.fundingPrice = fundingPrice;
	}

	public Timestamp getFundingStart() {
		return fundingStart;
	}

	public void setFundingStart(Timestamp fundingStart) {
		this.fundingStart = fundingStart;
	}

	public Timestamp getFundingFin() {
		return fundingFin;
	}

	public void setFundingFin(Timestamp fundingFin) {
		this.fundingFin = fundingFin;
	}

	public String getFundingPlan() {
		return fundingPlan;
	}

	public void setFundingPlan(String fundingPlan) {
		this.fundingPlan = fundingPlan;
	}

	public String getRewardDesc() {
		return rewardDesc;
	}

	public void setRewardDesc(String rewardDesc) {
		this.rewardDesc = rewardDesc;
	}

	public String getRewardPrice() {
		return rewardPrice;
	}

	public void setRewardPrice(String rewardPrice) {
		this.rewardPrice = rewardPrice;
	}

	public String getRewardTitle() {
		return rewardTitle;
	}

	public void setRewardTitle(String rewardTitle) {
		this.rewardTitle = rewardTitle;
	}

	public String getRewardEA() {
		return rewardEA;
	}

	public void setRewardEA(String rewardEA) {
		this.rewardEA = rewardEA;
	}

	public String getFeedback() {
		return feedback;
	}

	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	@Override
	public String toString() {
		return "Application [applyNo=" + applyNo + ", maker=" + maker + ", description=" + description + ", id=" + id
				+ ", makerTel=" + makerTel + ", makerEmail=" + makerEmail + ", makerInfo=" + makerInfo
				+ ", fundingTitle=" + fundingTitle + ", fundingCategory=" + fundingCategory + ", fundingContent="
				+ fundingContent + ", fundingPrice=" + fundingPrice + ", fundingStart=" + fundingStart + ", fundingFin="
				+ fundingFin + ", fundingPlan=" + fundingPlan + ", rewardDesc=" + rewardDesc + ", rewardPrice="
				+ rewardPrice + ", rewardTitle=" + rewardTitle + ", rewardEA=" + rewardEA + ", feedback=" + feedback
				+ "]";
	}
	
}
