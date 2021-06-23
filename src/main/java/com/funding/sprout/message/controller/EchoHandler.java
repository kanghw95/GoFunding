package com.funding.sprout.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.funding.sprout.vo.User;

@Component
public class EchoHandler extends TextWebSocketHandler {

	private static List<WebSocketSession> sessions;
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@PostConstruct
	public void init() {
		sessions=new ArrayList<WebSocketSession>();
		System.out.println("웹소켓세션생성됨");
	}
	
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		System.out.println("afterConnectionEstablished:" + session);
		sessions.add(session);
		String senderId = getId(session);
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage:" + session + " : " + message);
		String senderId = getId(session);

		for(WebSocketSession sess: sessions) {
			sess.sendMessage(new TextMessage(senderId+": "+message.getPayload()));
		}
		
		
//		String msg=message.getPayload();
//		if(StringUtils.isNotEmpty(msg)) {
//			String[] strs = msg.split(",");
//			if(strs!=null && strs.length>5) {
//				String SenderId=strs[1];
//				String SenderName=strs[1];
//				String receiverId=strs[2];
//				String receiverName=strs[2];
//				String msgNo=strs[3];
//				String msgTitle=strs[3];
//				String msgContent=strs[3];
//				String msgDate=strs[3];
//				
//				WebSocketSession msgWriterSession = userSessions.get(boardWriter);
//				if ("reply".equals(cmd) && msgWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 "
//							+ "<a href='/board/read?bno=" + bno + "'>" + bno + "</a>번 게시글에 댓글을 달았습니다!");
//					msgWriterSession.sendMessage(tmpMsg);
//				}
//				}
//			}
		}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionEstablished:" + session + ":" + status);
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("loginUser");
		if (null == loginUser)
			return session.getId();
		else
			return loginUser.getUserId();
	}
}
