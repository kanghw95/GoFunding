package com.funding.sprout.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board {

	private int boardNo; // 글번호
	private String boardTitle; // 글 제목
	private String boardContent; // 글 내용
	private Date boardDate; // 글 작성일
	private int boardCnt; // 글 조회수
	private String boardId; // 글 작성자
	private int likecnt; // 추천수
	private int cmt; // 리스트에 보일 댓글 수
	
	public Board() {

	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", boardCnt=" + boardCnt + ", boardId=" + boardId + ", likecnt="
				+ likecnt + ", cmt=" + cmt + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public int getCmt() {
		return cmt;
	}
	public void setCmt(int cmt) {
		this.cmt = cmt;
	}



}
