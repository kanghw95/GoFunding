package com.funding.sprout.user.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.funding.sprout.HomeController;
import com.funding.sprout.user.service.UserInfoService;
import com.funding.sprout.user.service.UserSMSService;
import com.funding.sprout.vo.User;

import net.nurigo.java_sdk.Coolsms;

@Controller
@RequestMapping("/user")
public class UserInfoCtrl {
	
	@Autowired
	private UserInfoService userService;
	
	@Autowired
	private UserSMSService smsService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
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
		System.out.println("user:" + user);
		int result = 0;
		result = userService.insertUser(user);
		System.out.println("컨트롤 result" + result);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST, produces = "application/text; charset=utf-8")  
	public String idCheck(@RequestParam("userId") String id) {
		System.out.println("idCheck 컨트롤러 들어옴");

		// 아이디 중복 체크
		int result = userService.idCheck(id);
		String idCheck;
		
		if(result > 0) {
			System.out.println("result : " + result);
			idCheck = "중복 사용 불가";
		}else {
			System.out.println("result : " + result);
			idCheck = "사용가능";
		}
		System.out.println("idCheck : " + idCheck);
		
		return idCheck;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST, produces = "application/text; charset=utf-8")  
	public String nickCheck(@RequestParam("userNick") String nick) {
		System.out.println("nickCheck 컨트롤러");
		// 닉네임 중복 체크
		System.out.println("nick : " + nick);
		int result = userService.nickCheck(nick);
		String nickCheck;
		
		if(result > 0) {
			System.out.println("result : " + result);
			nickCheck = "중복 사용 불가";
		}else {
			System.out.println("result : " + result);
			nickCheck = "사용가능";
		}
		System.out.println("nickCheck : " + nickCheck);
		
		return nickCheck;
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST, produces = "application/text; charset=utf-8")  
	public String emailCheck(@RequestParam("userEmail") String email) {
		System.out.println("emailCheck 컨트롤러");
		// 이메일 중복 체크
		System.out.println("email: " + email);
		int result = userService.emailCheck(email);
		String emailCheck;
		
		if(result > 0) {
			System.out.println("result : " + result);
			emailCheck = "중복 사용 불가";
		}else {
			System.out.println("result : " + result);
			emailCheck = "사용가능";
		}
		System.out.println("emailCheck : " + emailCheck);
		
		return emailCheck;
		
	}
	
    @ResponseBody
    @RequestMapping(value = "/sendSMS", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
    public String sendSMS(String phoneNumber) {

        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + phoneNumber);
        System.out.println("인증번호 : " + numStr);
        smsService.certifiedPhoneNumber(phoneNumber,numStr);
        return numStr;
    }
	
	

	@RequestMapping(value = "modifyUser", method = RequestMethod.GET)  
	public ModelAndView modifyUser() {
		return null; // 내 정보 수정
		
	}

	
	
	@RequestMapping(value = "/withdrawl", method = RequestMethod.GET)  
	public String withdrawlUser() {
		
		
		return "user/withdrawl"; // 회원 탈퇴 페이지로 이동
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/drawlUser", method = RequestMethod.POST)  
	public String drawlUser(@RequestParam("userId") String userId) {
		System.out.println("drawl 컨트롤러 들어옴");
		
		
		
		
		return null; // 회원 탈퇴
		
	}
	
}
