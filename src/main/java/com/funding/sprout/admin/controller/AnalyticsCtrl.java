package com.funding.sprout.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		Float statF1020=analyticsService.analAgeF1020();
		Float statF3040=analyticsService.analAgeF3040();
		Float statF5060=analyticsService.analAgeF5060();
		
		final float AGETOTALF=100/(float)(statF1020+statF3040+statF5060);
		
		statF1020*=AGETOTALF; statF3040*=AGETOTALF; statF5060*=AGETOTALF;
		
		int cateF1=analyticsService.analCateF1();
		int cateF2=analyticsService.analCateF2();
		int cateF3=analyticsService.analCateF3();
		int cateF4=analyticsService.analCateF4();
		int cateF5=analyticsService.analCateF5();
		int cateF6=analyticsService.analCateF6();
		int cateF7=analyticsService.analCateF7();
		
		final float CATETOTALF=100/(float)(cateF1+cateF2+cateF3+cateF4+cateF5+cateF6+cateF7);
		
		cateF1*=CATETOTALF; cateF2*=CATETOTALF; cateF3*=CATETOTALF; cateF4*=CATETOTALF;
		cateF5*=CATETOTALF; cateF6*=CATETOTALF; cateF7*=CATETOTALF;
		
		int maleF=analyticsService.analFGenderM();
		int femaleF=analyticsService.analFGenderF();
		
		final float GENDERTOTALF=100/(float)(maleF+femaleF);
		
		maleF*=GENDERTOTALF; femaleF*=GENDERTOTALF; //2차이 수정
		
		System.out.println(maleF+femaleF);
		
		
		Float statC1020=analyticsService.analAgeC1020();
		Float statC3040=analyticsService.analAgeC3040();
		Float statC5060=analyticsService.analAgeC5060();
		
		final float AGETOTALC=100/(float)(statC1020+statC3040+statC5060);
		
		statC1020*=AGETOTALC; statC3040*=AGETOTALC; statC5060*=AGETOTALC;
		
		int cateC1=analyticsService.analCateC1();
		int cateC2=analyticsService.analCateC2();
		int cateC3=analyticsService.analCateC3();
		int cateC4=analyticsService.analCateC4();
		int cateC5=analyticsService.analCateC5();
		System.out.println(cateC1+"  "+cateC2+"  "+cateC3+"  "+cateC4+"  "+cateC5);
		
		final float CATETOTALC=100/(float)(cateC1+cateC2+cateC3+cateC4+cateC5);
		System.out.println(CATETOTALC);
		
		cateC1*=CATETOTALC; cateC2*=CATETOTALC; cateC3*=CATETOTALC;
		cateC4*=CATETOTALC; cateC5*=CATETOTALC;
		System.out.println(cateC1+"  "+cateC2+"  "+cateC3+"  "+cateC4+"  "+cateC5);
		
		int maleC=analyticsService.analCGenderM();
		int femaleC=analyticsService.analCGenderF();
		
		final float GENDERTOTALC=100/(float)(maleC+femaleC);
		
		maleC*=GENDERTOTALC; femaleC*=GENDERTOTALC;

		List<HashMap<String, String>> payment=analyticsService.analPayment();
		
		mv.addObject("statF1020", statF1020);
		mv.addObject("statF3040", statF3040);
		mv.addObject("statF5060", statF5060);
		mv.addObject("statC1020", statC1020);
		mv.addObject("statC3040", statC3040);
		mv.addObject("statC5060", statC5060);
		mv.addObject("cateF1", cateF1);
		mv.addObject("cateF2", cateF2);
		mv.addObject("cateF3", cateF3);
		mv.addObject("cateF4", cateF4);
		mv.addObject("cateF5", cateF5);
		mv.addObject("cateF6", cateF6);
		mv.addObject("cateF7", cateF7);
		mv.addObject("cateC1", cateC1);
		mv.addObject("cateC2", cateC2);
		mv.addObject("cateC3", cateC3);
		mv.addObject("cateC4", cateC4);
		mv.addObject("cateC5", cateC5);
		mv.addObject("maleF", maleF);
		mv.addObject("femaleF", femaleF);
		mv.addObject("maleC", maleC);
		mv.addObject("femaleC", femaleC);
		mv.addObject("days", payment);
		
		mv.setViewName("admin/adminMain");
		
		return mv;
	}
	
	@RequestMapping(value = "/index")
	public String index() { //테스트용
		
		return "admin/index";
	}
}
