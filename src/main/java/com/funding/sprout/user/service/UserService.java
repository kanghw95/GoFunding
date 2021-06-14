package com.funding.sprout.user.service;

import java.util.ArrayList;

import com.funding.sprout.vo.User;

public interface UserService {

	public ArrayList<User> selectAll(); // 전체 회원 조회
		
	
	public ArrayList<User> searchUser();// 회원 검색
	
	
	public int userinsert(); //회원가입

	
	public ArrayList<User> id_nickCheck(); // 아이디/닉네임 중복체크

	
	public User login(); // 로그인

	
	public int modifyUser(); // 내 정보 수정

	
	public User idFind();  // 아이디 찾기

	
	public User pwFind();  //비밀번호 찾기

	
	public int drawlUser(); // 회원 탈퇴
	
}
