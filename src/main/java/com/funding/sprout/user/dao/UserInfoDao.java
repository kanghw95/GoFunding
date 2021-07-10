package com.funding.sprout.user.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.User;

@Repository("userDao")
public class UserInfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<User> selectAll(){ // 전체 회원 조회
		return null;
		
	}
	
	public ArrayList<User> searchUser(){ // 회원 검색
		return null;
		
	}
	
	public int insertUser(User user) { //회원가입
		return sqlSession.insert("User.insertUser", user);
	}
	
	public int idCheck(String userId){ // 아이디 중복체크
		return sqlSession.selectOne("User.idCheck", userId);
		
	}
	
	public int nickCheck(String userNick){ // 닉네임 중복체크
		return sqlSession.selectOne("User.nickCheck", userNick);
		
	}
	
	public int emailCheck(String userEmail){ // 이메일 중복체크
		return sqlSession.selectOne("User.emailCheck", userEmail);
		
	}
	
	public int modifyUser() {
		return 0; // 내 정보 수정
		
	}
	
	public int drawlUser(String userId) { // 회원 탈퇴
		return sqlSession.delete("User.deleteUser", userId);
		
	}
	
}
