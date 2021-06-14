package com.funding.sprout.vo;

import java.sql.Date;

public class Order {

	private int orderNo; // 주문번호
	private int orderTotalPrice; // 합계금액
	private String deliveryAddr; // 배송주소
	private String recipient; // 수령인
	private String recipientPhone; // 수령인연락처
	private Date orderDate; // 주문일
	
	
	public Order() {
		
	}

	
	public Order(int orderNo, int orderTotalPrice, String deliveryAddr, String recipient, String recipientPhone,
			Date orderDate) {
		super();
		this.orderNo = orderNo;
		this.orderTotalPrice = orderTotalPrice;
		this.deliveryAddr = deliveryAddr;
		this.recipient = recipient;
		this.recipientPhone = recipientPhone;
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderTotalPrice=" + orderTotalPrice + ", deliveryAddr=" + deliveryAddr
				+ ", recipient=" + recipient + ", recipientPhone=" + recipientPhone + ", orderDate=" + orderDate + "]";
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public String getDeliveryAddr() {
		return deliveryAddr;
	}

	public void setDeliveryAddr(String deliveryAddr) {
		this.deliveryAddr = deliveryAddr;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getRecipientPhone() {
		return recipientPhone;
	}

	public void setRecipientPhone(String recipientPhone) {
		this.recipientPhone = recipientPhone;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

}
