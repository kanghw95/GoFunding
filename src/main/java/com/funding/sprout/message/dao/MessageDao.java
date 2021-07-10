package com.funding.sprout.message.dao;

import java.util.HashMap;
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

	public String userUserMsgCnt(String loginId) { //회원-회원 메세지 개수
		return sqlSession.selectOne("Message.countUserUserMsg", loginId);
	}
	
	public String makerUserMsgCnt(String loginId) { //메이커-회원 메세지 개수
		return sqlSession.selectOne("Message.countMakerUserMsg", loginId);
	}
	
	public List<Map<String, String>> msgMakerList(String senderId) { //회원-메이커 메세지 목록
		return sqlSession.selectList("Message.selectMakerList", senderId);
	}
	
	public List<Map<String, String>> msgMakerUserList(String receiverId) { //메이커-회원 메세지 목록
		return sqlSession.selectList("Message.selectMakerUserList", receiverId);
	}

	public List<HashMap<String, String>> msgUserList(HashMap<String, String> vo) { //회원-회원 메세지 목록
		System.out.println("lll"+vo);
		return sqlSession.selectList("Message.selectUserList", vo);
	}

	public List<Map<String, String>> getUserMakerMessage(HashMap<String, String> id) { //회원-메이커 상세 조회
		return sqlSession.selectList("Message.selectUserMakerRead", id);
	}
	
	public List<Map<String, String>> getMakerUserMessage(HashMap<String, String> id) { //메이커-회원 상세 조회
		return sqlSession.selectList("Message.selectMakerUserRead", id);
	}
	
	public List<Message> getUserMessage(HashMap<String, String> id) { //회원-회원 상세 조회
		return sqlSession.selectList("Message.selectUserRead", id);
	}
	
	public List<Message> getAdminMessage(HashMap<String, String> id) { //관리자-회원 상세 조회
		return sqlSession.selectList("Message.selectAdminRead", id);
	}
	
	public String findMaker(String maker) { //메이커 아이디 찾기
		return sqlSession.selectOne("Message.findMaker", maker);
	}
	
	public int msgInsert(Message msg) {// 추가
		return sqlSession.insert("Message.insertMsg", msg); 
	}

	public int deleteMessage(int msgNo) { //삭제
		return sqlSession.delete("Message.msgDelete", msgNo);
	}

}
