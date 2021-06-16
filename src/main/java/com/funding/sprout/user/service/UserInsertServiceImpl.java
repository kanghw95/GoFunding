package com.funding.sprout.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserInsertDao;
import com.funding.sprout.vo.User;

@Service("userService")
public class UserInsertServiceImpl implements UserInsertService {
	
	@Autowired
	private UserInsertDao userDao;

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
	public ArrayList<User> nickCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyUser() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int drawlUser() {
		// TODO Auto-generated method stub
		return 0;
	}

}
