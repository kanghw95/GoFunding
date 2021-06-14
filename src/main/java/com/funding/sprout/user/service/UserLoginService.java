package com.funding.sprout.user.service;

import java.util.Map;

import com.funding.sprout.vo.User;

public interface UserLoginService {

	public User login(User user); // 일반로그인
	
	public User socialLogin(Map<String, String> vo); //소셜로그인
}
