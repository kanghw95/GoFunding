package com.funding.sprout.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.admin.service.AdminService;


@Controller
public class AdminCtrl {

	@Autowired
	private AdminService adService;
	
	@RequestMapping(value = "adlogin", method = RequestMethod.GET)
	public ModelAndView adminlogin() { // 관리자 계정 세선 저장용
		return null;
		
	}
	@RequestMapping(value = "userall", method = RequestMethod.GET)
	public ModelAndView getUserByPage() { // 검색 가능한 전체 회원 조회 페이지
		return null;
	}
	
	@RequestMapping(value = "userselect", method = RequestMethod.GET)
	public ModelAndView selectUser() { // 특정 유저 조회
		return null;

	}
	
	@RequestMapping(value = "usercount", method = RequestMethod.GET)
	public ModelAndView getUserCount() { // 유저수 조회
		return null;

	}
	
	@RequestMapping(value = "usetstop", method = RequestMethod.GET)
	public ModelAndView userStop() { // 회원 권한 박탈
		return null;

	}
	
	@RequestMapping(value = "userstart", method = RequestMethod.GET)
	public ModelAndView userStart() { // 회원 권한 복원
		return null;

	}

	@RequestMapping(value = "qnaAll", method = RequestMethod.GET)
	public ModelAndView getQNAByPage() { // qna 리스트 조회
		return null;

	}
	
	@RequestMapping(value = "qnainsert", method = RequestMethod.GET)
	public ModelAndView qnaInsert() { // qna 답변 쓰기
		return null;
		
	}
	
	@RequestMapping(value = "qnacount", method = RequestMethod.GET)
	public ModelAndView getQNACount() { // qna수 조회
		return null;

	}

	@RequestMapping(value = "qnaupdate", method = RequestMethod.GET)
	public ModelAndView qnaUpdate() { // qna 답변수정
		return null;

	}

	@RequestMapping(value = "faqall", method = RequestMethod.GET)
	public ModelAndView getFAQByPage() { // faq 리스트 조회
		return null;

	}
	
	@RequestMapping(value = "faqcount", method = RequestMethod.GET)
	public ModelAndView getFAQCount() { // 공지사항 수 조회
		return null;
		
	}
	
	@RequestMapping(value = "faqinsert", method = RequestMethod.GET)
	public ModelAndView FAQInsert() { // FAQ 쓰기
		return null; 
	}
	
	@RequestMapping(value = "faqdelete", method = RequestMethod.GET)
	public ModelAndView FAQdelete() {
		return null; // FAQ 삭제

	}
	
	@RequestMapping(value = "faqupdate", method = RequestMethod.GET)
	public ModelAndView FAQUpdate() { // FAQ 수정하기
		return null;
	}
	
	@RequestMapping(value = "notiall", method = RequestMethod.GET)
	public ModelAndView getNotifyByPage(){ // 공지사항 리스트 조회
		return null;
		
	}
	
	@RequestMapping(value = "noticount", method = RequestMethod.GET)
	public ModelAndView getNotifyCount() { // 공지사항 수 조회
		return null;
		
	}
	@RequestMapping(value = "notiInsert", method = RequestMethod.GET)
	public ModelAndView NotifyInsert() { // 공지사항 글쓰기
		return null;
	}
	
	@RequestMapping(value = "notidelete", method = RequestMethod.GET)
	public ModelAndView Notifydelete() { // 공지사항 삭제
		return null; 

	}
	
	@RequestMapping(value = "notiupdate", method = RequestMethod.GET)
	public ModelAndView NotifyUpdate() { // 공지사항 수정
		return null;
	}
	
	@RequestMapping(value = "reportall", method = RequestMethod.GET)
	public ModelAndView getPeportByPage(){ // 신고 리스트 조회
		return null;
		
	}
	
	@RequestMapping(value = "reportcount", method = RequestMethod.GET)
	public ModelAndView getReportCount() { // 신고 리스트 수  조회
		return null; 
		
	}
	
}
