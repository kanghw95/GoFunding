package com.funding.sprout.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
public class BoardCtrl {

	@Autowired
	private BoardService boService;
	@Autowired
	private CommentService comService;

	public static final int LIMIT = 10;
	private static final Logger logger = LoggerFactory.getLogger(BoardCtrl.class);

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list( // 게시글 목록
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "keyword", required = false) String keyword, ModelAndView mv, Board vo) {
		logger.info("list()");
		try {
			
			
			int currentPage = page; // 한 페이지당 출력할 목록 갯수
			mv.addObject("currentPage", currentPage);
			
			int listCount = boService.totalCount(); // 게시글 목록
			mv.addObject("listCount", listCount);
			
			int maxPage = (int) ((double) listCount / LIMIT + 0.9);
			mv.addObject("maxPage", maxPage);
			
			if (keyword != null && !keyword.equals("")) {
				mv.addObject("list", boService.searchList(keyword));
				List<Board> setcmt = boService.CommentCount(vo.getCmt()); // 리스트에 보여줄 댓글수
				mv.addObject("cmt",setcmt);
			}else {
				ArrayList<Board> aaa = new ArrayList<Board>(boService.selectList(currentPage, LIMIT));
				mv.addObject("list", aaa);
				
				List<Board> setcmt = boService.CommentCount(vo.getCmt()); // 리스트에 보여줄 댓글수
				mv.addObject("cmt",setcmt);
				System.out.println(setcmt);
			}
			logger.info("list()aaaa: ");
			mv.setViewName("board/list");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView detail(ModelAndView mv, @RequestParam(name = "boardNo") int boardNo,
			@RequestParam(name = "page", defaultValue = "1") int page, HttpSession session, Comment cm) { // 게시글 상세보기
		// 방법1
		try {	
			String boardId = ((User)session.getAttribute("user")).getUserId(); 
			
			Board data = boService.selectBoard(0, boardNo); // 조회수증가
			mv.addObject("data", data);
			
			int currentPage = page;
			mv.addObject("currentPage", currentPage);
			
			int isLiked = boService.checklike(boardNo, boardId);    // 좋아요상태 :1, 아니면 :0
			mv.addObject("isliked", isLiked);
			
			int likecnt = boService.likecnt(boardNo); // 추천수
			mv.addObject("likecnt", likecnt);
		
		
			
			List<Comment> commentList = comService.CommentAll(boardNo); // 댓글 목록 리스트
			mv.addObject("commentList", commentList);	
			} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
			}	
		return mv;
		// 방법2
//		model.addAttribute("data", data);
//		return "board/detail";	 
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() { // write로 이동
		return "board/write";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public ModelAndView insert(Board b, @RequestParam(name = "upfile", required = false) MultipartFile report,
			@RequestParam("boardTitle") String boardtitle, @RequestParam("boardContent") String boardcotent,
			@RequestParam("userid") String userid, HttpServletRequest request, ModelAndView mv, Board vo) { // 게시글 등록
		int result = 0;
		
		vo = new Board();
		vo.setBoardTitle(boardtitle);
		vo.setBoardContent(boardcotent);
		vo.setBoardId(userid);
		result = boService.insertBoard(vo);
		
		try {
			if (result != 0) {
				mv.setViewName("redirect:list");
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

	@RequestMapping(value = "delete")
	public ModelAndView delete(@RequestParam(name = "boardNo") int boardNo,
			@RequestParam(name = "page", defaultValue = "1") int page, ModelAndView mv) { // 게시글 삭제
		try {
			boService.deleteBoard(boardNo);
			mv.addObject("currentPage", page);
			mv.setViewName("redirect:list");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String boardRenew(int boardNo, Model model) { // 게시글 수정 jsp 이동
		Board data = boService.detail(boardNo);
		model.addAttribute("data", data);
		return "board/update";
	}

	@RequestMapping(value = "update2", method = RequestMethod.POST)
	public String boardUpdate(Board b) { // 게시글 수정
		boService.updateBoard(b);
		return "redirect:list";
	}

	@RequestMapping(value = "clickLike", method = RequestMethod.POST)
	@ResponseBody
	public int clickLike(@RequestParam("boardNo") int boardNo, @RequestParam("boardId") String boardId, ModelAndView mv,
			ModelAndView model) { // 추천
		int result = -1;
		int likecnt = 0;
		try {
			result = boService.checklike(boardNo, boardId);
			if (result == 0) { // 추천이 안되어있는 상태라면 클릭했을때 추천
				boService.insertLike(boardNo, boardId);
			} else if (result == 1) { // 추천이 되어있는 상태라면 클릭했을때 추천 취소
				boService.deleteLike(boardNo, boardId);
			} else {
				}
			likecnt = boService.likecnt(boardNo); // 총 추천수
		} catch (Exception e) {
			e.printStackTrace();
		}
		return likecnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "boardRead", method = RequestMethod.GET)
	public ModelAndView boarRead() { // 게시글 읽기
		return null;

	}

	@RequestMapping(value = "reportSend", method = RequestMethod.GET)
	public int ReportSend() { // 게시글 신고
		return 0;

	}

	private void saveFile() {

	}

	private void removeFile() {

	}
}