package com.funding.sprout.message.service;

import java.util.List;

import com.funding.sprout.vo.Message;

public interface MessageService {

	public List<Message> listOfSender(String senderId); // 보낸 목록

	public Message getMessage(String messageId, String userId); // 조회

	public int add(Message message); // 추가

	public int deleteMessage(String messageId, String userId); //삭제
	
}
