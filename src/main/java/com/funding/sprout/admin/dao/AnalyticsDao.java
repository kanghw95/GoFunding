package com.funding.sprout.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("analyticsDao")
public class AnalyticsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
}
