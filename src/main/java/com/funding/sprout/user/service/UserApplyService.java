package com.funding.sprout.user.service;

import com.funding.sprout.vo.Application;

public interface UserApplyService {

	public int inputForm(Application app); //신청 폼 내용 저장
	
	public String duplicateChk(String id); //메이커명 중복 검사
	
}
