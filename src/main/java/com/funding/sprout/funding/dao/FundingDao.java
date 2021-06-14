package com.funding.sprout.funding.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Funding;


@Repository("funDao")
public class FundingDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount() {
		return sqlSession.selectOne("Funding.listCount"); // 전체 펀딩수 조회
	}
	
	public Funding selectOne(int fundingno) {
		return sqlSession.selectOne("Funding.selectOne",fundingno); // 펀딩 가져오기
	}

	public List<Funding> searchList() {
		return null; // 펀딩 검색 조회
	}

	public List<Funding> selectList() {
		return sqlSession.selectList("Funding.selectList");// 전체 펀딩 조회
	}

	public int insertFunding() {
		return 0; // 펀딩 입력
	}

	public int addReadCount() {
		return 0; // 펀딩 조회 수 증가
	}

	public int updateFunding() {
		return 0; // 펀딩 수정
	}

	public int deleteFunding() {
		return 0; // 펀딩 삭제
	}
	
	
	public Funding getPreference() {  //TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도
		return null;

	}

}
