package com.funding.sprout.comment.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.comment.service.CommentService;

@Controller
public class CommentCtrl {
	
	@Autowired
	private CommentService comService;
	
	@RequestMapping(value = "comwrite", method = RequestMethod.GET)
	public ModelAndView CommentWrite() {// 댓글 쓰기
		return null; 
		
	}
	@RequestMapping(value = "comupdate", method = RequestMethod.GET)
	public ModelAndView CommentUpdate() { // 댓글 수정
		return null;
		
	}
	
	@RequestMapping(value = "comdelete", method = RequestMethod.GET)
	public ModelAndView CommentDelete() { // 댓글 삭제
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
