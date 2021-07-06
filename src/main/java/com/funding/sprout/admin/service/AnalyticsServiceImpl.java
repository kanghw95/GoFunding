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
	public Float analAge1020() { //연령 통계 지표 : 1020대
		return analyticsDao.analAge1020();
	}

	@Override
	public Float analAge3040() { //연령 통계 지표 : 3040대
		return analyticsDao.analAge3040();
	}

	@Override
	public Float analAge5060() { //연령 통계 지표 : 5060대
		return analyticsDao.analAge5060();
	}

	@Override
	public int analCate1() { //분류별 통계 지표 : 일자리 창출
		return analyticsDao.analCate1();
	}

	@Override
	public int analCate2() { //분류별 통계 지표 : 공정 무역
		return analyticsDao.analCate2();
	}

	@Override
	public int analCate3() { //분류별 통계 지표 : 친환경
		
		return analyticsDao.analCate3();
	}

	@Override
	public int analCate4() { //분류별 통계 지표 : 기부
		return analyticsDao.analCate4();
	}

	@Override
	public int analCate5() { //분류별 통계 지표 : 작은 가게
		return analyticsDao.analCate5();
	}

	@Override
	public int analCate6() { //분류별 통계 지표 : 미디어
		return analyticsDao.analCate6();
	}

	@Override
	public int analCate7() { //분류별 통계 지표 : 창작자
		return analyticsDao.analCate7();
	}

	@Override
	public int analGenderM() { //성별 통계 지표 : 남성
		return analyticsDao.analGenderM();
	}

	@Override
	public int analGenderF() { //성별 통계 지표 : 여성
		return analyticsDao.analGenderF();
	}

	@Override
	public List<HashMap<String, String>> analPayment() {
		return analyticsDao.analPayment();
	}

}
