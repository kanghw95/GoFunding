package com.funding.sprout.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AnalyticsDao;

@Service("analyticsService")
public class AnalyticsServiceImpl implements AnalyticsService {
	
	@Autowired
	private AnalyticsDao analyticsDao;

}
