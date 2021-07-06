package com.funding.sprout.admin.service;

import java.util.HashMap;
import java.util.List;

public interface AnalyticsService {
	
	public Float analAge1020(); //연령 통계 지표 : 1020대
	
	public Float analAge3040(); //연령 통계 지표 : 3040대
	
	public Float analAge5060(); //연령 통계 지표 : 5060대
	
	public int analCate1(); //분류별 통계 지표 : 일자리 창출
	
	public int analCate2(); //분류별 통계 지표 : 공정 무역
	
	public int analCate3(); //분류별 통계 지표 : 친환경
	
	public int analCate4(); //분류별 통계 지표 : 기부
	 
	public int analCate5(); //분류별 통계 지표 : 작은 가게
	
	public int analCate6(); //분류별 통계 지표 : 미디어
	
	public int analCate7(); //분류별 통계 지표 : 창작자
	
	public int analGenderM(); //성별 통계 지표 : 남성

	public int analGenderF(); //성별 통계 지표 : 여성
	
	public List<HashMap<String, String>> analPayment(); //결제 금액 통계
	
}
