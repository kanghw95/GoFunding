package com.funding.sprout.user.service;

import java.util.ArrayList;

import com.funding.sprout.vo.User;

public interface UserInfoService {

	public ArrayList<User> selectAll(); // 전체 회원 조회
	
	public ArrayList<User> searchUser();// 회원 검색
	
	public int insertUser(User user); //회원가입
	
	public int idCheck(String userId); // 아이디 중복체크
	
	public int nickCheck(String userNick); // 닉네임 중복체크

	public int emailCheck(String userEmail); // 이메일 중복체크
	
	public int modifyUser(); // 내 정보 수정

	public int drawlUser(String userId); // 회원 탈퇴
	
}
