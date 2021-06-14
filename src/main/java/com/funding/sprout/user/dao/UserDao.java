package com.funding.sprout.user.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.User;

@Repository("userDao")
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<User> selectAll(){ // 전체 회원 조회
		return null;
		
	}
	
	public ArrayList<User> searchUser(){ // 회원 검색
		return null;
		
	}
	
	public int userInsert() { //회원가입
		return 0;
		
	}
	
	public ArrayList<User> id_nickCheck(){ // 아이디/닉네임 중복체크
		return null;
		
	}
	
	public User login() { // 로그인
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
