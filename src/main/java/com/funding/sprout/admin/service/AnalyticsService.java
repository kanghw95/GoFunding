package com.funding.sprout.admin.service;

import java.util.HashMap;
import java.util.List;

public interface AnalyticsService {
	
	public Float analAgeF1020(); //연령 통계 지표 : 1020대
	
	public Float analAgeF3040(); //연령 통계 지표 : 3040대
	
	public Float analAgeF5060(); //연령 통계 지표 : 5060대
	
	public int analCateF1(); //분류별 통계 지표 : 일자리 창출
	
	public int analCateF2(); //분류별 통계 지표 : 공정 무역
	
	public int analCateF3(); //분류별 통계 지표 : 친환경
	
	public int analCateF4(); //분류별 통계 지표 : 기부
	 
	public int analCateF5(); //분류별 통계 지표 : 작은 가게
	
	public int analCateF6(); //분류별 통계 지표 : 미디어
	
	public int analCateF7(); //분류별 통계 지표 : 창작자
	
	public int analFGenderM(); //성별 통계 지표 : 남성

	public int analFGenderF(); //성별 통계 지표 : 여성
	
	public Float analAgeC1020(); //커뮤니티 연령 통계 지표 : 1020대
	
	public Float analAgeC3040(); //커뮤니티 연령 통계 지표 : 3040대
	
	public Float analAgeC5060(); //커뮤니티 연령 통계 지표 : 5060대
	
	public int analCateC1(); //커뮤니티 분류별 통계 지표 : 자유게시판
	
	public int analCateC2(); //커뮤니티 분류별 통계 지표 : 후기게시판
	
	public int analCateC3(); //커뮤니티 분류별 통계 지표 : 질답게시판
	
	public int analCateC4(); //커뮤니티 분류별 통계 지표 : 이벤트게시판
	
	public int analCateC5(); //커뮤니티 분류별 통계 지표 : 정보공유게시판
	
	public int analCGenderM(); //펀딩 성별 통계 지표 : 남성
	
	public int analCGenderF(); //펀딩 성별 통계 지표 : 여성
	
	public List<HashMap<String, String>> analPayment(); //결제 금액 통계
	
}
