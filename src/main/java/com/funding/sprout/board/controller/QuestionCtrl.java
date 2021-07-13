package com.funding.sprout.board.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.board.service.BoardService;
import com.funding.sprout.comment.service.CommentService;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Comment;
import com.funding.sprout.vo.User;

@Controller
@RequestMapping(value = "/board")
public class QuestionCtrl {

	@Autowired
	private BoardService boService;
	@Autowired
	private CommentService comService;

	public static final int LIMIT = 10;
	private static final Logger logger = LoggerFactory.getLogger(BoardCtrl.class);

	@RequestMapping(value = "question", method = RequestMethod.GET)
	public ModelAndView question( // 게시글 목록
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv, Comment cm, Board vo) {
		logger.info("list()");
		try {
			int currentPage = page; // 한 페이지당 출력할 목록 갯수
			int listCount = boService.questionCount();
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
					
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", boService.searchList(keyword));
			}else {
				ArrayList<Board> aaa = new ArrayList<Board>(boService.questionSelectList(currentPage, LIMIT));
				mv.addObject("list", aaa);
				System.out.println("sss"+aaa);
			}
			logger.info("list()aaaa: ");
			mv.addObject("currentPage", currentPage);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
 			
			mv.setViewName("board/question");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "questiondetail", method = RequestMethod.GET)
	public ModelAndView questiondetail(ModelAndView mv, @RequestParam(name = "boardNo") int boardNo,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpSession session,HttpServletResponse response){ // 게시글 상세보기
		// 방법1
		System.out.println("질의응답 게시판 상세보기들어온다!!");
		try {		
			Board data = boService.questionAddReadCount(0, boardNo); // 조회수증가
			int currentPage = page;
			int likecnt = 0; // 추천수
			mv.addObject("currentPage", currentPage);
			mv.addObject("data", data);
			
			String boardId = ((User)session.getAttribute("user")).getUserId(); 
			int isLiked = boService.questionChecklike(boardNo, boardId);    // 좋아요상태 :1, 아니면 :0
			mv.addObject("isliked", isLiked);   // 좋아요상태 :1, 아니면 :0
			
			likecnt = boService.questionLikecnt(boardNo); // 추천수
			mv.addObject("likecnt", likecnt);
		
			List<Comment> commentList = comService.CommentAll(boardNo); // 댓글 목록 리스트
			mv.addObject("commentList", commentList);	
			
			} catch (Exception e) {
			e.printStackTrace();
//			mv.addObject("msg", e.getMessage());

			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				out = response.getWriter();
				out.println("<script>alert('로그인 후 상세보기가 가능합니다.');</script>");			 
				out.flush();
			} catch (IOException e1) {
				e1.printStackTrace();
				}
			System.out.println("로그인 해야 상세보기가 가능합니다.");
			mv.setViewName("user/login");
			}	
		return mv;
		// 방법2
//		model.addAttribute("data", data);
//		return "board/detail";	 
	}

	@RequestMapping(value = "questionwrite", method = RequestMethod.GET)
	public String questionwrite() { // write로 이동
		return "board/questionwrite";
	}

	@RequestMapping(value = "questioninsert", method = RequestMethod.POST)
	public ModelAndView questioninsert(Board b, @RequestParam(name = "upfile", required = false) MultipartFile report,
			@RequestParam("boardTitle") String boardtitle, @RequestParam("boardContent") String boardcotent,
			@RequestParam("userid") String userid, HttpServletRequest request, ModelAndView mv, Board vo) { // 게시글 등록
		int result = 0;
		
		vo = new Board();
		vo.setBoardTitle(boardtitle);
		vo.setBoardContent(boardcotent);
		vo.setBoardId(userid);
		result = boService.questionInsertBoard(vo);
		
		try {
			if (result != 0) {
				mv.setViewName("redirect:question");
			} else {
				mv.addObject("msg", "글 등록 실패");
				mv.setViewName("errorPage");
			}
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "questiondelete")
	public ModelAndView questiondelete(@RequestParam(name = "boardNo") int boardNo,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) { // 게시글 삭제
		try {
//			Board b = boService.selectBoard(1, boardNo);
			boService.questionDeleteBoard(boardNo);
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:question");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "questionupdate", method = RequestMethod.POST)
	public String questionboardRenew(int boardNo, Model model) { // 게시글 수정 jsp 이동
		Board data = boService.questionDetail(boardNo);
		model.addAttribute("data", data);
		return "board/questionupdate";
	}

	@RequestMapping(value = "questionupdate2", method = RequestMethod.POST)
	public String questionboardUpdate(Board b) { // 게시글 수정
		boService.updateBoard(b);
		return "redirect:question";
	}

	@RequestMapping(value = "questionclickLike", method = RequestMethod.POST)
	@ResponseBody
	public int questionclickLike(@RequestParam("boardNo") int boardNo, @RequestParam("boardId") String boardId, ModelAndView mv,
			ModelAndView model) { // 추천
		int result = -1;
		int likecnt = 0;
		try {
			result = boService.questionChecklike(boardNo, boardId);
			if (result == 0) { // 추천이 안되어있는 상태라면 클릭했을때 추천
				boService.questionInsertLike(boardNo, boardId);
			} else if (result == 1) { // 추천이 되어있는 상태라면 클릭했을때 추천 취소
				boService.questionDeleteLike(boardNo, boardId);
			} else {
				}
			likecnt = boService.questionLikecnt(boardNo); // 총 추천수
			//mv.addObject("likecnt", likecnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return likecnt;
	}

}