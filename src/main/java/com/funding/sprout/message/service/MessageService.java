package com.funding.sprout.message.service;

import java.util.List;
import java.util.Map;

import com.funding.sprout.vo.Message;

public interface MessageService {

	public List<Map<String, String>> msgMakerList(String senderId); // 회원-메이커 목록

	public List<Map<String, String>> msgMakerUserList(String receiverId); // 메이커-회원 목록
	
	public List<Map<String, String>> msgUserList(Map<String, String> vo); // 회원(관리자)-회원 목록
	
	public List<Message> getMakerMessage(Map<String, String> id); //메이커-회원 상세 조회
	
	public List<Message> getUserMessage(Map<String, String> id); //회원-회원 상세 조회
	
	public List<Message> getAdminMessage(Map<String, String> id); //관리자-회원 상세 조회

	public int msgInsert(Message msg); //메세지 저장

	public int deleteMessage(int msgNo); //메세지 삭제
	
}
