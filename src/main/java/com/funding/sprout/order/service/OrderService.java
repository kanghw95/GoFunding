package com.funding.sprout.order.service;

import java.util.ArrayList;

import com.funding.sprout.vo.Order;

public interface OrderService {

	public void insertOrder();  // 펀딩하기

	
	public void reduceProduct(); // 펀딩 시 리워드 재고량 수정
	

	public ArrayList<Order> getOrderAll(); // 주문한 펀딩 전체보기

}
