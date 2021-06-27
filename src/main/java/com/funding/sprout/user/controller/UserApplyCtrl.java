package com.funding.sprout.user.controller;

import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funding.sprout.HomeController;
import com.funding.sprout.user.service.UserApplyService;
import com.funding.sprout.vo.Application;


@Controller
@RequestMapping("/user")
public class UserApplyCtrl {
	
	@Autowired
	private UserApplyService userApplyService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/applicationForm")
	public String applicationForm () {
		
		return "/user/applicationForm";
	}

	@RequestMapping(value = "/formSend")
	public String formSend (HttpSession session, Application app, HttpServletResponse response,
			@RequestParam() String start, @RequestParam() String end, @RequestParam() String domain,
			@RequestParam() String delivery) {
		
		String makerEmail=app.getMakerEmail()+"@"+domain;
		Timestamp fundingStart=new Timestamp(0);
		Timestamp fundingFin=new Timestamp(0);
		Date dd= new Date();
		
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = dateFormat.parse(start);
			Date endDate = dateFormat.parse(end);
			dd = dateFormat.parse(delivery);
			
			System.out.println(startDate);
			System.out.println(endDate);
			
			fundingStart=new java.sql.Timestamp(startDate.getTime());
			fundingFin=new java.sql.Timestamp(endDate.getTime());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		java.sql.Date deliveryDate= new java.sql.Date(dd.getTime());
		
		app.setMakerEmail(makerEmail);
		app.setFundingStart(fundingStart);
		app.setFundingFin(fundingFin);
		app.setDeliveryDate(deliveryDate);
		System.out.println(app);
		
		int result = userApplyService.inputForm(app);
		System.out.println(result);
		
		if(result>0) {
			response.setContentType("text/html; charset=UTF-8");
			try {
				PrintWriter wr=response.getWriter();
				wr.println("<script type='text/javascript'>"); 
				wr.println("alert('제출이 완료되었습니다. 검토 결과는 15일 이내 마이페이지에서 확인 가능합니다.');"); 
				wr.println("</script>");
				wr.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "/user/applicationForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/makerChk", method = RequestMethod.GET)
	public String makerChk (@RequestParam HashMap<String, String> maker) {
		
		System.out.println(maker.get("maker"));
		
		String id=maker.get("maker");
		
		String idChk=userApplyService.duplicateChk(id);
		System.out.println("idChk: "+idChk);
		
		if(idChk!=null) {
			return idChk;
		} else {
			return "no";
		}
		
	}
	
}
