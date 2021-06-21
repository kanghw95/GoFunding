package com.funding.sprout.board.service;

import java.util.List;
import com.funding.sprout.vo.Board;

public interface BoardService {
	
	int totalCount(); // 게시글 목록
	
	Board detail(int boardNo); // 게시글 상세보기
	
	int insertBoard(Board b); // 게시글 등록
	
	Board selectBoard(int chk, int boardNo);
	
	void deleteBoard(int boardNo); // 글 삭제
	
	int updateBoard(Board b); // 글 수정
	
	
	

	
	
	
	
	
	
	
	
	
	Board selectOne(int boardNo); 
	
	List<Board> searchList(String keyword);
	
	List<Board> selectList(int startPage, int limit);
	
	int addReadCount(int boardCnt);
	
	int ReportSend(Board b);
	
	int getLike(Board b);
	
}