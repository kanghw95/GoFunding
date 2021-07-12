package com.funding.sprout.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AdminDao;
import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Comment;
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
	public List<Board> noticeList(Criteria cri) throws Exception { // 공지사항 조회
		return adDao.noticeList(cri);
	}
	
	@Override
	public List<Qna> qnaList(Criteria cri) throws Exception { // Qna 조회
		return adDao.qnaList(cri);
	}
	
	@Override
	public List<Qna> qnaReply(Qna qna) throws Exception { // qnaReply 조회
		return adDao.qnaReply(qna);
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
	public int noticeCount() throws Exception { // 공지사항 글 수 조회
		return adDao.noticeCount();
	}
	
	@Override
	public int qnaCount() throws Exception { // Qna 글 수 조회
		return adDao.qnaCount();
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
	public List<Board> selectNBoardId(Board board) throws Exception { // 공지사항 작성자 조회
		return adDao.selectNBoardId(board);
	}
	
	@Override
	public List<Board> selectNBoardTitle(Board board) throws Exception { // 공지사항 제목 조회
		return adDao.selectNBoardTitle(board);
	}
	
	@Override
	public List<Qna> selectQnaType(Qna qna) throws Exception { // Qna 유형 조회
		return adDao.selectQnaType(qna);
	}
	
	@Override
	public List<Board> selectFRadio(Board board) throws Exception { // 자유 게시판 라디오박스 조회
		return adDao.selectFRadio(board);
	}
	
	@Override
	public List<Board> selectRRadio(Board board) throws Exception { // 후기 게시판 라디오박스 조회
		return adDao.selectRRadio(board);
	}
	
	@Override
	public List<Board> selectQRadio(Board board) throws Exception { // 질의응답 게시판 라디오박스 조회
		return adDao.selectQRadio(board);
	}
	
	@Override
	public List<Board> selectSRadio(Board board) throws Exception { // 정보공유 게시판 라디오박스 조회
		return adDao.selectSRadio(board);
	}
	
	@Override
	public List<Board> selectERadio(Board board) throws Exception { // 이벤트 게시판 라디오박스 조회
		return adDao.selectERadio(board);
	}
	
	@Override
	public List<Board> selectNRadio(Board board) throws Exception { // 공지사항 라디오박스 조회
		return adDao.selectNRadio(board);
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
	public void deleteNBoardList(String boardNo) { // 공지사항 글 삭제
		adDao.deleteNBoardList(boardNo);
	}
	
	@Override
	public void deleteQna(String qnaNo) { // Qna 글 삭제
		adDao.deleteQna(qnaNo);
	}
	
	@Override
	public int qnaInsert(Comment cmt) throws Exception { // Qna 답글 추가
		return adDao.qnaInsert(cmt);
	}
	
	@Override
	public List<Comment> qnaCmt(Comment cmt) throws Exception { // Qna 답글 조회
		return adDao.qnaCmt(cmt);
	}
	
	@Override
	public List<Comment> qnaOne(Comment cmt) throws Exception { // Qna 답글 하나만 조회
		return adDao.qnaOne(cmt);
	}
	
	@Override
	public int replyUpdate(Comment cmt) throws Exception { // Qna 답글 수 추가
		return adDao.replyUpdate(cmt);
	}
	
	@Override
	public int replyCount(Comment cmt) throws Exception { // Qna 특정 답글 조회
		return adDao.replyCount(cmt);
	}
	
	@Override
	public List<Report> report() throws Exception { // 전체 신고내역 조회
		return adDao.report();
	}
	
	@Override
	public List<Report> bReport(Report rpt) throws Exception { // 게시글 신고 상세 조회
		return adDao.bReport(rpt);
	}
	
	@Override
	public List<Report> cReport(Report rpt) throws Exception { // 댓글 신고 상세 조회
		return adDao.cReport(rpt);
	}
	
	@Override
	public int userReport(User user) throws Exception { // 회원 정지일 설정
		return adDao.userReport(user);
	}
	
	@Override
	public int bReportState(Report rpt) throws Exception { // 게시글 신고 상태 변경
		return adDao.bReportState(rpt);
	}
	
	@Override
	public int cReportState(Report rpt) throws Exception { // 댓글 신고 상태 변경
		return adDao.cReportState(rpt);
	}
	
	@Override
	public int reportCnt(User user) throws Exception { // 회원 신고 횟수 추가
		return adDao.reportCnt(user);
	}
	
	@Override
	public int reportStop() throws Exception { // 회원 정지 해제
		return adDao.reportStop();
	}
	
	@Override
	public int userAuthority(User user) throws Exception { // 회원 권한 정지
		return adDao.userAuthority(user);
	}
	
	@Override
	public List<Report> reportSelect(Report rpt) throws Exception { // 신고 내역 검색
		return adDao.reportSelect(rpt);
	}
	
	@Override
	public void deleteCReport(String reportNo) { // 댓글 신고내역 삭제
		adDao.deleteCReport(reportNo);
	}
	
	@Override
	public void deleteBReport(String reportNo) { // 게시글 신고내역 삭제
		adDao.deleteBReport(reportNo);
	}
	
	@Override
	public List<Faq> faq(Criteria cri) throws Exception { // feq 조회
		return adDao.faq(cri);
	}
	
	@Override
	public int faqCount() throws Exception { // faq 수 조회
		return adDao.faqCount();
	}
	
	@Override
	public List<Faq> selectFaq(Faq faq) throws Exception { // faq 검색
		return adDao.selectFaq(faq);
	}
	
	@Override
	public void deleteFaq(String faqNo) { // faq 삭제
		adDao.deleteFaq(faqNo);
	}
	
	@Override
	public int insertFaq(Faq faq) throws Exception { // faq 추가
		return adDao.insertFaq(faq);
	}
	
	@Override
	public int insertNotice(Board board) throws Exception { // 공지사항 추가
		return adDao.insertNotice(board);
	}
	
	@Override
	public List<Board> noticeDetail(Board board) throws Exception { // 공지사항 상세보기
		return adDao.noticeDetail(board);
	}
	
	@Override
	public List<Board> freeDetail(Board board) throws Exception { // 자유게시판 상세보기
		return adDao.freeDetail(board);
	}
	
	@Override
	public List<Board> reviewDetail(Board board) throws Exception { // 리뷰게시판 상세보기
		return adDao.reviewDetail(board);
	}
	
	@Override
	public List<Board> questionDetail(Board board) throws Exception { // 질의응답게시판 상세보기
		return adDao.questionDetail(board);
	}
	
	@Override
	public List<Board> shareDetail(Board board) throws Exception { // 정보공유게시판 상세보기
		return adDao.shareDetail(board);
	}
	
	@Override
	public List<Board> eventDetail(Board board) throws Exception { // 이벤트게시판 상세보기
		return adDao.eventDetail(board);
	}
	
	@Override
	public List<Faq> faqDetail(Faq faq) throws Exception { // faq 상세보기
		return adDao.faqDetail(faq);
	}
	
	@Override
	public List<Comment> freeCmt(Comment comment) throws Exception { // 자유게시판 댓글
		return adDao.freeCmt(comment);
	}
	
	@Override
	public List<Comment> reviewCmt(Comment comment) throws Exception { // 후기게시판 댓글
		return adDao.reviewCmt(comment);
	}
	
	@Override
	public List<Comment> questionCmt(Comment comment) throws Exception { // 질의응답게시판 댓글
		return adDao.questionCmt(comment);
	}
	
	@Override
	public List<Comment> shareCmt(Comment comment) throws Exception { // 정보공유게시판 댓글
		return adDao.shareCmt(comment);
	}
	
	@Override
	public List<Comment> eventCmt(Comment comment) throws Exception { // 이벤트게시판 댓글
		return adDao.eventCmt(comment);
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
