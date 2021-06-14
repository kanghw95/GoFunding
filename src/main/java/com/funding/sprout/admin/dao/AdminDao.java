package com.funding.sprout.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Faq;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.Report;
import com.funding.sprout.vo.User;

@Repository("adDao")
public class AdminDao {

	@Autowired
	private SqlSession sqlSession;
	
	public Admin adminlogin() { // 관리자 계정 세선 저장용
		return null;
		
	}

	public List<User> getUserByPage() { // 검색 가능한 전체 회원 조회
		return null;
	}

	public List<User> selectUser() { // 특정 유저 조회
		return null;

	}

	public int getUserCount() { // 유저수 조회
		return 0;

	}

	public int userStop() { // 회원 권한 박탈
		return 0;

	}

	public int userStart() { // 회원 권한 복원
		return 0;

	}

	public List<Qna> getQNAByPage() { // qna 리스트 조회
		return null;

	}
	
	public int qnaInsert() { // qna 답변 쓰기
		return 0;
		
	}

	public int getQNACount() { // qna수 조회
		return 0;

	}

	public int qnaUpdate() { // qna 답변수정
		return 0;

	}

	public List<Faq> getFAQByPage() { // faq 리스트 조회
		return null;

	}
	
	public int getFAQCount() { // 공지사항 수 조회
		return 0;
		
	}

	public int FAQInsert() { // FAQ 쓰기
		return 0;
	}

	public int FAQdelete() {
		return 0; // FAQ 삭제

	}

	public int FAQUpdate() { // FAQ 수정하기
		return 0;
	}
	
	public List<Faq> getNotifyByPage(){ // 공지사항 리스트 조회
		return null;
		
	}
	
	public int getNotifyCount() { // 공지사항 수 조회
		return 0;
		
	}
	
	public int NotifyInsert() { // 공지사항 글쓰기
		return 0;
	}
	
	public int Notifydelete() { // 공지사항 삭제
		return 0; 

	}

	public int NotifyUpdate() { // 공지사항 수정
		return 0;
	}
	
	public List<Report> getPeportByPage(){ // 신고 리스트 조회
		return null;
		
	}
	
	public int getReportCount() { // 신고 리스트 수  조회
		return 0; 
		
	}
}
