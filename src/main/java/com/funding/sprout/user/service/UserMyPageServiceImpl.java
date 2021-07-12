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
	
	@Override
	public List<MyFunding> list(String id) throws Exception {
		return myDao.list(id); // 내가 참여한 펀딩 조회
	}


	@Override
	public int cntMyFunding(String id) throws Exception {
		return myDao.cntMyFunding(id); // 내가 참여한 펀딩 수
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


	
}
