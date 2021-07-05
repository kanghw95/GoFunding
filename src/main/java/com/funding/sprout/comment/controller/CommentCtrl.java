package com.funding.sprout.comment.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.comment.service.CommentService;
import com.funding.sprout.vo.Comment;
import com.funding.sprout.vo.User;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "/board")
public class CommentCtrl {
	
	@Autowired
	private CommentService comService;
	
	@RequestMapping(value = "comwrite", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")  //, produces="text/plain;charset=UTF-8"
	@ResponseBody
	public String CommentWrite(Comment cm, HttpSession session) { // 댓글 쓰기
//		res.setContentType("text/html; charset=UTF-8"); (String 대신 void쓰기 , ResponseBody 없애고, produces="text/plain;charset=UTF-8"없애고)
		String result = "";
		try {
			String boardId = ((User)session.getAttribute("user")).getUserId(); // 댓글 작성한 아이디
			cm.setId(boardId);
			
			int insertResult = comService.CommentWrite(cm); // 댓글 작성
			int boardNo = cm.getBoardNo();
			List<Comment> commentList = comService.CommentAll(boardNo); // 댓글 목록 리스트
			
			Gson gs = new Gson();
			result = gs.toJson(commentList);
//			PrintWriter out = res.getWriter();
//			out.print(result);
//			out.flush();
//			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
		
	@RequestMapping(value = "comdelete", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String CommentDelete(@RequestParam(name = "cmtNo") int cmtNo, Comment cm, HttpSession session) { // 댓글 삭제
		
		String result = "";
		try{
			String boardId = ((User)session.getAttribute("user")).getUserId(); // 아이디
			cm.setId(boardId);
			
			int deleteno = comService.CommentDelete(cmtNo); // 댓글 삭제할 댓글 번호
			int boardNo = cm.getBoardNo();
			List<Comment> commentList = comService.CommentAll(boardNo); // 댓글 목록 리스트
			
			Gson gs = new Gson();
			result = gs.toJson(commentList);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result; 
	}

	
	
	
	@RequestMapping(value = "comupdate", method = RequestMethod.POST)
	public String CommentUpdate(Comment cm, HttpSession session) { // 댓글 수정
			
		
		try{
			String boardId = ((User)session.getAttribute("user")).getUserId(); // 아이디
			cm.setId(boardId);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	@RequestMapping(value = "comlookup", method = RequestMethod.GET)
	public ModelAndView CommentAll(){ // 모든 댓글 조회
		return null;
		
	}
	
	@RequestMapping(value = "comcount", method = RequestMethod.GET)
	public ModelAndView CommentCount() { //댓글 수 조회
		return null;
		
	}
	
	@RequestMapping(value = "comall", method = RequestMethod.GET)
	public ModelAndView CommentByPage(){ // 페이지 조회
		return null;
		
	}

}
