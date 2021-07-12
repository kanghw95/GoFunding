package com.funding.sprout.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserMyPageDao;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.MyFunding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.OrderRefund;

@Service("myService")
public class UserMyPageServiceImpl implements UserMyPageService{

	@Autowired
	private UserMyPageDao myDao;
	
	// 내가 참여한 펀딩
	@Override
	public List<MyFunding> list(String id) throws Exception {
		return myDao.list(id);
	}


	@Override
	public int cntMyFunding(String id) throws Exception {
		return myDao.cntMyFunding(id);
	}


	@Override
	public List<MyFunding> rewardList(MyFunding vo) throws Exception {
		return myDao.rewardList(vo);
	}


	@Override
	public List<MyFunding> fundingDetail(MyFunding vo) throws Exception {
		return myDao.fundingDetail(vo);
	}


	@Override
	public int insertOrderRefund(OrderRefund orRefund) throws Exception {
		return myDao.insertOrderRefund(orRefund);
	}


	@Override
	public int orderStausChange(Order order) throws Exception {
		return  myDao.orderStausChange(order);
	}


	@Override
	public int orderDetailStausChange(OrderDetail orDetail) throws Exception {
		return myDao.orderDetailStausChange(orDetail);
	}

	
	// 내가 쓴 글 조회
	@Override
	public List<Board> freeBoardList(String id) throws Exception {
		return myDao.freeBoardList(id);
	}


	@Override
	public List<Board> freeBoardListMore(String id) throws Exception {
		return myDao.freeBoardListMore(id);
	}


	@Override
	public List<Board> reviewBoardList(String id) throws Exception {
		return myDao.reviewBoardList(id);
	}


	@Override
	public List<Board> reviewBoardListMore(String id) throws Exception {
		return myDao.reviewBoardListMore(id);
	}


	@Override
	public List<Board> qBoardList(String id) throws Exception {
		return myDao.qBoardList(id);
	}


	@Override
	public List<Board> qBoardListMore(String id) throws Exception {
		return myDao.qBoardListMore(id);
	}


	@Override
	public List<Board> sBoardList(String id) throws Exception {
		return myDao.sBoardList(id);
	}


	@Override
	public List<Board> sBoardListMore(String id) throws Exception {
		return myDao.sBoardListMore(id);
	}


	@Override
	public List<Board> eBoardList(String id) throws Exception {
		return myDao.eBoardList(id);
	}

	@Override
	public List<Board> eBoardListMore(String id) throws Exception {
		return myDao.eBoardListMore(id);
	}

	// 내가 쓴 댓글
	@Override
	public List<Board> freeBoardCmtList(String id) throws Exception {
		return myDao.freeBoardCmtList(id);
	}


	@Override
	public List<Board> freeBoardCmtListMore(String id) throws Exception {
		return myDao.freeBoardCmtListMore(id);
	}


	@Override
	public List<Board> rBoardCmtList(String id) throws Exception {
		return myDao.rBoardCmtList(id);
	}


	@Override
	public List<Board> rBoardCmtListMore(String id) throws Exception {
		return myDao.rBoardCmtListMore(id);
	}


	@Override
	public List<Board> qBoardCmtList(String id) throws Exception {
		return myDao.qBoardCmtList(id);
	}


	@Override
	public List<Board> qBoardCmtListMore(String id) throws Exception {
		return myDao.qBoardCmtListMore(id);
	}


	@Override
	public List<Board> sBoardCmtList(String id) throws Exception {
		return myDao.sBoardCmtList(id);
	}


	@Override
	public List<Board> sBoardCmtListMore(String id) throws Exception {
		return myDao.sBoardCmtListMore(id);
	}


	@Override
	public List<Board> eBoardCmtList(String id) throws Exception {
		return myDao.eBoardCmtList(id);
	}


	@Override
	public List<Board> eBoardCmtListMore(String id) throws Exception {
		return myDao.eBoardCmtListMore(id);
	}


	
}
