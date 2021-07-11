package com.funding.sprout.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserMyPageDao;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.MyFunding;

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


	
}
