package com.funding.sprout.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;
@Component
public class Order {

	private int orderNo; // 주문번호
	private int orderTotalPrice; // 합계금액
	private String deliveryAddr; // 배송주소
	private String recipient; // 수령인
	private String recipientPhone; // 수령인연락처
	private Date orderDate; // 주문일
	private char paymentType; // 주문방법
	private String deliveryMessage; // 배송 메시지
	private int fundingNo; // 펀딩번호
	private String id; // 아이디

	public Order() {

	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderTotalPrice=" + orderTotalPrice + ", deliveryAddr=" + deliveryAddr
				+ ", recipient=" + recipient + ", recipientPhone=" + recipientPhone + ", orderDate=" + orderDate
				+ ", paymentType=" + paymentType + ", deliveryMessage=" + deliveryMessage + ", fundingNo=" + fundingNo
				+ ", id=" + id + "]";
	}

	public Order(int orderNo, int orderTotalPrice, String deliveryAddr, String recipient, String recipientPhone,
			Date orderDate, char paymentType, String deliveryMessage, int fundingNo, String id) {
		super();
		this.orderNo = orderNo;
		this.orderTotalPrice = orderTotalPrice;
		this.deliveryAddr = deliveryAddr;
		this.recipient = recipient;
		this.recipientPhone = recipientPhone;
		this.orderDate = orderDate;
		this.paymentType = paymentType;
		this.deliveryMessage = deliveryMessage;
		this.fundingNo = fundingNo;
		this.id = id;
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

	public char getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(char paymentType) {
		this.paymentType = paymentType;
	}
	
	public String getDeliveryMessage() {
		return deliveryMessage;
	}

	public void setDeliveryMessage(String deliveryMessage) {
		this.deliveryMessage = deliveryMessage;
	}

	public int getFundingNo() {
		return fundingNo;
	}

	public void setFundingNo(int fundingNo) {
		this.fundingNo = fundingNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
