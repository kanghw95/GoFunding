package com.funding.sprout.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Report;

public interface BoardService {
	
	int totalCount();  // 게시글 목록
	
	Board detail(int boardNo); // 게시글 상세보기
	
	int insertBoard(Board b); // 게시글 등록
	
	void deleteBoard(int boardNo); // 글 삭제
	
	int updateBoard(Board b); // 글 수정
	
	List<Board> selectList(int startPage, int limit); // 번호 정렬
		
	Board selectBoard(int chk, int boardNo); // 조회수 증가
	
	Board selectOne(int boardNo); // 글 가져오기
	
	int checklike(int boardNo, String userId); // 게시글 추천 여부 검사
	
	int insertLike(int boardNo,String userId); // 게시글 추천
	
	int deleteLike(int boardNo,String userId); // 게시글 추천 취소
	
	int likecnt(int boardNo); // 게시글 추천수
	
	int ReportSend(Report re); // 게시글 신고
	
	/*
	 * public List<Board> selectFRadio(Board board) throws Exception; // 자유 게시판
	 * 라디오박스 조회
	 */	
	List<Board> searchList(String keyword);
	
	// 후기게시판
	int reviewCount();  // 게시글 목록
	
	Board reviewDetail(int boardNo); // 게시글 상세보기
	
	int reviewInsertBoard(Board b); // 게시글 등록
	
	void reviewDeleteBoard(int boardNo); // 글 삭제
	
	int reviewUpdateBoard(Board b); // 글 수정
	
	List<Board> reviewSelectList(int startPage, int limit); // 번호 정렬
		
	Board reviewAddReadCount(int chk, int boardNo); // 조회수 증가
	
	Board reviewSelectOne(int boardNo); // 글 가져오기
	
	int reviewChecklike(int boardNo, String userId); // 게시글 추천 여부 검사
	
	int reviewInsertLike(int boardNo,String userId); // 게시글 추천
	
	int reviewDeleteLike(int boardNo,String userId); // 게시글 추천 취소
	
	int reviewLikecnt(int boardNo); // 게시글 추천수
	
	// 질의응답 게시판
	int questionCount();  // 게시글 목록
	
	Board questionDetail(int boardNo); // 게시글 상세보기
	
	int questionInsertBoard(Board b); // 게시글 등록
	
	void questionDeleteBoard(int boardNo); // 글 삭제
	
	int questionUpdateBoard(Board b); // 글 수정
	
	List<Board> questionSelectList(int startPage, int limit); // 번호 정렬
		
	Board questionAddReadCount(int chk, int boardNo); // 조회수 증가
	
	Board questionSelectOne(int boardNo); // 글 가져오기
	
	int questionChecklike(int boardNo, String userId); // 게시글 추천 여부 검사
	
	int questionInsertLike(int boardNo,String userId); // 게시글 추천
	
	int questionDeleteLike(int boardNo,String userId); // 게시글 추천 취소
	
	int questionLikecnt(int boardNo); // 게시글 추천수

	
	// 이벤트 게시판
	int eventCount();  // 게시글 목록
	
	Board eventDetail(int boardNo); // 게시글 상세보기
	
	int eventInsertBoard(Board b); // 게시글 등록
	
	void eventDeleteBoard(int boardNo); // 글 삭제
	
	int eventUpdateBoard(Board b); // 글 수정
	
	List<Board> eventSelectList(int startPage, int limit); // 번호 정렬
		
	Board eventAddReadCount(int chk, int boardNo); // 조회수 증가
	
	Board eventSelectOne(int boardNo); // 글 가져오기
	
	int eventChecklike(int boardNo, String userId); // 게시글 추천 여부 검사
	
	int eventInsertLike(int boardNo,String userId); // 게시글 추천
	
	int eventDeleteLike(int boardNo,String userId); // 게시글 추천 취소
	
	int eventLikecnt(int boardNo); // 게시글 추천수
	
	
	// 정보공유 게시판
	int shareCount();  // 게시글 목록
	
	Board shareDetail(int boardNo); // 게시글 상세보기
	
	int shareInsertBoard(Board b); // 게시글 등록
	
	void shareDeleteBoard(int boardNo); // 글 삭제
	
	int shareUpdateBoard(Board b); // 글 수정
	
	List<Board> shareSelectList(int startPage, int limit); // 번호 정렬
		
	Board shareAddReadCount(int chk, int boardNo); // 조회수 증가
	
	Board shareSelectOne(int boardNo); // 글 가져오기
	
	int shareChecklike(int boardNo, String userId); // 게시글 추천 여부 검사
	
	int shareInsertLike(int boardNo,String userId); // 게시글 추천
	
	int shareDeleteLike(int boardNo,String userId); // 게시글 추천 취소
	
	int shareLikecnt(int boardNo); // 게시글 추천수
	
	

	
}