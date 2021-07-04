package com.funding.sprout.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.admin.service.AdminService;
import com.funding.sprout.vo.Board;
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.PageMaker;
import com.funding.sprout.vo.Qna;
import com.funding.sprout.vo.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


@Controller
public class AdminCtrl {

	@Autowired
	private AdminService adService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminCtrl.class);
	public static final int LIMIT = 2;
	
	@RequestMapping(value = "adlogin", method = RequestMethod.GET)
	public ModelAndView adminlogin() { // 관리자 계정 세선 저장용
		return null;
		
	}
	
	@RequestMapping(value = "userlist", method = RequestMethod.GET) 
	public String list(Model model, Criteria cri) throws Exception { // 검색 가능한 전체 회원 조회 페이지
		
		List<User> userlist = adService.list(cri); // 유저 리스트 가져오기
		int userCount = adService.listCount(); // 유저 총 수 가져오기
		System.out.println("usercount : " + userCount);
		System.out.println("userlist : " + userlist);
		model.addAttribute("userlist", userlist); // 유저 리스트 jsp로
		model.addAttribute("usercount", userCount); // 유저 총 수 jsp로
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "userselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectUser(User user, HttpServletRequest request) throws Exception { // 특정 유저 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String userId = request.getParameter("userId"); // 아이디 값 받기
		String userName = request.getParameter("userName"); // 이름 값 받기
		String userNick = request.getParameter("userNick"); // 닉네임 값 받기
		System.out.println("mapper로 넘길 값은 : " + userId);
		System.out.println("mapper로 넘길 값은 : " + userName);
		System.out.println("mapper로 넘길 값은 : " + userNick);
		
		if (userId != null) { // select에서 아이디를 선택했을 때
			user.setUserId(userId); // vo에 아이디를 넣음
			String getUserId = user.getUserId();			
			System.out.println("최종 userId 값은 : " + getUserId);
			List<User> searchId = adService.selectUserId(user); // 아이디로 검색한 리스트 가져오기
			System.out.println(searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (userName != null) { // select에서 이름을 선택했을 때
			user.setUserName(userName);
			String getUserName = user.getUserName();
			System.out.println("최종 userName 값은 : " + getUserName);
			List<User> searchName = adService.selectUserName(user); // 이름으로 검색한 리스트 가져오기
			System.out.println(searchName);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchName);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		} else if (userNick != null) { // select에서 닉네임을 선택했을 때
			user.setUserNick(userNick);
			String getUserNick = user.getUserNick();
			System.out.println("최종 userNick 값은 : " + getUserNick);
			List<User> searchNick = adService.selectUserNick(user); // 닉네임으로 검색한 리스트 가져오기
			System.out.println(searchNick);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchNick);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		return "admin/userList";
	}
	
	@RequestMapping(value = "userstop", method = RequestMethod.POST)
	@ResponseBody
	public String userStop(HttpServletRequest request) { // 회원 권한 박탈
		String[] deleteList = request.getParameterValues("userNo"); // 체크된 유저 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.userStop(deleteList[i]); // 유저 번호 검색해서 해당 유저 삭제
		}
		return "admin/userList";
	}
	
	@RequestMapping(value = "freeboardlist", method = RequestMethod.GET)
	public String FreeBoardList(Model model, Criteria cri) throws Exception { // 자유 게시판 조회
		
		List<Board> freeBoard = adService.freeBoardList(cri); // 게시판 리스트 가져오기
		System.out.println("freeBoard : " + freeBoard);
		model.addAttribute("freeboard", freeBoard);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.freeBoardCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/board";	
	}
	
	@RequestMapping(value = "reviewboardlist", method = RequestMethod.GET)
	public String reviewBoardList(Model model, Criteria cri) throws Exception { // 후기 게시판 조회
		
		List<Board> reviewBoard = adService.reviewBoardList(cri); // 게시판 리스트 가져오기
		System.out.println("reviewBoard : " + reviewBoard);
		model.addAttribute("reviewboard", reviewBoard);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.reviewBoardCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/board";	
	}
	
	@RequestMapping(value = "questionboardlist", method = RequestMethod.GET)
	public String questionBoardList(Model model, Criteria cri) throws Exception { // 질의응답 게시판 조회
		
		List<Board> questionBoard = adService.questionBoardList(cri); // 게시판 리스트 가져오기
		System.out.println("questionBoard : " + questionBoard);
		model.addAttribute("questionboard", questionBoard);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.questionBoardCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/board";	
	}
	
	@RequestMapping(value = "shareboardlist", method = RequestMethod.GET)
	public String shareBoardList(Model model, Criteria cri) throws Exception { // 정보공유 게시판 조회
		
		List<Board> shareBoard = adService.shareBoardList(cri); // 게시판 리스트 가져오기
		System.out.println("shareBoard : " + shareBoard);
		model.addAttribute("shareboard", shareBoard);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.shareBoardCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/board";	
	}
	
	@RequestMapping(value = "eventboardlist", method = RequestMethod.GET)
	public String eventBoardList(Model model, Criteria cri) throws Exception { // 이벤트 게시판 조회
		
		List<Board> eventBoard = adService.eventBoardList(cri); // 게시판 리스트 가져오기
		System.out.println("eventBoard : " + eventBoard);
		model.addAttribute("eventboard", eventBoard);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.eventBoardCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/board";	
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String noticeList(Model model, Criteria cri) throws Exception { // 공지사항 조회
		
		List<Board> notice = adService.noticeList(cri); // 게시판 리스트 가져오기
		System.out.println("notice : " + notice);
		model.addAttribute("notice", notice);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.noticeCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/notice";	
	}

	
	@RequestMapping(value = "fboardselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String fBoardSelect(Board board, HttpServletRequest request) throws Exception { // 자유 게시판 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String boardTitle = request.getParameter("boardTitle"); // 제목 값 받기
		String boardId = request.getParameter("boardId"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + boardTitle);
		System.out.println("mapper로 넘길 값은 : " + boardId);
		
		if (boardTitle != null) { // select에서 제목을 선택했을 때
			board.setBoardTitle(boardTitle); // vo에 제목을 넣음
			String getBoardTitle = board.getBoardTitle();			
			System.out.println("최종 boardTitle 값은 : " + getBoardTitle);
			List<Board> searchTitle = adService.selectFBoardTitle(board); // 제목으로 검색한 리스트 가져오기
			System.out.println("searchTitle : " + searchTitle);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchTitle);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (boardId != null) { // select에서 작성자를 선택했을 때
			board.setBoardId(boardId); // vo에 작성자를 넣음
			String getBoardId = board.getBoardId();
			System.out.println("최종 boardId 값은 : " + getBoardId);
			List<Board> searchId = adService.selectFBoardId(board); // 이름으로 검색한 리스트 가져오기
			System.out.println("searchId : " + searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "rboardselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String rBoardSelect(Board board, HttpServletRequest request) throws Exception { // 후기 게시판 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String boardTitle = request.getParameter("boardTitle"); // 제목 값 받기
		String boardId = request.getParameter("boardId"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + boardTitle);
		System.out.println("mapper로 넘길 값은 : " + boardId);
		
		if (boardTitle != null) { // select에서 제목을 선택했을 때
			board.setBoardTitle(boardTitle); // vo에 제목을 넣음
			String getBoardTitle = board.getBoardTitle();			
			System.out.println("최종 boardTitle 값은 : " + getBoardTitle);
			List<Board> searchTitle = adService.selectRBoardTitle(board); // 제목으로 검색한 리스트 가져오기
			System.out.println("searchTitle : " + searchTitle);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchTitle);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (boardId != null) { // select에서 작성자를 선택했을 때
			board.setBoardId(boardId); // vo에 작성자를 넣음
			String getBoardId = board.getBoardId();
			System.out.println("최종 boardId 값은 : " + getBoardId);
			List<Board> searchId = adService.selectRBoardId(board); // 작성자로 검색한 리스트 가져오기
			System.out.println("searchId : " + searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "qboardselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String qBoardSelect(Board board, HttpServletRequest request) throws Exception { // 질의응답 게시판 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String boardTitle = request.getParameter("boardTitle"); // 제목 값 받기
		String boardId = request.getParameter("boardId"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + boardTitle);
		System.out.println("mapper로 넘길 값은 : " + boardId);
		
		if (boardTitle != null) { // select에서 제목을 선택했을 때
			board.setBoardTitle(boardTitle); // vo에 제목을 넣음
			String getBoardTitle = board.getBoardTitle();			
			System.out.println("최종 boardTitle 값은 : " + getBoardTitle);
			List<Board> searchTitle = adService.selectQBoardTitle(board); // 제목으로 검색한 리스트 가져오기
			System.out.println("searchTitle : " + searchTitle);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchTitle);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (boardId != null) { // select에서 작성자를 선택했을 때
			board.setBoardId(boardId); // vo에 작성자를 넣음
			String getBoardId = board.getBoardId();
			System.out.println("최종 boardId 값은 : " + getBoardId);
			List<Board> searchId = adService.selectQBoardId(board); // 작성자로 검색한 리스트 가져오기
			System.out.println("searchId : " + searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "sboardselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String sBoardSelect(Board board, HttpServletRequest request) throws Exception { // 정보공유 게시판 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String boardTitle = request.getParameter("boardTitle"); // 제목 값 받기
		String boardId = request.getParameter("boardId"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + boardTitle);
		System.out.println("mapper로 넘길 값은 : " + boardId);
		
		if (boardTitle != null) { // select에서 제목을 선택했을 때
			board.setBoardTitle(boardTitle); // vo에 제목을 넣음
			String getBoardTitle = board.getBoardTitle();			
			System.out.println("최종 boardTitle 값은 : " + getBoardTitle);
			List<Board> searchTitle = adService.selectSBoardTitle(board); // 제목으로 검색한 리스트 가져오기
			System.out.println("searchTitle : " + searchTitle);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchTitle);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (boardId != null) { // select에서 작성자를 선택했을 때
			board.setBoardId(boardId); // vo에 작성자를 넣음
			String getBoardId = board.getBoardId();
			System.out.println("최종 boardId 값은 : " + getBoardId);
			List<Board> searchId = adService.selectSBoardId(board); // 작성자로 검색한 리스트 가져오기
			System.out.println("searchId : " + searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "eboardselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String eBoardSelect(Board board, HttpServletRequest request) throws Exception { // 이벤트 게시판 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String boardTitle = request.getParameter("boardTitle"); // 제목 값 받기
		String boardId = request.getParameter("boardId"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + boardTitle);
		System.out.println("mapper로 넘길 값은 : " + boardId);
		
		if (boardTitle != null) { // select에서 제목을 선택했을 때
			board.setBoardTitle(boardTitle); // vo에 제목을 넣음
			String getBoardTitle = board.getBoardTitle();			
			System.out.println("최종 boardTitle 값은 : " + getBoardTitle);
			List<Board> searchTitle = adService.selectEBoardTitle(board); // 제목으로 검색한 리스트 가져오기
			System.out.println("searchTitle : " + searchTitle);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchTitle);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (boardId != null) { // select에서 작성자를 선택했을 때
			board.setBoardId(boardId); // vo에 작성자를 넣음
			String getBoardId = board.getBoardId();
			System.out.println("최종 boardId 값은 : " + getBoardId);
			List<Board> searchId = adService.selectEBoardId(board); // 작성자로 검색한 리스트 가져오기
			System.out.println("searchId : " + searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "noticeselect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String noticeSelect(Board board, HttpServletRequest request) throws Exception { // 자유 게시판 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String boardTitle = request.getParameter("boardTitle"); // 제목 값 받기
		String boardId = request.getParameter("boardId"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + boardTitle);
		System.out.println("mapper로 넘길 값은 : " + boardId);
		
		if (boardTitle != null) { // select에서 제목을 선택했을 때
			board.setBoardTitle(boardTitle); // vo에 제목을 넣음
			String getBoardTitle = board.getBoardTitle();			
			System.out.println("최종 boardTitle 값은 : " + getBoardTitle);
			List<Board> searchTitle = adService.selectNBoardTitle(board); // 제목으로 검색한 리스트 가져오기
			System.out.println("searchTitle : " + searchTitle);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchTitle);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (boardId != null) { // select에서 작성자를 선택했을 때
			board.setBoardId(boardId); // vo에 작성자를 넣음
			String getBoardId = board.getBoardId();
			System.out.println("최종 boardId 값은 : " + getBoardId);
			List<Board> searchId = adService.selectNBoardId(board); // 이름으로 검색한 리스트 가져오기
			System.out.println("searchId : " + searchId);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(searchId);
			System.out.println("jsonOutput : " + jsonOutput);
			return jsonOutput;
		}
		
		return "admin/userList";
	}
	
	@RequestMapping(value = "qnaSelect", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String qndSelect(Qna qna, HttpServletRequest request) throws Exception { // Qna 특정 글 조회
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String funding = request.getParameter("funding"); // 펀딩문의
		String payment = request.getParameter("payment"); // 결제문의
		String account = request.getParameter("account"); // 계정문의
		String etc = request.getParameter("etc"); // 기타문의
		System.out.println("funding : " + funding); 
		System.out.println("payment : " + payment);
		System.out.println("account : " + account);
		System.out.println("etc : " + etc);
		
		if (funding != null) { // select에서 제목을 선택했을 때
			System.out.println("펀딩문의");
			qna.setQnaType(funding);
			String getQnaType = qna.getQnaType();			
			System.out.println("최종 qnaType 값은 : " + getQnaType);
			List<Qna> selectType = adService.selectQnaType(qna);
			System.out.println("selectType : " + selectType);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(selectType);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (payment != null) { // select에서 작성자를 선택했을 때
			System.out.println("결제문의");
			qna.setQnaType(payment);
			String getQnaType = qna.getQnaType();
			System.out.println("최종 qnaType 값은 : " + getQnaType);
			List<Qna> selectType = adService.selectQnaType(qna);
			System.out.println("selectType : " + selectType);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(selectType);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (account != null) {
			System.out.println("계정문의");
			qna.setQnaType(account);
			String getQnaType = qna.getQnaType();
			System.out.println("최종 qnaType 값은 : " + getQnaType);
			List<Qna> selectType = adService.selectQnaType(qna);
			System.out.println("selectType : " + selectType);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(selectType);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (etc != null) {
			System.out.println("기타");
			qna.setQnaType(etc);
			String getQnaType = qna.getQnaType();
			System.out.println("최종 qnaType 값은 : " + getQnaType);
			List<Qna> selectType = adService.selectQnaType(qna);
			System.out.println("selectType : " + selectType);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(selectType);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		}	
		return "admin/qna";
	}
	
	@RequestMapping(value = "deletefboardlist", method = RequestMethod.POST)
	@ResponseBody
	public String deleteFBoardList(HttpServletRequest request) { // 자유 게시판 글 삭제
		String[] deleteList = request.getParameterValues("boardNo"); // 체크된 자유 게시판 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteFBoardList(deleteList[i]); // 자유 게시판 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/userList";
	}
	
	@RequestMapping(value = "deleterboardlist", method = RequestMethod.POST)
	@ResponseBody
	public String deleteRBoardList(HttpServletRequest request) { // 후기 게시판 글 삭제
		String[] deleteList = request.getParameterValues("boardNo"); // 체크된 후기 게시판 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteRBoardList(deleteList[i]); // 후기 게시판 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/reviewboardlist";
	}
	
	@RequestMapping(value = "deleteqboardlist", method = RequestMethod.POST)
	@ResponseBody
	public String deleteQBoardList(HttpServletRequest request) { // 질의응답 게시판 글 삭제
		String[] deleteList = request.getParameterValues("boardNo"); // 체크된 질의응답 게시판 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteQBoardList(deleteList[i]); // 질의응답 게시판 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/questionboardlist";
	}
	
	@RequestMapping(value = "deletesboardlist", method = RequestMethod.POST)
	@ResponseBody
	public String deleteSBoardList(HttpServletRequest request) { // 정보공유 게시판 글 삭제
		String[] deleteList = request.getParameterValues("boardNo"); // 체크된 정보공유 게시판 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteSBoardList(deleteList[i]); // 정보공유 게시판 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/shareboardlist";
	}
	
	@RequestMapping(value = "deleteeboardlist", method = RequestMethod.POST)
	@ResponseBody
	public String deleteEBoardList(HttpServletRequest request) { // 이벤트 게시판 글 삭제
		String[] deleteList = request.getParameterValues("boardNo"); // 체크된 이벤트 게시판 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteEBoardList(deleteList[i]); // 이벤트 게시판 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/eventboardlist";
	}
	
	@RequestMapping(value = "deletenoticelist", method = RequestMethod.POST)
	@ResponseBody
	public String deleteNoticeList(HttpServletRequest request) { // 공지사항 글 삭제
		String[] deleteList = request.getParameterValues("boardNo"); // 체크된 공지사항 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteNBoardList(deleteList[i]); // 공지사항 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/notice";
	}
	
	@RequestMapping(value = "deleteQna", method = RequestMethod.POST)
	@ResponseBody
	public String deleteQna(HttpServletRequest request) { // 공지사항 글 삭제
		String[] deleteList = request.getParameterValues("qnaNo"); // 체크된 공지사항 글 번호 리스트에 넣기
		System.out.println("deleteList 길이 : " + deleteList.length);
		for (int i = 0; i < deleteList.length; i++) { // for문 사용해서 deleteList[0]부터 삭제
			System.out.println("deleteList index " + i + " : " + deleteList[i]);
			adService.deleteQna(deleteList[i]); // 공지사항 글 번호 검색해서 해당 유저 삭제 
		}
		return "admin/notice";
	}
	
	@RequestMapping(value = "boardradio", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String boardRadio(Board board, HttpServletRequest request) throws Exception { // 자유 게시판 라디오 버튼 선택 나열
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String id = request.getParameter("id"); // 제목 값 받기
		String value = request.getParameter("value"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + id);
		System.out.println("mapper로 넘길 값은 : " + value);
		
		if (id.equals("free")) { // 자유 게시판에서 넘어온 라디오 id
			System.out.println("free 값 확인");
			if (value.equals("new")) {
				System.out.println("최신순 조회입니다.");
				board.setBoardTitle("FREEDATE");
				String type = board.getBoardTitle();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectFRadio = adService.selectFRadio(board);
				System.out.println("radioList : " + selectFRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectFRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("like")) {
				System.out.println("추천순 조회입니다.");
				// TODO
			} else if (value.equals("cnt")) {
				System.out.println("조회순 조회입니다.");
				board.setBoardContent("FREECNT");
				String type = board.getBoardContent();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectFRadio = adService.selectFRadio(board);
				System.out.println("radioList : " + selectFRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectFRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("cmt")) {
				System.out.println("댓글순 조회입니다.");
				// TODO
			}
		} else if (id.equals("review")) {
			System.out.println("review 값 확인");
			if (value.equals("new")) {
				System.out.println("최신순 조회입니다.");
				board.setBoardTitle("REVIEWDATE");
				String type = board.getBoardTitle();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectRRadio = adService.selectRRadio(board);
				System.out.println("radioList : " + selectRRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectRRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("like")) {
				System.out.println("추천순 조회입니다.");
				// TODO
			} else if (value.equals("cnt")) {
				System.out.println("조회순 조회입니다.");
				board.setBoardContent("REVIEWCNT");
				String type = board.getBoardContent();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectRRadio = adService.selectRRadio(board);
				System.out.println("radioList : " + selectRRadio.get(0).toString());
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectRRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("cmt")) {
				System.out.println("댓글순 조회입니다.");
				// TODO
			}
		} else if (id.equals("question")) {
			System.out.println("question 값 확인");
			if (value.equals("new")) {
				System.out.println("최신순 조회입니다.");
				board.setBoardTitle("QBOARDDATE");
				String type = board.getBoardTitle();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectQRadio = adService.selectQRadio(board);
				System.out.println("radioList : " + selectQRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectQRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("like")) {
				System.out.println("추천순 조회입니다.");
				// TODO
			} else if (value.equals("cnt")) {
				System.out.println("조회순 조회입니다.");
				board.setBoardContent("QBOARDCNT");
				String type = board.getBoardContent();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectQRadio = adService.selectQRadio(board);
				System.out.println("radioList : " + selectQRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectQRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("cmt")) {
				System.out.println("댓글순 조회입니다.");
				// TODO
			}
		} else if (id.equals("share")) {
			System.out.println("share 값 확인");
			if (value.equals("new")) {
				System.out.println("최신순 조회입니다.");
				board.setBoardTitle("SHAREDATE");
				String type = board.getBoardTitle();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectSRadio = adService.selectSRadio(board);
				System.out.println("radioList : " + selectSRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectSRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("like")) {
				System.out.println("추천순 조회입니다.");
				// TODO
			} else if (value.equals("cnt")) {
				System.out.println("조회순 조회입니다.");
				board.setBoardContent("SHARECNT");
				String type = board.getBoardContent();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectSRadio = adService.selectSRadio(board);
				System.out.println("radioList : " + selectSRadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectSRadio);
				System.out.println("jsonOutput : "+ jsonOutput);
				return jsonOutput;
			} else if (value.equals("cmt")) {
				System.out.println("댓글순 조회입니다.");
				// TODO
			}
		} else if (id.equals("event")) {
			System.out.println("event 값 확인");
			if (value.equals("new")) {
				System.out.println("최신순 조회입니다.");
				board.setBoardTitle("EVENTDATE");
				String type = board.getBoardTitle();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectERadio = adService.selectERadio(board);
				System.out.println("radioList : " + selectERadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectERadio);
				System.out.println("jsonOutput : "+ jsonOutput);
			} else if (value.equals("like")) {
				System.out.println("추천순 조회입니다.");
				// TODO
			} else if (value.equals("cnt")) {
				System.out.println("조회순 조회입니다.");
				board.setBoardTitle("EVENTCNT");
				String type = board.getBoardTitle();
				System.out.println("mapper로 넘길 값은 : " + type);
				List<Board> selectERadio = adService.selectERadio(board);
				System.out.println("radioList : " + selectERadio);
				Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
				String jsonOutput = gson.toJson(selectERadio);
				System.out.println("jsonOutput : "+ jsonOutput);
			} else if (value.equals("cmt")) {
				System.out.println("댓글순 조회입니다.");
				// TODO
			}
		}
		return "admin/userlist";
	}
	
	@RequestMapping(value = "noticeradio", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String noticeRadio(Board board, HttpServletRequest request) throws Exception { // 자유 게시판 라디오 버튼 선택 나열
		request.setCharacterEncoding("UTF-8");
		
		System.out.println("컨트롤러 진입");
		String id = request.getParameter("id"); // 제목 값 받기
		String value = request.getParameter("value"); // 작성자 값 받기
		System.out.println("mapper로 넘길 값은 : " + id);
		System.out.println("mapper로 넘길 값은 : " + value);
		System.out.println("notice 값 확인");
		if (value.equals("new")) {
			System.out.println("최신순 조회입니다.");
			board.setBoardTitle("NOTICEDATE");
			String type = board.getBoardTitle();
			System.out.println("mapper로 넘길 값은 : " + type);
			List<Board> selectFRadio = adService.selectNRadio(board);
			System.out.println("radioList : " + selectFRadio);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(selectFRadio);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (value.equals("like")) {
			System.out.println("추천순 조회입니다.");
			// TODO
		} else if (value.equals("cnt")) {
			System.out.println("조회순 조회입니다.");
			board.setBoardContent("NOTICECNT");
			String type = board.getBoardContent();
			System.out.println("mapper로 넘길 값은 : " + type);
			List<Board> selectNRadio = adService.selectNRadio(board);
			System.out.println("radioList : " + selectNRadio);
			Gson gson = new GsonBuilder().setPrettyPrinting().create(); // Gson 사용
			String jsonOutput = gson.toJson(selectNRadio);
			System.out.println("jsonOutput : "+ jsonOutput);
			return jsonOutput;
		} else if (value.equals("cmt")) {
			System.out.println("댓글순 조회입니다.");
			// TODO
		}
		return "admin/notice";
	}
	
	@RequestMapping(value = "userstart", method = RequestMethod.GET)
	public ModelAndView userStart() { // 회원 권한 복원
		return null;

	}
	
	@RequestMapping(value = "qna", method = RequestMethod.GET)
	public String qndList(Model model, Criteria cri) throws Exception { // qna 리스트 조회
		
		List<Qna> qnaList = adService.qnaList(cri); // Qna 리스트 가져오기
		int qnaCount = adService.qnaCount(); // Qna 총 수 가져오기
		System.out.println("qnaCount : " + qnaCount);
		System.out.println("qnaList : " + qnaList);
		model.addAttribute("qnaList", qnaList); // Qna 리스트 jsp로
		model.addAttribute("qnaCount", qnaCount); // Qna 총 수 jsp로
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		System.out.println(pageMaker.getCri());
		pageMaker.setTotalCount(adService.qnaCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/qna";
	}
	
	@RequestMapping(value = "qnaReply", method = RequestMethod.GET)
	public String qnaReply(Model model, HttpServletRequest request) throws Exception {
		
		String[] qnaNo = request.getParameterValues("qnaNo");
		System.out.println("qnaNo : " + qnaNo[0]);
		System.out.println("qnaNo : " + qnaNo[1]);
		System.out.println("qnaNo : " + qnaNo[2]);
		return "admin/qnaReply";
	}
	
	@RequestMapping(value = "qnainsert", method = RequestMethod.GET)
	public String qnaInsert() { // qna 답변 쓰기
		return "admin/qnaReply";
		
	}

	@RequestMapping(value = "qnaupdate", method = RequestMethod.GET)
	public ModelAndView qnaUpdate() { // qna 답변수정
		return null;

	}

	@RequestMapping(value = "faqall", method = RequestMethod.GET)
	public ModelAndView getFAQByPage() { // faq 리스트 조회
		return null;

	}
	
	@RequestMapping(value = "faqcount", method = RequestMethod.GET)
	public ModelAndView getFAQCount() { // 공지사항 수 조회
		return null;
		
	}
	
	@RequestMapping(value = "faqinsert", method = RequestMethod.GET)
	public ModelAndView FAQInsert() { // FAQ 쓰기
		return null; 
	}
	
	@RequestMapping(value = "faqdelete", method = RequestMethod.GET)
	public ModelAndView FAQdelete() {
		return null; // FAQ 삭제

	}
	
	@RequestMapping(value = "faqupdate", method = RequestMethod.GET)
	public ModelAndView FAQUpdate() { // FAQ 수정하기
		return null;
	}
	
	@RequestMapping(value = "notiall", method = RequestMethod.GET)
	public ModelAndView getNotifyByPage(){ // 공지사항 리스트 조회
		return null;
		
	}
	
	@RequestMapping(value = "noticount", method = RequestMethod.GET)
	public ModelAndView getNotifyCount() { // 공지사항 수 조회
		return null;
		
	}
	@RequestMapping(value = "notiInsert", method = RequestMethod.GET)
	public ModelAndView NotifyInsert() { // 공지사항 글쓰기
		return null;
	}
	
	@RequestMapping(value = "notidelete", method = RequestMethod.GET)
	public ModelAndView Notifydelete() { // 공지사항 삭제
		return null; 

	}
	
	@RequestMapping(value = "notiupdate", method = RequestMethod.GET)
	public ModelAndView NotifyUpdate() { // 공지사항 수정
		return null;
	}
	
	@RequestMapping(value = "reportall", method = RequestMethod.GET)
	public ModelAndView getPeportByPage(){ // 신고 리스트 조회
		return null;
		
	}
	
	@RequestMapping(value = "reportcount", method = RequestMethod.GET)
	public ModelAndView getReportCount() { // 신고 리스트 수  조회
		return null; 
		
	}
	
}
