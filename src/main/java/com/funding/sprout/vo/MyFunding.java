package com.funding.sprout.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component
public class MyFunding {
	private int orderNo;
	private int orderDetailNo;
	private int fundingNo;
	private String orderStatus;
	private String userId;
	private String fundingTitle;
	private String maker;
	private String paymentType;
	private Date orderDate;
	private String rewardTitle;
	private int rewardPrice;
	private int rewardCount;
	private int rTotalPrice;
	private Timestamp fundingstart;
	private Timestamp fundingfin;
	
	
	
	
	
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public int getFundingNo() {
		return fundingNo;
	}
	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getOrderDetailNo() {
		return orderDetailNo;
	}
	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getRewardTitle() {
		return rewardTitle;
	}
	public void setRewardTitle(String rewardTitle) {
		this.rewardTitle = rewardTitle;
	}
	public int getRewardPrice() {
		return rewardPrice;
	}
	public void setRewardPrice(int rewardPrice) {
		this.rewardPrice = rewardPrice;
	}
	public int getRewardCount() {
		return rewardCount;
	}
	public void setRewardCount(int rewardCount) {
		this.rewardCount = rewardCount;
	}
	public int getrTotalPrice() {
		return rTotalPrice;
	}
	public void setrTotalPrice(int rTotalPrice) {
		this.rTotalPrice = rTotalPrice;
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
	
	public MyFunding(int orderNo, int orderDetailNo, int fundingNo, String orderStatus, String userId,
			String fundingTitle, String maker, String paymentType, Date orderDate, String rewardTitle, int rewardPrice,
			int rewardCount, int rTotalPrice, Timestamp fundingstart, Timestamp fundingfin) {
		super();
		this.orderNo = orderNo;
		this.orderDetailNo = orderDetailNo;
		this.fundingNo = fundingNo;
		this.orderStatus = orderStatus;
		this.userId = userId;
		this.fundingTitle = fundingTitle;
		this.maker = maker;
		this.paymentType = paymentType;
		this.orderDate = orderDate;
		this.rewardTitle = rewardTitle;
		this.rewardPrice = rewardPrice;
		this.rewardCount = rewardCount;
		this.rTotalPrice = rTotalPrice;
		this.fundingstart = fundingstart;
		this.fundingfin = fundingfin;
	}
	@Override
	public String toString() {
		return "MyFunding [orderNo=" + orderNo + ", orderDetailNo=" + orderDetailNo + ", fundingNo=" + fundingNo
				+ ", orderStatus=" + orderStatus + ", userId=" + userId + ", fundingTitle=" + fundingTitle + ", maker="
				+ maker + ", paymentType=" + paymentType + ", orderDate=" + orderDate + ", rewardTitle=" + rewardTitle
				+ ", rewardPrice=" + rewardPrice + ", rewardCount=" + rewardCount + ", rTotalPrice=" + rTotalPrice
				+ ", fundingstart=" + fundingstart + ", fundingfin=" + fundingfin + "]";
	}
	public MyFunding() {
	}
	
	
	
	 
	


	
	
}
