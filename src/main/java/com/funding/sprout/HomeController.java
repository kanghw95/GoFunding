package com.funding.sprout;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
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
}
