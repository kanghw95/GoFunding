package com.funding.sprout.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.funding.sprout.message.service.MessageService;

@Controller
public class MessageCtrl {

	@Autowired
	private MessageService mesService;

	@RequestMapping(value = "mesReceiver", method = RequestMethod.GET) // 받은 목록
	public String listReceiver() {
		return null;
	}

	@RequestMapping(value = "mesSender", method = RequestMethod.GET) // 보낸 목록
	public String listOfSender() {
		return null;
	}

	@RequestMapping(value = "mesView", method = RequestMethod.GET) // 보기
	public void view() {
	}

	@RequestMapping(value = "mesadd", method = RequestMethod.GET) // 메시지 저장
	public String add() {
		return null;
	}

	@RequestMapping(value = "mesDelete", method = RequestMethod.GET) // 메시지 삭제
	public String delete() {
		return null;
		
	}

}
