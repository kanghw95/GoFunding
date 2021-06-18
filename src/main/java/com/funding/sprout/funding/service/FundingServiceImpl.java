package com.funding.sprout.funding.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.funding.dao.FundingDao;
import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Reward;

@Service("funService")
public class FundingServiceImpl implements FundingService{

	@Autowired
	private FundingDao funDao;

	@Override
	public int listCount() {
		// TODO Auto-generated method stub
		return funDao.listCount();
	}

	@Override
	public Funding selectOne(int fundingno) {
		// TODO Auto-generated method stub
		return funDao.selectOne(fundingno);
	}
	
	public List<Funding> searchList(String serchOption, String keyword){
		return funDao.searchList(serchOption,keyword);
	}

	@Override
	public List<Funding> selectList() {
		// TODO Auto-generated method stub
		return funDao.selectList();
	}

	@Override
	public List<Reward> selectReward(int fundingno) {
		// TODO Auto-generated method stub
		return funDao.selectReward(fundingno);
	}

	
	@Override
	public int insertFunding() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addReadCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFunding() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFunding() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Funding getPreference() {
		// TODO Auto-generated method stub
		return null;
	}



}
