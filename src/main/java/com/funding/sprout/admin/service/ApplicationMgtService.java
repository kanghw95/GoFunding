package com.funding.sprout.admin.service;

import java.util.List;

import com.funding.sprout.vo.Application;

public interface ApplicationMgtService {
	
	public List<Application> fundingList(); //펀딩 목록 조회 : 전체
	
	public List<Application> fundingListCate(String fundingCategory); //펀딩 목록 조회 : 카테고리

	public List<Application> formList(); //펀딩 신청서 목록 조회 : 전체
	
	public List<Application> formListCate(String fundingCategory); //펀딩 신청서 목록 조회 : 카테고리
	
	public List<Application> formReject(); //반려 펀딩 목록 조회 : 전체
	
	public List<Application> formRejectCate(String fundingCategory); //반려 펀딩 목록 조회 : 카테고리

	public List<Application> formDetail(String applyNo); //펀딩 신청 상세페이지
	
	public int makeMaker(Application app); //펀딩 승인 - 메이커 생성
	
	public int makeFunding(Application app); //펀딩 승인 - 펀딩 생성
	
	public int applicationConfirm(int applyNo); //펀딩 승인 - 신청서 approved 입력
	
	public int formRejectInput(Application app); //펀딩 거절 - 거절 사유 입력
}
