package com.funding.sprout.order.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Order;

@Repository("orDao")
public class OrderDao {

	@Autowired
	private SqlSession sqlSession;

	public void insertOrder() { // 펀딩하기

	}

	public void reduceProduct() { // 펀딩 시 리워드 재고량 수정

	}

	public ArrayList<Order> getOrderAll() { // 주문한 펀딩 전체보기
		return null; 

	}

}
