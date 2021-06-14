package com.funding.sprout.board.service;

import java.util.List;

import com.funding.sprout.vo.Board;


public interface BoardService {

	int totalCount();

	Board selectBoard();

	List<Board> selectSearch();

	List<Board> selectList();

	void insertBoard();

	int addReadCount();
	
	Board updateBoard();

	void deleteBoard();
	
	int ReportSend();
	
	Board getLike(); //TODO 좋아요 정보 이거는 수정이 필요해보임 추가도

}
