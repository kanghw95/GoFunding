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
	public List<Board> CommentCount(int cmt) { // 댓글 수 조회
		return boDao.CommentCount(cmt);
	}
	
	
	
	
	
	
	
	
	
	
	

	@Override
	public List<Board> searchList(String keyword) { // 게시글 검색 조회
		return boDao.searchList(keyword);
	}

	@Override
	public int ReportSend(Board b) { // 게시글 신고
		return boDao.insertBoard(b);
	}




}