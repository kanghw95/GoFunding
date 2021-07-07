package com.funding.sprout.funding.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Order;
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


	public int insertFunding() {
		return 0; // 펀딩 입력
	}

	public int updateFunding() {
		return 0; // 펀딩 수정
	}

	public int deleteFunding() {
		return 0; // 펀딩 삭제
	}
	
	
	public Funding getPreference() {  //TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도
		return null;

	}

}
