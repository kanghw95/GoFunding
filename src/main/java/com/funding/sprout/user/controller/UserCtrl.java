package com.funding.sprout.user.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.user.service.UserService;

@Controller
public class UserCtrl {
	
	@Autowired
	private UserService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "selectAll", method = RequestMethod.GET)  
	public ModelAndView selectAll() {
		return null; // 전체 회원 조회
		
	}
	
	@RequestMapping(value = "searchUser", method = RequestMethod.GET)  
	public ModelAndView searchUser() {
		return null; // 회원 검색
		
	}
	
	@RequestMapping(value = "userInsert", method = RequestMethod.GET)  
	public ModelAndView userInsert() {
		return null; // 회원 가입
		
	}
	
	@RequestMapping(value = "id_nickCheck", method = RequestMethod.GET)  
	public ModelAndView id_nickCheck() {
		return null; // 아이디/닉네임 중복체크
		
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)  
	public ModelAndView login() {
		return null; // 로그인
		
	}
	@RequestMapping(value = "modifyUser", method = RequestMethod.GET)  
	public ModelAndView modifyUser() {
		return null; // 내 정보 수정
		
	}
	@RequestMapping(value = "idFind", method = RequestMethod.GET)  
	public ModelAndView idFind() {
		return null; // 아이디 찾기
		
	}
	
	@RequestMapping(value = "pwFind", method = RequestMethod.GET)  
	public ModelAndView pwFind() {
		return null; // 비밀번호 찾기
		
	}
	
	@RequestMapping(value = "drawlUser", method = RequestMethod.GET)  
	public ModelAndView drawlUser() {
		return null; // 회원 탈퇴
		
	}
	
}
