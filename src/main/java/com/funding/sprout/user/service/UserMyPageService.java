package com.funding.sprout.user.service;

import java.util.List;

import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.MyFunding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.OrderRefund;

public interface UserMyPageService {
	public List<MyFunding> list(String id) throws Exception;
	
	public int cntMyFunding(String id) throws Exception;
	
	public List<MyFunding> rewardList(MyFunding vo) throws Exception;
	
	public List<MyFunding> fundingDetail(MyFunding vo) throws Exception;
	
	public int insertOrderRefund(OrderRefund orRefund) throws Exception;
	
	public int orderStausChange(Order order) throws Exception;
	
	public int orderDetailStausChange(OrderDetail orDetail) throws Exception;
	
	public List<Board> freeBoardList(String id) throws Exception;
	
	public List<Board> freeBoardListMore(String id) throws Exception;
	
	public List<Board> reviewBoardList(String id) throws Exception;
	
	public List<Board> reviewBoardListMore(String id) throws Exception;
	
	public List<Board> qBoardList(String id) throws Exception;
	
	public List<Board> qBoardListMore(String id) throws Exception;
	
	public List<Board> sBoardList(String id) throws Exception;
	
	public List<Board> sBoardListMore(String id) throws Exception;
	
	public List<Board> eBoardList(String id) throws Exception;
	
	public List<Board> eBoardListMore(String id) throws Exception;
	
	
}
