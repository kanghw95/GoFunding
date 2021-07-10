package com.funding.sprout.funding.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.Reward;


@Repository("funDao")
public class FundingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return sqlSession.selectOne("Funding.listCount"); // 전체 펀딩수 조회
	}
	
	public Funding selectOne(int fundingno) {
		return sqlSession.selectOne("Funding.selectOne",fundingno); // 펀딩 가져오기
	}
	
	public List<Funding> selectList() {
		return sqlSession.selectList("Funding.selectlist");// 전체 펀딩 조회
	}
	

	public List<Funding> searchList(String serchOption, String keyword) { //펀딩 검색
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("검색옵션"+serchOption);
		map.put("serchOption", serchOption);
		map.put("keyword", keyword);
		return sqlSession.selectList("Funding.selectfunList",map);
	} 
	

	public List<Funding> selectCatList(String serchOption) { // 펀딩 분류별 검색
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("검색옵션"+serchOption);
		map.put("serchOption", serchOption);
		return sqlSession.selectList("Funding.selectCatList",map);
	}
	

	public List<Funding> selectFinList(String serchOption) { // 종료 펀딩 검색
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("검색옵션"+serchOption);
		map.put("serchOption", serchOption);
		return sqlSession.selectList("Funding.selectFinList",map);
	}
	
	public List<Reward> selectReward(int fundingno){ // 해당 펀딩 리워드 가져오기 
		return sqlSession.selectList("Reward.selectrewardlist", fundingno);
	}
	
	public int insertOrders(Order order){ // 주문 입력
		return sqlSession.insert("Order.insertOrders",order);
	}
	
	public int selectTotalPrice(int fundingno){ // 펀딩별 주문금액  조회
		return sqlSession.selectOne("Order.selectTotalPrice",fundingno);
	}
	
	public int priceUpdate(Funding funding) { // 펀딩 현재금액 업데이트
		return  sqlSession.update("Funding.priceUpdate",funding);
	}
	
	public int selectHistory(int fundingno) { // 펀딩별 참여인원 조회
		return sqlSession.selectOne("Order.selectHistory",fundingno);
	}
	
	public List<Order> selectHistoryDetail(int fundingno) { // 펀딩별 참여내역 조회
		return sqlSession.selectList("Order.selectHistoryDetail",fundingno);
	}
	
	public int selectOrderCheck(Order order) { // 펀딩별 참여 중복검사
		return sqlSession.selectOne("Order.selectOrderCheck", order);
	}
	
	public int rewardStock(Reward reward) { // 리워드 수량 조회
		return sqlSession.selectOne("Reward.rewardStock", reward);
	}
	
	public int rewardStockChange(Reward reward) { // 리워드 수량 변경
		return sqlSession.update("Reward.rewardStockChange", reward);
	}
	

	public int insertOrdersDetail(OrderDetail orderDetail) {  // 주문 상세 입력
		// TODO Auto-generated method stub
		return sqlSession.insert("OrderDetail.insertOrdersDetail", orderDetail);
	}
	
	public int selectOrderNo(Order order) { // 주문번호 알아오기
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Order.selectOrderNo", order);
	}
	
	public int selectRewardNo(Reward reward) { // 주문 리워드 알아오기
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reward.selectRewardNo", reward);
	}
	
	public int rewardCount(Reward reward) { // 리워드 참가 인원알아오기
		// TODO Auto-generated method stub
		return sqlSession.selectOne("Reward.rewardCount", reward);
	}
	
	public int rewardCountIncrease(Reward reward) { // 리워드 참가 인원 증가
		// TODO Auto-generated method stub
		return sqlSession.update("Reward.rewardCountIncrease", reward);
	}
	
	public Funding getPreference() {  //TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도
		return null;

	}


}
