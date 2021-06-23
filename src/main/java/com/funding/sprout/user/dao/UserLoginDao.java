package com.funding.sprout.user.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.User;

@Repository("userLoginDao")
public class UserLoginDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public User login(User user) { // 일반로그인
		return sqlSession.selectOne("User.logIn", user);
	}
	
	public User socialLogin(Map<String, String> vo) { // 소셜로그인
		return sqlSession.selectOne("User.socialLogIn", vo);
	}
	
}
