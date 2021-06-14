package com.funding.sprout.funding.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.funding.dao.FundingDao;
import com.funding.sprout.vo.Funding;

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

	@Override
	public List<Funding> searchList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Funding> selectList() {
		// TODO Auto-generated method stub
		return funDao.selectList();
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
