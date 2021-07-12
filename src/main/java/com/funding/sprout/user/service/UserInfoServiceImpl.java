package com.funding.sprout.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserInfoDao;
import com.funding.sprout.vo.User;

@Service("userService")
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	private UserInfoDao userDao;

	@Override
	public ArrayList<User> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<User> searchUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int idCheck(String userId) {
		return userDao.idCheck(userId);
	}
	
	@Override
	public int nickCheck(String userNick) {
		return userDao.nickCheck(userNick);
	}
	
	@Override
	public int emailCheck(String userEmail) {
		return userDao.emailCheck(userEmail);
	}

	@Override
	public int modifyUser(User user) {
		return userDao.modifyUser(user);
	}
	
	@Override
	public int modifyAddr(User user) {
		return userDao.modifyAddr(user);
	}

	@Override
	public int drawlUser(String userId) {
		return userDao.drawlUser(userId);
	}


}
