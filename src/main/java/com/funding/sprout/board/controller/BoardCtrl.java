package com.funding.sprout.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.board.service.BoardService;
import com.funding.sprout.vo.Board;

@Controller
@RequestMapping(value="/board")
public class BoardCtrl {
	
	@Autowired
	private BoardService boService;
	
	public static final int LIMIT = 4;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardCtrl.class);
	
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public ModelAndView boardList( // 게시글 목록
		@RequestParam(name = "page" , defaultValue = "1") int page,
		@RequestParam(name = "keyword", required = false) String keyword, 
		ModelAndView mv) {
			logger.info("boardList()");
			try {
				int currentPage = page;
				//한 페이지당 출력할 목록 갯수
				int listCount = boService.totalCount();
				int maxPage = (int)((double) listCount / LIMIT + 0.9);
				System.out.println("listCount:" + listCount);
				if(keyword != null && !keyword.equals(""))
					mv.addObject("list", boService.searchList(keyword));
				else {
					ArrayList<Board> aaa= new ArrayList<Board>(boService.selectList(currentPage, LIMIT)); 
					System.out.println("aaa: " + aaa.size());
					System.out.println("aaa: " + aaa.get(0).toString());
					mv.addObject("list", aaa);
				}
				
				mv.addObject("currentPage" , currentPage);
				mv.addObject("maxPage" , maxPage);
				mv.addObject("listCound", listCount);
				logger.info("boardList()aaaa: ");
				mv.setViewName("board/boardList");
			}catch(Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("errorPage");
			}
			return mv;
		}
	
	@RequestMapping(value = "boardWrite", method = RequestMethod.GET)
	public ModelAndView boardWrite() { //게시글 등록
		return null;
	}
	
	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(ModelAndView mv,Model model, int boardNo) { // 게시글 상세보기
//	public String boardDetail(ModelAndView mv,Model model, int boardNo) { // 게시글 상세보기
		Board data = boService.detail(boardNo); // no값넘김
		System.out.println("data : " + data.toString());
	
		// 방법1
		mv.addObject("data", data);
		mv.setViewName("board/boardDetail");
		return mv;
		// 방법2
//		model.addAttribute("data", data);
//		return "board/boardDetail";	 
	}
	
	@RequestMapping(value = "bRewrite", method = RequestMethod.GET)
	public ModelAndView boardRenew() { //게시글 수정 jsp 이동
		return null;
	}
	
	
	
	
	@RequestMapping(value = "boardUpdate", method = RequestMethod.GET)
	public ModelAndView boardUpdate() { // 게시글 수정
		return null;
		
	}
	
	@RequestMapping(value = "boardRead", method = RequestMethod.GET)
	public ModelAndView boarRead() { // 게시글 읽기
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
	public int getLike() { //TODO 좋아요 정보 이거는 수정이 필요해보임 추가도
		return 0;

	}
	

	
	private void saveFile() {
		
	}
	
	private void removeFile() {
		
	}


}
