package com.funding.sprout.board.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Board;


@Repository("boDao")
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return 0; // 전체 글 수 조회
	}

	public Board selectOne() {
		return null; // 글 가져오기
	}

	public List<Board> searchList() {
		return null; // 게시글 검색 조회
	}

	public List<Board> selectList() {
		return null;// 특정 페이지 단위의 게시글 조회
	}

	public int insertBoard() {
		return 0; // 글 입력
	}

	public int addReadCount() {
		return 0; // 글 조회 수 증가
	}

	public int updateBoard() {
		return 0; // 글 수정
	}

	public int deleteBoard() {
		return 0; // 글 삭제
	}
	
	public int ReportSend() { //게시글 신고
		return 0;
		
	}
	
	public Board getLike() { //TODO 좋아요 정보 이거는 수정이 필요해보임 추가도
		return null;

	}
} 
