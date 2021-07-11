package com.funding.sprout.funding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.funding.dao.FundingDao;
import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Order;
import com.funding.sprout.vo.OrderDetail;
import com.funding.sprout.vo.Reward;

@Service("funService")
public class FundingServiceImpl implements FundingService {

	@Autowired
	private FundingDao funDao;

	@Override
	public int listCount() {
		return funDao.listCount();
	}

	@Override
	public Funding selectOne(int fundingno) {
		return funDao.selectOne(fundingno);
	}

	public List<Funding> searchList(String serchOption, String keyword) {
		return funDao.searchList(serchOption, keyword);
	}
	
	@Override
	public List<Funding> selectCatList(String serchOption) {
		// TODO Auto-generated method stub
		return funDao.selectCatList(serchOption);
	}
	
	@Override
	public List<Funding> selectFinList(String serchOption) {
		// TODO Auto-generated method stub
		return  funDao.selectFinList(serchOption);
	}
	
	@Override
	public List<Funding> selectCatFinList(String serchOption) {
		// TODO Auto-generated method stub
		return funDao.selectCatFinList(serchOption);
	}

	@Override
	public List<Funding> selectList() {
		return funDao.selectList();
	}

	@Override
	public List<Reward> selectReward(int fundingno) {
		return funDao.selectReward(fundingno);
	}

	@Override
	public int insertOrders(Order order) {
		return funDao.insertOrders(order);
	}
	
	@Override
	public int selectTotalPrice(int fundingno) {
		return funDao.selectTotalPrice(fundingno);
	}
	
	@Override
	public int priceUpdate(Funding funding) {
		return funDao.priceUpdate(funding);
	}
	

	@Override
	public int selectHistory(int fundingno) {
		return funDao.selectHistory(fundingno);
	}

	@Override
	public List<Order> selectHistoryDetail(int fundingno) {
		return funDao.selectHistoryDetail(fundingno);
	}
	
	@Override
	public int selectOrderCheck(Order oder) {
		return funDao.selectOrderCheck(oder);
	}
	
	@Override
	public int rewardStock(Reward reward) {
		return funDao.rewardStock(reward);
	}
	@Override
	public int rewardStockChange(Reward reward) {
		return funDao.rewardStockChange(reward);
	}
	
	@Override
	public int insertOrdersDetail(OrderDetail orderDetail) {
		// TODO Auto-generated method stub
		return funDao.insertOrdersDetail(orderDetail);
	}
	
	@Override
	public int selectOrderNo(Order order) {
		// TODO Auto-generated method stub
		return funDao.selectOrderNo(order);
	}
	
	@Override
	public int selectRewardNo(Reward reward) {
		// TODO Auto-generated method stub
		return funDao.selectRewardNo(reward);
	}
	
	@Override
	public int rewardCount(Reward reward) {
		// TODO Auto-generated method stub
		return funDao.rewardCount(reward);
	}

	@Override
	public int rewardCountIncrease(Reward reward) {
		// TODO Auto-generated method stub
		return funDao.rewardCountIncrease(reward);
	}
	
	@Override
	public int checklike(int fundingno, String Id) { // 게시글 추천 여부 검사 비추천0 추천1

		int result = funDao.checklike(fundingno, Id);
		
		return result;
	}

	@Override
	public int insertLike(int fundingno,String Id) { // 게시글 추천
		return funDao.insertLike(fundingno,Id);
	}
	
	@Override
	public int deleteLike(int fundingno, String Id) { // 게시글 추천 취소
		return funDao.deleteLike(fundingno, Id);
	}

	@Override
	public int likecnt(int fundingno) { // 게시글 추천수
		return funDao.likecnt(fundingno);
	}
	
	@Override
	public Funding getPreference() {
		return null;
	}


}
