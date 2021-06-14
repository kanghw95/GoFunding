package com.funding.sprout.comment.service;

import java.util.ArrayList;
import java.util.List;

import com.funding.sprout.vo.Comment;

public interface CommentService {

	public int CommentWrite(); // 댓글 쓰기

	public int CommentUpdate(); // 댓글 수정

	public int CommentDelete(); // 댓글 삭제

	public List<Comment> CommentAll(); // 모든 댓글 조회

	public int CommentCount(); // 댓글 수 조회

	public ArrayList<Comment> CommentByPage(); // 페이지 조회

}
