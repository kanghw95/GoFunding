package com.funding.sprout.user.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.funding.sprout.message.service.MessageService;
import com.funding.sprout.user.service.UserMyPageService;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.MyFunding;
import com.funding.sprout.vo.PageMaker;
import com.funding.sprout.vo.User;

@Controller
public class UserMyPageCtrl {
	
	@Autowired
	private UserMyPageService myService;
	@Autowired
	private MessageService msgService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public ModelAndView mypagetest(Locale locale, Model model, HttpSession session) {
		logger.info("myPage 진입", locale);

		ModelAndView mv=new ModelAndView();
		User loginUser=(User)session.getAttribute("user");
		String loginId=loginUser.getUserId();
		String userCnt=msgService.userUserMsgCnt(loginId);
		String makerCnt=msgService.makerUserMsgCnt(loginId);
		mv.addObject("userCnt", userCnt);
		mv.addObject("makerCnt", makerCnt);
		mv.setViewName("user/myPage");
		
		return mv;
	}
	
	
	@RequestMapping(value = "/myfundinglist", method = RequestMethod.GET) 
	public String myFundingList(Model model, HttpSession session) throws Exception { // 내가 참여한 전체 펀딩 조회 페이지
		System.out.println("fundinglist 컨트롤러 들어옴");
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		List<MyFunding> fundingList = myService.list(id); // 펀딩 리스트
		int fundingCount = myService.cntMyFunding(id); // 펀딩 참여 횟수
		
		System.out.println(loginUser);
		System.out.println("id: " + id);
		System.out.println("fundingList: " + fundingList);
		System.out.println("fundingCount: " + fundingCount);
		
		
		model.addAttribute("fundingList", fundingList); 
		model.addAttribute("fundingCount", fundingCount);
		
		
		return "user/myFundingList";
	}
	
	
	@RequestMapping(value = "/myfundingdetail", method = RequestMethod.GET)
	public ModelAndView myFundingDetailList(ModelAndView mv, HttpSession session, @RequestParam(name="fundingNo")int fundingNo, MyFunding vo) throws Exception{
		System.out.println("fundingDetail 들어옴");
		
		
		User loginUser = (User)session.getAttribute("user");
		String id = loginUser.getUserId();
		
		vo.setUserId(id);
		vo.setFundingNo(fundingNo);
		
		List<MyFunding> fundingReward = myService.rewardList(id);
		MyFunding fundingDetail = myService.fundingDetail(vo);
		
		System.out.println("fundingNo"+ fundingNo);
		System.out.println(loginUser);
		System.out.println("id: " + id);
		System.out.println("fundingDetail: " + fundingDetail);
		System.out.println("fundingReward : " + fundingReward);

		mv.addObject("fundingDetail", fundingDetail);
		mv.addObject("fundingReward", fundingReward);
		
		
		mv.setViewName("user/myFundingDetail");
		
		
		return mv;
	}
	
}
