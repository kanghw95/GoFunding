package com.funding.sprout.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AdminDao;
import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.Faq;
import com.funding.sprout.vo.Notifiy;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.Report;
import com.funding.sprout.vo.User;

@Service("adService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adDao;

	@Override
	public Admin adminlogin() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> list(Criteria cri) throws Exception { // 검색 가능한 전체 회원 조회
		return adDao.list(cri);
	}
	
	@Override
	public int listCount() throws Exception { // 유저 수 조회
		return adDao.listCount();
	}
	
	@Override
	public List<User> selectUserId(User user) throws Exception { // 유저 아이디 조회
		return adDao.selectUserId(user);
	}
	
	@Override
	public List<User> selectUserName(User user) throws Exception { // 유저 이름 조회
		return adDao.selectUserName(user);
	}
	
	@Override
	public List<User> selectUserNick(User user) throws Exception { // 유저 닉네임 조회
		return adDao.selectUserNick(user);
	}

	@Override
	public void userStop(String userNo) { // 회원 권한 박탈
		adDao.userStop(userNo);
	}
	
	@Override
	public List<Board> freeBoardList(Criteria cri) throws Exception { // 자유 게시판 조회
		return adDao.freeBoardList(cri);
	}
	
	@Override
	public List<Board> reviewBoardList(Criteria cri) throws Exception { // 후기 게시판 조회
		return adDao.reviewBoardList(cri);
	}
	
	@Override
	public List<Board> questionBoardList(Criteria cri) throws Exception { // 질의응답 게시판 조회
		return adDao.questionBoardList(cri);
	}

	@Override
	public List<Board> shareBoardList(Criteria cri) throws Exception { // 정보공유 게시판 조회
		return adDao.shareBoardList(cri);
	}
	
	@Override
	public List<Board> eventBoardList(Criteria cri) throws Exception { // 이벤트 게시판 조회
		return adDao.eventBoardList(cri);
	}

	@Override
	public int freeBoardCount() throws Exception { // 자유 게시판 글 수 조회
		return adDao.freeBoardCount();
	}
	
	@Override
	public int reviewBoardCount() throws Exception { // 자유 게시판 글 수 조회
		return adDao.reviewBoardCount();
	}
	
	@Override
	public int questionBoardCount() throws Exception { // 자유 게시판 글 수 조회
		return adDao.questionBoardCount();
	}
	
	@Override
	public int shareBoardCount() throws Exception { // 자유 게시판 글 수 조회
		return adDao.shareBoardCount();
	}
	
	@Override
	public int eventBoardCount() throws Exception { // 자유 게시판 글 수 조회
		return adDao.eventBoardCount();
	}
	
	@Override
	public List<Board> selectFBoardId(Board board) throws Exception { // 자유 게시판 작성자 조회
		return adDao.selectFBoardId(board);
	}
	
	@Override
	public List<Board> selectFBoardTitle(Board board) throws Exception { // 자유 게시판 제목 조회
		return adDao.selectFBoardTitle(board);
	}
	
	@Override
	public List<Board> selectRBoardId(Board board) throws Exception { // 후기 게시판 작성자 조회
		return adDao.selectRBoardId(board);
	}
	
	@Override
	public List<Board> selectRBoardTitle(Board board) throws Exception { // 후기 게시판 제목 조회
		return adDao.selectRBoardTitle(board);
	}
	
	@Override
	public List<Board> selectQBoardId(Board board) throws Exception { // 질의응답 게시판 작성자 조회
		return adDao.selectQBoardId(board);
	}

	@Override
	public List<Board> selectQBoardTitle(Board board) throws Exception { // 질의응답 게시판 제목 조회
		return adDao.selectQBoardTitle(board);
	}

	@Override
	public List<Board> selectSBoardId(Board board) throws Exception { // 정보공유 게시판 작성자 조회
		return adDao.selectSBoardId(board);
	}
	
	@Override
	public List<Board> selectSBoardTitle(Board board) throws Exception { // 정보공유 게시판 제목 조회
		return adDao.selectSBoardTitle(board);
	}	
	
	@Override
	public List<Board> selectEBoardId(Board board) throws Exception { // 이벤트 게시판 작성자 조회
		return adDao.selectEBoardId(board);
	}	
		
	@Override
	public List<Board> selectEBoardTitle(Board board) throws Exception { // 이벤트 게시판 제목 조회
		return adDao.selectEBoardTitle(board);
	}
		
	@Override
	public void deleteFBoardList(String boardNo) { // 자유 게시판 글 삭제
		adDao.deleteFBoardList(boardNo);
	}
	
	@Override
	public void deleteRBoardList(String boardNo) { // 후기 게시판 글 삭제
		adDao.deleteRBoardList(boardNo);
	}
	
	@Override
	public void deleteQBoardList(String boardNo) { // 질의응답 게시판 글 삭제
		adDao.deleteQBoardList(boardNo);
	}
	
	@Override
	public void deleteSBoardList(String boardNo) { // 정보공유 게시판 글 삭제
		adDao.deleteSBoardList(boardNo);
	}
	
	@Override
	public void deleteEBoardList(String boardNo) { // 이벤트 게시판 글 삭제
		adDao.deleteEBoardList(boardNo);
	}
	
	@Override
	public int userStart() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Qna> getQNAByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getQNACount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Faq> getFAQByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getFAQCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQdelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notifiy> getNotifyByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNotifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int NotifyInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Notifydelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int NotifyUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Report> getPeportByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReportCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
