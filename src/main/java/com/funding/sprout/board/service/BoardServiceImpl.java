package com.funding.sprout.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.board.dao.BoardDao;
import com.funding.sprout.vo.Board;

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
	public Board selectBoard(int chk, int boardNo) {

		if (chk == 0) {
			boDao.addReadCount(boardNo);
		}
		return boDao.selectOne(boardNo);
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
	public Board selectOne(int boardNo) { // 글 가져오기
		return boDao.selectOne(boardNo);
	}

	@Override
	public List<Board> searchList(String keyword) { // 게시글 검색 조회
		return boDao.searchList(keyword);
	}

	@Override
	public List<Board> selectList(int startPage, int limit) { // 특정 페이지 단위의 게시글 조회
		List<Board> result = null;
		try{
			System.out.println("Aaa"+ startPage );
			System.out.println("bbb"+ limit );
			result = boDao.selectList(startPage, limit);
			System.out.println("result:" + result.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Aaa");
		return result;
	}
	


	@Override
	public int addReadCount(int boardCnt) { // 글 조회수 증가
		return boDao.addReadCount(boardCnt);
	}


	@Override
	public int ReportSend(Board b) { // 게시글 신고
		return boDao.insertBoard(b);
	}

	@Override
	public int getLike(Board b) { // 좋아요
		return boDao.updateBoard(b);
	}



}
