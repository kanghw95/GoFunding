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
import com.funding.sprout.vo.Criteria;
import com.funding.sprout.vo.PageMaker;
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
	
	@RequestMapping(value = "list", method = RequestMethod.GET) // 검색 가능한 전체 회원 조회 페이지
	public String list(Model model, Criteria cri) throws Exception {
		
		List<User> userlist = adService.list(cri); // 유저 리스트 가져오기
		int userCount = adService.listCount(); // 유저 총 수 가져오기
		System.out.println("usercount : " + userCount);
		System.out.println("userlist : " + userlist);
		model.addAttribute("userlist", userlist); // 유저 리스트 jsp로
		model.addAttribute("usercount", userCount); // 유저 총 수 jsp로
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/userlist";
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
		return "admin/userlist";
	}
	
	@RequestMapping(value = "usercount", method = RequestMethod.GET)
	public ModelAndView getUserCount() throws Exception { // 유저수 조회
		return null;
		
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
		return "admin/userlist";
	}
	
	@RequestMapping(value = "userstart", method = RequestMethod.GET)
	public ModelAndView userStart() { // 회원 권한 복원
		return null;

	}

	@RequestMapping(value = "qnaAll", method = RequestMethod.GET)
	public ModelAndView getQNAByPage() { // qna 리스트 조회
		return null;

	}
	
	@RequestMapping(value = "qnainsert", method = RequestMethod.GET)
	public ModelAndView qnaInsert() { // qna 답변 쓰기
		return null;
		
	}
	
	@RequestMapping(value = "qnacount", method = RequestMethod.GET)
	public ModelAndView getQNACount() { // qna수 조회
		return null;

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
