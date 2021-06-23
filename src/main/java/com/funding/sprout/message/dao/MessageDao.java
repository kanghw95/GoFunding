package com.funding.sprout.message.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Message;

@Repository("msgDao")
public class MessageDao {

	@Autowired
	private SqlSession sqlSession;

	public List<Map<String, String>> msgMakerList(String senderId) { //회원-메이커 메세지 목록
		System.out.println("daoList: "+senderId);
		return sqlSession.selectList("Message.selectMakerList", senderId);
	}
	
	public List<Map<String, String>> msgMakerUserList(String receiverId) { //메이커-회원 메세지 목록
		System.out.println("daoList: "+receiverId);
		return sqlSession.selectList("Message.selectMakerUserList", receiverId);
	}

	public List<Map<String, String>> msgUserList(Map<String, String> vo) { //회원-회원 메세지 목록
		System.out.println("daoList: "+vo);
		return sqlSession.selectList("Message.selectUserList", vo);
	}

	public List<Message> getMakerMessage(Map<String, String> id) { //메이커-회원 상세 조회
		System.out.println("dao: "+id);
		return sqlSession.selectList("Message.selectMakerRead", id);
	}
	
	public List<Message> getUserMessage(Map<String, String> id) { //회원-회원 상세 조회
		System.out.println("dao: "+id);
		return sqlSession.selectList("Message.selectUserRead", id);
	}
	
	public List<Message> getAdminMessage(Map<String, String> id) { //관리자-회원 상세 조회
		System.out.println("dao: "+id);
		return sqlSession.selectList("Message.selectAdminRead", id);
	}
	
	public int msgInsert(Message msg) {// 추가
		return sqlSession.insert("Message.insertMsg", msg); 
	}

	public int deleteMessage(int msgNo) { //삭제
		return sqlSession.delete("Message.msgDelete", msgNo);
	}

}
