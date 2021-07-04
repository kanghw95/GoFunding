package com.funding.sprout.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserFindDao;
import com.funding.sprout.vo.User;

@Service("userFindService")
public class UserFindServiceImpl implements UserFindService {
	
	@Autowired
	private UserFindDao userFindDao;

	@Override
	public User findId(User user) {
		return userFindDao.findId(user);
	}

	@Override
	public User findPwd(User user) {
		return userFindDao.findPwd(user);
	}
}
