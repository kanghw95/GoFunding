package com.funding.sprout.user.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.funding.sprout.vo.User;

public class Interceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN="login";
	private static final Logger logger=LoggerFactory.getLogger(Interceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mv) throws Exception {
		//로그인 후처리
		HttpSession session=request.getSession();
		ModelMap mm=mv.getModelMap(); 
		User list=(User) mm.get("user");

		if(list!=null) {
				logger.info("new login success");
				session.setAttribute(LOGIN, list);
//				response.sendRedirect("../");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		//로그인 전처리
		HttpSession session=request.getSession();
		addSameSite(response, "None");
		if(session.getAttribute(LOGIN)!=null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	private void addSameSite(HttpServletResponse response, String sameSite) { 
		Collection<String> headers = response.getHeaders(HttpHeaders.SET_COOKIE); 
		boolean firstHeader = true; 
		for (String header : headers) 
		{ // there can be multiple Set-Cookie attributes 
			if (firstHeader) { 
				response.setHeader(HttpHeaders.SET_COOKIE, String.format("%s; Secure; %s", header, "SameSite=" + sameSite)); 
				firstHeader = false; 
				continue; 
				} 
			response.addHeader(HttpHeaders.SET_COOKIE, String.format("%s; Secure; %s", header, "SameSite=" + sameSite)); 
			} 
		}
	}
