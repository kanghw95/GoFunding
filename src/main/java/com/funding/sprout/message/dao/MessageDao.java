package com.funding.sprout.message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Message;

@Repository("mesDao")
public class MessageDao {

	@Autowired
	private SqlSession sqlSession;

	public List<Message> listOfSender(String senderId) { // 보낸 목록
		return null;

	}

	public Message getMessage(String messageId, String userId) {// 조회
		return null;
	}
	
	public int add(Message message) {// 추가
		return 0; 

	}


	public int deleteMessage(String messageId, String userId) { //삭제
		return 0;
	}

}
