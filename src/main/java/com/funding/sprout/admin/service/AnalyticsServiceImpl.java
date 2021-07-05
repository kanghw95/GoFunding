package com.funding.sprout.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AnalyticsDao;

@Service("analyticsService")
public class AnalyticsServiceImpl implements AnalyticsService {
	
	@Autowired
	private AnalyticsDao analyticsDao;

	@Override
	public Float analAge1020() {
		return analyticsDao.analAge1020();
	}

	@Override
	public Float analAge3040() {
		return analyticsDao.analAge3040();
	}

	@Override
	public Float analAge5060() {
		return analyticsDao.analAge5060();
	}

	@Override
	public int analCate1() {
		return analyticsDao.analCate1();
	}

	@Override
	public int analCate2() {
		return analyticsDao.analCate2();
	}

	@Override
	public int analCate3() {
		return analyticsDao.analCate3();
	}

	@Override
	public int analCate4() {
		return analyticsDao.analCate4();
	}

	@Override
	public int analCate5() {
		return analyticsDao.analCate5();
	}

	@Override
	public int analCate6() {
		return analyticsDao.analCate6();
	}

	@Override
	public int analCate7() {
		return analyticsDao.analCate7();
	}

	@Override
	public int analGenderM() {
		return analyticsDao.analGenderM();
	}

	@Override
	public int analGenderF() {
		return analyticsDao.analGenderF();
	}

}
