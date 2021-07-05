package com.funding.sprout.comment.controller;


import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String CommentWrite(Comment cm, HttpSession session, HttpServletResponse res) { // 댓글 쓰기
//		res.setContentType("text/html; charset=UTF-8"); (String 대신 void쓰기 , ResponseBody 없애고, produces="text/plain;charset=UTF-8"없애고)
		String result = "";
		System.out.println("[순찬1111]");
		try {
			System.out.println("[순찬2222] : " + cm.toString());

			String boardId = ((User)session.getAttribute("user")).getUserId(); // 댓글 작성한 아이디
			System.out.println("[순찬 07-02] session boardId: "+ boardId); 
			cm.setId(boardId);
			
			int insertResult = comService.CommentWrite(cm); // 댓글 작성
			System.out.println("댓글입력 결과: "+ insertResult);  // 1: 성공, 0 이면 실패
			
			int boardNo = cm.getBoardNo();
			System.out.println("boardNO: " + boardNo);
			List<Comment> commentList = comService.CommentAll(boardNo); // 댓글 목록 리스트
			
			Gson gs = new Gson();
		
			result = gs.toJson(commentList);
			System.out.println("댓글입력 후 댓글 목록 json 리스트:" + result);
			
//			PrintWriter out = res.getWriter();
//			out.print(result);
//			out.flush();
//			out.close();
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
		
	@RequestMapping(value = "comdelete", method = RequestMethod.POST)
	@ResponseBody
	public String CommentDelete(Comment cm, HttpSession session) { // 댓글 삭제

		System.out.println("댓글삭제페이지 넘어오기!!!");
		try{
			String boardId = ((User)session.getAttribute("user")).getUserId(); // 아이디
			System.out.println("[순찬 07-05] session boardId: "+ boardId); 
			cm.setId(boardId);
			
			comService.CommentDelete(cm);
			System.out.println("cm.삭제 : " + cm);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}
	
	@RequestMapping(value = "comupdate", method = RequestMethod.POST)
	public String CommentUpdate(Comment cm, HttpSession session) { // 댓글 수정
			
		System.out.println("댓글수정페이지넘어오기!!!");
		String result = "";
		
		try{
			String boardId = ((User)session.getAttribute("user")).getUserId(); // 아이디
			System.out.println("[순찬 07-04] session boardId: "+ boardId); 
			cm.setId(boardId);
			
			comService.CommentUpdate(cm);
			System.out.println("cm.수정 : " + cm);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
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
