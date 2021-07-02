package com.funding.sprout;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.funding.sprout.funding.service.FundingService;
import com.funding.sprout.vo.Funding;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private FundingService funService;
	
	private IamportClient api;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	public HomeController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.api = new IamportClient("5072168781836147","DjlP8kkHm6ZwIPfy17RHjjpB6opUCcGgw15FmqnIxmffbuOdCFVWYlx5JWZm9GCFIIk48HNG42VgwKt9");
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, ModelAndView mv) {
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

	@RequestMapping(value = "/paytest", method = RequestMethod.GET)
	public String paytest(Locale locale, Model model) {
		logger.info("결제 테스트 들어옴", locale);



		return "funding/paytest";
	}

	
	@RequestMapping(value = "/header", method = RequestMethod.GET)
	public String headertest(Locale locale, Model model) {
		logger.info("header 테스트", locale);



		return "header";
	}
	
	@RequestMapping(value = "/footer", method = RequestMethod.GET)
	public String footertest(Locale locale, Model model) {
		logger.info("header 테스트", locale);



		return "footer";
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
