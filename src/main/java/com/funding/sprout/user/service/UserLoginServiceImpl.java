package com.funding.sprout.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserLoginDao;
import com.funding.sprout.vo.User;

@Service("userLoginService")
public class UserLoginServiceImpl implements UserLoginService {
	
	@Autowired
	private UserLoginDao userLoginDao;

	@Override
	public User login(User user) {
		return userLoginDao.login(user);
	}

	@Override
	public User socialLogin(Map<String, String> vo) {
		return userLoginDao.socialLogin(vo);
	}
}
