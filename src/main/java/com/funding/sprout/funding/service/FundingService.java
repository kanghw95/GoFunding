package com.funding.sprout.funding.service;

import java.util.List;

import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.Reward;

public interface FundingService {

	public int listCount();// 전체 펀딩수 조회

	public Funding selectOne(int fundingno); // 펀딩 상세페이지

	public List<Funding> searchList(String serchOption, String keyword); // 펀딩 제목&내용 검색
	
	public List<Funding> selectCatList(String serchOption); // 펀딩 분류별 검색
	
	public List<Funding> selectFinList(String serchOption); // 종료 펀딩검색
	
	public List<Funding> selectCatFinList(String serchOption); // 펀딩  원하는 순서 + 종료만  조회 

	public List<Funding> selectList();// 전체 펀딩 조회

	public List<Reward> selectReward(int fundingno);// 리워드 가져오기
	
	public int insertOrders(Order oder); // 주문입력
	
	public int selectTotalPrice(int fundingno); // 펀딩별 주문금액  조회
	
	public int priceUpdate(Funding funding); // 펀딩 현재금액 업데이트
	
	public int selectHistory(int fundingno); // 펀딩별 참여인원 조회
	
	public List<Order> selectHistoryDetail(int fundingno); // 펀딩별 참여내역 조회
	
	public int selectOrderCheck(Order order); // 펀딩별 참여 중복검사
	
	public int rewardStock(Reward reward); // 리워드 수량 조회
	
	public int rewardStockChange(Reward reward); // 리워드 수량 변경
	
	public int insertOrdersDetail(OrderDetail orderDetail); // 주문 상세 입력

	public int selectOrderNo(Order order); // 주문 번호 알아오기
	
	public int selectRewardNo(Reward reward); // 주문 리워드 알아오기
	
	public int rewardCount(Reward reward); // 리워드 참가 인원알아오기
	
	public int rewardCountIncrease(Reward reward); // 리워드 참가 인원 증가
	
	int checklike(int fundingno, String Id); // 펀딩 좋아요 검사
	
	int insertLike(int fundingno,String Id); // 펀딩 좋아요
	
	int deleteLike(int fundingno,String Id); // 펀딩 좋아요 취소
	
	int likecnt(int fundingno); // 펀딩 좋아요수
	
	public Funding getPreference(); // TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도

}
