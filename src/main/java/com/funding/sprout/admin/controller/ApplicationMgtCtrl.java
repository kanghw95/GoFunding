package com.funding.sprout.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.admin.service.ApplicationMgtService;
import com.funding.sprout.vo.Application;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class ApplicationMgtCtrl {
	
	@Autowired
	private ApplicationMgtService applicationMgtService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/fundingList")
	public ModelAndView fundingList() { //펀딩 목록 조회 : 전체
		List<Application> list=applicationMgtService.fundingList();
		System.out.println("목록 "+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("fundingList",list);
		mv.setViewName("admin/fundingList");
		
		return mv;
	}
	
	@RequestMapping(value = "/fundingListCate")
	public ModelAndView fundingListCate(@RequestParam() String fundingCategory) { //펀딩 목록 조회 : 카테고리
		List<Application> list=applicationMgtService.fundingListCate(fundingCategory);
		System.out.println("목록 "+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("fundingList",list);
		mv.setViewName("admin/fundingList");
		
		return mv;
	}
	
	@RequestMapping(value = "/formList")
	public ModelAndView formList() { //펀딩 신청서 목록 조회 : 전체
		List<Application> list=applicationMgtService.formList();
		System.out.println("목록 "+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("formList",list);
		mv.setViewName("admin/formList");
		
		return mv;
	}
	
	@RequestMapping(value = "/formListCate")
	public ModelAndView formListCate(@RequestParam() String fundingCategory) {  //펀딩 신청서 목록 조회 : 카테고리
		ModelAndView mv=new ModelAndView();
		List<Application> vo;
		if(fundingCategory==null||fundingCategory=="") {
			vo=applicationMgtService.formList();
			mv.addObject("formList", vo);
			mv.setViewName("admin/formList");
			return mv;
		}
		System.out.println(fundingCategory);
		vo=applicationMgtService.formListCate(fundingCategory);
		System.out.println(vo);
		mv.addObject("formList", vo);
		mv.setViewName("admin/formList");
		return mv;
	}
	
	@RequestMapping(value = "/formDetail", method = RequestMethod.GET)
	public ModelAndView formDetail(@RequestParam() String applyNo) { //펀딩 신청서 상세 페이지
		List<Application> list=applicationMgtService.formDetail(applyNo);
		System.out.println("상세 "+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("formDetail",list);
		mv.setViewName("admin/formDetail");
		
		return mv;
	}
	
	@RequestMapping(value = "/formPermit", method = RequestMethod.POST)
	public void formPermit(Application app, @RequestParam() String start, @RequestParam() String end,
			 @RequestParam() String delivery, HttpServletResponse response) { //펀딩 신청서 승인
		Timestamp fundingStart=new Timestamp(0);
		Timestamp fundingFin=new Timestamp(0);
		Date dd= new Date();
		System.out.println(app+start+end+delivery);
		
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = dateFormat.parse(start);
			Date endDate = dateFormat.parse(end);
			dd = dateFormat.parse(delivery);
			
			fundingStart=new java.sql.Timestamp(startDate.getTime());
			fundingFin=new java.sql.Timestamp(endDate.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		java.sql.Date deliveryDate= new java.sql.Date(dd.getTime());
		app.setFundingStart(fundingStart);
		app.setFundingFin(fundingFin);
		app.setDeliveryDate(deliveryDate);
		int applyNo=app.getApplyNo();
		
		int a=applicationMgtService.makeMaker(app);
		int b=applicationMgtService.makeFunding(app);
		int c=applicationMgtService.applicationConfirm(applyNo);
		int result=a+b+c;
		System.out.println(a+b+c);
		
		if(result==3) {
			response.setContentType("text/html; charset=UTF-8");
			try {
				PrintWriter wr=response.getWriter();
				wr.println("<script type='text/javascript'>"); 
				wr.println("location.href='http://localhost:8090/sprout/formList';"); 
				wr.println("</script>");
				wr.flush();
			} catch (IOException e) {
				e.printStackTrace();
			} 
		} else {
		}
	}
	
	@RequestMapping(value = "/formReject", method = RequestMethod.GET)
	public ModelAndView formReject(Application app) { //펀딩 신청서 반려 처리 및 반려 펀딩 목록
		System.out.println(app);
		if(app.getFeedback()!=null && app.getFeedback()!="") {
			int a=applicationMgtService.formRejectInput(app);
			System.out.println("사유입력"+a);
		}
		List<Application> vo=applicationMgtService.formReject();
		System.out.println(vo);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("formReject", vo);
		mv.setViewName("admin/formReject");
		
		return mv;
	}
	
	@RequestMapping(value = "/formRejectCate", method = RequestMethod.GET)
	public ModelAndView formRejectCate(@RequestParam() String fundingCategory) { //반려 펀딩 카테 선택 목록
		ModelAndView mv=new ModelAndView();
		List<Application> vo;
		if(fundingCategory==null||fundingCategory=="") {
			vo=applicationMgtService.formReject();
			mv.addObject("formReject", vo);
			mv.setViewName("admin/formReject");
			return mv;
		}
		System.out.println(fundingCategory);
		vo=applicationMgtService.formRejectCate(fundingCategory);
		System.out.println(vo);
		mv.addObject("formReject", vo);
		mv.setViewName("admin/formReject");
		return mv;
	}
}
