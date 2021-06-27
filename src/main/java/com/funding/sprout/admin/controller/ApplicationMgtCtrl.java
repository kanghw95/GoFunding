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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.admin.service.ApplicationMgtService;
import com.funding.sprout.vo.Application;

@Controller
public class ApplicationMgtCtrl {
	
	@Autowired
	private ApplicationMgtService applicationMgtService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/formList")
	public ModelAndView formList() {
		
		List<Application> list=applicationMgtService.formList();
		System.out.println("목록 "+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("formList",list);
		mv.setViewName("admin/formList");
		
		return mv;
	}
	
	@RequestMapping(value = "/formDetail", method = RequestMethod.GET)
	public ModelAndView formDetail(@RequestParam() String applyNo) {
		List<Application> list=applicationMgtService.formDetail(applyNo);
		System.out.println("상세 "+list);
		ModelAndView mv=new ModelAndView();
		mv.addObject("formDetail",list);
		mv.setViewName("admin/formDetail");
		
		return mv;
	}
	
	@RequestMapping(value = "/formPermit", method = RequestMethod.POST)
	public void formPermit(Application app, @RequestParam() String start, @RequestParam() String end,
			 @RequestParam() String delivery, HttpServletResponse response) {
		
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
				wr.println("var cp=\"<%=request.getContextPath()%>\";"); 
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
	public ModelAndView formReject(Application app) {
		System.out.println(app);
		int a=applicationMgtService.formReject(app);
		List<Application> vo=applicationMgtService.formReject();
		System.out.println(a);
		System.out.println(vo);
		
		ModelAndView mv=new ModelAndView();
		mv.addObject("formReject", vo);
		mv.setViewName("admin/formReject");
		
		return mv;
	}
}
