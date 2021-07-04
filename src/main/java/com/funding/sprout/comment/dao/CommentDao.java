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
	
	public int CommentWrite(Comment cm) { // 댓글 쓰기
		return sqlSession.insert("Comment.CommentWrite",cm);	
	}
	
	public List<Comment> CommentAll(int boardNo){ // 모든 댓글 조회
		return sqlSession.selectList("Comment.CommentAll", boardNo);
	}
	
	public int CommentDelete(Comment cm) { // 댓글 삭제
		return sqlSession.delete("Comment.CommentDelete", cm); 
	}
	
	public int CommentUpdate(Comment cm) { // 댓글 수정
		return sqlSession.update("Comment.CommentUpdate", cm);	
	}
	
	
	
	
	
	
	


	public int CommentCount() { //댓글 수 조회
		return 0;
		
	}

	public ArrayList<Comment> CommentByPage(){ // 페이지 조회
		return null;
		
	}
}
