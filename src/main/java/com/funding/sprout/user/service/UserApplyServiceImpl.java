package com.funding.sprout.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.user.dao.UserApplyDao;
import com.funding.sprout.vo.Application;

@Service("userApplyService")
public class UserApplyServiceImpl implements UserApplyService {
	
	@Autowired
	private UserApplyDao userApplyDao;

	@Override
	public int inputForm(Application app) { //신청 폼 내용 저장
		return userApplyDao.inputForm(app);
	}

	@Override
	public String duplicateChk(String id) { //메이커명 중복 검사
		return userApplyDao.duplicateChk(id);
	}
	
}
