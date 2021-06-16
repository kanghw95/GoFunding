package com.funding.sprout.user.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.funding.sprout.HomeController;
import com.funding.sprout.user.service.UserInsertService;
import com.funding.sprout.vo.User;

@Controller
@RequestMapping("/user")
public class UserInsertCtrl {
	
	@Autowired
	private UserInsertService userService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "selectAll", method = RequestMethod.GET)  
	public ModelAndView selectAll() {
		return null; // 전체 회원 조회
		
	}
	
	@RequestMapping(value = "searchUser", method = RequestMethod.GET)  
	public ModelAndView searchUser() {
		return null; // 회원 검색
		
	}
	
	
	
	// 회원가입 페이지
	@RequestMapping(value = "/join", method = RequestMethod.GET)  
	public String insertUserGet() {
		
	
		return "user/join";
	}
	
	
	// 회원가입 처리
	@ResponseBody
	@RequestMapping(value = "/doJoin", method = RequestMethod.POST, produces = "application/text; charset=utf-8")  
	public void insertUserPost(User user) {
		// 비밀번호 암호화
		// TODO BCrypt 
//		String hashedPwd = BCrypt.hashpw(user.getUserPwd(), BCrypt.gensalt());
//		user.setUserPwd(hashedPwd);
		System.out.println("컨트롤 들어옴");
		int result = 0;
		result = userService.insertUser(user);
		System.out.println("컨트롤 result" + result);
		

		
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/text; charset=utf-8")  
	public String idCheck(@RequestBody String paramData) {
		System.out.println("idCheck 컨트롤러 들어옴");
		// 아이디 중복 체크
		
		String str = paramData.trim();
		System.out.println("str: " + str);
		
		int index = str.indexOf("=");
		String userId = str.substring(0, index);
		System.out.println("userId: " + userId);
		
		int result = userService.idCheck(userId);
		System.out.println("result: " + result);

		String real = "";
		if(result != 0) {
			real = "사용불가";
		}else {
			real = "사용가능";
		}
		System.out.println("real : " + real);
		return real;
	}
	
	@RequestMapping(value = "/nickCheck", method = RequestMethod.GET)  
	public ModelAndView nickCheck() {
		// 닉네임 중복 체크
		
		
		return null; 
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
