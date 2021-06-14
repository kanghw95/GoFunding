package com.funding.sprout.order.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.order.dao.OrderDao;
import com.funding.sprout.vo.Order;

@Service("orService")
public class OrderServiceImpl implements OrderService{

	
	@Autowired
	private OrderDao orDao;

	@Override
	public void insertOrder() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void reduceProduct() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Order> getOrderAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
