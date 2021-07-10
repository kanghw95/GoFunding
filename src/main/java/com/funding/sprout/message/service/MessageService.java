package com.funding.sprout.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.funding.sprout.vo.Message;

public interface MessageService {
	
	public String userUserMsgCnt(String loginId); //회원-회원 메세지 개수
	
	public String makerUserMsgCnt(String loginId); //메이커-회원 메세지 개수

	public List<Map<String, String>> msgMakerList(String senderId); // 회원-메이커 목록

	public List<Map<String, String>> msgMakerUserList(String receiverId); // 메이커-회원 목록
	
	public List<HashMap<String, String>> msgUserList(HashMap<String, String> vo); // 회원(관리자)-회원 목록
	
	public List<Map<String, String>> getUserMakerMessage(HashMap<String, String> id); //회원-메이커 상세 조회

	public List<Map<String, String>> getMakerUserMessage(HashMap<String, String> id); //메이커-회원 상세 조회
	
	public List<Message> getUserMessage(HashMap<String, String> id); //회원-회원 상세 조회
	
	public List<Message> getAdminMessage(HashMap<String, String> id); //관리자-회원 상세 조회

	public String findMaker(String maker); //메이커 아이디 찾기
	
	public int msgInsert(Message msg); //메세지 저장

	public int deleteMessage(int msgNo); //메세지 삭제
	
}
