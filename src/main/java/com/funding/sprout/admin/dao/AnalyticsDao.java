package com.funding.sprout.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Application;

@Repository("analyticsDao")
public class AnalyticsDao {
	
	@Autowired
	private SqlSession sqlSession;
	 
	public Float analAgeF1020() { //펀딩 연령 통계 지표 : 1020대
		return sqlSession.selectOne("Admin.analAgeF1020");
	}
	
	public Float analAgeF3040() { //펀딩 연령 통계 지표 : 3040대
		return sqlSession.selectOne("Admin.analAgeF3040");
	}
	
	public Float analAgeF5060() { //펀딩 연령 통계 지표 : 5060대
		return sqlSession.selectOne("Admin.analAgeF5060");
	}
	
	public int analCateF1() { //펀딩 분류별 통계 지표 : 일자리 창출
		return sqlSession.selectOne("Admin.analCateF1");
	}
	
	public int analCateF2() { //펀딩 분류별 통계 지표 : 공정 무역
		return sqlSession.selectOne("Admin.analCateF2");
	}
	
	public int analCateF3() { //펀딩 분류별 통계 지표 : 친환경
		return sqlSession.selectOne("Admin.analCateF3");
	}
	
	public int analCateF4() { //분류별 통계 지표 : 기부
		return sqlSession.selectOne("Admin.analCateF4");
	}
	 
	public int analCateF5() { //펀딩 분류별 통계 지표 : 작은 가게
		return sqlSession.selectOne("Admin.analCateF5");
	}
	
	public int analCateF6() { //펀딩 분류별 통계 지표 : 미디어
		return sqlSession.selectOne("Admin.analCateF6");
	}
	
	public int analCateF7() { //펀딩 분류별 통계 지표 : 창작자
		return sqlSession.selectOne("Admin.analCateF7");
	}
	
	public int analFGenderM() { //펀딩 성별 통계 지표 : 남성
		return sqlSession.selectOne("Admin.analFGenderM");
	}

	public int analFGenderF() { //펀딩 성별 통계 지표 : 여성
		return sqlSession.selectOne("Admin.analFGenderF");
	}
	
	public Float analAgeC1020() { //커뮤니티 연령 통계 지표 : 1020대
		return sqlSession.selectOne("Admin.analAgeC1020");
	}
	
	public Float analAgeC3040() { //커뮤니티 연령 통계 지표 : 3040대
		return sqlSession.selectOne("Admin.analAgeC3040");
	}
	
	public Float analAgeC5060() { //커뮤니티 연령 통계 지표 : 5060대
		return sqlSession.selectOne("Admin.analAgeC5060");
	}
	
	public int analCateC1() { //커뮤니티 분류별 통계 지표 : 자유게시판
		return sqlSession.selectOne("Admin.analCateC1");
	}
	
	public int analCateC2() { //커뮤니티 분류별 통계 지표 : 후기게시판
		return sqlSession.selectOne("Admin.analCateC2");
	}
	
	public int analCateC3() { //커뮤니티 분류별 통계 지표 : 질답게시판
		return sqlSession.selectOne("Admin.analCateC3");
	}
	
	public int analCateC4() { //커뮤니티 분류별 통계 지표 : 이벤트게시판
		return sqlSession.selectOne("Admin.analCateC4");
	}
	
	public int analCateC5() { //커뮤니티 분류별 통계 지표 : 정보공유게시판
		return sqlSession.selectOne("Admin.analCateC5");
	}
	
	public int analCGenderM() { //펀딩 성별 통계 지표 : 남성
		return sqlSession.selectOne("Admin.analCGenderM");
	}
	
	public int analCGenderF() { //펀딩 성별 통계 지표 : 여성
		return sqlSession.selectOne("Admin.analCGenderF");
	}
	
	public List<HashMap<String, String>> analPayment() { //결제 금액 통계 차트
		return sqlSession.selectList("Admin.analPayment");
	}
	
	public List<HashMap<String, String>> analPaymentTab() { //결제 금액 통계 표 : 주문 대비 결제
		return sqlSession.selectList("Admin.analPaymentTab");
	}
	
	public List<HashMap<String, String>> analFundingTab() { //펀딩 현황 표 
		return sqlSession.selectList("Admin.analFundingTab");
	}
	
	public List<Application> adminMainFundingNotice(){ //관리자 메인 페이지 : 펀딩 신청 관리
		return sqlSession.selectList("Admin.adminMainFundingNotice");
	}
	
}
