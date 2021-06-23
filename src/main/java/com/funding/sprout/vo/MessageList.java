package com.funding.sprout.vo;

import java.sql.Date;

public class MessageList { //메세지 조회용 VO

	private int msgNo;
	private String fundingTitle;
	private String maker;
	private String receiverId;
	private String receiverName;
	private String senderId;
	private String senderName;
	private String msgContent;
	private Date msgDate;
	private char msgRoot;
	
	public MessageList(int msgNo, String fundingTitle, String maker, String receiverId, String receiverName,
			String senderId, String senderName, String msgContent, Date msgDate, char msgRoot) {
		super();
		this.msgNo = msgNo;
		this.fundingTitle = fundingTitle;
		this.maker = maker;
		this.receiverId = receiverId;
		this.receiverName = receiverName;
		this.senderId = senderId;
		this.senderName = senderName;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
		this.msgRoot = msgRoot;
	}
	
	public MessageList() {
		super();
	}
	
	public int getMsgNo() {
		return msgNo;
	}
	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}
	public String getFundingTitle() {
		return fundingTitle;
	}
	public void setFundingTitle(String fundingTitle) {
		this.fundingTitle = fundingTitle;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
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
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
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
		return "MessageList [msgNo=" + msgNo + ", fundingTitle=" + fundingTitle + ", maker=" + maker + ", receiverId="
				+ receiverId + ", receiverName=" + receiverName + ", senderId=" + senderId + ", senderName="
				+ senderName + ", msgContent=" + msgContent + ", msgDate=" + msgDate + ", msgRoot=" + msgRoot + "]";
	}

}
