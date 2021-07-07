package com.funding.sprout.funding.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.Reward;

public interface FundingService {

	public int listCount();// 전체 펀딩수 조회

	public Funding selectOne(int fundingno); // 펀딩 상세페이지

	public List<Funding> searchList(String serchOption, String keyword); // 펀딩 제목&내용 검색

	public List<Funding> selectList();// 전체 펀딩 조회

	public List<Reward> selectReward(int fundingno);// 리워드 가져오기
	
	public int insertOrders(Order oder); // 주문입력
	
	public int selectTotalPrice(int fundingno); // 펀딩별 주문금액  조회
	
	public int priceUpdate(Funding funding); // 펀딩 현재금액 업데이트
	
	public int selectHistory(int fundingno); // 펀딩별 참여인원 조회
	
	public List<Order> selectHistoryDetail(int fundingno); // 펀딩별 참여내역 조회

	public int insertFunding(); // 펀딩 입력

	public int updateFunding(); // 펀딩 수정

	public int deleteFunding(); // 펀딩 삭제

	public Funding getPreference(); // TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도

}
