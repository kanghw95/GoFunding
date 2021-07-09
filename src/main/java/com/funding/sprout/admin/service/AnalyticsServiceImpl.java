package com.funding.sprout.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AnalyticsDao;

@Service("analyticsService")
public class AnalyticsServiceImpl implements AnalyticsService {
	
	@Autowired
	private AnalyticsDao analyticsDao;

	@Override
	public Float analAgeF1020() { //펀딩 연령 통계 지표 : 1020대
		return analyticsDao.analAgeF1020();
	}

	@Override
	public Float analAgeF3040() { //펀딩 연령 통계 지표 : 3040대
		return analyticsDao.analAgeF3040();
	}

	@Override
	public Float analAgeF5060() { //펀딩 연령 통계 지표 : 5060대
		return analyticsDao.analAgeF5060();
	}

	@Override
	public int analCateF1() { //펀딩 분류별 통계 지표 : 일자리 창출
		return analyticsDao.analCateF1();
	}

	@Override
	public int analCateF2() { //펀딩 분류별 통계 지표 : 공정 무역
		return analyticsDao.analCateF2();
	}

	@Override
	public int analCateF3() { //펀딩 분류별 통계 지표 : 친환경
		
		return analyticsDao.analCateF3();
	}

	@Override
	public int analCateF4() { //펀딩 분류별 통계 지표 : 기부
		return analyticsDao.analCateF4();
	}

	@Override
	public int analCateF5() { //펀딩 분류별 통계 지표 : 작은 가게
		return analyticsDao.analCateF5();
	}

	@Override
	public int analCateF6() { //펀딩 분류별 통계 지표 : 미디어
		return analyticsDao.analCateF6();
	}

	@Override
	public int analCateF7() { //펀딩 분류별 통계 지표 : 창작자
		return analyticsDao.analCateF7();
	}

	@Override
	public int analFGenderM() { //펀딩 성별 통계 지표 : 남성
		return analyticsDao.analFGenderM();
	}

	@Override
	public int analFGenderF() { //펀딩 성별 통계 지표 : 여성
		return analyticsDao.analFGenderF();
	}

	@Override
	public Float analAgeC1020() { //커뮤니티 연령 통계 지표 : 1020대
		return analyticsDao.analAgeC1020();
	}

	@Override
	public Float analAgeC3040() { //커뮤니티 연령 통계 지표 : 3040대
		return analyticsDao.analAgeC3040();
	}

	@Override
	public Float analAgeC5060() { //커뮤니티 연령 통계 지표 : 5060대
		return analyticsDao.analAgeC5060();
	}

	@Override
	public int analCateC1() { //커뮤니티 분류별 통계 지표 : 자유게시판
		return analyticsDao.analCateC1();
	}

	@Override
	public int analCateC2() { //커뮤니티 분류별 통계 지표 : 후기게시판
		return analyticsDao.analCateC2();
	}

	@Override
	public int analCateC3() { //커뮤니티 분류별 통계 지표 : 질답게시판
		return analyticsDao.analCateC3();
	}

	@Override
	public int analCateC4() { //커뮤니티 분류별 통계 지표 : 이벤트게시판
		return analyticsDao.analCateC4();
	}

	@Override
	public int analCateC5() { //커뮤니티 분류별 통계 지표 : 정보공유게시판
		return analyticsDao.analCateC5();
	}
	
	@Override
	public int analCGenderM() {
		return analyticsDao.analCGenderM();
	}

	@Override
	public int analCGenderF() {
		return analyticsDao.analCGenderF();
	}

	@Override
	public List<HashMap<String, String>> analPayment() { //결제 금액 통계
		return analyticsDao.analPayment();
	}
	
	@Override
	public List<HashMap<String, String>> analPaymentTab() { //결제 금액 통계 표 : 주문 대비 결제
		return analyticsDao.analPaymentTab();
	}

	@Override
	public List<HashMap<String, String>> analFundingTab() {  //펀딩 현황 표 
		return analyticsDao.analFundingTab();
	}

}
