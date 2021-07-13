package com.funding.sprout.board.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Report;

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

	public int ReportSend(Report re) { //게시글 신고
		return sqlSession.insert("Report.ReportSend", re);	
	}
	
	/*
	 * public List<Board> selectFRadio(Board board) throws Exception { // 자유 게시판
	 * 라디오박스 조회 Map<String, String> map = new HashMap<String, String>(); String date
	 * = board.getBoardTitle(); String cnt = board.getBoardContent();
	 * System.out.println("날짜 값 : " + date); System.out.println("조회 값 : " + cnt);
	 * map.put("date", date); map.put("cnt", cnt); return
	 * sqlSession.selectList("Admin.selectFRadio", map); }
	 */
	
	public List<Board> searchList(String keyword) {
		return sqlSession.selectList("Board.searchList" , keyword); // 게시글 검색 조회
	}
	
	// 후기게시판
	public int reviewCount() {
		return sqlSession.selectOne("Board.reviewCount"); // 게시글 목록
	}

	public Board reviewDetail(int boardNo) {
		return sqlSession.selectOne("Board.reviewDetail", boardNo); // 게시글 상세보기
	}
	
	public int reviewInsertBoard(Board b) {
		return sqlSession.insert("Board.reviewInsertBoard" , b); // 게시글 등록
	}
	
	public int reviewDeleteBoard(int boardNo) {
		return sqlSession.delete("Board.reviewDeleteBoard" , boardNo); // 글 삭제
	}
	
	public int reviewUpdateBoard(Board b) {
		return sqlSession.update("Board.reviewUpdateBoard" , b); // 글 수정
	}

	public List<Board> reviewSelectList(int startPage, int limit) { // 번호 정렬
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.reviewSelectList" , null, row);
	}
	
	public int reviewAddReadCount(int boardNo) {
		return sqlSession.update("Board.reviewAddReadCount",boardNo); // 글 조회 수 증가
	}
	
	public Board reviewSelectOne(int boardNo) {
		return sqlSession.selectOne("Board.reviewSelectOne" , boardNo); // 글 가져오기
	}
	
	public int reviewChecklike(int boardNo,String userId) { // 게시글 추천 여부 검사
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.selectOne("Board.reviewChecklike", map);
	}
	
	public int reviewInsertLike(int boardNo, String userId) { // 게시글 추천
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.insert("Board.reviewInsertLike",map);
	}
	
	public int reviewDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.delete("Board.reviewDeleteLike",map);
	}
	
	public int reviewLikecnt(int boardNo) { // 게시글 추천수
		return sqlSession.selectOne("Board.reviewLikecnt", boardNo);
	}
	
	// 질의응답게시판
	public int questionCount() {
		return sqlSession.selectOne("Board.questionCount"); // 게시글 목록
	}

	public Board questionDetail(int boardNo) {
		return sqlSession.selectOne("Board.questionDetail", boardNo); // 게시글 상세보기
	}
	
	public int questionInsertBoard(Board b) {
		return sqlSession.insert("Board.questionInsertBoard" , b); // 게시글 등록
	}
	
	public int questionDeleteBoard(int boardNo) {
		return sqlSession.delete("Board.questionDeleteBoard" , boardNo); // 글 삭제
	}
	
	public int questionUpdateBoard(Board b) {
		return sqlSession.update("Board.questionUpdateBoard" , b); // 글 수정
	}

	public List<Board> questionSelectList(int startPage, int limit) { // 번호 정렬
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.questionSelectList" , null, row);
	}
	
	public int questionAddReadCount(int boardNo) {
		return sqlSession.update("Board.questionAddReadCount",boardNo); // 글 조회 수 증가
	}
	
	public Board questionSelectOne(int boardNo) {
		return sqlSession.selectOne("Board.questionSelectOne" , boardNo); // 글 가져오기
	}
	
	public int questionChecklike(int boardNo,String userId) { // 게시글 추천 여부 검사
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.selectOne("Board.questionChecklike", map);
	}
	
	public int questionInsertLike(int boardNo, String userId) { // 게시글 추천
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.insert("Board.questionInsertLike",map);
	}
	
	public int questionDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.delete("Board.questionDeleteLike",map);
	}
	
	public int questionLikecnt(int boardNo) { // 게시글 추천수
		return sqlSession.selectOne("Board.reviewLikecnt", boardNo);
	}
	
	// 이벤트 게시판
	public int eventCount() {
		return sqlSession.selectOne("Board.eventCount"); // 게시글 목록
	}

	public Board eventDetail(int boardNo) {
		return sqlSession.selectOne("Board.eventDetail", boardNo); // 게시글 상세보기
	}
	
	public int eventInsertBoard(Board b) {
		return sqlSession.insert("Board.eventInsertBoard" , b); // 게시글 등록
	}
	
	public int eventDeleteBoard(int boardNo) {
		return sqlSession.delete("Board.eventDeleteBoard" , boardNo); // 글 삭제
	}
	
	public int eventUpdateBoard(Board b) {
		return sqlSession.update("Board.eventUpdateBoard" , b); // 글 수정
	}

	public List<Board> eventSelectList(int startPage, int limit) { // 번호 정렬
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.eventSelectList" , null, row);
	}
	
	public int eventAddReadCount(int boardNo) {
		return sqlSession.update("Board.eventAddReadCount",boardNo); // 글 조회 수 증가
	}
	
	public Board eventSelectOne(int boardNo) {
		return sqlSession.selectOne("Board.eventSelectOne" , boardNo); // 글 가져오기
	}
	
	public int eventChecklike(int boardNo,String userId) { // 게시글 추천 여부 검사
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.selectOne("Board.eventChecklike", map);
	}
	
	public int eventInsertLike(int boardNo, String userId) { // 게시글 추천
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.insert("Board.eventInsertLike",map);
	}
	
	public int eventDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.delete("Board.eventDeleteLike",map);
	}
	
	public int eventLikecnt(int boardNo) { // 게시글 추천수
		return sqlSession.selectOne("Board.eventLikecnt", boardNo);
	}	
	
	
	
	// 정보공유 게시판
	public int shareCount() {
		return sqlSession.selectOne("Board.shareCount"); // 게시글 목록
	}

	public Board shareDetail(int boardNo) {
		return sqlSession.selectOne("Board.shareDetail", boardNo); // 게시글 상세보기
	}
	
	public int shareInsertBoard(Board b) {
		return sqlSession.insert("Board.shareInsertBoard" , b); // 게시글 등록
	}
	
	public int shareDeleteBoard(int boardNo) {
		return sqlSession.delete("Board.shareDeleteBoard" , boardNo); // 글 삭제
	}
	
	public int shareUpdateBoard(Board b) {
		return sqlSession.update("Board.questionUpdateBoard" , b); // 글 수정
	}

	public List<Board> shareSelectList(int startPage, int limit) { // 번호 정렬
		int startRow = (startPage - 1) * limit;
		RowBounds row = new RowBounds(startRow, limit);
		return sqlSession.selectList("Board.shareSelectList" , null, row);
	}
	
	public int shareAddReadCount(int boardNo) {
		return sqlSession.update("Board.shareAddReadCount",boardNo); // 글 조회 수 증가
	}
	
	public Board shareSelectOne(int boardNo) {
		return sqlSession.selectOne("Board.shareSelectOne" , boardNo); // 글 가져오기
	}
	
	public int shareChecklike(int boardNo,String userId) { // 게시글 추천 여부 검사
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.selectOne("Board.shareChecklike", map);
	}
	
	public int shareInsertLike(int boardNo, String userId) { // 게시글 추천
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.insert("Board.shareInsertLike",map);
	}
	
	public int shareDeleteLike(int boardNo, String userId) { // 게시글 추천 취소
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FREENO", boardNo);
		map.put("ID", userId);
		return sqlSession.delete("Board.shareDeleteLike",map);
	}
	
	public int shareLikecnt(int boardNo) { // 게시글 추천수
		return sqlSession.selectOne("Board.shareLikecnt", boardNo);
	}
	

}