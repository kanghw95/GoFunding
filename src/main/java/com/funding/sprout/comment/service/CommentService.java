package com.funding.sprout.comment.service;

import java.util.List;

import com.funding.sprout.vo.Comment;

public interface CommentService {

	public int CommentWrite(Comment cm); // 댓글 쓰기

	public List<Comment> CommentAll(int boardNo); // 모든 댓글 조회
	
	public int CommentDelete(Comment cm); // 댓글 삭제
	
	public int CommentUpdate(Comment cm); // 댓글 수정
	
	public int CommentCount(Comment cm); // 댓글 수 조회
}