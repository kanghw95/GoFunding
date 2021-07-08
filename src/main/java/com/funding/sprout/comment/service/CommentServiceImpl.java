package com.funding.sprout.comment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.sprout.comment.dao.CommentDao;
import com.funding.sprout.vo.Comment;

@Service("comService")
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	private CommentDao comDao;

	@Override
	public int CommentWrite(Comment cm) { // 댓글 쓰기
		return comDao.CommentWrite(cm);
	}

	@Override
	public List<Comment> CommentAll(int boardNo) { // 모든 댓글 조회
		return comDao.CommentAll(boardNo);
	}
	
	@Override
	public int CommentDelete(Comment cm) { // 댓글 삭제
		return comDao.CommentDelete(cm);
	}
	
	@Override
	public int CommentUpdate(Comment cm) { // 댓글 수정
		return comDao.CommentUpdate(cm);
	}
	
	@Override
	public int CommentCount(Comment cm) { // 댓글 수 조회
		return comDao.CommentCount(cm);
	}
}
