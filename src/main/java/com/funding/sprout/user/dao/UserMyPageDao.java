package com.funding.sprout.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.MyFunding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.OrderRefund;

@Repository("myDao")
public class UserMyPageDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<MyFunding> list(String id) throws Exception { // 참여한 전체 펀딩 조회
		return sqlSession.selectList("User.myFunding", id);
	}
	
	public int cntMyFunding(String id) throws Exception{ // 참여한 전체 펀딩 수
		return sqlSession.selectOne("User.cntMyFunding", id);
	}
	
	public List<MyFunding> rewardList(MyFunding vo) throws Exception{ // 참여한 펀딩 상세 조회
		return sqlSession.selectList("User.myFundingReward", vo);
	}
	
	public List<MyFunding> fundingDetail(MyFunding vo) throws Exception{ // 참여한 펀딩 하나
		return sqlSession.selectList("User.myFundingDetail", vo);
	}

	public int insertOrderRefund(OrderRefund orRefund) {
		return sqlSession.insert("OrderRefund.insertOrderRefund", orRefund);
	}

	public int orderStausChange(Order order) {
		return sqlSession.update("Order.orderStausChange", order);
	}

	public int orderDetailStausChange(OrderDetail orDetail) {
		return sqlSession.update("OrderDetail.orderDetailStausChange", orDetail);
	}
	public List<Board> freeBoardList(String id) throws Exception { // 자유 게시판 조회 (3개까지)
		return sqlSession.selectList("User.selectFree", id);
	}
	
	public List<Board> freeBoardListMore(String id) throws Exception { // 자유 게시판 조회 (더보기)
		return sqlSession.selectList("User.selectFreeMore", id);
	}
	
	public List<Board> reviewBoardList(String id) throws Exception { // 후기 게시판 조회 (3개까지)
		return sqlSession.selectList("User.selectReview", id);
	}
	
	public List<Board> reviewBoardListMore(String id) throws Exception { // 후기 게시판 조회 (더보기)
		return sqlSession.selectList("User.selectReviewMore", id);
	}
	
	public List<Board> qBoardList(String id) throws Exception { // 질의응답 게시판 조회 (3개까지)
		return sqlSession.selectList("User.selectQuestion", id);
	}
	
	public List<Board> qBoardListMore(String id) throws Exception { // 질의응답 게시판 조회 (더보기)
		return sqlSession.selectList("User.selectQuestionMore", id);
	}
	
	public List<Board> sBoardList(String id) throws Exception { // 정보공유 게시판 조회 (3개까지)
		return sqlSession.selectList("User.selectShare", id);
	}
	
	public List<Board> sBoardListMore(String id) throws Exception { // 정보공유 게시판 조회 (더보기)
		return sqlSession.selectList("User.selectShareMore", id);
	}
	
	public List<Board> eBoardList(String id) throws Exception { // 이벤트 게시판 조회 (3개까지)
		return sqlSession.selectList("User.selectEvent", id);
	}
	
	public List<Board> eBoardListMore(String id) throws Exception { // 이벤트 게시판 조회 (더보기)
		return sqlSession.selectList("User.selectEventMore", id);
	}
}
