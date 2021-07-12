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




}