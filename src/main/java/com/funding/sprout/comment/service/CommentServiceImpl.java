package com.funding.sprout.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.funding.sprout.comment.dao.CommentDao;
import com.funding.sprout.vo.Comment;

@Service("comService")
public class CommentServiceImpl implements CommentService {
	
	private CommentDao comDao;

	@Override
	public int CommentWrite(Comment cm) {
		return comDao.CommentWrite(cm);
	}

	@Override
	public int CommentUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int CommentDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Comment> CommentAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int CommentCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Comment> CommentByPage() {
		// TODO Auto-generated method stub
		return null;
	}

}
