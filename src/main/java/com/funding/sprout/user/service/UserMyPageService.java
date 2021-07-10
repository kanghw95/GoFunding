package com.funding.sprout.user.service;

import java.util.List;

import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.MyFunding;

public interface UserMyPageService {
	public List<MyFunding> list(String id) throws Exception;
	
	public int cntMyFunding(String id) throws Exception;
	
	public List<MyFunding> rewardList(String id) throws Exception;
	
	public MyFunding fundingDetail(MyFunding vo) throws Exception;
	
}
