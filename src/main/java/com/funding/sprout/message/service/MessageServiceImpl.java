package com.funding.sprout.message.service;

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
	public List<Map<String, String>> msgMakerList(String senderId) {
		return msgDao.msgMakerList(senderId);
	}
	
	@Override
	public List<Map<String, String>> msgMakerUserList(String receiverId) {
		return msgDao.msgMakerUserList(receiverId);
	}
	
	@Override
	public List<Map<String, String>> msgUserList(Map<String, String> vo) {
		List<Map<String, String>> vo1=null;
		try {
			vo1=msgDao.msgUserList(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo1;
	}

	@Override
	public List<Message> getMakerMessage(Map<String, String> id) {
		return msgDao.getMakerMessage(id);
	}
	
	@Override
	public List<Message> getUserMessage(Map<String, String> id) {
		return msgDao.getUserMessage(id);
	}
	
	@Override
	public List<Message> getAdminMessage(Map<String, String> id){
		return msgDao.getAdminMessage(id);
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
