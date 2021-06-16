package com.funding.sprout.funding.service;

import java.util.List;

import com.funding.sprout.vo.Funding;

public interface FundingService {

	public int listCount();// 전체 펀딩수 조회

	public Funding selectOne(int fundingno); // 펀딩 가져오기
	
	public List<Funding> selectlist(); // 펀딩 전체 조회

	
	public List<Funding> searchList(String serchOption, String keyword); // 펀딩  제목&내용 검색

	public List<Funding> selectList();// 전체 펀딩 조회

	public int insertFunding(); // 펀딩 입력

	public int addReadCount(); // 펀딩 조회 수 증가

	public int updateFunding(); // 펀딩 수정

	public int deleteFunding(); // 펀딩 삭제
	
	public Funding getPreference(); //TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도

}
