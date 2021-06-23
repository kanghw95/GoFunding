package com.funding.sprout.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.message.service.MessageService;
import com.funding.sprout.vo.Message;
import com.funding.sprout.vo.User;

@Controller
@RequestMapping("/message")
public class MessageCtrl {

	@Autowired
	private MessageService msgService;

	@RequestMapping(value = "/msgList1", method = RequestMethod.GET) // 회원-메이커 메세지 목록
	public ModelAndView msgList1(ModelAndView mv, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("user");
		String senderId=loginUser.getUserId();
		List<Map<String, String>> msgList = msgService.msgMakerList(senderId);
		
		mv.addObject("msgList1",msgList);
		mv.setViewName("/message/msgList1");
		
		return mv;
	}
	
	@RequestMapping(value = "/msgList2", method = RequestMethod.GET) // 회원-회원 메세지 목록
	public ModelAndView msgList2(ModelAndView mv, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("user");
		String senderId=loginUser.getUserId();
		
		HashMap<String, String> vo=new HashMap<String, String>();
		vo.put("senderId", senderId);
		vo.put("msgRoot", "2");
		
		List<Map<String, String>> msgList = msgService.msgUserList(vo);
		mv.addObject("msgList2",msgList);
		mv.setViewName("/message/msgList2");
		
		return mv;
	}
	
	@RequestMapping(value = "/msgList3", method = RequestMethod.GET) // 메이커-회원 메세지 목록
	public ModelAndView msgList3(ModelAndView mv, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("user");
		String receiverId=loginUser.getUserId();
		
		List<Map<String, String>> msgList = msgService.msgMakerUserList(receiverId);
		mv.addObject("msgList3",msgList);
		mv.setViewName("/message/msgList3");
		
		return mv;
	}
	
	@RequestMapping(value = "/msgUserList", method = RequestMethod.GET) // 관리자-회원 메세지 목록
	public ModelAndView msgUserList(ModelAndView mv, HttpSession session) {

		HashMap<String, String> vo=new HashMap<String, String>();
		vo.put("senderId", "admin");
		vo.put("msgRoot", "3");

		List<Map<String, String>> msgList = msgService.msgUserList(vo);
		mv.addObject("msgList",msgList);
		mv.setViewName("/message/msgUserList");
		
		return mv;
	}
	
	@RequestMapping(value = "/msgAdminList", method = RequestMethod.GET) // 회원-관리자 메세지 목록
	public ModelAndView msgAdminList(ModelAndView mv, HttpSession session) {
		
		User loginUser=(User)session.getAttribute("user");
		String receiverId=loginUser.getUserId();
		
		HashMap<String, String> vo=new HashMap<String, String>();
		vo.put("senderId", receiverId);
		vo.put("msgRoot", "4");
		List<Map<String, String>> msgList = msgService.msgUserList(vo);
		mv.addObject("msgList",msgList);
		mv.setViewName("/message/msgAdminList");
		
		return mv;
	}

	@RequestMapping(value = "/msgRead1", method = RequestMethod.GET) // 회원-메이커 메세지 상세
	public ModelAndView msgRead1 (
			@RequestParam(name="receiverId") String receiverId, 
			HttpSession session) {
		User loginUser=(User)session.getAttribute("user");
		String senderId=loginUser.getUserId();
		Map<String, String> id = new HashMap<String, String>();
		id.put("receiverId", receiverId);
		id.put("senderId", senderId);
		List<Message> ml=msgService.getMakerMessage(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", ml);
		mv.setViewName("/message/msgRead1");
		return mv;
	}

	@RequestMapping(value = "/msgRead2", method = RequestMethod.GET) // 회원-회원 메세지 상세
	public ModelAndView msgRead2 (
			@RequestParam(name="receiverId") String receiverId, 
			HttpSession session) {
		User loginUser=(User)session.getAttribute("user");
		String loginId=loginUser.getUserId();
		HashMap<String, String> id=new HashMap<String, String>();
		id.put("userId", receiverId);
		id.put("loginId", loginId);
		id.put("msgRoot", "2");
		List<Message> ml=msgService.getUserMessage(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", ml);
		mv.setViewName("/message/msgRead2");
		return mv;
	}
	
	@RequestMapping(value = "/msgRead3", method = RequestMethod.GET) // 메이커-회원 메세지 상세
	public ModelAndView msgRead3 (
			@RequestParam(name="receiverId") String receiverId, 
			HttpSession session) {
		User loginUser=(User)session.getAttribute("user");
		String loginId=loginUser.getUserId();
		HashMap<String, String> id=new HashMap<String, String>();
		id.put("senderId", receiverId);
		id.put("receiverId", loginId);
		List<Message> ml=msgService.getMakerMessage(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", ml);
		mv.setViewName("/message/msgRead3");
		return mv;
	}
	
	@RequestMapping(value = "/msgAdminRead", method = RequestMethod.GET) // 회원-관리자 메세지 상세
	public ModelAndView msgAdminRead (
			@RequestParam(name="receiverId") String receiverId, 
			HttpSession session) {
		System.out.println("receiverId: "+receiverId);
		User loginUser=(User)session.getAttribute("user");
		String loginId=loginUser.getUserId();
		HashMap<String, String> id=new HashMap<String, String>();
		id.put("userId", receiverId);
		id.put("loginId", loginId);
		List<Message> ml=msgService.getAdminMessage(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", ml);
		mv.setViewName("/message/msgAdminRead");
		return mv;
	}
	
	@RequestMapping(value = "/msgUserRead", method = RequestMethod.GET) // 관리자-회원 메세지 상세
	public ModelAndView msgUserRead (
			@RequestParam(name="receiverId") String receiverId, 
			HttpSession session) {
		HashMap<String, String> id=new HashMap<String, String>();
		id.put("userId", receiverId);
		id.put("loginId", "admin");
		List<Message> ml=msgService.getAdminMessage(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", ml);
		mv.setViewName("/message/msgUserRead");
		return mv;
	}
	
	@RequestMapping(value = "msgInsert1", method = RequestMethod.POST) // 메이커-회원 발송 메시지 저장 (회원 root0 메이커 root1)
	public void msgInsert1(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int result=0;
		User loginUser=(User)session.getAttribute("user");
		char maker=request.getParameter("makerChk").charAt(0);
		
		String senderId=loginUser.getUserId();
		Message msg = new Message();
		
		msg.setMsgContent(request.getParameter("msgContent"));
		if(maker=='0') {
			msg.setMsgRoot(maker);
			msg.setReceiverId(request.getParameter("receiverId"));
			msg.setSenderId(senderId);
		} else if(maker=='1') {
			msg.setMsgRoot(maker);
			msg.setReceiverId(senderId);
			msg.setSenderId(request.getParameter("receiverId"));
		}
		result=msgService.msgInsert(msg);
		System.out.println(result);
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter wr=response.getWriter();
			wr.println("<script type='text/javascript'>"); 
			wr.println("alert('등록성공'); window.location = document.referrer;"); 
			wr.println("</script>");
			wr.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "msgInsert2", method = RequestMethod.POST) // 회원-회원 발송 메시지 저장 (회원 간 root2)
	public void msgInsert2(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int result=0;
		User loginUser=(User)session.getAttribute("user");
		String senderId=loginUser.getUserId();
		Message msg = new Message();
		
		msg.setMsgContent(request.getParameter("msgContent"));
		msg.setReceiverId(request.getParameter("receiverId"));
		msg.setMsgRoot('2');
		msg.setSenderId(senderId);
		
		result=msgService.msgInsert(msg);
		
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter wr=response.getWriter();
			wr.println("<script type='text/javascript'>"); 
			wr.println("alert('등록성공'); window.location = document.referrer;"); 
			wr.println("</script>");
			wr.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "msgAdminInsert", method = RequestMethod.POST) // 관리자-회원 발송 메시지 저장 (관리자 root3) (회원 root4)
	public void msgAdminInsert(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
		int result=0;
		User loginUser=(User)session.getAttribute("user");
		String loginId=loginUser.getUserId();
		String receiverId=request.getParameter("receiverId");
		
		Message msg = new Message();
		
		msg.setMsgContent(request.getParameter("msgContent"));
		if(loginId.equals("admin")) {
			msg.setMsgRoot('3');
			msg.setReceiverId(receiverId);
			msg.setSenderId(loginId);
		} else {
			msg.setMsgRoot('4');
			msg.setReceiverId("admin");
			msg.setSenderId(loginId);
		}
		result=msgService.msgInsert(msg);
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter wr=response.getWriter();
			wr.println("<script type='text/javascript'>"); 
			wr.println("alert('등록성공'); window.location = document.referrer;"); 
			wr.println("</script>");
			wr.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "msgDelete", method = RequestMethod.GET) // 메시지 삭제
	public int msgDelete(String num) {
		int result = 0, msgNo = 0;
		try {
			msgNo=Integer.parseInt(num);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		if(msgNo>0) {
			result=msgService.deleteMessage(msgNo);
		}
		return result;
	}

}
