package com.funding.sprout.user.controller;

import org.springframework.stereotype.Component;

import com.github.scribejava.core.builder.api.DefaultApi20;

@Component
public class NaverOAuthApi20 extends DefaultApi20 {
	protected NaverOAuthApi20() {
	}

	private static class InstanceHolder {
		private static final NaverOAuthApi20 INSTANCE = new NaverOAuthApi20();
	}

	public static NaverOAuthApi20 instance() {
		return InstanceHolder.INSTANCE;
	}

	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}
}
