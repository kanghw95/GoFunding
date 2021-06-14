package com.funding.sprout.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.board.service.BoardService;
import com.funding.sprout.vo.Board;

@Controller
public class BoardCtrl {
	
	@Autowired
	private BoardService boService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping(value = "boardlist", method = RequestMethod.GET)
	public ModelAndView boardList() { //게시글 리스트
		return null;
		
	}
	
	@RequestMapping(value = "boardRead", method = RequestMethod.GET)
	public ModelAndView boarRead() { // 게시글 읽기
		return null;
		
	}
	
	@RequestMapping(value = "boardWrite", method = RequestMethod.GET)
	public String boardInsertForm(ModelAndView mv) { //게시글 쓰기 jsp 이동
		 return null;
		 
	}
	
	@RequestMapping(value = "boardInsert", method = RequestMethod.GET)
	public ModelAndView boardInsert() { //게시글 등록
		return null;
		
	}
	
	@RequestMapping(value = "bRewrite", method = RequestMethod.GET)
	public ModelAndView boardRenew() { //게시글 수정 jsp 이동
		return null;

	}
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.GET)
	public ModelAndView boardUpdate() { // 게시글 수정
		return null;
		
	}
	
	@RequestMapping(value = "boardDelete", method = RequestMethod.GET)
	public ModelAndView boardDelte() {  // 게시글 삭제
		return null;
		
	}
	
	@RequestMapping(value = "reportSend", method = RequestMethod.GET)
	public int ReportSend() { //게시글 신고
		return 0;
		
	}
	
	@RequestMapping(value = "getLike", method = RequestMethod.GET)
	public Board getLike() { //TODO 좋아요 정보 이거는 수정이 필요해보임 추가도
		return null;

	}
	
	
	private void saveFile() {
		
	}
	
	private void removeFile() {
		
	}


}
