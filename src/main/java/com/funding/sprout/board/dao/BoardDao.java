package com.funding.sprout.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.BoardReport;


@Repository("boDao")
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return sqlSession.selectOne("Board.listCount"); // 게시글 목록
	}

	public Board detail(int boardNo) {
		return sqlSession.selectOne("Board.detail", boardNo); // 게시글 상세보기
	}
	
	public int insertBoard(Board b) {
		return sqlSession.insert("Board.insertBoard" , b); // 게시글 등록
	}
	
	public int deleteBoard(int boardNo) {
		return sqlSession.delete("Board.deleteBoard" , boardNo); // 글 삭제
	}
	
	public int updateBoard(Board b) {
		return sqlSession.update("Board.updateBoard" , b); // 글 수정
	}

	public List<Board> selectList(int startPage, int limit) { // 번호 정렬
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.selectList" , null, row);
	}
	
	public int addReadCount(int boardNo) {
		return sqlSession.update("Board.addReadCount",boardNo); // 글 조회 수 증가
	}
	
	public Board selectOne(int boardNo) {
		return sqlSession.selectOne("Board.selectOne" , boardNo); // 글 가져오기
	}
	
	public int checklike(int boardNo,String userId) { // 게시글 추천 여부 검사
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.selectOne("Board.checklike", map);
	}
	
	public int insertLike(int boardNo, String userId) { // 게시글 추천
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.insert("Board.insertLike",map);
	}
	
	public int deleteLike(int boardNo, String userId) { // 게시글 추천 취소
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.delete("Board.deleteLike",map);
	}
	
	public int likecnt(int boardNo) { // 게시글 추천수
		return sqlSession.selectOne("Board.likecnt", boardNo);
	}

	public int ReportSend(BoardReport br) { //게시글 신고
		return sqlSession.insert("Board.ReportSend", br);	
	}
	
	
	
	
	


	public List<Board> searchList(String keyword) {
		return sqlSession.selectList("Board.searchList" , keyword); // 게시글 검색 조회
	}


	

} 