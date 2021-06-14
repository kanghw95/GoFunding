package com.funding.sprout.vo;

import java.sql.Date;

public class Message {

	private int msgNo; // 쪽지번호
	private String msgTitle; // 쪽지제목
	private String msgCotent; // 쪽지내용
	private String senderId; // 보내는 사람 아이디
	private String senderName; // 보내는 사람 이름
	private String receiverId; // 받는 사람 아이디
	private String receiverName; // 받는  사람 이름
	private Date msgDate; // 쪽지수발신시간

	public Message() {

	}

	public Message(int msgNo, String msgTitle, String msgCotent, String senderId, String senderName, String receiverId,
			String receiverName, Date msgDate) {
		super();
		this.msgNo = msgNo;
		this.msgTitle = msgTitle;
		this.msgCotent = msgCotent;
		this.senderId = senderId;
		this.senderName = senderName;
		this.receiverId = receiverId;
		this.receiverName = receiverName;
		this.msgDate = msgDate;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", msgTitle=" + msgTitle + ", msgCotent=" + msgCotent + ", senderId="
				+ senderId + ", senderName=" + senderName + ", receiverId=" + receiverId + ", receiverName="
				+ receiverName + ", msgDate=" + msgDate + "]";
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

	public String getMsgCotent() {
		return msgCotent;
	}

	public void setMsgCotent(String msgCotent) {
		this.msgCotent = msgCotent;
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
}
