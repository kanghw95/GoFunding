package com.funding.sprout.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.funding.sprout.HomeController;
import com.funding.sprout.admin.service.AnalyticsService;

@Controller
public class AnalyticsCtrl {
	
	@Autowired
	private AnalyticsService analyticsService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/adminMain")
	public String adminMain() { //관리자 페이지 메인
		
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/index")
	public String index() { //테스트용
		
		return "admin/index";
	}
}
