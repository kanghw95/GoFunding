package com.funding.sprout.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("analyticsDao")
public class AnalyticsDao {
	
	@Autowired
	private SqlSession sqlSession;
	 
	public Float analAge1020() {
		return sqlSession.selectOne("Admin.analAge1020");
	}
	
	public Float analAge3040() {
		return sqlSession.selectOne("Admin.analAge3040");
	}
	
	public Float analAge5060() {
		return sqlSession.selectOne("Admin.analAge5060");
	}
	
	public int analCate1() {
		return sqlSession.selectOne("Admin.analCate1");
	}
	
	public int analCate2() {
		return sqlSession.selectOne("Admin.analCate2");
	}
	
	public int analCate3() {
		return sqlSession.selectOne("Admin.analCate3");
	}
	
	public int analCate4() {
		return sqlSession.selectOne("Admin.analCate4");
	}
	
	public int analCate5() {
		return sqlSession.selectOne("Admin.analCate5");
	}
	
	public int analCate6() {
		return sqlSession.selectOne("Admin.analCate6");
	}
	
	public int analCate7() {
		return sqlSession.selectOne("Admin.analCate7");
	}
	
	public int analGenderM() {
		return sqlSession.selectOne("Admin.analGenderM");
	}

	public int analGenderF() {
		return sqlSession.selectOne("Admin.analGenderF");
	}
	
}
