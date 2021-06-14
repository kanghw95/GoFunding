package com.funding.sprout.user.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserDao;
import com.funding.sprout.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;

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
	public int userinsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<User> id_nickCheck() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User login() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyUser() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User idFind() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User pwFind() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int drawlUser() {
		// TODO Auto-generated method stub
		return 0;
	}

}
