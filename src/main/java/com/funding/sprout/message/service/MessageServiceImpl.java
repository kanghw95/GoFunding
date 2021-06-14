package com.funding.sprout.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.message.dao.MessageDao;
import com.funding.sprout.vo.Message;


@Service("mesService")
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao mesDao;

	@Override
	public List<Message> listOfSender(String senderId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Message getMessage(String messageId, String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int add(Message message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMessage(String messageId, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
