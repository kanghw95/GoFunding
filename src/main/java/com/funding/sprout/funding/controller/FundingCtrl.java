package com.funding.sprout.funding.controller;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.funding.service.FundingService;
import com.funding.sprout.vo.Funding;
import com.funding.sprout.vo.Reward;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class FundingCtrl {

	
	@Autowired
	private FundingService funService;

	@RequestMapping(value = "funone", method = RequestMethod.GET)
	public ModelAndView selectOne() {
		

		return null; // 펀딩 가져오기
	}
	
	private IamportClient api;
	
	public FundingCtrl() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("3452420157053319","DXI0XVlgpUwS8B3Hj9cFxozTrGn6CXmfU4fS0B8pvFhDglkzvxe3VNXnukt7hPmcUC4UddkJSCn9XIJt");
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

	@RequestMapping(value = "funding/fundingresult", method = RequestMethod.GET)
	public ModelAndView fundingresult(ModelAndView mv) {
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
	
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}

}
