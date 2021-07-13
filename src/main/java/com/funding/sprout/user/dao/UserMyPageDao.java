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
import com.funding.sprout.vo.Prefer;

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

	public int insertOrderRefund(OrderRefund orRefund) { // 펀딩 환불
		return sqlSession.insert("OrderRefund.insertOrderRefund", orRefund); 
	}

	public int orderStausChange(Order order) { // 펀딩 환불 후 결제 상태 바꾸기
		return sqlSession.update("Order.orderStausChange", order); 
	}

	public int orderDetailStausChange(OrderDetail orDetail) { // 펀딩 환불 후 결제 상태 바꾸기 (상세페이지) 
		return sqlSession.update("OrderDetail.orderDetailStausChange", orDetail);
	}
	
	public List<Prefer> preferList(String id) throws Exception { // 관심 펀딩 조회
		return sqlSession.selectList("User.preferFunding", id);
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
	
	public List<Board> freeBoardCmtList(String id) throws Exception { // 자유 게시판 댓글 조회 (3개까지)
		return sqlSession.selectList("User.selectFreeCmt", id);
	}
	
	public List<Board> freeBoardCmtListMore(String id) throws Exception { // 자유 게시판 댓글 조회 (더보기)
		return sqlSession.selectList("User.selectFreeCmtMore", id);
	}
	
	public List<Board> rBoardCmtList(String id) throws Exception { // 후기 게시판 댓글 조회 (3개까지)
		return sqlSession.selectList("User.selectReviewCmt", id);
	}
	
	public List<Board> rBoardCmtListMore(String id) throws Exception { // 후기 게시판 댓글 조회 (더보기)
		return sqlSession.selectList("User.selectReviewCmtMore", id);
	}
	
	public List<Board> qBoardCmtList(String id) throws Exception { // 질의응답 게시판 댓글 조회 (3개까지)
		return sqlSession.selectList("User.selectQuestionCmt", id);
	}
	
	public List<Board> qBoardCmtListMore(String id) throws Exception { // 질의응답 게시판 댓글 조회 (더보기)
		return sqlSession.selectList("User.selectQuestionCmtMore", id);
	}
	
	public List<Board> sBoardCmtList(String id) throws Exception { // 정보공유 게시판 댓글 조회 (3개까지)
		return sqlSession.selectList("User.selectShareCmt", id);
	}
	
	public List<Board> sBoardCmtListMore(String id) throws Exception { // 정보공유 게시판 댓글 조회 (더보기)
		return sqlSession.selectList("User.selectShareCmtMore", id);
	}
	
	public List<Board> eBoardCmtList(String id) throws Exception { // 이벤트 게시판 댓글 조회 (3개까지)
		return sqlSession.selectList("User.selectEventCmt", id);
	}
	
	public List<Board> eBoardCmtListMore(String id) throws Exception { // 이벤트 게시판 댓글 조회 (더보기)
		return sqlSession.selectList("User.selectEventCmtMore", id);
	}
	
	
}
