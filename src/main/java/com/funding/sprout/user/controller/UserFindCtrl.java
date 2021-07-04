package com.funding.sprout.user.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.funding.sprout.HomeController;
import com.funding.sprout.user.service.UserFindService;
import com.funding.sprout.vo.User;

@Controller
@RequestMapping("/user")
public class UserFindCtrl {
	
	@Autowired
	private UserFindService userFindService;
	@Autowired
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/findId")
	public String findId() {
		return "/user/findId";
	}

	@ResponseBody
	@RequestMapping(value = "/chkId")
	public HashMap<String, Object> chkId(@RequestParam String userName, @RequestParam String userEmail,
			@RequestParam String phone, @RequestParam String phoneChk, HttpServletRequest request) {
		System.out.println(userName+" "+userEmail+" "+phone+" "+phoneChk);
		User list=new User();
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(phoneChk=="match"||phoneChk.equals("match")) {
			list.setUserName(userName);
			list.setUserEmail(userEmail);
			list.setUserPhone(phone);
			list=userFindService.findId(list);
			System.out.println(list);
			String id=list.getUserId();
			if(id!=null&&id!="") {
				result.put("userId", id);
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/findPwd")
	public String findPwd() {
		return "/user/findPwd";
	}
	
	@ResponseBody
	@RequestMapping(value = "/chkPwd")
	public HashMap<String, Object> chkPwd(@RequestParam String userId, @RequestParam String userEmail,
			@RequestParam String phone, @RequestParam String phoneChk, HttpServletRequest request) {
		System.out.println(userId+" "+userEmail+" "+phone+" "+phoneChk);
		User list=new User();
		HashMap<String, Object> result = new HashMap<String, Object>();
		if(phoneChk=="match"||phoneChk.equals("match")) {
			list.setUserId(userId);
			list.setUserEmail(userEmail);
			list.setUserPhone(phone);
			list=userFindService.findPwd(list);
			System.out.println(list);
			String pwd=list.getUserPwd();
			if(pwd!=null&&pwd!="") {
				result.put("userPwd", pwd);
			}
		}
		return result;
	}
}
	
