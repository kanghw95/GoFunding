package com.funding.sprout.vo;

import org.springframework.stereotype.Component;

@Component
public class OrderDetail {
	private int orderDetailNo; // 주문 상세 번호
	private int orderNo; // 주문 번호
	private int rewardNo; // 리워드 번호
	private int rewardCount; // 주문 수량
	private int rewardPrice; // 주문 가격
	private char orderStatus; // 주문 상태
	
	public OrderDetail() {
		
	}
	
	
	
	public OrderDetail(int orderDetailNo, int orderNo, int rewardNo, int rewardCount, int rewardPrice,
			char orderStatus) {
		super();
		this.orderDetailNo = orderDetailNo;
		this.orderNo = orderNo;
		this.rewardNo = rewardNo;
		this.rewardCount = rewardCount;
		this.rewardPrice = rewardPrice;
		this.orderStatus = orderStatus;
	}



	@Override
	public String toString() {
		return "OrderDetail [orderDetailNo=" + orderDetailNo + ", orderNo=" + orderNo + ", rewardNo=" + rewardNo
				+ ", rewardCount=" + rewardCount + ", rewardPrice=" + rewardPrice + ", orderStatus=" + orderStatus
				+ "]";
	}



	public int getOrderDetailNo() {
		return orderDetailNo;
	}
	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getRewardNo() {
		return rewardNo;
	}
	public void setRewardNo(int rewardNo) {
		this.rewardNo = rewardNo;
	}
	public int getRewardCount() {
		return rewardCount;
	}
	public void setRewardCount(int rewardCount) {
		this.rewardCount = rewardCount;
	}
	public int getRewardPrice() {
		return rewardPrice;
	}
	public void setRewardPrice(int rewardPrice) {
		this.rewardPrice = rewardPrice;
	}
	public char getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(char orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	

}
