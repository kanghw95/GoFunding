package com.funding.sprout.funding.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.admin.service.AdminService;
import com.funding.sprout.funding.service.FundingService;
import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Reward;
import com.funding.sprout.vo.User;

@Controller
public class FundingCtrl {
	
	@Autowired
	private FundingService funService;

	@Autowired
	private AdminService adService;
	
	@RequestMapping(value = "funone", method = RequestMethod.GET)
	public ModelAndView selectOne() {
		

		return null; // 펀딩 가져오기
	}
	
	
	//펀딩 검색
	@RequestMapping(value = "funsearch", method = RequestMethod.GET)
	public ModelAndView searchList(ModelAndView mv, @RequestParam(name = "keyword") String keyword,
			@RequestParam(name = "serchOption") String serchOption) {
		System.out.println(keyword);
		System.out.println(serchOption);
		List<Funding> searchlist = null;
		try {
				searchlist = funService.searchList(serchOption, keyword);

			System.out.println("검색된 펀딩 목록 : " + searchlist);
			mv.addObject("fundinglist", searchlist);
			mv.setViewName("funding/fundinglist");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv; // 펀딩 검색 조회
	}

	// 전체 펀딩 조회
	@RequestMapping(value = "funselect", method = RequestMethod.GET)
	public ModelAndView selectList(ModelAndView mv) {
		try {
			int listcount = funService.listCount();
			List<Funding> fundinglist = funService.selectList();
			System.out.println("펀딩리스트 :" + fundinglist);
			System.out.println("펀딩갯수 :" + listcount);
			mv.addObject("fundinglist", fundinglist);
			mv.addObject("listcount", listcount);
			mv.setViewName("funding/fundinglist");

		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}

	// 펀딩 상세 페이지
	@RequestMapping(value = "funding/detail", method = RequestMethod.GET)
	public ModelAndView fundingDetail(@RequestParam(name = "no") int fundingno, ModelAndView mv) {
		try {
			Funding funding = funService.selectOne(fundingno);	
			List<Reward> rewardlist = funService.selectReward(fundingno);
			System.out.println("선택한 펀딩 정보 :" + funding);
			System.out.println("선택한 리워드 정보 :" + rewardlist);
			mv.addObject("funding", funService.selectOne(fundingno));
			mv.addObject("reward", funService.selectReward(fundingno));
			
			mv.setViewName("funding/fundingdetail");
			
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;
	}
	
	//결제 페이지 이동
	@RequestMapping(value = "funding/fundingpay", method = RequestMethod.POST)
	public ModelAndView fundingpay(
			@RequestParam(name = "funding_pay_total_price") int funding_pay_price,
			@RequestParam(name = "funding_pay_total_rewordEA") int funding_pay_rewordEA,
			@RequestParam(name = "funding_no") int fundingno,
			@RequestParam(name = "deliverycharge") int deliverycharge,
			@RequestParam(name = "funding_pay_reword") String[] reword,
			@RequestParam(name = "funding_pay_price") String[] price,
			@RequestParam(name = "funding_pay_rewordEA") String[] rewordEA,
			@RequestParam(name = "cheer_pay") String cheer_pay,
			@RequestParam(name = "cheer_pay_price") int cheer_pay_price,
			@RequestParam(name = "cheer_pay_EA") String cheer_pay_EA,
			ModelAndView mv) {
		try {
			
			Funding funding = funService.selectOne(fundingno);	
			List<Reward> rewardlist = funService.selectReward(fundingno);
			System.out.println("선택한 펀딩 정보 :" + funding);
			for(int i=0; i<reword.length; i++) {
			System.out.println("선택한 리워드 정보 :" + reword[i]);
			}
			mv.addObject("funding_pay_price",funding_pay_price);
			mv.addObject("funding_pay_rewordEA",funding_pay_rewordEA);
			mv.addObject("funding", funService.selectOne(fundingno));
			mv.addObject("deliverycharge", deliverycharge);
			mv.addObject("reward", reword);
			mv.addObject("price", price);
			mv.addObject("rewordEA", rewordEA);
			mv.addObject("cheer_pay", cheer_pay);
			mv.addObject("cheer_pay_price", cheer_pay_price);
			mv.addObject("cheer_pay_EA", cheer_pay_EA);
			mv.setViewName("funding/fundingpay");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		return mv;  // 펀딩 결제 페이지
	}

	@RequestMapping(value = "funding/fundingresult", method = RequestMethod.POST)
	public ModelAndView fundingresult(
			@RequestParam(name = "reward") String[] reword,
			@RequestParam(name = "rewardEA") String[] rewardEA,
			@RequestParam(name = "rewardPrice") int[] rewardPrice,
			
			@RequestParam(name = "cheer") String cheer,
			@RequestParam(name = "cheerEA") String cheerEA,
			@RequestParam(name = "cheerPrice") int cheerPrice,
			
			@RequestParam(name = "totalPrice") int totalPrice,
			@RequestParam(name = "userId") String userId,
			@RequestParam(name = "fundingno") int fundingno,
			@RequestParam(name = "paycat") String paycat,
			User user,
			ModelAndView mv) {
		try {
			Funding funding = funService.selectOne(fundingno);	
			System.out.println("선택한 펀딩 정보 :" + funding);
			
			for(int i =0; i<reword.length; i++) {
				System.out.println(reword[i]);
				System.out.println(rewardEA[i]);
				System.out.println(rewardPrice[i]);
			}
			
			user.setUserId(userId); // vo에 아이디를 넣음
			List<User> searchId = adService.selectUserId(user); // 아이디로 검색한 리스트 가져오기
			System.out.println(searchId);
		
			mv.addObject("funding", funding);
			mv.addObject("searchId", searchId);
			
			mv.addObject("reward", reword);
			mv.addObject("rewardEA", rewardEA);
			mv.addObject("rewardPrice", rewardPrice);
			
			mv.addObject("cheer", cheer);
			mv.addObject("cheerEA", cheerEA);
			mv.addObject("cheerPrice", cheerPrice);
			
			mv.addObject("totalPrice", totalPrice);
			mv.addObject("paycat", paycat);
			
			
			mv.setViewName("funding/fundingpay");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("errorPage");
		}
		mv.setViewName("funding/fundingpayResult");
		return mv;  // 펀딩 결제완료 페이지
	}
	
	@RequestMapping(value = "funinsert", method = RequestMethod.GET)
	public ModelAndView insertFunding() {
		return null; // 펀딩 입력
	}

	@RequestMapping(value = "funupdate", method = RequestMethod.GET)
	public ModelAndView updateFunding() {
		return null; // 펀딩 수정
	}

	@RequestMapping(value = "fundelete", method = RequestMethod.GET)
	public ModelAndView deleteFunding() {
		return null; // 펀딩 삭제
	}

	@RequestMapping(value = "funlike", method = RequestMethod.GET)
	public ModelAndView getPreference() { // TODO 선호하는 펀딩 정보 이거는 수정이 필요해보임 추가도
		return null;

	}
}
