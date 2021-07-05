package com.funding.sprout.comment.service;

import java.util.ArrayList;
import java.util.List;

import com.funding.sprout.vo.Comment;

public interface CommentService {

	public int CommentWrite(Comment cm); // 댓글 쓰기

	public List<Comment> CommentAll(int boardNo); // 모든 댓글 조회
	
	public int CommentDelete(int cmtNo); // 댓글 삭제
	
	public int CommentUpdate(Comment cm); // 댓글 수정
	
	
	
	
	
	
	
	
	
	

	public int CommentCount(); // 댓글 수 조회

	public ArrayList<Comment> CommentByPage(); // 페이지 조회

}
