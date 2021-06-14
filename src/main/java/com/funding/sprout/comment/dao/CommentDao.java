package com.funding.sprout.comment.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funding.sprout.vo.Comment;

@Repository("comDao")
public class CommentDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int CommentWrite() {// 댓글 쓰기
		return 0; 
		
	}
	
	public int CommentUpdate() { // 댓글 수정
		return 0;
		
	}
	
	public int CommentDelete() { // 댓글 삭제
		return 0; 
		
	}
	public List<Comment> CommentAll(){ // 모든 댓글 조회
		return null;
		
	}
	
	public int CommentCount() { //댓글 수 조회
		return 0;
		
	}

	public ArrayList<Comment> CommentByPage(){ // 페이지 조회
		return null;
		
	}
}
