package com.funding.sprout.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.HomeController;
import com.funding.sprout.vo.User;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.funding.sprout.user.service.UserLoginService;


@Controller
@RequestMapping("/user")
public class UserLoginCtrl {
	
	@Autowired
	private UserLoginService userLoginService;
	@Autowired
	NaverLoginBO naverLoginBO;
	@Autowired
	KakaoLoginBO kakaoLoginBO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String serverUrl = request.getScheme()+"://"+request.getServerName();
		if(request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session, serverUrl);
		model.addAttribute("naverAuthUrl", naverAuthUrl);
		
		String kakaoAuthUrl = kakaoLoginBO.getAuthorizationUrl(session, serverUrl);
		model.addAttribute("kakaoAuthUrl", kakaoAuthUrl);
		
		return "/user/login";
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)  
	public String loginPost (User user, HttpSession session, Model model) throws Exception {
		logger.info("loginPost들어옴");
		User loginUser=userLoginService.login(user);
		
		String pw1=user.getUserPwd();
		String pw2=loginUser.getUserPwd();
		
		if(loginUser==null || !pw1.equals(pw2)) { // TODO bcrypt 추가
			System.out.println("실패");
			return "redirect:/"; // err500 처리 추가
		}
		session.setAttribute("user",loginUser);
		System.out.println("성공");
		return "redirect:/";
	}
	
	// 네이버 로그인 성공시 callback
	@RequestMapping(value = "/naverCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverOauth2ClientCallback(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {

		String serverUrl = request.getScheme()+"://"+request.getServerName();
		if(request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}

		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state, serverUrl);
		if(oauthToken == null) {
			model.addAttribute("msg", "네이버 로그인 access 토큰 발급 오류 입니다.");
			model.addAttribute("url", "/");
			return "/user/aaa";
		}
		
		// 로그인 사용자 정보를 읽어온다
		String apiResult = naverLoginBO.getUserProfile(oauthToken, serverUrl);
		
		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		// 프로필 조회
		String userName = (String) response_obj.get("name");
		String userEmail = (String) response_obj.get("email");
		
		Map<String, String> vo=new HashMap<String, String>();
		vo.put("userName", userName);
		vo.put("userEmail", userEmail);
		
		User loginUser=userLoginService.socialLogin(vo);
		
		// 세션에 사용자 정보 등록
		session.setAttribute("user", loginUser);
		
		return "redirect:/";
	}
	
	// 카카오 로그인 성공시 callback
	@RequestMapping(value = "/kakaoCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoOauth2ClientCallback(HttpServletRequest request, HttpServletResponse response, Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {

		String serverUrl = request.getScheme() + "://" + request.getServerName();
		if (request.getServerPort() != 80) {
			serverUrl = serverUrl + ":" + request.getServerPort();
		}

		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLoginBO.getAccessToken(session, code, state, serverUrl);
		if (oauthToken == null) {
			model.addAttribute("msg", "카카오 로그인 access 토큰 발급 오류 입니다.");
			model.addAttribute("url", "/");
			return "/user/aaa";
		}
		System.out.println("로그인성공");

		// 로그인 사용자 정보를 읽어온다
		String apiResult = kakaoLoginBO.getUserProfile(oauthToken, serverUrl);

		JSONParser jsonParser = new JSONParser();
		Object obj = jsonParser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("kakao_account");
		JSONObject profile_obj = (JSONObject)response_obj.get("profile");

		// 프로필 조회
		String userName = (String) profile_obj.get("nickname");
		String userEmail = (String) response_obj.get("email");
		
		Map<String, String> vo=new HashMap<String, String>();
		vo.put("userName", userName);
		vo.put("userEmail", userEmail);
		User loginUser=userLoginService.socialLogin(vo);
		
		// 세션에 사용자 정보 등록
		session.setAttribute("user", loginUser);
		
		return "redirect:/";
	}
	
	// 구글 로그인 성공시 callback
	@RequestMapping(value = "/googleCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleOauth2ClientCallback(User user, HttpSession session, Model model) throws Exception {
		if(user!=null) {
			String userName=user.getUserName();
			String userEmail=user.getUserEmail();
			Map<String, String> vo=new HashMap<String, String>();
			vo.put("userName", userName);
			vo.put("userEmail", userEmail);
			User loginUser = userLoginService.socialLogin(vo);
			session.setAttribute("user", loginUser);
		} else {
			System.out.println("로그인 실패");
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		// 세션 삭제
		System.out.println("로그아웃");
		session.removeAttribute("user");
		
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "/inputJoin", method = RequestMethod.GET)  
	public String inputJoin(User user, HttpSession session, ModelAndView mv) throws Exception {
		logger.info("추가입력");
		mv.setViewName("user/inputJoin");
		return "user/inputJoin";
	}
}
