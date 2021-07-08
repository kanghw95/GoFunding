package com.funding.sprout.board.service;

import java.util.List;

import com.funding.sprout.vo.Board;

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
	
	List<Board> CommentCount(int cmt); // 댓글 수 조회
	

	
	
	
	

	List<Board> searchList(String keyword);
	
	int ReportSend(Board b);
	
	
}