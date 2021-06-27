package com.funding.sprout.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.ApplicationMgtDao;
import com.funding.sprout.vo.Application;

@Service("applicationMgtService")
public class ApplicationMgtServiceImpl implements ApplicationMgtService {
	
	@Autowired
	private ApplicationMgtDao applicationMgtDao;

	@Override
	public List<Application> formList() { //펀딩 신청 목록 조회
		return applicationMgtDao.formList();
	}
	
	@Override
	public List<Application> formReject() { //반려 펀딩 목록 조회
		return applicationMgtDao.formReject();
	}

	@Override
	public List<Application> formDetail(String applyNo) { //펀딩 신청 상세페이지
		return applicationMgtDao.formDetail(applyNo);
	}

	@Override
	public int makeMaker(Application app) { //펀딩 승인 - 메이커 생성
		return applicationMgtDao.makeMaker(app);
	}

	@Override
	public int makeFunding(Application app) { //펀딩 승인 - 펀딩 생성
		return applicationMgtDao.makeFunding(app);
	}

	@Override
	public int applicationConfirm(int applyNo) { //펀딩 승인 - 신청서 approved 입력
		return applicationMgtDao.applicationConfirm(applyNo);
	}

	@Override
	public int formReject(Application app) { //펀딩 거절 - 거절 사유 입력
		return applicationMgtDao.formReject(app);
	}

}
