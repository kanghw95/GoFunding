package com.funding.sprout.board.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.board.dao.BoardDao;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Report;

@Service("boService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDao boDao;

	@Override
	public int totalCount() { // 게시글 목록
		return boDao.listCount();
	}

	@Override
	public Board detail(int boardNo) { // 게시글 상세보기
		return boDao.detail(boardNo);
	}
	
	@Override
	public int insertBoard(Board b) { // 게시글 등록
		return boDao.insertBoard(b);
	}
	
	@Override
	public void deleteBoard(int boardNo) { // 글 삭제
		boDao.deleteBoard(boardNo);
	}

	@Override
	public int updateBoard(Board b) { // 글 수정
		return boDao.updateBoard(b);
	}
	
	@Override
	public List<Board> selectList(int startPage, int limit) { // 번호 정렬
		List<Board> result = null;
		try{
			result = boDao.selectList(startPage, limit);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	@Override
	public Board selectBoard(int chk, int boardNo) { // 글 조회수 증가

		if (chk == 0) {
			boDao.addReadCount(boardNo);
		}
		return boDao.selectOne(boardNo);
	}
	
	@Override
	public Board selectOne(int boardNo) { // 글 가져오기
		return boDao.selectOne(boardNo);
	}

	@Override
	public int checklike(int boardNo, String userId) { // 게시글 추천 여부 검사 비추천0 추천1

		int result = boDao.checklike(boardNo, userId);
		
		if(result == 0) {
		} else {
			}
		return result;
	}

	@Override
	public int insertLike(int boardNo,String userId) { // 게시글 추천
		return boDao.insertLike(boardNo,userId);
	}
	
	@Override
	public int deleteLike(int boardNo, String userId) { // 게시글 추천 취소
		return boDao.deleteLike(boardNo, userId);
	}

	@Override
	public int likecnt(int boardNo) { // 게시글 추천수
		return boDao.likecnt(boardNo);
	}
	
	@Override
	public int ReportSend(Report re) { // 게시글 신고
		return boDao.ReportSend(re);
	}
	
	/*
	 * @Override public List<Board> selectFRadio(Board board) throws Exception { //
	 * 자유 게시판 라디오박스 조회 return boDao.selectFRadio(board); }
	 */
	@Override
	public List<Board> searchList(String keyword) { // 게시글 검색 조회
		return boDao.searchList(keyword);
	}

	// 후기게시판
	@Override
	public int reviewCount() { // 게시글 목록
		return boDao.reviewCount();
	}

	@Override
	public Board reviewDetail(int boardNo) { // 게시글 상세보기
		return boDao.reviewDetail(boardNo);
	}
	
	@Override
	public int reviewInsertBoard(Board b) { // 게시글 등록
		return boDao.reviewInsertBoard(b);
	}
	
	@Override
	public void reviewDeleteBoard(int boardNo) { // 글 삭제
		boDao.reviewDeleteBoard(boardNo);
	}

	@Override
	public int reviewUpdateBoard(Board b) { // 글 수정
		return boDao.reviewUpdateBoard(b);
	}
	
	@Override
	public List<Board> reviewSelectList(int startPage, int limit) { // 번호 정렬
		List<Board> result = null;
		try{
			result = boDao.reviewSelectList(startPage, limit);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	@Override
	public Board reviewAddReadCount(int chk, int boardNo) { // 글 조회수 증가

		if (chk == 0) {
			boDao.reviewAddReadCount(boardNo);
		}
		return boDao.reviewSelectOne(boardNo);
	}
	
	@Override
	public Board reviewSelectOne(int boardNo) { // 글 가져오기
		return boDao.reviewSelectOne(boardNo);
	}

	@Override
	public int reviewChecklike(int boardNo, String userId) { // 게시글 추천 여부 검사 비추천0 추천1

		int result = boDao.reviewChecklike(boardNo, userId);
		
		if(result == 0) {
		} else {
			}
		return result;
	}

	@Override
	public int reviewInsertLike(int boardNo,String userId) { // 게시글 추천
		return boDao.reviewInsertLike(boardNo,userId);
	}
	
	@Override
	public int reviewDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		return boDao.reviewDeleteLike(boardNo, userId);
	}

	@Override
	public int reviewLikecnt(int boardNo) { // 게시글 추천수
		return boDao.reviewLikecnt(boardNo);
	}
	
	// 질의응답 게시판
	@Override
	public int questionCount() { // 게시글 목록
		return boDao.questionCount();
	}

	@Override
	public Board questionDetail(int boardNo) { // 게시글 상세보기
		return boDao.questionDetail(boardNo);
	}
	
	@Override
	public int questionInsertBoard(Board b) { // 게시글 등록
		return boDao.questionInsertBoard(b);
	}
	
	@Override
	public void questionDeleteBoard(int boardNo) { // 글 삭제
		boDao.questionDeleteBoard(boardNo);
	}

	@Override
	public int questionUpdateBoard(Board b) { // 글 수정
		return boDao.questionUpdateBoard(b);
	}
	
	@Override
	public List<Board> questionSelectList(int startPage, int limit) { // 번호 정렬
		List<Board> result = null;
		try{
			result = boDao.questionSelectList(startPage, limit);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	@Override
	public Board questionAddReadCount(int chk, int boardNo) { // 글 조회수 증가

		if (chk == 0) {
			boDao.questionAddReadCount(boardNo);
		}
		return boDao.questionSelectOne(boardNo);
	}
	
	@Override
	public Board questionSelectOne(int boardNo) { // 글 가져오기
		return boDao.questionSelectOne(boardNo);
	}

	@Override
	public int questionChecklike(int boardNo, String userId) { // 게시글 추천 여부 검사 비추천0 추천1

		int result = boDao.questionChecklike(boardNo, userId);
		
		if(result == 0) {
		} else {
			}
		return result;
	}

	@Override
	public int questionInsertLike(int boardNo,String userId) { // 게시글 추천
		return boDao.questionInsertLike(boardNo,userId);
	}
	
	@Override
	public int questionDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		return boDao.questionDeleteLike(boardNo, userId);
	}

	@Override
	public int questionLikecnt(int boardNo) { // 게시글 추천수
		return boDao.questionLikecnt(boardNo);
	}

	
	// 이벤트 게시판
	@Override
	public int eventCount() { // 게시글 목록
		return boDao.eventCount();
	}

	@Override
	public Board eventDetail(int boardNo) { // 게시글 상세보기
		return boDao.eventDetail(boardNo);
	}
	
	@Override
	public int eventInsertBoard(Board b) { // 게시글 등록
		return boDao.eventInsertBoard(b);
	}
	
	@Override
	public void eventDeleteBoard(int boardNo) { // 글 삭제
		boDao.eventDeleteBoard(boardNo);
	}

	@Override
	public int eventUpdateBoard(Board b) { // 글 수정
		return boDao.eventUpdateBoard(b);
	}
	
	@Override
	public List<Board> eventSelectList(int startPage, int limit) { // 번호 정렬
		List<Board> result = null;
		try{
			result = boDao.eventSelectList(startPage, limit);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	@Override
	public Board eventAddReadCount(int chk, int boardNo) { // 글 조회수 증가

		if (chk == 0) {
			boDao.eventAddReadCount(boardNo);
		}
		return boDao.eventSelectOne(boardNo);
	}
	
	@Override
	public Board eventSelectOne(int boardNo) { // 글 가져오기
		return boDao.eventSelectOne(boardNo);
	}

	@Override
	public int eventChecklike(int boardNo, String userId) { // 게시글 추천 여부 검사 비추천0 추천1

		int result = boDao.eventChecklike(boardNo, userId);
		
		if(result == 0) {
		} else {
			}
		return result;
	}

	@Override
	public int eventInsertLike(int boardNo,String userId) { // 게시글 추천
		return boDao.eventInsertLike(boardNo,userId);
	}
	
	@Override
	public int eventDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		return boDao.eventDeleteLike(boardNo, userId);
	}

	@Override
	public int eventLikecnt(int boardNo) { // 게시글 추천수
		return boDao.eventLikecnt(boardNo);
	}
	
	
	// 정보공유 게시판	
	@Override
	public int shareCount() { // 게시글 목록
		return boDao.shareCount();
	}

	@Override
	public Board shareDetail(int boardNo) { // 게시글 상세보기
		return boDao.shareDetail(boardNo);
	}
	
	@Override
	public int shareInsertBoard(Board b) { // 게시글 등록
		return boDao.shareInsertBoard(b);
	}
	
	@Override
	public void shareDeleteBoard(int boardNo) { // 글 삭제
		boDao.shareDeleteBoard(boardNo);
	}

	@Override
	public int shareUpdateBoard(Board b) { // 글 수정
		return boDao.shareUpdateBoard(b);
	}
	
	@Override
	public List<Board> shareSelectList(int startPage, int limit) { // 번호 정렬
		List<Board> result = null;
		try{
			result = boDao.shareSelectList(startPage, limit);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
			
	@Override
	public Board shareAddReadCount(int chk, int boardNo) { // 글 조회수 증가

		if (chk == 0) {
			boDao.shareAddReadCount(boardNo);
		}
		return boDao.shareSelectOne(boardNo);
	}
	
	@Override
	public Board shareSelectOne(int boardNo) { // 글 가져오기
		return boDao.shareSelectOne(boardNo);
	}

	@Override
	public int shareChecklike(int boardNo, String userId) { // 게시글 추천 여부 검사 비추천0 추천1

		int result = boDao.shareChecklike(boardNo, userId);
		
		if(result == 0) {
		} else {
			}
		return result;
	}

	@Override
	public int shareInsertLike(int boardNo,String userId) { // 게시글 추천
		return boDao.shareInsertLike(boardNo,userId);
	}
	
	@Override
	public int shareDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		return boDao.shareDeleteLike(boardNo, userId);
	}

	@Override
	public int shareLikecnt(int boardNo) { // 게시글 추천수
		return boDao.shareLikecnt(boardNo);
	}
	
	
}