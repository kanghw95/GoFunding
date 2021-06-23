package com.funding.sprout.vo;

import java.sql.Date;

public class Message {

	private int msgNo; // 쪽지번호
	private String msgTitle; // 쪽지제목
	private String msgContent; // 쪽지내용
	private String senderId; // 발신 회원 아이디
	private String senderName; // 발신 회원 이름
	private String receiverId; // 수신 회원 or 메이커
	private String receiverName; // 수신 회원 or 메이커 이름
	private Date msgDate; // 쪽지수발신일자
	private char msgRoot; // 회원0 메이커1 구분

	public Message() {

	}

	public Message(int msgNo, String msgTitle, String msgContent, String senderId, String senderName, String receiverId,
			String receiverName, Date msgDate, char msgRoot) {
		super();
		this.msgNo = msgNo;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.senderId = senderId;
		this.senderName = senderName;
		this.receiverId = receiverId;
		this.receiverName = receiverName;
		this.msgDate = msgDate;
		this.msgRoot = msgRoot;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public Date getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}

	public char getMsgRoot() {
		return msgRoot;
	}

	public void setMsgRoot(char msgRoot) {
		this.msgRoot = msgRoot;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", msgTitle=" + msgTitle + ", msgContent=" + msgContent + ", senderId="
				+ senderId + ", senderName=" + senderName + ", receiverId=" + receiverId + ", receiverName="
				+ receiverName + ", msgDate=" + msgDate + ", msgRoot=" + msgRoot + "]";
	}

}
