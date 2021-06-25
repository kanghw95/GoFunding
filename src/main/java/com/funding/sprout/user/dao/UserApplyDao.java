package com.funding.sprout.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Application;

@Repository("userApplyDao")
public class UserApplyDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int inputForm(Application app) { //신청 폼 내용 저장
		return sqlSession.insert("User.inputForm", app);
	}
	
	public String duplicateChk(String id) { //메이커명 중복 검사
		return sqlSession.selectOne("User.makerChk", id);
	}
	
}
