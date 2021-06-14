package com.funding.sprout.order.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.order.service.OrderService;


@Controller
public class OrderCtrl {
	
	@Autowired
	private OrderService orService;
	
	
	@RequestMapping(value = "insertOrder", method = RequestMethod.GET) // 주문하기
	public ModelAndView insertOrder() {
		return null;
		
	}
	
	@RequestMapping(value = "reduceProduct", method = RequestMethod.GET) // 주문 시 재고량 수정
	public ModelAndView reduceProduct() {
		return null;
		
	}
	
	@RequestMapping(value = "getOrderAll", method = RequestMethod.GET) // 주문 전체보기
	public ModelAndView getOrderAll() {
		return null;
		
	}
}
