package com.funding.sprout.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.admin.service.AnalyticsService;

@Controller
public class AnalyticsCtrl {
	
	@Autowired
	private AnalyticsService analyticsService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/adminMain")
	public ModelAndView adminMain() { //관리자 페이지 메인
		
		ModelAndView mv= new ModelAndView();
		
		Float stat1020=analyticsService.analAge1020();
		Float stat3040=analyticsService.analAge3040();
		Float stat5060=analyticsService.analAge5060();
		
		final float AGETOTAL=100/(stat1020+stat3040+stat5060);
		
		stat1020*=AGETOTAL; stat3040*=AGETOTAL; stat5060*=AGETOTAL;
		
		int cate1=analyticsService.analCate1();
		int cate2=analyticsService.analCate2();
		int cate3=analyticsService.analCate3();
		int cate4=analyticsService.analCate4();
		int cate5=analyticsService.analCate5();
		int cate6=analyticsService.analCate6();
		int cate7=analyticsService.analCate7();
		
		final int CATETOTAL=100/(cate1+cate2+cate3+cate4+cate5+cate6+cate7);
		
		cate1*=CATETOTAL; cate2*=CATETOTAL; cate3*=CATETOTAL; cate4*=CATETOTAL;
		cate5*=CATETOTAL; cate6*=CATETOTAL; cate7*=CATETOTAL;
		
		int male=analyticsService.analGenderM();
		int female=analyticsService.analGenderF();
		
		final int GENDERTOTAL=100/(male+female);
		
		male*=GENDERTOTAL; female*=GENDERTOTAL; //2차이 수정
		
		System.out.println(male+female);
		mv.addObject("stat1020", stat1020);
		mv.addObject("stat3040", stat3040);
		mv.addObject("stat5060", stat5060);
		mv.addObject("cate1", cate1);
		mv.addObject("cate2", cate2);
		mv.addObject("cate3", cate3);
		mv.addObject("cate4", cate4);
		mv.addObject("cate5", cate5);
		mv.addObject("cate6", cate6);
		mv.addObject("cate7", cate7);
		mv.addObject("male", male);
		mv.addObject("female", female);
		
		mv.setViewName("admin/adminMain");
		
		return mv;
	}
	
	@RequestMapping(value = "/index")
	public String index() { //테스트용
		
		return "admin/index";
	}
}
