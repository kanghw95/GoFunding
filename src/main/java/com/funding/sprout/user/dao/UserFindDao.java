package com.funding.sprout.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.User;

@Repository("userFindDao")
public class UserFindDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public User findId(User user) { //아이디 찾기
		System.out.println("dao : "+user);
		return sqlSession.selectOne("User.findId", user);
	}
	
	public User findPwd(User user) { //비밀번호 찾기
		System.out.println("dao : "+user);
		return sqlSession.selectOne("User.findPwd", user);
	}
}
