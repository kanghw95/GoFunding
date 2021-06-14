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
		return sqlSession.selectOne("Board.listCount"); // 게시글 목록
	}

	public int insertBoard(Board b) {
		return sqlSession.insert("Board.insertBoard" , b); // 게시글 등록
	}
	
	public Board detail(int boardNo) {
		return sqlSession.selectOne("Board.detail", boardNo); // 게시글 상세보기
	}
	
	public int updateBoard(Board b) {
		return sqlSession.update("Board.updateBoard" , b); // 글 수정
	}
	
	
	
	
	
	
	
	public Board selectOne(int boardNo) {
		return sqlSession.selectOne("Board.selectOne" , boardNo); // 글 가져오기
	}

	public List<Board> searchList(String keyword) {
		return sqlSession.selectList("Board.searchList" , keyword); // 게시글 검색 조회
	}

	public List<Board> selectList(int startPage, int limit) {
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		System.out.println("startRow:"+ startRow);
		System.out.println("limit:"+ limit);
		return sqlSession.selectList("Board.selectList" , null, row);// 특정 페이지 단위의 게시글 조회
	}
	

	public int addReadCount(int boardCnt) {
		return sqlSession.update("Board.addReadCount", boardCnt ); // 글 조회 수 증가
	}

	public int deleteBoard(int boardNo) {
		return sqlSession.delete("Board.deleteBoard" , boardNo); // 글 삭제
	}
	
	public int ReportSend(Board b) { //게시글 신고
		return sqlSession.insert("Board.insertBoard", b);
		
	}
	
	public int getLike(Board b) { //TODO 좋아요 정보 이거는 수정이 필요해보임 추가도
		return sqlSession.update("Board.updateBoard", b);

	}
	
} 
