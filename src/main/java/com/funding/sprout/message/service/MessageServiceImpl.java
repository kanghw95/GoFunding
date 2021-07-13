package com.funding.sprout.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.message.dao.MessageDao;
import com.funding.sprout.vo.Message;

@Service("msgService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao msgDao;

	
	@Override
	public String userUserMsgCnt(String loginId) {
		return msgDao.userUserMsgCnt(loginId);
	}
	
	@Override
	public String makerUserMsgCnt(String loginId) {
		return msgDao.makerUserMsgCnt(loginId);
	}
	@Override
	public List<Map<String, String>> msgMakerList(String senderId) {
		return msgDao.msgMakerList(senderId);
	}
	
	@Override
	public List<Map<String, String>> msgMakerUserList(String receiverId) {
		return msgDao.msgMakerUserList(receiverId);
	}
	
	@Override
	public List<HashMap<String, String>> msgUserList(HashMap<String, String> vo) {
		List<HashMap<String, String>> vo1=null;
		try {
			vo1=msgDao.msgUserList(vo);
			System.out.println("들어옴~~");
			System.out.println(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo1;
	}
	
	@Override
	public List<HashMap<String, String>> msgAdminUserList(HashMap<String, String> vo) {
		return msgDao.msgAdminUserList(vo);
	}
	
	@Override
	public List<Map<String, String>> getUserMakerMessage(HashMap<String, String> id) {
		return msgDao.getUserMakerMessage(id);
	}
	
	@Override
	public List<Map<String, String>> getMakerUserMessage(HashMap<String, String> id) {
		return msgDao.getMakerUserMessage(id);
	}
	
	@Override
	public List<Message> getUserMessage(HashMap<String, String> id) {
		return msgDao.getUserMessage(id);
	}
	
	@Override
	public List<Message> getAdminMessage(HashMap<String, String> id){
		return msgDao.getAdminMessage(id);
	}
	
	@Override
	public String findMaker(String maker) {
		return msgDao.findMaker(maker);
	}
	
	@Override
	public int msgInsert(Message msg) {
		return msgDao.msgInsert(msg);
	}

	@Override
	public int deleteMessage(int msgNo) {
		return msgDao.deleteMessage(msgNo);
	}

}
