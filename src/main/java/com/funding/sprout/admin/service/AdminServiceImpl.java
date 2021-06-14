package com.funding.sprout.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.admin.dao.AdminDao;
import com.funding.sprout.vo.Admin;
import com.funding.sprout.vo.Faq;
import com.funding.sprout.vo.Notifiy;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.Report;
import com.funding.sprout.vo.User;

@Service("adService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adDao;

	@Override
	public Admin adminlogin() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getUserByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> selectUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getUserCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userStop() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userStart() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Qna> getQNAByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int qnaInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getQNACount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int qnaUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Faq> getFAQByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getFAQCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQdelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int FAQUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notifiy> getNotifyByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getNotifyCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int NotifyInsert() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int Notifydelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int NotifyUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Report> getPeportByPage() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getReportCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
