package com.funding.sprout.admin.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.Faq;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.Report;
import com.funding.sprout.vo.User;

@Repository("adDao")
public class AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	public Admin adminlogin() { // 관리자 계정 세선 저장용
		return null;
		
	}

	public List<User> list(Criteria cri) throws Exception { // 검색 가능한 전체 회원 조회
		return sqlSession.selectList("Admin.selectUser", cri);
	}

	public int listCount() throws Exception { // 유저수 조회
		return sqlSession.selectOne("Admin.countUser");
	}
	
	public List<User> selectUserId(User user) throws Exception { // 유저 아이디 조회
		return sqlSession.selectList("Admin.searchId", user);
	}
	
	public List<User> selectUserName(User user) throws Exception { // 유저 이름 조회
		return sqlSession.selectList("Admin.searchName", user);
	}
	
	public List<User> selectUserNick(User user) throws Exception { // 유저 닉네임 조회
		return sqlSession.selectList("Admin.searchNick", user);
	}

	public void userStop(String userNo) { // 회원 권한 박탈
		sqlSession.delete("Admin.deleteUser", userNo);
	}

	public List<Board> freeBoardList(Criteria cri) throws Exception { // 자유 게시판 조회
		return sqlSession.selectList("Admin.selectFree", cri);
	}
	
	public List<Board> reviewBoardList(Criteria cri) throws Exception { // 후기 게시판 조회
		return sqlSession.selectList("Admin.selectReview", cri);
	}
	
	public List<Board> questionBoardList(Criteria cri) throws Exception { // 질의응답 게시판 조회
		return sqlSession.selectList("Admin.selectQuestion", cri);
	}
	
	public List<Board> shareBoardList(Criteria cri) throws Exception { // 정보공유 게시판 조회
		return sqlSession.selectList("Admin.selectShare", cri);
	}
	
	public List<Board> eventBoardList(Criteria cri) throws Exception { // 이벤트 게시판 조회
		return sqlSession.selectList("Admin.selectEvent", cri);
	}
	
	public int freeBoardCount() throws Exception { // 자유 게시판 글 수 조회
		return sqlSession.selectOne("Admin.countFreeBoard");
	}
	
	public int reviewBoardCount() throws Exception { // 후기 게시판 글 수 조회
		return sqlSession.selectOne("Admin.countReviewBoard");
	}
	
	public int questionBoardCount() throws Exception { // 질의응답 게시판 글 수 조회
		return sqlSession.selectOne("Admin.countQuestionBoard");
	}
	
	public int shareBoardCount() throws Exception { // 정보공유 게시판 글 수 조회
		return sqlSession.selectOne("Admin.countShareBoard");
	}
	
	public int eventBoardCount() throws Exception { // 이벤트 게시판 글 수 조회
		return sqlSession.selectOne("Admin.countEventBoard");
	}
	
	public List<Board> selectFBoardId(Board board) throws Exception { // 자유 게시판 작성자 조회
		return sqlSession.selectList("Admin.searchFBoardId", board);
	}
	
	public List<Board> selectFBoardTitle(Board board) throws Exception { // 자유 게시판 제목 조회
		return sqlSession.selectList("Admin.searchFBoardTitle", board);
	}
	
	public List<Board> selectRBoardId(Board board) throws Exception { // 후기 게시판 작성자 조회
		return sqlSession.selectList("Admin.searchRBoardId", board);
	}
	
	public List<Board> selectRBoardTitle(Board board) throws Exception { // 후기 게시판 제목 조회
		return sqlSession.selectList("Admin.searchRBoardTitle", board);
	}
	
	public List<Board> selectQBoardId(Board board) throws Exception { // 질의응답 게시판 작성자 조회
		return sqlSession.selectList("Admin.searchQBoardId", board);
	}
	
	public List<Board> selectQBoardTitle(Board board) throws Exception { // 질의응답 게시판 제목 조회
		return sqlSession.selectList("Admin.searchQBoardTitle", board);
	}
	
	public List<Board> selectSBoardId(Board board) throws Exception { // 정보공유 게시판 작성자 조회
		return sqlSession.selectList("Admin.searchSBoardId", board);
	}
	
	public List<Board> selectSBoardTitle(Board board) throws Exception { // 정보공유 게시판 제목 조회
		return sqlSession.selectList("Admin.searchSBoardTitle", board);
	}
	
	public List<Board> selectEBoardId(Board board) throws Exception { // 이벤트 게시판 작성자 조회
		return sqlSession.selectList("Admin.searchEBoardId", board);
	}
	
	public List<Board> selectEBoardTitle(Board board) throws Exception { // 이벤트 게시판 제목 조회
		return sqlSession.selectList("Admin.searchEBoardTitle", board);
	}
	
	public void deleteFBoardList(String boardNo) { // 자유 게시판 글 삭제
		sqlSession.delete("Admin.deleteFBoardList", boardNo);
	}
	
	public void deleteRBoardList(String boardNo) { // 후기 게시판 글 삭제
		sqlSession.delete("Admin.deleteRBoardList", boardNo);
	}
	
	public void deleteQBoardList(String boardNo) { // 질의응답 게시판 글 삭제
		sqlSession.delete("Admin.deleteQBoardList", boardNo);
	}
	
	public void deleteSBoardList(String boardNo) { // 정보공유 게시판 글 삭제
		sqlSession.delete("Admin.deleteSBoardList", boardNo);
	}
	
	public void deleteEBoardList(String boardNo) {
		sqlSession.delete("Admin.deleteEBoardList", boardNo);
	}
	
	public int userStart() { // 회원 권한 복원
		return 0;

	}

	public List<Qna> getQNAByPage() { // qna 리스트 조회
		return null;

	}
	
	public int qnaInsert() { // qna 답변 쓰기
		return 0;
		
	}

	public int getQNACount() { // qna수 조회
		return 0;

	}

	public int qnaUpdate() { // qna 답변수정
		return 0;

	}

	public List<Faq> getFAQByPage() { // faq 리스트 조회
		return null;

	}
	
	public int getFAQCount() { // 공지사항 수 조회
		return 0;
		
	}

	public int FAQInsert() { // FAQ 쓰기
		return 0;
	}

	public int FAQdelete() {
		return 0; // FAQ 삭제

	}

	public int FAQUpdate() { // FAQ 수정하기
		return 0;
	}
	
	public List<Faq> getNotifyByPage(){ // 공지사항 리스트 조회
		return null;
		
	}
	
	public int getNotifyCount() { // 공지사항 수 조회
		return 0;
		
	}
	
	public int NotifyInsert() { // 공지사항 글쓰기
		return 0;
	}
	
	public int Notifydelete() { // 공지사항 삭제
		return 0; 

	}

	public int NotifyUpdate() { // 공지사항 수정
		return 0;
	}
	
	public List<Report> getPeportByPage(){ // 신고 리스트 조회
		return null;
		
	}
	
	public int getReportCount() { // 신고 리스트 수  조회
		return 0; 
		
	}
}
