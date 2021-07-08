package com.funding.sprout.vo;


public class OrderRefund {
	private int refundNo; // 환불 번호
	private int orderDetailNo; // 주문 상세 번호
	
	public OrderRefund() {
		
	}
	
	public OrderRefund(int refundNo, int orderDetailNo) {
		super();
		this.refundNo = refundNo;
		this.orderDetailNo = orderDetailNo;
	}
	@Override
	public String toString() {
		return "OrderRefund [refundNo=" + refundNo + ", orderDetailNo=" + orderDetailNo + "]";
	}
	public int getRefundNo() {
		return refundNo;
	}
	public void setRefundNo(int refundNo) {
		this.refundNo = refundNo;
	}
	public int getOrderDetailNo() {
		return orderDetailNo;
	}
	public void setOrderDetailNo(int orderDetailNo) {
		this.orderDetailNo = orderDetailNo;
	}
	
	

}
