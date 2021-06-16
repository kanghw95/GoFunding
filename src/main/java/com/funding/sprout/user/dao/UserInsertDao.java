package com.funding.sprout.user.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.User;

@Repository("userDao")
public class UserInsertDao {
	
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
	
	public ArrayList<User> nickCheck(){ // 닉네임 중복체크
		return null;
		
	}
	
	public int modifyUser() {
		return 0; // 내 정보 수정
		
	}
	
	public User idFind() { // 아이디 찾기
		return null;
		
	}
	
	public User pwFind() { //비밀번호 찾기
		return null;
		
	}
	
	
	public int drawlUser() { // 회원 탈퇴
		return 0;
		
	}
	
}
