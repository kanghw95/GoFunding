package com.funding.sprout.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("analyticsDao")
public class AnalyticsDao {
	
	@Autowired
	private SqlSession sqlSession;
	 
	public Float analAge1020() { //연령 통계 지표 : 1020대
		return sqlSession.selectOne("Admin.analAge1020");
	}
	
	public Float analAge3040() { //연령 통계 지표 : 3040대
		return sqlSession.selectOne("Admin.analAge3040");
	}
	
	public Float analAge5060() { //연령 통계 지표 : 5060대
		return sqlSession.selectOne("Admin.analAge5060");
	}
	
	public int analCate1() { //분류별 통계 지표 : 일자리 창출
		return sqlSession.selectOne("Admin.analCate1");
	}
	
	public int analCate2() { //분류별 통계 지표 : 공정 무역
		return sqlSession.selectOne("Admin.analCate2");
	}
	
	public int analCate3() { //분류별 통계 지표 : 친환경
		return sqlSession.selectOne("Admin.analCate3");
	}
	
	public int analCate4() { //분류별 통계 지표 : 기부
		return sqlSession.selectOne("Admin.analCate4");
	}
	 
	public int analCate5() { //분류별 통계 지표 : 작은 가게
		return sqlSession.selectOne("Admin.analCate5");
	}
	
	public int analCate6() { //분류별 통계 지표 : 미디어
		return sqlSession.selectOne("Admin.analCate6");
	}
	
	public int analCate7() { //분류별 통계 지표 : 창작자
		return sqlSession.selectOne("Admin.analCate7");
	}
	
	public int analGenderM() { //성별 통계 지표 : 남성
		return sqlSession.selectOne("Admin.analGenderM");
	}

	public int analGenderF() { //성별 통계 지표 : 여성
		return sqlSession.selectOne("Admin.analGenderF");
	}
	
	public List<HashMap<String, String>> analPayment() { //결제 금액 통계
		return sqlSession.selectList("Admin.analPayment");
	}
	
}
