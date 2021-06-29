package com.funding.sprout.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Application;

@Repository("applicationMgtDao")
public class ApplicationMgtDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Application> fundingList(){ //펀딩 목록 조회 : 전체
		return sqlSession.selectList("Admin.fundingList");
	}
	
	public List<Application> fundingListCate(String fundingCategory){ //펀딩 목록 조회 : 카테고리
		return sqlSession.selectList("Admin.fundingListCate", fundingCategory);
	}
	
	public List<Application> formList(){ //펀딩 신청서 목록 조회 : 전체
		return sqlSession.selectList("Admin.selectFormList");
	}
	
	public List<Application> formListCate(String fundingCategory){ //펀딩 신청서 목록 조회 : 카테고리
		return sqlSession.selectList("Admin.selectFormCate", fundingCategory);
	}
	
	public List<Application> formReject(){ //반려 펀딩 목록 조회 : 전체
		return sqlSession.selectList("Admin.selectRejectedForm");
	}
	
	public List<Application> formRejectCate(String fundingCategory){ //반려 펀딩 목록 조회 : 카테고리
		System.out.println("dao들어옴"+fundingCategory);
		System.out.println(sqlSession.selectList("Admin.selectRejectedCategory", fundingCategory));
		return sqlSession.selectList("Admin.selectRejectedCategory", fundingCategory);
	}
	
	public List<Application> formDetail(String applyNo){ //펀딩 신청 상세페이지
		System.out.println(applyNo);
		return sqlSession.selectList("Admin.selectFormDetail", applyNo);
	}
	
	public int makeMaker(Application app) { //펀딩 승인 - 메이커 생성
		return sqlSession.insert("Admin.makeMaker", app);
	}
	
	public int makeFunding(Application app) { //펀딩 승인 - 펀딩 생성
		return sqlSession.insert("Admin.makeFunding", app);
	}
	
	public int makeReward(Application app) { //펀딩 승인 - 리워드 생성
		return sqlSession.insert("Admin.makeReward", app);
	}
	
	public int applicationConfirm(int applyNo) { //펀딩 승인 - 신청서 approved 입력
		return sqlSession.update("Admin.applicationConfirm", applyNo);
	}
	
	public int formRejectInput(Application app) { //펀딩 거절 - 거절 사유 입력
		return sqlSession.update("Admin.formReject", app);
	}
	
}
