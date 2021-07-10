package com.funding.sprout.user.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.MyFunding;

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
	
	public List<MyFunding> rewardList(String id) throws Exception{ // 참여한 펀딩 상세 조회
		return sqlSession.selectList("User.myFundingReward", id);
	}
	
	public MyFunding fundingDetail(MyFunding vo) throws Exception{ // 참여한 펀딩 하나
		return sqlSession.selectOne("User.myFundingDetail", vo);
	}
	
}
