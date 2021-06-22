package com.funding.sprout.admin.service;

import java.util.List;

import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.Faq;
import com.funding.sprout.vo.Notifiy;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.Report;
import com.funding.sprout.vo.User;

public interface AdminService {

	public Admin adminlogin(); // 관리자 계정 세선 저장용

	public List<User> list(Criteria cri) throws Exception; // 검색 가능한 전체 회원 조회

	public int listCount() throws Exception; // 유저수 조회
	
	public List<User> selectUserId(User user) throws Exception; // 유저 아이디 조회
	
	public List<User> selectUserName(User user) throws Exception; // 유저 이름 조회
	
	public List<User> selectUserNick(User user) throws Exception; // 유저 닉네임 조회

	public void userStop(String userNo); // 회원 권한 박탈

	public List<Board> freeBoardList(Criteria cri) throws Exception; // 자유 게시판 조회
	
	public List<Board> reviewBoardList(Criteria cri) throws Exception; // 후기 게시판 조회
	
	public List<Board> questionBoardList(Criteria cri) throws Exception; // 질의응답 게시판 조회
	
	public List<Board> shareBoardList(Criteria cri) throws Exception; // 정보공유 게시판 조회
	
	public List<Board> eventBoardList(Criteria cri) throws Exception; // 이벤트 게시판 조회
	
	public int freeBoardCount() throws Exception; // 자유 게시판 글 수 조회
	
	public int reviewBoardCount() throws Exception; // 후기 게시판 글 수 조회
	
	public int questionBoardCount() throws Exception; // 질의응답 게시판 글 수 조회
	
	public int shareBoardCount() throws Exception; // 정보공유 게시판 글 수 조회
	
	public int eventBoardCount() throws Exception; // 이벤트 게시판 글 수 조회
	
	public List<Board> selectFBoardId(Board board) throws Exception; // 자유 게시판 작성자 조회
	
	public List<Board> selectFBoardTitle(Board board) throws Exception; // 자유 게시판 제목 조회
	
	public List<Board> selectRBoardId(Board board) throws Exception; // 후기 게시판 작성자 조회
	
	public List<Board> selectRBoardTitle(Board board) throws Exception; // 후기 게시판 제목 조회
	
	public List<Board> selectQBoardId(Board board) throws Exception; // 질의응답 게시판 작성자 조회

	public List<Board> selectQBoardTitle(Board board) throws Exception; // 질의응답 게시판 제목 조회
	
	public List<Board> selectSBoardId(Board board) throws Exception; // 정보공유 게시판 작성자 조회
	
	public List<Board> selectSBoardTitle(Board board) throws Exception; // 정보공유 게시판 제목 조회
	
	public List<Board> selectEBoardId(Board board) throws Exception; // 이벤트 게시판 작성자 조회
	
	public List<Board> selectEBoardTitle(Board board) throws Exception; // 이벤트 게시판 제목 조회
	
	public List<Board> selectFRadio(Board board) throws Exception; // 자유 게시판 라디오박스 조회
	
	public List<Board> selectRRadio(Board board) throws Exception; // 후기 게시판 라디오박스 조회
	
	public List<Board> selectQRadio(Board board) throws Exception; // 질의응답 게시판 라디오박스 조회
	
	public List<Board> selectSRadio(Board board) throws Exception; // 정보공유 게시판 라디오박스 조회
	
	public List<Board> selectERadio(Board board) throws Exception; // 이벤트 게시판 라디오박스 조회
	
	public void deleteFBoardList(String boardNo); // 자유 게시판 글 삭제
	
	public void deleteRBoardList(String boardNo); // 리뷰 게시판 글 삭제
	
	public void deleteQBoardList(String boardNo); // 질의응답 게시판 글 삭제
	
	public void deleteSBoardList(String boardNo); // 정보공유 게시판 글 삭제
	
	public void deleteEBoardList(String boardNo); // 이벤트 게시판 글 삭제
	
	public int userStart(); // 회원 권한 복원

	public List<Qna> getQNAByPage(); // qna 리스트 조회


	public int qnaInsert(); // qna 답변 쓰기


	public int getQNACount(); // qna수 조회


	public int qnaUpdate();// qna 답변수정

	public List<Faq> getFAQByPage();// faq 리스트 조회


	public int getFAQCount(); // 공지사항 수 조회


	public int FAQInsert(); // FAQ 쓰기


	public int FAQdelete(); // FAQ 삭제


	public int FAQUpdate(); // FAQ 수정하기


	public List<Notifiy> getNotifyByPage(); // 공지사항 리스트 조회


	public int getNotifyCount(); // 공지사항 수 조회


	public int NotifyInsert(); // 공지사항 글쓰기

	public int Notifydelete(); // 공지사항 삭제


	public int NotifyUpdate(); // 공지사항 수정


	public List<Report> getPeportByPage(); // 신고 리스트 조회


	public int getReportCount(); // 신고 리스트 수  조회

}
